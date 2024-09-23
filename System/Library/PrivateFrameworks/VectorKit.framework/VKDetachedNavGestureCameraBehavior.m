@implementation VKDetachedNavGestureCameraBehavior

- (VKDetachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3
{
  id v4;
  VKDetachedNavGestureCameraBehavior *v5;
  VKDetachedNavGestureCameraBehavior *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKDetachedNavGestureCameraBehavior;
  v5 = -[VKGestureCameraBehavior initWithCameraController:](&v8, sel_initWithCameraController_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navCameraController, v4);
    v6->super._notifyCameraStateChanges = 1;
    v6->_startZoomScale = 1.0;
    v6->_startPitch._value = 0.0;
  }

  return v6;
}

- (void)dealloc
{
  VKTimedAnimation *tapZoomAnimation;
  objc_super v4;

  -[VKAnimation stop](self->_tapZoomAnimation, "stop");
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKDetachedNavGestureCameraBehavior;
  -[VKDetachedNavGestureCameraBehavior dealloc](&v4, sel_dealloc);
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  double startZoomScale;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  VKTimedAnimation *v18;
  double v19;
  VKTimedAnimation *tapZoomAnimation;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31[5];
  id location;
  _QWORD v33[4];

  y = a3.y;
  x = a3.x;
  v9 = a5;
  startZoomScale = self->_startZoomScale;
  v11 = exp2(a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(WeakRetained, "minZoomScale");
  v14 = v13;
  v15 = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(v15, "maxZoomScale");
  v17 = v16;

  -[VKAnimation stop](self->_tapZoomAnimation, "stop");
  v18 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.25);
  v19 = fmin(fmax(startZoomScale * v11, v14), v17);
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = v18;

  v21 = self->_startZoomScale;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  *(double *)&v33[3] = v21;
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke;
  v30[3] = &unk_1E42F9468;
  objc_copyWeak(v31, &location);
  v31[1] = *(id *)&v21;
  v31[2] = *(id *)&v19;
  v31[3] = *(id *)&x;
  v31[4] = *(id *)&y;
  v30[4] = v33;
  -[VKTimedAnimation setStepHandler:](self->_tapZoomAnimation, "setStepHandler:", v30);
  v25 = v22;
  v26 = 3221225472;
  v27 = __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke_2;
  v28 = &unk_1E42F9440;
  v23 = v9;
  v29 = v23;
  -[VKAnimation setCompletionHandler:](self->_tapZoomAnimation, "setCompletionHandler:", &v25);
  v24 = objc_loadWeakRetained((id *)&self->_navCameraController);
  md::AnimationRunner::runAnimation((md::MapEngine **)objc_msgSend(v24, "animationRunner", v25, v26, v27, v28), &self->_tapZoomAnimation->super);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(v33, 8);

}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  unint64_t *v19;
  unint64_t v20;
  VKNavCameraController **p_navCameraController;
  id v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  float64x2_t v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  id v38;
  double v39;
  double v40;
  id v41;
  float v42;
  double v43;
  double v44;
  float64x2_t v45;
  id v46;
  void *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  id v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double v55;
  double v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  float64x2_t v69;
  double v70;
  float64x2_t v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  y = a3.y;
  x = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained, "camera");
    if (!*(_QWORD *)&v71.f64[1])
      goto LABEL_6;
    v13 = (unint64_t *)(*(_QWORD *)&v71.f64[1] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v71.f64[1] + 16))(*(_QWORD *)&v71.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v71.f64[1]);

      if (!*(_QWORD *)&v71.f64[0])
        return;
    }
    else
    {
LABEL_6:

      if (!*(_QWORD *)&v71.f64[0])
        return;
    }
    v15 = objc_loadWeakRetained((id *)p_cameraController);
    v16 = objc_msgSend(v15, "mapDataAccess");

    v17 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v17, "camera");
    v18 = *(_OWORD *)(*(_QWORD *)&v69.f64[0] + 24);
    v71 = *(float64x2_t *)(*(_QWORD *)&v69.f64[0] + 8);
    v72 = v18;
    v73 = *(_OWORD *)(*(_QWORD *)&v69.f64[0] + 40);
    v74 = *(_QWORD *)(*(_QWORD *)&v69.f64[0] + 56);
    if (*(_QWORD *)&v69.f64[1])
    {
      v19 = (unint64_t *)(*(_QWORD *)&v69.f64[1] + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        (*(void (**)(_QWORD))(**(_QWORD **)&v69.f64[1] + 16))(*(_QWORD *)&v69.f64[1]);
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v69.f64[1]);
      }
    }

    p_navCameraController = &self->_navCameraController;
    v22 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v22, "canvas");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;
    v26 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v26, "canvas");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    v28.f64[0] = v25 * x;
    v28.f64[1] = v29 * (1.0 - y);
    v65 = v28;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v69, v16, (uint64_t)&v71, 0, v65);
    if (v69.f64[0] != -3.14159265 || v69.f64[1] != -3.14159265 || v70 != 0.0)
    {
      v30 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v30, "minZoomHeight");
      v32 = v31;
      v33 = *((double *)&v72 + 1);

      v34 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v34, "maxZoomHeight");
      v36 = v35;

      v37 = v72;
      v64 = v71;
      v66 = v69;
      v38 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v38, "minZoomHeight");
      v40 = v39;
      v41 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v41, "maxZoomHeight");
      v42 = 1.0 - 1.0 / a4;
      v61 = v42;
      v62 = 1.0 - v42;
      v63 = 1.0 - 1.0 / a5;
      v44 = fmin(fmax(v33 / v62 - v33 / v62 * v63, v40), v43);

      if (vabdd_f64(v44, v33) > 1.0)
      {
        v45 = vdivq_f64(vmlsq_lane_f64(v64, v66, v61, 0), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v62, 0));
        v71 = vmlaq_n_f64(v45, vsubq_f64(v66, v45), v63);
        *(_QWORD *)&v72 = v37;
        *((double *)&v72 + 1) = v44;
        v46 = objc_loadWeakRetained((id *)p_cameraController);
        v47 = v46;
        if (v46)
        {
          objc_msgSend(v46, "camera");
          *(float64x2_t *)(v67 + 8) = v71;
          *(_OWORD *)(v67 + 24) = v72;
          *(_OWORD *)(v67 + 40) = v73;
          *(_QWORD *)(v67 + 56) = v74;
          if (v68)
          {
            p_shared_owners = (unint64_t *)&v68->__shared_owners_;
            do
              v49 = __ldaxr(p_shared_owners);
            while (__stlxr(v49 - 1, p_shared_owners));
            if (!v49)
            {
              ((void (*)())v68->__on_zero_shared)();
              std::__shared_weak_count::__release_weak(v68);
            }
          }
        }
        else
        {
          MEMORY[8] = v71;
          MEMORY[0x18] = v72;
          MEMORY[0x28] = v73;
          MEMORY[0x38] = v74;
        }

      }
      v50 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v50, "minZoomHeight");
      v52 = v51;
      v53 = *((double *)&v72 + 1);

      v54 = objc_loadWeakRetained((id *)p_navCameraController);
      objc_msgSend(v54, "maxZoomHeight");
      v56 = v55;

      if (v32 >= v33 == v52 < v53)
      {
        v57 = objc_loadWeakRetained((id *)p_navCameraController);
        objc_msgSend(v57, "cameraDelegate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "mapLayerCanZoomInDidChange:", v52 < v53);

      }
      if (v36 <= v33 == v56 > v53)
      {
        v59 = objc_loadWeakRetained((id *)p_navCameraController);
        objc_msgSend(v59, "cameraDelegate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "mapLayerCanZoomOutDidChange:", v56 > v53);

      }
    }
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  id v14;
  unsigned __int8 *v15;
  id v16;
  __int128 v17;
  unint64_t *v18;
  unint64_t v19;
  double v20;
  VKNavCameraController **p_navCameraController;
  id v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  float64x2_t v28;
  double v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  float64x2_t v36;
  double v37;
  long double v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  id v42;
  void *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  __int128 v46;
  float64x2_t v47;
  float64x2_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  _BYTE v62[32];
  _BYTE v63[24];

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "camera");
    if (!*(_QWORD *)&v62[8])
      goto LABEL_6;
    v12 = (unint64_t *)(*(_QWORD *)&v62[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v62[8] + 16))(*(_QWORD *)&v62[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v62[8]);

      if (!*(_QWORD *)v62)
        return;
    }
    else
    {
LABEL_6:

      if (!*(_QWORD *)v62)
        return;
    }
    v14 = objc_loadWeakRetained((id *)p_cameraController);
    v15 = (unsigned __int8 *)objc_msgSend(v14, "mapDataAccess");

    v16 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v16, "camera");
    *(_OWORD *)v62 = *(_OWORD *)(v57 + 8);
    v17 = *(_OWORD *)(v57 + 40);
    *(_OWORD *)&v62[16] = *(_OWORD *)(v57 + 24);
    *(_OWORD *)v63 = v17;
    *(_QWORD *)&v63[16] = *(_QWORD *)(v57 + 56);
    if ((_QWORD)v58)
    {
      v18 = (unint64_t *)(v58 + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v58 + 16))(v58);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v58);
      }
    }

    v20 = *(double *)v62;
    v57 = *(_QWORD *)v62;
    v46 = *(_OWORD *)&v62[8];
    v58 = *(_OWORD *)&v62[8];
    v59 = *(_QWORD *)&v62[24];
    v61 = *(_OWORD *)&v63[8];
    v60 = 0;
    p_navCameraController = &self->_navCameraController;
    v22 = objc_loadWeakRetained((id *)&self->_navCameraController);
    objc_msgSend(v22, "canvas");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;
    v26 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v26, "canvas");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    v28.f64[0] = v25 * v7;
    v28.f64[1] = v29 * (1.0 - v6);
    v47 = v28;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v54, (uint64_t)v15, (uint64_t)&v57, 0, v47);
    v30 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v30, "canvas");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "size");
    v33 = v32;
    v34 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v34, "canvas");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "size");
    v36.f64[0] = v33 * x;
    v36.f64[1] = v37 * (1.0 - y);
    v48 = v36;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v51, (uint64_t)v15, (uint64_t)&v57, 0, v48);
    if ((v54 != -3.14159265 || v55 != -3.14159265 || v56 != 0.0)
      && (v51 != -3.14159265 || v52 != -3.14159265 || v53 != 0.0))
    {
      *(double *)v62 = fmax(fmin((v51 - v54 + v20) * 57.2957795, 75.0), -75.0) * 0.0174532925;
      v38 = fmod(3.14159265 - v55 + v52 + *(double *)&v46, 6.28318531);
      *(double *)&v62[8] = fmod(v38 + 6.28318531, 6.28318531) + -3.14159265;
      md::MapDataAccess::heightAtCoordinate(v15, v62);
      if (v40)
        v41 = v39;
      else
        v41 = *((_QWORD *)&v46 + 1);
      *(_QWORD *)&v62[16] = v41;
      v42 = objc_loadWeakRetained((id *)p_cameraController);
      v43 = v42;
      if (v42)
      {
        objc_msgSend(v42, "camera");
        *(_OWORD *)(v49 + 8) = *(_OWORD *)v62;
        *(_OWORD *)(v49 + 24) = *(_OWORD *)&v62[16];
        *(_OWORD *)(v49 + 40) = *(_OWORD *)v63;
        *(_QWORD *)(v49 + 56) = *(_QWORD *)&v63[16];
        if (v50)
        {
          p_shared_owners = (unint64_t *)&v50->__shared_owners_;
          do
            v45 = __ldaxr(p_shared_owners);
          while (__stlxr(v45 - 1, p_shared_owners));
          if (!v45)
          {
            ((void (*)())v50->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v50);
          }
        }
      }
      else
      {
        MEMORY[8] = *(_OWORD *)v62;
        MEMORY[0x18] = *(_OWORD *)&v62[16];
        MEMORY[0x28] = *(_OWORD *)v63;
        MEMORY[0x38] = *(_QWORD *)&v63[16];
      }

    }
  }
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v10;
  unint64_t *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  unint64_t *v17;
  unint64_t v18;
  VKNavCameraController **p_navCameraController;
  id v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  float64x2_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float64x2_t v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  unsigned int v37;
  double v38;
  double v39;
  __double2 v40;
  double v41;
  double v42;
  __double2 v43;
  long double v44;
  double v45;
  __double2 v46;
  double v47;
  double v48;
  __double2 v49;
  double v50;
  double v51;
  __double2 v52;
  __double2 v53;
  float64x2_t v54;
  __double2 v55;
  double v56;
  double v57;
  __double2 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __double2 v64;
  __double2 v65;
  double v66;
  __double2 v67;
  double v68;
  long double v69;
  long double v70;
  double v71;
  long double v72;
  long double v73;
  long double v74;
  long double v75;
  float64x2_t v76;
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
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  __double2 v114;
  double v115;
  double v116;
  __double2 v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  __double2 v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  long double v136;
  __int128 v137;
  id v138;
  void *v139;
  float64x2_t v140;
  __int128 v141;
  unint64_t *v142;
  unint64_t v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  long double v163;
  double v164;
  double v165;
  double v166;
  long double v167;
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
  double v178;
  float64x2_t v179;
  double v180;
  float64x2_t v181;
  double v182;
  long double v183;
  double v184;
  double v185;
  double v186;
  float64x2_t v187;
  __int128 v188;
  __int128 v189;
  double v190;
  double v191[3];
  double v192;
  double v193;
  double v194;
  double v195;
  float64x2_t v196;
  double v197;
  __int128 v198;
  __int128 v199;

  y = a4.y;
  x = a4.x;
  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "camera");
    if (!*(_QWORD *)&v196.f64[1])
      goto LABEL_6;
    v11 = (unint64_t *)(*(_QWORD *)&v196.f64[1] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v196.f64[1] + 16))(*(_QWORD *)&v196.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v196.f64[1]);

      if (!*(_QWORD *)&v196.f64[0])
        return;
    }
    else
    {
LABEL_6:

      if (!*(_QWORD *)&v196.f64[0])
        return;
    }
    v13 = objc_loadWeakRetained((id *)p_cameraController);
    v14 = objc_msgSend(v13, "mapDataAccess");

    v15 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v15, "camera");
    v16 = *(_OWORD *)(*(_QWORD *)&v196.f64[0] + 24);
    v187 = *(float64x2_t *)(*(_QWORD *)&v196.f64[0] + 8);
    v188 = v16;
    v189 = *(_OWORD *)(*(_QWORD *)&v196.f64[0] + 40);
    v190 = *(double *)(*(_QWORD *)&v196.f64[0] + 56);
    if (*(_QWORD *)&v196.f64[1])
    {
      v17 = (unint64_t *)(*(_QWORD *)&v196.f64[1] + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        (*(void (**)(_QWORD))(**(_QWORD **)&v196.f64[1] + 16))(*(_QWORD *)&v196.f64[1]);
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v196.f64[1]);
      }
    }

    p_navCameraController = &self->_navCameraController;
    v20 = objc_loadWeakRetained((id *)&self->_navCameraController);
    objc_msgSend(v20, "canvas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;
    v24 = objc_loadWeakRetained((id *)p_navCameraController);
    objc_msgSend(v24, "canvas");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v26.f64[0] = v23 * x;
    v26.f64[1] = v27 * (1.0 - y);
    v179 = v26;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v184, v14, (uint64_t)&v187, 0, v179);
    v29 = v184;
    v28 = v185;
    v30 = v186;
    v31 = -3.14159265;
    if (v184 != -3.14159265 || v185 != -3.14159265 || v186 != 0.0)
    {
      if (*(_BYTE *)(v14 + 8) == 2)
      {
        v32 = v187;
        v33 = v188;
        v34 = v189;
        v35 = v190;
      }
      else
      {
        v36 = 0.0;
        v37 = *(unsigned __int8 *)(v14 + 9) - 1;
        if (v37 >= 3)
        {
          if (*(_BYTE *)(v14 + 9))
          {
            v164 = 1.0;
            v181 = 0u;
            v77 = 0.0;
          }
          else
          {
            v168 = v190;
            v62 = *(double *)&v189;
            v182 = v187.f64[0];
            v161 = v185;
            v63 = *((double *)&v189 + 1);
            v64 = __sincos_stret((*((double *)&v189 + 1) - v190) * 0.5);
            v65 = __sincos_stret(v62 * 0.5);
            v155 = v64.__sinval * v65.__sinval;
            v66 = v64.__cosval * v65.__sinval * -2.0;
            v177 = v66 * (v64.__cosval * v65.__sinval) + 1.0 - (v155 + v155) * v155;
            v67 = __sincos_stret((v168 + v63) * 0.5);
            v165 = v66 * (v67.__cosval * v65.__cosval) + (v155 + v155) * (v67.__sinval * v65.__cosval);
            v158 = -(v66 * (v67.__sinval * v65.__cosval) - (v155 + v155) * (v67.__cosval * v65.__cosval));
            v68 = *(double *)&v188;
            v169 = v187.f64[1];
            v69 = tan(v182 * 0.5 + 0.785398163);
            v170 = v169 * 0.159154943 + 0.5;
            v146 = v30;
            v70 = log(v69) * 0.159154943 + 0.5;
            v152 = v70 + v165 * (*((double *)&v188 + 1) * 0.0000000249532021);
            v153 = v170 + v158 * (*((double *)&v188 + 1) * 0.0000000249532021);
            v178 = v68 * 0.0000000249532021 + v177 * (*((double *)&v188 + 1) * 0.0000000249532021);
            v71 = v64.__cosval * v65.__sinval;
            v148 = (v71 + v71) * (v64.__sinval * v65.__sinval)
                 + v67.__sinval * v65.__cosval * -2.0 * (v67.__cosval * v65.__cosval);
            v164 = 1.0;
            v154 = -(v67.__sinval * v65.__cosval * -2.0 * (v64.__sinval * v65.__sinval)
                   - (v71 + v71) * (v67.__cosval * v65.__cosval));
            v157 = v67.__sinval * v65.__cosval * -2.0 * (v67.__sinval * v65.__cosval) + 1.0 - (v71 + v71) * v71;
            v72 = tan(v29 * 0.5 + 0.785398163);
            v150 = v161 * 0.159154943 + 0.5;
            v151 = log(v72) * 0.159154943 + 0.5;
            v36 = 0.0;
            v73 = exp(v70 * 6.28318531 + -3.14159265);
            v183 = atan(v73) * 2.0 + -1.57079633;
            v29 = v70;
            v30 = v146;
            v74 = fmod(v170 * 6.28318531, 6.28318531);
            v28 = v170;
            v75 = fmod(v74 + 6.28318531, 6.28318531);
            v31 = v148;
            v76.f64[0] = v183;
            v76.f64[1] = v75 + -3.14159265;
            v181 = v76;
            v149 = v178 * 40075017.0;
            v173 = v68;
            v77 = v68;
          }
          v176 = v77;
          v61 = 0.0;
        }
        else
        {
          v144 = a3;
          v160 = v185;
          gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v196.f64, v187.f64);
          v38 = v187.f64[1];
          v39 = *(double *)&v188;
          v40 = __sincos_stret(v187.f64[0]);
          v41 = 6378137.0 / sqrt(1.0 - v40.__sinval * v40.__sinval * 0.00669437999);
          v42 = (v41 + v39) * v40.__cosval;
          v43 = __sincos_stret(v38);
          v167 = v42 * v43.__cosval;
          v44 = v42 * v43.__sinval;
          v173 = (v39 + v41 * 0.99330562) * v40.__sinval;
          v152 = v196.f64[1];
          v153 = v196.f64[0];
          v45 = *(double *)&v198;
          v147 = (v45 + v45) * *((double *)&v198 + 1) + *((double *)&v199 + 1) * (*(double *)&v199 * -2.0);
          v149 = v197;
          v154 = -(*(double *)&v199 * -2.0 * *((double *)&v198 + 1) - (v45 + v45) * *((double *)&v199 + 1));
          v157 = *(double *)&v199 * -2.0 * *(double *)&v199 + 1.0 - (v45 + v45) * v45;
          v46 = __sincos_stret(v29);
          v47 = 6378137.0 / sqrt(1.0 - v46.__sinval * v46.__sinval * 0.00669437999);
          v48 = (v47 + v30) * v46.__cosval;
          v49 = __sincos_stret(v160);
          v150 = v48 * v49.__cosval;
          v151 = v48 * v49.__sinval;
          v145 = v30;
          v30 = (v30 + v47 * 0.99330562) * v46.__sinval;
          v50 = sqrt(v167 * v167 + v44 * v44);
          v51 = atan2(v173, v50 * 0.996647189);
          v163 = atan2(v44, v167);
          v52 = __sincos_stret(v51);
          v180 = atan2(v173 + v52.__sinval * v52.__sinval * 42841.3115 * v52.__sinval, v50 + v52.__cosval * v52.__cosval * -42697.6727 * v52.__cosval);
          v53 = __sincos_stret(v180);
          v176 = v50 / v53.__cosval - 6378137.0 / sqrt(1.0 - v53.__sinval * v53.__sinval * 0.00669437999);
          v54.f64[0] = v180;
          v54.f64[1] = v163;
          v181 = v54;
          v55 = __sincos_stret(v29);
          v56 = 6378137.0 / sqrt(v55.__sinval * v55.__sinval * -0.00669437999 + 1.0);
          v57 = (v56 + v145) * v55.__cosval;
          v58 = __sincos_stret(v160);
          v59 = (v145 + v56 * 0.99330562) * v55.__sinval;
          v60 = 1.0
              / sqrt(v57 * v58.__cosval * (v57 * v58.__cosval) + v57 * v58.__sinval * (v57 * v58.__sinval) + v59 * v59);
          v36 = v60 * (v57 * v58.__cosval);
          v61 = v60 * (v57 * v58.__sinval);
          v164 = v60 * v59;
          v29 = v44;
          a3 = v144;
          v28 = v167;
          v31 = v147;
        }
        v78 = __sincos_stret(a3 * 0.5);
        v79 = -((v152 - v151) * (v164 * v78.__sinval) - (v149 - v30) * (v61 * v78.__sinval));
        v80 = -((v149 - v30) * (v36 * v78.__sinval) - (v153 - v150) * (v164 * v78.__sinval));
        v81 = -((v153 - v150) * (v61 * v78.__sinval) - (v152 - v151) * (v36 * v78.__sinval));
        v82 = v80 + v80;
        v83 = v81 + v81;
        v84 = v153 + v83 * (v61 * v78.__sinval) + (v79 + v79) * v78.__cosval;
        v85 = v82 * (v164 * v78.__sinval);
        v86 = v152 - v83 * (v36 * v78.__sinval) + (v79 + v79) * (v164 * v78.__sinval) + v82 * v78.__cosval;
        v87 = v149 + v83 * v78.__cosval + v82 * (v36 * v78.__sinval);
        v88 = (v79 + v79) * (v61 * v78.__sinval);
        v89 = -((v29 - v151) * (v164 * v78.__sinval) - (v173 - v30) * (v61 * v78.__sinval));
        v90 = -((v173 - v30) * (v36 * v78.__sinval) - (v28 - v150) * (v164 * v78.__sinval));
        v91 = -((v28 - v150) * (v61 * v78.__sinval) - (v29 - v151) * (v36 * v78.__sinval));
        v92 = v90 + v90;
        v93 = v91 + v91;
        v94 = v28 + v93 * (v61 * v78.__sinval) + (v89 + v89) * v78.__cosval - v92 * (v164 * v78.__sinval);
        v95 = v29 - v93 * (v36 * v78.__sinval) + (v89 + v89) * (v164 * v78.__sinval) + v92 * v78.__cosval;
        v96 = v173 + v93 * v78.__cosval + v92 * (v36 * v78.__sinval) - (v89 + v89) * (v61 * v78.__sinval);
        v97 = -((v157 - v151) * (v164 * v78.__sinval) - (v154 - v30) * (v61 * v78.__sinval));
        v98 = -((v154 - v30) * (v36 * v78.__sinval) - (v31 - v150) * (v164 * v78.__sinval));
        v99 = -((v31 - v150) * (v61 * v78.__sinval) - (v157 - v151) * (v36 * v78.__sinval));
        v100 = v98 + v98;
        v101 = v99 + v99;
        v102 = v31 + v101 * (v61 * v78.__sinval) + (v97 + v97) * v78.__cosval - v100 * (v164 * v78.__sinval);
        v103 = v157 - v101 * (v36 * v78.__sinval) + (v97 + v97) * (v164 * v78.__sinval) + v100 * v78.__cosval;
        v104 = v154 + v101 * v78.__cosval + v100 * (v36 * v78.__sinval) - (v97 + v97) * (v61 * v78.__sinval);
        v105 = 1.0;
        v35 = 0.0;
        v106 = 0.0;
        v107 = 0.0;
        v108 = 1.0;
        if (*(unsigned __int8 *)(v14 + 9) - 1 <= 2)
        {
          v156 = v88;
          v174 = v84;
          v171 = v85;
          v162 = v86;
          v166 = v31 + v101 * (v61 * v78.__sinval) + (v97 + v97) * v78.__cosval - v100 * (v164 * v78.__sinval);
          v159 = v87;
          v109 = v103;
          v110 = v94;
          v111 = v95;
          v112 = v104;
          v113 = v96;
          v114 = __sincos_stret(v181.f64[0]);
          v115 = 6378137.0 / sqrt(v114.__sinval * v114.__sinval * -0.00669437999 + 1.0);
          v116 = (v115 + v176) * v114.__cosval;
          v117 = __sincos_stret(v181.f64[1]);
          v105 = 1.0;
          v96 = v113;
          v104 = v112;
          v95 = v111;
          v94 = v110;
          v103 = v109;
          v88 = v156;
          v87 = v159;
          v86 = v162;
          v102 = v166;
          v85 = v171;
          v84 = v174;
          v35 = 0.0;
          v118 = (v176 + v115 * 0.99330562) * v114.__sinval;
          v119 = 1.0
               / sqrt(v116 * v117.__cosval * (v116 * v117.__cosval)+ v116 * v117.__sinval * (v116 * v117.__sinval)+ v118 * v118);
          v106 = v119 * (v116 * v117.__cosval);
          v107 = v119 * (v116 * v117.__sinval);
          v108 = v119 * v118;
        }
        v120 = v94 + v85 - v84;
        v121 = v96 + v88 - v87;
        v175 = sqrt(v120 * v120 + (v95 - v86) * (v95 - v86) + v121 * v121);
        v122 = v105 / v175 * v120;
        v123 = v105 / v175 * (v95 - v86);
        v124 = v105 / v175 * v121;
        v172 = acos(fmin(fmax(-(v122 * v106 + v123 * v107 + v124 * v108), -1.0), v105));
        v125 = __sincos_stret(v172);
        v126 = v125.__cosval / sqrt(v102 * v102 + v103 * v103 + v104 * v104);
        v127 = v122 * v125.__sinval + v126 * v102;
        v128 = v123 * v125.__sinval + v126 * v103;
        v129 = v124 * v125.__sinval + v126 * v104;
        v199 = 0u;
        v198 = 0u;
        v196 = v181;
        v197 = v176;
        gdc::ViewDataAccess::rigidTransformForFrame(v191, **(_BYTE **)(v14 + 16), v196.f64);
        v131 = v192;
        v130 = v193;
        v132 = v194;
        v133 = -(v130 * v129 - v132 * v128) - (v130 * v129 - v132 * v128);
        v134 = -(v132 * v127 - v131 * v129) - (v132 * v127 - v131 * v129);
        v135 = -(v131 * v128 - v130 * v127) - (v131 * v128 - v130 * v127);
        v136 = atan2(-(v134 * v194 - (-(v127 - v135 * v193) - v133 * v195)), v128 + v135 * v192 + v134 * v195 - v133 * v194);
        *(double *)&v33 = v176;
        v32 = v181;
        *((double *)&v33 + 1) = v175;
        *(double *)&v137 = v172;
        *((long double *)&v137 + 1) = v136;
        v34 = v137;
      }
      v187 = v32;
      v188 = v33;
      v189 = v34;
      v190 = v35;
      v138 = objc_loadWeakRetained((id *)p_cameraController);
      v139 = v138;
      if (v138)
      {
        objc_msgSend(v138, "camera");
        v140 = v196;
        v141 = v188;
        *(float64x2_t *)(*(_QWORD *)&v196.f64[0] + 8) = v187;
        *(_OWORD *)(*(_QWORD *)&v140.f64[0] + 24) = v141;
        *(_OWORD *)(*(_QWORD *)&v140.f64[0] + 40) = v189;
        *(double *)(*(_QWORD *)&v140.f64[0] + 56) = v190;
        if (*(_QWORD *)&v140.f64[1])
        {
          v142 = (unint64_t *)(*(_QWORD *)&v140.f64[1] + 8);
          do
            v143 = __ldaxr(v142);
          while (__stlxr(v143 - 1, v142));
          if (!v143)
          {
            (*(void (**)(_QWORD))(**(_QWORD **)&v140.f64[1] + 16))(*(_QWORD *)&v140.f64[1]);
            std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v140.f64[1]);
          }
        }
      }
      else
      {
        v196 = 0uLL;
        MEMORY[8] = v187;
        MEMORY[0x18] = v188;
        MEMORY[0x28] = v189;
        MEMORY[0x38] = *(_QWORD *)&v190;
      }

    }
  }
}

- (void)beginPitch:(CGPoint)a3
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  id v9;
  double v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "camera");
    if (!v14)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);

      if (!v13)
        return;
    }
    else
    {
LABEL_6:

      if (!v13)
        return;
    }
    v9 = objc_loadWeakRetained((id *)p_cameraController);
    objc_msgSend(v9, "camera");
    v10 = *(double *)(v13 + 40);
    if (v14)
    {
      v11 = (unint64_t *)&v14->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    self->_startPitch._value = v10;
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  __int128 v12;
  uint64_t *v13;
  unint64_t v14;
  long double v15;
  std::__shared_weak_count *v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  __double2 v21;
  double v22;
  __double2 v23;
  id v24;
  double v25;
  double v26;
  double v27;
  char v28;
  double v29;
  double v30;
  double value;
  VKNavCameraController **p_navCameraController;
  id v33;
  void *v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  double v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  double v56;
  double v57;
  double v58;
  long double v59;
  __int128 v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (!WeakRetained)
    return;
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "camera");
  if (!*((_QWORD *)&v62 + 1))
    goto LABEL_6;
  v9 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)&v62 + 1) + 16))(*((_QWORD *)&v62 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v62 + 1));

    if (!(_QWORD)v62)
      return;
  }
  else
  {
LABEL_6:

    if (!(_QWORD)v62)
      return;
  }
  v11 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v11, "camera");
  v12 = *(_OWORD *)(*(_QWORD *)&v57 + 24);
  v62 = *(_OWORD *)(*(_QWORD *)&v57 + 8);
  v63 = v12;
  v64 = *(_OWORD *)(*(_QWORD *)&v57 + 40);
  v65 = *(_QWORD *)(*(_QWORD *)&v57 + 56);
  if (v58 != 0.0)
  {
    v13 = (uint64_t *)(*(_QWORD *)&v58 + 8);
    do
      v14 = __ldaxr((unint64_t *)v13);
    while (__stlxr(v14 - 1, (unint64_t *)v13));
    if (!v14)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v58 + 16))(*(_QWORD *)&v58);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v58);
    }
  }

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v57, (double *)&v62);
  v15 = v57;
  *(double *)&v16 = v58;
  v17 = v59;
  v18 = sqrt(v15 * v15 + *(double *)&v16 * *(double *)&v16);
  v19 = atan2(v59, v18 * 0.996647189);
  v20 = atan2(*(long double *)&v16, v15);
  v21 = __sincos_stret(v19);
  v22 = atan2(v17 + v21.__sinval * v21.__sinval * 42841.3115 * v21.__sinval, v18 + v21.__cosval * v21.__cosval * -42697.6727 * v21.__cosval);
  v23 = __sincos_stret(v22);
  *(double *)&v60 = v22;
  *((long double *)&v60 + 1) = v20;
  v61 = v18 / v23.__cosval + -6378137.0 / sqrt(v23.__sinval * v23.__sinval * -0.00669437999 + 1.0);
  v24 = objc_loadWeakRetained((id *)p_cameraController);
  md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)objc_msgSend(v24, "mapDataAccess"), &v60);
  v26 = v25;
  v27 = *(double *)&v63;
  if (!v28)
    v26 = *(double *)&v63;
  v29 = v26 + 10.0;

  v30 = acos((v29 - v27) / *((double *)&v63 + 1));
  value = self->_startPitch._value;
  p_navCameraController = &self->_navCameraController;
  v33 = objc_loadWeakRetained((id *)p_navCameraController);
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "maxCameraPitch");
    v35 = v57;
  }
  else
  {
    v57 = 0.0;
    v35 = 0.0;
  }
  v36 = objc_loadWeakRetained((id *)p_navCameraController);
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "minCameraPitch");
    v38 = v56;
  }
  else
  {
    v56 = 0.0;
    v38 = 0.0;
  }
  v39 = value - a4;
  v40 = fmax(v38, v35);
  if (v40 < v39)
  {
    v41 = 0.0698131701 / ((v40 - v39) * 7.87816968 + -1.0);
    v42 = v40 + 0.0698131701;
LABEL_26:
    v39 = v41 + v42;
    goto LABEL_27;
  }
  if (v39 < v38)
  {
    v42 = 0.0698131701 / ((v38 - v39) * 7.87816968 + 1.0);
    v41 = v38 + -0.0698131701;
    goto LABEL_26;
  }
LABEL_27:

  v43 = objc_loadWeakRetained((id *)p_navCameraController);
  v44 = v43;
  if (v43)
  {
    objc_msgSend(v43, "minCameraPitch");
    v45 = v57;
  }
  else
  {
    v57 = 0.0;
    v45 = 0.0;
  }
  v46 = objc_loadWeakRetained((id *)p_navCameraController);
  v47 = v46;
  if (v46)
  {
    objc_msgSend(v46, "maxCameraPitch");
    v48 = v56 + 0.0698131701;
  }
  else
  {
    v48 = 0.0698131701;
  }
  v49 = fmin(fmax(v39, v45), fmin(v30, v48));

  *(double *)&v64 = v49;
  v50 = objc_loadWeakRetained((id *)p_cameraController);
  v51 = v50;
  if (v50)
  {
    objc_msgSend(v50, "camera");
    v52 = v57;
    v53 = *(std::__shared_weak_count **)&v58;
    *(_OWORD *)(*(_QWORD *)&v57 + 8) = v62;
    *(_OWORD *)(*(_QWORD *)&v52 + 24) = v63;
    *(_OWORD *)(*(_QWORD *)&v52 + 40) = v64;
    *(_QWORD *)(*(_QWORD *)&v52 + 56) = v65;
    if (v53)
    {
      p_shared_owners = (unint64_t *)&v53->__shared_owners_;
      do
        v55 = __ldaxr(p_shared_owners);
      while (__stlxr(v55 - 1, p_shared_owners));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  else
  {
    v57 = 0.0;
    v58 = 0.0;
    MEMORY[8] = v62;
    MEMORY[0x18] = v63;
    MEMORY[0x28] = v64;
    MEMORY[0x38] = v65;
  }

}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  VKCameraController **p_cameraController;
  id WeakRetained;
  void *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  __int128 v12;
  uint64_t *v13;
  unint64_t v14;
  long double v15;
  std::__shared_weak_count *v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  __double2 v21;
  double v22;
  __double2 v23;
  id v24;
  double v25;
  double v26;
  double v27;
  char v28;
  double v29;
  double v30;
  VKNavCameraController **p_navCameraController;
  id v32;
  void *v33;
  double v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  double v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  double v51;
  std::__shared_weak_count *v52;
  unint64_t *p_shared_owners;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  long double v58;
  __int128 v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  p_cameraController = &self->super._cameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (!WeakRetained)
    return;
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "camera");
  if (!*((_QWORD *)&v61 + 1))
    goto LABEL_6;
  v9 = (unint64_t *)(*((_QWORD *)&v61 + 1) + 8);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)&v61 + 1) + 16))(*((_QWORD *)&v61 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v61 + 1));

    if (!(_QWORD)v61)
      return;
  }
  else
  {
LABEL_6:

    if (!(_QWORD)v61)
      return;
  }
  v11 = objc_loadWeakRetained((id *)p_cameraController);
  objc_msgSend(v11, "camera");
  v12 = *(_OWORD *)(*(_QWORD *)&v56 + 24);
  v61 = *(_OWORD *)(*(_QWORD *)&v56 + 8);
  v62 = v12;
  v63 = *(_OWORD *)(*(_QWORD *)&v56 + 40);
  v64 = *(_QWORD *)(*(_QWORD *)&v56 + 56);
  if (v57 != 0.0)
  {
    v13 = (uint64_t *)(*(_QWORD *)&v57 + 8);
    do
      v14 = __ldaxr((unint64_t *)v13);
    while (__stlxr(v14 - 1, (unint64_t *)v13));
    if (!v14)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&v57 + 16))(*(_QWORD *)&v57);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v57);
    }
  }

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v56, (double *)&v61);
  v15 = v56;
  *(double *)&v16 = v57;
  v17 = v58;
  v18 = sqrt(v15 * v15 + *(double *)&v16 * *(double *)&v16);
  v19 = atan2(v58, v18 * 0.996647189);
  v20 = atan2(*(long double *)&v16, v15);
  v21 = __sincos_stret(v19);
  v22 = atan2(v17 + v21.__sinval * v21.__sinval * 42841.3115 * v21.__sinval, v18 + v21.__cosval * v21.__cosval * -42697.6727 * v21.__cosval);
  v23 = __sincos_stret(v22);
  *(double *)&v59 = v22;
  *((long double *)&v59 + 1) = v20;
  v60 = v18 / v23.__cosval + -6378137.0 / sqrt(v23.__sinval * v23.__sinval * -0.00669437999 + 1.0);
  v24 = objc_loadWeakRetained((id *)p_cameraController);
  md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)objc_msgSend(v24, "mapDataAccess"), &v59);
  v26 = v25;
  v27 = *(double *)&v62;
  if (!v28)
    v26 = *(double *)&v62;
  v29 = v26 + 10.0;

  v30 = acos((v29 - v27) / *((double *)&v62 + 1));
  p_navCameraController = &self->_navCameraController;
  v32 = objc_loadWeakRetained((id *)p_navCameraController);
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "maxCameraPitch");
    v34 = v56;
  }
  else
  {
    v56 = 0.0;
    v34 = 0.0;
  }
  v35 = objc_loadWeakRetained((id *)p_navCameraController);
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "minCameraPitch");
    v37 = v55;
  }
  else
  {
    v55 = 0.0;
    v37 = 0.0;
  }
  v38 = a4 * 0.0174532925;
  v39 = fmax(v37, v34);
  if (v39 < v38)
  {
    v40 = 0.0698131701 / ((v39 - v38) * 7.87816968 + -1.0);
    v41 = v39 + 0.0698131701;
LABEL_26:
    v38 = v40 + v41;
    goto LABEL_27;
  }
  if (v38 < v37)
  {
    v41 = 0.0698131701 / ((v37 - v38) * 7.87816968 + 1.0);
    v40 = v37 + -0.0698131701;
    goto LABEL_26;
  }
LABEL_27:

  v42 = objc_loadWeakRetained((id *)p_navCameraController);
  v43 = v42;
  if (v42)
  {
    objc_msgSend(v42, "minCameraPitch");
    v44 = v56;
  }
  else
  {
    v56 = 0.0;
    v44 = 0.0;
  }
  v45 = objc_loadWeakRetained((id *)p_navCameraController);
  v46 = v45;
  if (v45)
  {
    objc_msgSend(v45, "maxCameraPitch");
    v47 = v55 + 0.0698131701;
  }
  else
  {
    v47 = 0.0698131701;
  }
  v48 = fmin(fmax(v38, v44), fmin(v30, v47));

  *(double *)&v63 = v48;
  v49 = objc_loadWeakRetained((id *)p_cameraController);
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "camera");
    v51 = v56;
    v52 = *(std::__shared_weak_count **)&v57;
    *(_OWORD *)(*(_QWORD *)&v56 + 8) = v61;
    *(_OWORD *)(*(_QWORD *)&v51 + 24) = v62;
    *(_OWORD *)(*(_QWORD *)&v51 + 40) = v63;
    *(_QWORD *)(*(_QWORD *)&v51 + 56) = v64;
    if (v52)
    {
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v54 = __ldaxr(p_shared_owners);
      while (__stlxr(v54 - 1, p_shared_owners));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
  }
  else
  {
    v56 = 0.0;
    v57 = 0.0;
    MEMORY[8] = v61;
    MEMORY[0x18] = v62;
    MEMORY[0x28] = v63;
    MEMORY[0x38] = v64;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapZoomAnimation, 0);
  objc_destroyWeak((id *)&self->_navCameraController);
}

void __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id *WeakRetained;
  double v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * a2;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "updateZoom:oldFactor:newFactor:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v5);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    v6 = objc_loadWeakRetained(v7 + 23);
    objc_msgSend(v6, "startIgnoreStyleChangeTimer");

    WeakRetained = v7;
  }

}

uint64_t __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
