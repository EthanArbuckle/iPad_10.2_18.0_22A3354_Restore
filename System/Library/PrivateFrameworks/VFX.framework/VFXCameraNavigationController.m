@implementation VFXCameraNavigationController

- (VFXCameraNavigationController)initWithView:(id)a3
{
  VFXCameraNavigationController *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VFXCameraNavigationController;
  v4 = -[VFXCameraNavigationController init](&v27, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_view = (VFXView *)a3;
    v4->_cameraController = objc_alloc_init(VFXCameraController);
    v9 = objc_msgSend_pointOfView(a3, v6, v7, v8);
    objc_msgSend_setPointOfView_(*(void **)(v5 + 480), v10, v9, v11);
    objc_msgSend_setInertiaEnabled_(*(void **)(v5 + 480), v12, 1, v13);
    objc_msgSend_setInteractionMode_(*(void **)(v5 + 480), v14, 1, v15);
    objc_msgSend_setDrivenByDefaultNavigationCameraController_(*(void **)(v5 + 480), v16, 1, v17);
    objc_msgSend_setDelegate_(*(void **)(v5 + 480), v18, v5, v19);
    *(_DWORD *)(v5 + 336) = 0;
    *(_DWORD *)(v5 + 252) = 0;
    *(_DWORD *)(v5 + 84) = 1065353216;
    *(_WORD *)(v5 + 474) = 1;
    *(_BYTE *)(v5 + 89) = 1;
    *(_BYTE *)(v5 + 289) = 0;
    *(_WORD *)(v5 + 93) = 257;
    *(_OWORD *)(v5 + 184) = xmmword_1B22463D0;
    objc_msgSend_worldDidChange((void *)v5, v20, v21, v22);
    objc_msgSend_cameraDidChange((void *)v5, v23, v24, v25);
  }
  return (VFXCameraNavigationController *)v5;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setDelegate_(self->_cameraController, a2, 0, v2);

  v4.receiver = self;
  v4.super_class = (Class)VFXCameraNavigationController;
  -[VFXCameraNavigationController dealloc](&v4, sel_dealloc);
}

- (VFXCameraController)cameraController
{
  return self->_cameraController;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_enabled = a3;
  v5 = (void *)objc_msgSend_gestureRecognizers(self, a2, a3, v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend_setEnabled_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v8, self->_enabled, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)allowsTranslation
{
  return self->_translationAllowed;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  self->_translationAllowed = a3;
}

- (BOOL)enableInertia
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_cameraController(self, a2, v2, v3);
  return MEMORY[0x1E0DE7D20](v4, sel_inertiaEnabled, v5, v6);
}

- (void)setEnableInertia:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_msgSend_cameraController(self, a2, a3, v3);
  objc_msgSend_setInertiaEnabled_(v5, v6, v4, v7);
}

- (float)friction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float result;

  v4 = objc_msgSend_cameraController(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_inertiaFriction, v5, v6);
  return result;
}

- (void)setFriction:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend_cameraController(self, a2, v3, v4);
  MEMORY[0x1E0DE7D20](v5, sel_setInertiaFriction_, v6, v7);
}

- (BOOL)automaticCameraTarget
{
  return self->_target.hasAutomatic;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  uint64_t v3;

  if (self->_target.hasAutomatic != a3)
  {
    self->_target.hasAutomatic = a3;
    objc_msgSend_invalidateCameraTarget(self, a2, a3, v3);
  }
}

- (void)invalidateCameraTarget
{
  self->_target.automaticLocationUpToDate = 0;
}

- (uint64_t)cameraTarget
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend__computeAutomaticTargetPointIfNeeded(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_cameraController(a1, v5, v6, v7);
  return objc_msgSend_target(v8, v9, v10, v11);
}

- (void)setCameraTarget:(VFXCameraNavigationController *)self
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;

  v12 = v3;
  objc_msgSend_setAutomaticCameraTarget_(self, a2, 0, v2);
  v8 = (void *)objc_msgSend_cameraController(self, v5, v6, v7);
  objc_msgSend_setTarget_(v8, v9, v10, v11, v12);
}

- (BOOL)gimbalLockMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  return objc_msgSend_interactionMode(v4, v5, v6, v7) == 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  if (a3)
    v4 = 1;
  else
    v4 = 3;
  v5 = (void *)objc_msgSend_cameraController(self, a2, a3, v3);
  objc_msgSend_setInteractionMode_(v5, v6, v4, v7);
}

- (BOOL)wantsRedraw
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t value;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;

  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  if ((objc_msgSend_isInertiaRunning(v5, v6, v7, v8) & 1) != 0)
    return 1;
  os_unfair_lock_lock(&self->_keyboard.lock);
  value = self->_keyboard.keyDown.__tree_.__pair3_.__value_;
  os_unfair_lock_unlock(&self->_keyboard.lock);
  v14 = (void *)objc_msgSend_cameraController(self, v11, v12, v13);
  if (objc_msgSend_interactionMode(v14, v15, v16, v17))
    v18 = 1;
  else
    v18 = value == 0;
  return !v18;
}

- (void)focusNode:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 1);
  objc_msgSend_focusNodes_(self, v5, v4, v6);
}

- (void)focusNodes:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  float originalOrthoScale;
  float v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;

  if (a3)
  {
    self->_didEverFocusNode = 1;
    objc_msgSend_setAutomaticCameraTarget_(self, a2, 0, v3);
    objc_msgSend__switchToFreeViewCamera(self, v6, v7, v8);
    v12 = (void *)objc_msgSend_cameraController(self, v9, v10, v11);
    v16 = objc_msgSend_automaticTarget(v12, v13, v14, v15);
    v20 = (void *)objc_msgSend_cameraController(self, v17, v18, v19);
    objc_msgSend_setAutomaticTarget_(v20, v21, 1, v22);
    v26 = (void *)objc_msgSend_cameraController(self, v23, v24, v25);
    objc_msgSend_frameNodes_(v26, v27, (uint64_t)a3, v28);
    v32 = (void *)objc_msgSend_cameraController(self, v29, v30, v31);
    objc_msgSend_setAutomaticTarget_(v32, v33, v16, v34);
    if (objc_msgSend__pointOfViewUsesOrthographicProjection(self, v35, v36, v37))
    {
      originalOrthoScale = self->_originalOrthoScale;
      objc_msgSend__pointOfViewOrthographicScale(self, v38, v39, v40);
      *(float *)&v43 = originalOrthoScale / v42;
      objc_msgSend_setZoomFactor_(self, v44, v45, v46, v43);
    }
  }
}

- (unint64_t)stickyAxis
{
  return *(_QWORD *)&self->_anon_101[23];
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis.stickyMoveEnabled = a3 == 0;
  *(_QWORD *)&self->_anon_101[23] = a3;
}

- (unint64_t)_effectiveStickyAxis
{
  unint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->_anon_101[23];
  if (!v2)
  {
    v3 = 272;
    if (!self->_stickyAxis.stickyMoveEnabled)
      v3 = 280;
    return *(unint64_t *)((char *)&self->super.isa + v3);
  }
  return v2;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  uint64_t v3;

  self->_enableFreeCamera = a3;
  if (!a3)
    objc_msgSend__resetFreeViewCamera(self, a2, a3, v3);
}

- (void)_resetFreeViewCamera
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
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

  v5 = objc_msgSend_worldRef(self->_freeViewCameraNode, a2, v2, v3);
  if (v5)
  {
    v13 = v5;
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    v17 = (void *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v14, v15, v16);
    v21 = objc_msgSend_worldRef(self->_freeViewCameraNode, v18, v19, v20);
    sub_1B17C5DD0(v17, v21, v22, v23, v24, v25, v26, v27);
    sub_1B18797B4(v13, v28, v29, v30, v31, v32, v33, v34);
  }
  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, v6, v7, v8);

  self->_freeViewCameraNode = 0;
}

- (BOOL)_freeCameraActivated
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *freeViewCameraNode;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  freeViewCameraNode = self->_freeViewCameraNode;
  if (!freeViewCameraNode)
    return 0;
  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  return freeViewCameraNode == (VFXNode *)objc_msgSend_pointOfView(v9, v10, v11, v12);
}

- (void)_prepareFreeViewCamera
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  VFXNode *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  VFXNode *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  VFXNode *freeViewCameraNode;
  VFXNode *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  float32x4_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  __int128 v73;
  __int128 v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  int32x4_t v102;
  float32x4_t v103;
  float v104;
  int32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  int32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  int32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  int8x16_t v117;
  int8x16_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int8x16_t v121;
  float32x4_t v122;
  float v123;
  int32x4_t v124;
  float v125;
  float32x4_t v126;
  float v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  int8x16_t v132;
  int8x16_t v133;
  float v134;
  float32x2_t v135;
  float32x2_t v136;
  float32x2_t v137;
  uint64_t v138;
  int32x2_t v139;
  float32x4_t v140;
  float32x2_t v141;
  float32x2_t v142;
  float32x4_t v143;
  float32x4_t v144;
  int8x16_t v145;
  float32x4_t v146;
  float v147;
  float32x4_t v148;
  float32x2_t v149;
  float32x4_t v150;
  float32x4_t v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  float32x4_t v221;
  __int128 v222;
  float32x4_t v223;

  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (VFXNode *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  v17 = v13;
  if (v13 && v13 == self->_freeViewCameraNode)
    return;
  v18 = (void *)objc_msgSend_presentationNode(v13, v14, v15, v16);
  if (objc_msgSend_camera(v18, v19, v20, v21))
    v25 = (void *)objc_msgSend_camera(v18, v22, v23, v24);
  else
    v25 = (void *)objc_msgSend_light(v18, v22, v23, v24);
  objc_msgSend_orthographicScale(v25, v26, v27, v28);
  self->_originalOrthoScale = v32;
  self->_orthographicZoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v17)
  {
    if (freeViewCameraNode)
      goto LABEL_13;
    v34 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v29, v30, v31);
    goto LABEL_12;
  }
  if (v17 == freeViewCameraNode)
  {
LABEL_17:
    v66 = (void *)objc_msgSend_presentationNode(v17, v29, v30, v31);
    objc_msgSend_worldTransform(v66, v67, v68, v69);
    v74 = v73;
    goto LABEL_22;
  }
  if (!freeViewCameraNode)
  {
    v34 = (VFXNode *)objc_msgSend_copy(v17, v29, v30, v31);
LABEL_12:
    self->_freeViewCameraNode = v34;
  }
LABEL_13:
  if (objc_msgSend_camera(v17, v29, v30, v31))
  {
    v38 = (void *)objc_msgSend_camera(v17, v35, v36, v37);
    v42 = (id)objc_msgSend_copy(v38, v39, v40, v41);
LABEL_15:
    v45 = v42;
    goto LABEL_16;
  }
  if (!objc_msgSend_light(v17, v35, v36, v37))
  {
    v42 = (id)objc_msgSend_camera(VFXCamera, v75, v76, v77);
    goto LABEL_15;
  }
  v78 = (void *)objc_msgSend_light(v17, v75, v76, v77);
  v45 = (void *)objc_msgSend_camera(VFXCamera, v79, v80, v81);
  if (v78)
  {
    objc_msgSend_spotOuterAngle(v78, v43, v82, v44);
    objc_msgSend_setFieldOfView_(v45, v83, v84, v85);
    objc_msgSend_zNear(v78, v86, v87, v88);
    objc_msgSend_setZNear_(v45, v89, v90, v91);
    objc_msgSend_zFar(v78, v92, v93, v94);
    objc_msgSend_setZFar_(v45, v95, v96, v97);
  }
LABEL_16:
  objc_msgSend_setCamera_(self->_freeViewCameraNode, v43, (uint64_t)v45, v44);
  objc_msgSend_setLight_(self->_freeViewCameraNode, v46, 0, v47);
  objc_msgSend_setModel_(self->_freeViewCameraNode, v48, 0, v49);
  objc_msgSend_setConstraints_(self->_freeViewCameraNode, v50, 0, v51);
  v55 = objc_msgSend_immediateMode(VFXTransaction, v52, v53, v54);
  objc_msgSend_setImmediateMode_(VFXTransaction, v56, 1, v57);
  objc_msgSend_removeAllAnimations(self->_freeViewCameraNode, v58, v59, v60);
  objc_msgSend_setConstraints_(self->_freeViewCameraNode, v61, 0, v62);
  objc_msgSend_setImmediateMode_(VFXTransaction, v63, v55, v64);
  if (v17)
    goto LABEL_17;
  v70 = (float32x4_t)VFXMatrix4Identity;
  v71 = (float32x4_t)unk_1B2247DB0;
  v72 = (float32x4_t)xmmword_1B2247DC0;
  v74 = unk_1B2247DD0;
LABEL_22:
  v98 = vmulq_f32(v70, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v72, (int8x16_t)v72, 0xCuLL), (int8x16_t)v72, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v71, (int32x4_t)v71), (int8x16_t)v71, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v71, (int8x16_t)v71, 0xCuLL), (int8x16_t)v71, 8uLL)));
  if (fabs(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v98, 2), vaddq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v98.f32, 1))).f32[0]+ -1.0) > 0.00001)
  {
    v99 = vmulq_f32(v70, v70);
    v65.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v99, 2), vaddq_f32(v99, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 1))).f32[0]);
    v100 = vmulq_f32(v71, v71);
    v101 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v100, 2);
    v102 = (int32x4_t)vaddq_f32(v101, vaddq_f32(v100, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v100.f32, 1)));
    *(float *)v102.i32 = sqrtf(*(float *)v102.i32);
    v103 = vmulq_f32(v72, v72);
    LODWORD(v104) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1))).u32[0];
    v105 = vzip2q_s32((int32x4_t)v99, (int32x4_t)v103);
    v106 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v99, (int32x4_t)v103), (int32x4_t)v100);
    v107 = (float32x4_t)vtrn2q_s32((int32x4_t)v99, (int32x4_t)v100);
    v107.i32[2] = v103.i32[1];
    v108 = vaddq_f32((float32x4_t)vzip1q_s32(v105, (int32x4_t)v101), vaddq_f32(v106, v107));
    v107.i64[0] = 0x80000000800000;
    v107.i64[1] = 0x80000000800000;
    v109 = vcgeq_f32(v107, v108);
    v108.i32[3] = 0;
    v110 = vrsqrteq_f32(v108);
    v111 = vmulq_f32(v110, vrsqrtsq_f32(v108, vmulq_f32(v110, v110)));
    v112 = v109;
    v112.i32[3] = 0;
    v113 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v112), (int8x16_t)v108, (int8x16_t)vmulq_f32(v111, vrsqrtsq_f32(v108, vmulq_f32(v111, v111))));
    v114 = vmulq_n_f32(v70, v113.f32[0]);
    v115 = vmulq_lane_f32(v71, *(float32x2_t *)v113.f32, 1);
    v116 = vmulq_laneq_f32(v72, v113, 2);
    v117 = (int8x16_t)vuzp1q_s32((int32x4_t)v116, (int32x4_t)v116);
    v118 = (int8x16_t)vuzp1q_s32((int32x4_t)v115, (int32x4_t)v115);
    v119 = (int32x4_t)v114;
    if (v109.i32[0])
    {
      v120 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v117, (int8x16_t)v116, 0xCuLL), vnegq_f32(v115)), v116, (float32x4_t)vextq_s8(v118, (int8x16_t)v115, 0xCuLL));
      v119 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v120, v120), (int8x16_t)v120, 0xCuLL);
    }
    v121 = (int8x16_t)vuzp1q_s32((int32x4_t)v114, (int32x4_t)v114);
    v122 = v115;
    v123 = sqrtf(v104);
    if (v109.i32[1])
    {
      v124 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v121, (int8x16_t)v114, 0xCuLL), vnegq_f32(v116)), v114, (float32x4_t)vextq_s8(v117, (int8x16_t)v116, 0xCuLL));
      v122 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v124, v124), (int8x16_t)v124, 0xCuLL);
    }
    v65.i32[1] = v102.i32[0];
    if (v109.i32[2])
    {
      v102 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v118, (int8x16_t)v115, 0xCuLL), vnegq_f32(v114)), v115, (float32x4_t)vextq_s8(v121, (int8x16_t)v114, 0xCuLL));
      v116 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v102, v102), (int8x16_t)v102, 0xCuLL);
    }
    v65.f32[2] = v123;
    v125 = (float)(*(float *)v119.i32 + v122.f32[1]) + v116.f32[2];
    v221 = v65;
    v222 = v74;
    if (v125 > 0.0)
    {
      v126 = (float32x4_t)vzip2q_s32((int32x4_t)v122, vuzp1q_s32((int32x4_t)v122, (int32x4_t)v116));
      v126.i32[2] = v119.i32[1];
      v127 = sqrtf(v125 + 1.0);
      v128 = (float32x4_t)vtrn2q_s32((int32x4_t)v116, vzip2q_s32((int32x4_t)v116, v119));
      v128.i32[2] = v122.i32[0];
      v130 = vsubq_f32(v126, v128);
      v126.f32[3] = v127;
      v128.f32[3] = v127;
      v129 = vmulq_f32(v126, v128);
      v130.i32[3] = v129.i32[3];
LABEL_41:
      v129.f32[0] = 0.5 / v127;
      v140 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v129.f32, 0);
      goto LABEL_42;
    }
    if (*(float *)v119.i32 < v122.f32[1] || *(float *)v119.i32 < v116.f32[2])
    {
      if (v122.f32[1] <= v116.f32[2])
      {
        v127 = sqrtf((float)((float)(v116.f32[2] + 1.0) - *(float *)v119.i32) - v122.f32[1]);
        *(float32x2_t *)v130.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v119, (int32x4_t)v122), *(float32x2_t *)v116.f32);
        v141 = (float32x2_t)__PAIR64__(v119.u32[1], LODWORD(v127));
        v142 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v122.f32, 0);
        *(float32x2_t *)v129.f32 = vsub_f32(*(float32x2_t *)v119.i8, v142);
        v142.f32[0] = v127;
        v142.i32[0] = vmul_f32(v141, v142).u32[0];
        v142.i32[1] = v129.i32[1];
        *(float32x2_t *)&v130.u32[2] = v142;
        goto LABEL_41;
      }
      v134 = sqrtf((float)((float)(v122.f32[1] + 1.0) - *(float *)v119.i32) - v116.f32[2]);
      *(int32x2_t *)v102.i8 = vdup_laneq_s32((int32x4_t)v122, 2);
      v132 = (int8x16_t)v102;
      *(float *)v132.i32 = v134;
      v132.i32[0] = vmul_f32(*(float32x2_t *)v132.i8, (float32x2_t)__PAIR64__(v116.u32[1], LODWORD(v134))).u32[0];
      v132.i32[1] = vadd_f32(*(float32x2_t *)&v102, *(float32x2_t *)&v116).i32[1];
      v133 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.i8, 1), v122);
      v139 = (int32x2_t)vsubq_f32(v116, (float32x4_t)vdupq_laneq_s32(v119, 2)).u64[0];
      v140 = (float32x4_t)vextq_s8(vextq_s8(v133, v133, 4uLL), v132, 0xCuLL);
      v140.i32[3] = v139.i32[0];
    }
    else
    {
      v134 = sqrtf((float)((float)(*(float *)v119.i32 + 1.0) - v122.f32[1]) - v116.f32[2]);
      v135 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v122.f32, 0);
      v136 = vadd_f32(*(float32x2_t *)v119.i8, v135);
      v135.f32[0] = v134;
      v140.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v119.u32[1], LODWORD(v134)), v135).u32[0];
      v140.i32[1] = v136.i32[1];
      v137 = (float32x2_t)vzip2q_s32(v119, (int32x4_t)v122).u64[0];
      LODWORD(v138) = vadd_f32(v137, *(float32x2_t *)v116.f32).u32[0];
      v139 = (int32x2_t)vsub_f32(v137, *(float32x2_t *)v116.f32);
      HIDWORD(v138) = v139.i32[1];
      v140.i64[1] = v138;
    }
    *(float *)v139.i32 = 0.5 / v134;
    v130 = (float32x4_t)vdupq_lane_s32(v139, 0);
LABEL_42:
    v223 = vmulq_f32(v130, v140);
    sub_1B17C99D0(&v223);
    *(_QWORD *)&v74 = v222;
    v143 = vabsq_f32(v221);
    v143.i32[3] = 0;
    v144 = v223;
    v145.i64[0] = 0x8000000080000000;
    v145.i64[1] = 0x8000000080000000;
    v70 = (float32x4_t)vorrq_s8((int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v143, (float32x4_t)xmmword_1B2245780) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), vandq_s8((int8x16_t)v221, v145));
    v72 = vmulq_f32(v144, v144);
    v146 = vmulq_laneq_f32(v144, v144, 3);
    v147 = vmulq_lane_f32(v144, *(float32x2_t *)v144.f32, 1).f32[0];
    v148 = vaddq_f32(v70, v70);
    v72.f32[0] = 0.5 - v72.f32[0];
    v149 = vmul_laneq_f32(*(float32x2_t *)v144.f32, v144, 2);
    v71.i32[3] = 0;
    v71.f32[0] = (float)(0.5 - v72.f32[1]) - v72.f32[2];
    v71.f32[1] = v147 + v146.f32[2];
    v150.i32[3] = 0;
    v71.f32[2] = v149.f32[0] - v146.f32[1];
    v70.i64[0] = vmulq_n_f32(v71, v148.f32[0]).u64[0];
    v150.f32[0] = v147 - v146.f32[2];
    v150.f32[1] = v72.f32[0] - v72.f32[2];
    v150.f32[2] = v149.f32[1] + v146.f32[0];
    v71.i64[0] = vmulq_lane_f32(v150, *(float32x2_t *)v148.f32, 1).u64[0];
    *(int32x2_t *)v146.f32 = vrev64_s32(*(int32x2_t *)v146.f32);
    v151.i32[0] = vadd_f32(v149, *(float32x2_t *)v146.f32).u32[0];
    v151.i32[1] = vsub_f32(v149, *(float32x2_t *)&v146).i32[1];
    v151.f32[2] = v72.f32[0] - v72.f32[1];
    v151.i32[3] = 0;
    v72.i64[0] = vmulq_laneq_f32(v151, v148, 2).u64[0];
  }
  objc_msgSend_setTransform_(self->_freeViewCameraNode, v29, v30, v31, *(double *)v70.i64, *(double *)v71.i64, *(double *)v72.i64, *(double *)&v74, *(_OWORD *)&v221, v222);
  objc_msgSend_setName_(self->_freeViewCameraNode, v152, (uint64_t)CFSTR("kVFXFreeViewCameraName"), v153);
  v156 = objc_msgSend_stringByAppendingString_(CFSTR("kVFXFreeViewCameraName"), v154, (uint64_t)CFSTR("Camera"), v155);
  v160 = (void *)objc_msgSend_camera(self->_freeViewCameraNode, v157, v158, v159);
  objc_msgSend_setName_(v160, v161, v156, v162);
  v166 = (void *)objc_msgSend_view(self, v163, v164, v165);
  if (objc_msgSend__showsAuthoringEnvironment(v166, v167, v168, v169))
  {
    v173 = (void *)objc_msgSend_camera(self->_freeViewCameraNode, v170, v171, v172);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v173, v174, 1, v175);
  }
  v176 = (void *)objc_msgSend_view(self, v170, v171, v172);
  v180 = (void *)objc_msgSend_world(v176, v177, v178, v179);
  v184 = objc_msgSend_worldRef(v180, v181, v182, v183);
  if (v184)
  {
    v188 = v184;
    v189 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v185, v186, v187);
    if (!sub_1B17C61FC(v189, v190, v191, v192, v193, v194, v195, v196))
    {
      sub_1B187973C(v188, v197, v198, v199, v200, v201, v202, v203);
      v207 = (uint64_t *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v204, v205, v206);
      sub_1B17C5FC0(v207, v188, v208, v209, v210, v211, v212, v213);
      sub_1B18797B4(v188, v214, v215, v216, v217, v218, v219, v220);
    }
  }
}

- (void)_installFreeViewCameraIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  VFXNode *freeViewCameraNode;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3))
  {
    v8 = (void *)objc_msgSend_view(self, v5, v6, v7);
    v12 = (void *)objc_msgSend_renderer(v8, v9, v10, v11);
    if ((VFXNode *)objc_msgSend_pointOfView(v12, v13, v14, v15) != self->_freeViewCameraNode)
    {
      objc_msgSend_begin(VFXTransaction, v16, v17, v18);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v19, v20, v21, 0.0);
      objc_msgSend_setPointOfView_(v12, v22, (uint64_t)self->_freeViewCameraNode, v23);
      freeViewCameraNode = self->_freeViewCameraNode;
      v28 = (void *)objc_msgSend_cameraController(self, v25, v26, v27);
      objc_msgSend_setPointOfView_(v28, v29, (uint64_t)freeViewCameraNode, v30);
      objc_msgSend_commit(VFXTransaction, v31, v32, v33);
    }
  }
}

- (void)_switchToFreeViewCamera
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  if ((objc_msgSend_enableFreeCamera(self, a2, v2, v3) & 1) != 0)
  {
    if ((objc_msgSend__freeCameraActivated(self, v5, v6, v7) & 1) == 0)
    {
      objc_msgSend_begin(VFXTransaction, v8, v9, v10);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v26, v27, v28, 0.0);
      objc_msgSend__prepareFreeViewCamera(self, v29, v30, v31);
      objc_msgSend__installFreeViewCameraIfNeeded(self, v32, v33, v34);
      objc_msgSend_commit(VFXTransaction, v35, v36, v37);
    }
  }
  else
  {
    v11 = (void *)objc_msgSend_view(self, v5, v6, v7);
    v15 = (void *)objc_msgSend_renderer(v11, v12, v13, v14);
    v19 = objc_msgSend_pointOfView(v15, v16, v17, v18);
    v23 = (void *)objc_msgSend_cameraController(self, v20, v21, v22);
    objc_msgSend_setPointOfView_(v23, v24, v19, v25);
  }
}

- (float)_cappedTranslationDelta:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float32x4_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float v41;
  float v43;
  float32x4_t v46;
  float32x4_t v47;

  objc_msgSend__targetDistance(self, a2, v3, v4);
  if (v10 >= 10000000.0)
  {
    v11 = (void *)objc_msgSend_cameraController(self, v7, v8, v9);
    objc_msgSend_simdTarget(v11, v12, v13, v14);
    v46 = v15;
    v19 = (void *)objc_msgSend_pointOfView(self, v16, v17, v18);
    v23 = (void *)objc_msgSend_presentationNode(v19, v20, v21, v22);
    objc_msgSend_worldPosition(v23, v24, v25, v26);
    v47 = vsubq_f32(v46, v27);
    v31 = (void *)objc_msgSend_cameraController(self, v28, v29, v30);
    v35 = (void *)objc_msgSend_pointOfView(v31, v32, v33, v34);
    objc_msgSend_worldFront(v35, v36, v37, v38);
    v40 = vmulq_f32(v47, v39);
    v41 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).f32[0];
    if (v41 >= 0.0 && a3 < 0.0)
      v43 = 0.0;
    else
      v43 = a3;
    if (v43 > 0.0 && v41 < 0.0)
      return 0.0;
    else
      return v43;
  }
  return a3;
}

- (float)_translationCoef
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;

  objc_msgSend__targetDistance(self, a2, v2, v3);
  v5 = v4;
  if (v5 > 10000000.0)
    v5 = 10000000.0;
  v6 = v5 * 0.00999999978;
  v7 = v5 <= 0.1;
  v8 = 0.000999999978;
  if (!v7)
    return v6;
  return v8;
}

- (float)_targetDistance
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float result;
  float32x4_t v21;

  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  objc_msgSend_simdTarget(v5, v6, v7, v8);
  v21 = v9;
  v13 = (void *)objc_msgSend_pointOfView(self, v10, v11, v12);
  objc_msgSend_worldPosition(v13, v14, v15, v16);
  v18 = vsubq_f32(v17, v21);
  v19 = vmulq_f32(v18, v18);
  result = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
  if (result <= 0.1)
    return 0.1;
  return result;
}

- (void)rotateOf:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend_begin(VFXTransaction, a2, v3, v4);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.0);
  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, v10, v11, v12))
    objc_msgSend__switchToFreeViewCamera(self, v10, v11, v12);
  v13 = (void *)objc_msgSend_view(self, v10, v11, v12);
  objc_msgSend_bounds(v13, v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v21 = v17 * 0.5;
  v22 = v19 * 0.5;
  v26 = (void *)objc_msgSend_cameraController(self, v23, v24, v25);
  *(float *)&v27 = a3;
  objc_msgSend_rollBy_aroundScreenPoint_viewport_(v26, v28, v29, v30, v27, v21, v22, v18, v20);
  objc_msgSend_commit(VFXTransaction, v31, v32, v33);
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a4;
  if (objc_msgSend_pointOfView(self, a2, a4, v4))
  {
    if (v5)
    {
      objc_msgSend_begin(VFXTransaction, v8, v9, v10);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.3);
      v17 = (void *)objc_msgSend_cameraController(self, v14, v15, v16);
      *(float *)&v18 = a3 * -100.0;
      LODWORD(v19) = 0;
      LODWORD(v20) = 0;
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v17, v21, v22, v23, v19, v20, v18);
      objc_msgSend_commit(VFXTransaction, v24, v25, v26);
    }
    else
    {
      v27 = (void *)objc_msgSend_cameraController(self, v8, v9, v10);
      *(float *)&v28 = a3 * -100.0;
      LODWORD(v29) = 0;
      LODWORD(v30) = 0;
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v27, v31, v32, v33, v29, v30, v28);
    }
  }
}

- (void)zoomBy:(float)a3
{
  ((void (*)(VFXCameraNavigationController *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_zoomBy_animate_, 1);
}

- (float)zoomFactor
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  v5 = objc_msgSend__pointOfViewUsesOrthographicProjection(self, a2, v2, v3);
  v6 = 76;
  if (v5)
    v6 = 84;
  return *(float *)((char *)&self->super.isa + v6);
}

- (id)pointOfView
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  return (id)objc_msgSend_pointOfView(v4, v5, v6, v7);
}

- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float v7;
  float v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  float v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float originalOrthoScale;
  double v35;
  float v36;
  float v37;
  double v38;
  float v39;
  float v40;

  objc_msgSend__orthographicScaleForZoomFactor_(self, a2, v3, v4);
  v8 = v7;
  objc_msgSend__worldBoundingSphere(self, v9, v10, v11);
  v16 = v15;
  if (v15 != 0.0)
  {
    v17 = (void *)objc_msgSend_view(self, v12, v13, v14);
    objc_msgSend_bounds(v17, v18, v19, v20);
    v22 = v21;
    v26 = (void *)objc_msgSend_view(self, v23, v24, v25);
    objc_msgSend_bounds(v26, v27, v28, v29);
    v31 = v30;
    if (v31 >= v22)
      v32 = v30;
    else
      v32 = v22;
    if (v31 >= v22)
      v31 = v22;
    v33 = v31 / fmaxf(v32, 1.0);
    originalOrthoScale = self->_originalOrthoScale;
    v35 = v16 * 10000000.0;
    if (v35 <= originalOrthoScale)
    {
      v37 = self->_originalOrthoScale;
    }
    else
    {
      v36 = v35;
      v37 = v36;
    }
    v38 = v16 * 0.00001 * v33;
    if (v38 <= originalOrthoScale)
    {
      v39 = v38;
      v40 = v39;
    }
    else
    {
      v40 = self->_originalOrthoScale;
    }
    if (v8 <= v37)
    {
      if (v8 < v40)
        return originalOrthoScale / v40;
    }
    else
    {
      return originalOrthoScale / v37;
    }
  }
  return a3;
}

- (float)_orthographicScaleForZoomFactor:(float)a3
{
  return self->_originalOrthoScale / a3;
}

- (void)setZoomFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  long double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  long double v28;
  double v29;
  float v30;
  void *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  objc_msgSend_zoomFactor(self, a2, v3, v4);
  if (a3 > 0.0 && v10 != a3)
  {
    v12 = (void *)objc_msgSend_pointOfView(self, v7, v8, v9);
    if ((objc_msgSend__pointOfViewUsesOrthographicProjection(self, v13, v14, v15) & 1) != 0)
    {
      *(float *)&v19 = a3;
      objc_msgSend__orthographicZoomFactorForProposedZoomFactor_(self, v16, v17, v18, v19);
      self->_orthographicZoomFactor = v20;
      objc_msgSend__orthographicScaleForZoomFactor_(self, v21, v22, v23);
      MEMORY[0x1E0DE7D20](self, sel__setPointOfViewOrthographicScale_, v36, v37);
    }
    else
    {
      v24 = tan(self->_cameraOriginalFieldOfView * 0.5 / 180.0 * 3.14159265);
      v28 = atan(v24 / a3);
      *(float *)&v28 = v28 / 3.14159265 * 180.0 + v28 / 3.14159265 * 180.0;
      v29 = fmin(*(float *)&v28, 120.0);
      if (v29 < 1.0)
        v29 = 1.0;
      v30 = v29;
      v31 = (void *)objc_msgSend_camera(v12, v25, v26, v27);
      *(float *)&v32 = v30;
      objc_msgSend_setFieldOfView_(v31, v33, v34, v35, v32);
      self->_fieldOfViewZoomFactor = a3;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  float32x4_t v13;
  __int32 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;

  v29.i64[0] = *(_QWORD *)&a3;
  if (objc_msgSend_pointOfView(self, a2, v5, v6))
  {
    *(float *)&v12 = a5;
    objc_msgSend__cappedTranslationDelta_(self, v9, v10, v11, v12);
    v13 = v29;
    v13.f32[1] = a4;
    v13.i32[2] = v14;
    v30 = v13;
    objc_msgSend__translationCoef(self, v15, v16, v17);
    v31 = vmulq_n_f32(v30, v18);
    v22 = (void *)objc_msgSend_cameraController(self, v19, v20, v21);
    LODWORD(v23) = v31.i32[1];
    *(float *)&v24 = -v31.f32[2];
    objc_msgSend_translateInCameraSpaceByX_Y_Z_(v22, v25, v26, v27, *(double *)v31.i64, v23, v24);
  }
}

- (void)cameraRotationWillStartForController:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)objc_msgSend_pointOfView(a3, a2, (uint64_t)a3, v3);
  if (objc_msgSend_authoringCameraType(v5, v6, v7, v8))
    objc_msgSend__switchToFreeViewCamera(self, v9, v10, v11);
}

- (void)worldWillChange
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  *(_WORD *)&self->_isWorldBoundingSphereComputed = 0;
  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  objc_msgSend_setSimdTarget_(v5, v6, v7, v8, 0.0);
  objc_msgSend__resetFreeViewCamera(self, v9, v10, v11);
}

- (void)worldDidChange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend_invalidateCameraTarget(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_view(self, v5, v6, v7);
  v12 = (void *)objc_msgSend_renderer(v8, v9, v10, v11);
  v16 = objc_msgSend_pointOfView(v12, v13, v14, v15);
  if (v16)
  {
    v20 = v16;
    v21 = (void *)objc_msgSend_cameraController(self, v17, v18, v19);
    objc_msgSend_setPointOfView_(v21, v22, v20, v23);
    self->_cameraTargetComputed = 0;
    v27 = (void *)objc_msgSend_cameraController(self, v24, v25, v26);
    objc_msgSend_setSimdTarget_(v27, v28, v29, v30, 0.0);
    objc_msgSend__computeAutomaticTargetPointIfNeeded(self, v31, v32, v33);
  }
}

- (void)viewWillDrawAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;

  v7 = objc_msgSend_immediateMode(VFXTransaction, a2, v3, v4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  v13 = (void *)objc_msgSend_cameraController(self, v10, v11, v12);
  if (objc_msgSend_isInertiaRunning(v13, v14, v15, v16))
  {
    v20 = (void *)objc_msgSend_view(self, v17, v18, v19);
    v24 = (void *)objc_msgSend_world(v20, v21, v22, v23);
    v28 = objc_msgSend_worldRef(v24, v25, v26, v27);
    if (v28)
    {
      v36 = v28;
      sub_1B187973C(v28, (uint64_t)v29, v30, v31, v32, v33, v34, v35);
      v40 = (void *)objc_msgSend_cameraController(self, v37, v38, v39);
      objc_msgSend_updateInertiaAtTime_(v40, v41, v42, v43, a3);
      sub_1B18797B4(v36, v44, v45, v46, v47, v48, v49, v50);
    }
    else
    {
      v51 = (void *)objc_msgSend_cameraController(self, v29, v30, v31);
      objc_msgSend_updateInertiaAtTime_(v51, v52, v53, v54, a3);
    }
  }
  os_unfair_lock_unlock(&self->_drawAtTimeLock);
  objc_msgSend_setImmediateMode_(VFXTransaction, v55, v7, v56);
}

- (void)_setupUpVector
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float v20;
  int32x4_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  uint64_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int32x4_t v41;
  float32x4_t v42;
  int32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  int8x16_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  int32x4_t v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x4_t v54;
  int32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float v58;
  float v59;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  int32x4_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x4_t v68;
  int32x4_t v69;
  int8x16_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  int32x4_t v74;
  int8x16_t v75;
  float32x4_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;

  v5 = (void *)objc_msgSend_pointOfView(self, a2, v2, v3);
  objc_msgSend_convertVector_fromNode_(v5, v6, 0, v7);
  if (fabsf(v11.f32[0]) < 0.001 && fabsf(v11.f32[1]) < 0.001)
    goto LABEL_19;
  v11.i32[2] = 0;
  v12 = vmulq_f32(v11, v11);
  v12.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u64[0];
  v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 0);
  v13.i32[3] = 0;
  v14 = vrsqrteq_f32(v13);
  v15 = vmulq_f32(v14, vrsqrtsq_f32(v13, vmulq_f32(v14, v14)));
  v16 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v12.f32[0] != 0.0)), 0x1FuLL));
  v16.i32[3] = 0;
  v17 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v16), (int8x16_t)vmulq_f32(v11, vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)))), (int8x16_t)v11);
  v18 = (float32x4_t)xmmword_1B2244DD0;
  v19 = vmulq_f32(v17, (float32x4_t)xmmword_1B2244DD0);
  LODWORD(v20) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).u32[0];
  if (fabsf(v20) > 0.99)
    goto LABEL_19;
  if (v20 >= 0.0)
  {
    v50 = vaddq_f32(v17, (float32x4_t)xmmword_1B2244DD0);
    v51 = (int32x4_t)vmulq_f32(v50, v50);
    v51.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v51, 2), vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v51.i8, 1))).u32[0];
    v52 = vrsqrte_f32((float32x2_t)v51.u32[0]);
    v53 = vmul_f32(v52, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v52, v52)));
    v54 = vmulq_n_f32(v50, vmul_f32(v53, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v53, v53))).f32[0]);
    v55 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v54, (int32x4_t)v54), (int8x16_t)v54, 0xCuLL), vnegq_f32(v17)), v54, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
    v49 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v55, v55), (int8x16_t)v55, 0xCuLL);
    v56 = vmulq_f32(v17, v54);
    v49.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).u32[0];
  }
  else
  {
    v21 = (int32x4_t)vmulq_f32(v17, v17);
    v21.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))).u32[0];
    v22 = vrsqrte_f32((float32x2_t)v21.u32[0]);
    v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v22, v22)));
    v24 = vrsqrte_f32((float32x2_t)1065353216);
    v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v24, v24)));
    v26 = vaddq_f32(vmulq_n_f32(v17, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v23, v23))).f32[0]), vmulq_n_f32((float32x4_t)xmmword_1B2244DD0, vmul_f32(v25, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v25, v25))).f32[0]));
    v27 = vmulq_f32(v26, v26);
    v28 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0];
    if (v28 <= 1.4211e-14)
    {
      v57 = vabsq_f32(v17);
      v58 = v57.f32[1];
      v59 = v57.f32[2];
      if (v57.f32[0] > v57.f32[1] || v57.f32[0] > v57.f32[2])
      {
        v61 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
        if (v58 <= v59)
        {
          v62 = vmulq_f32(v17, (float32x4_t)xmmword_1B2244F20);
        }
        else
        {
          v62 = vmulq_f32(v17, (float32x4_t)xmmword_1B2244EF0);
          v18 = (float32x4_t)xmmword_1B2244D90;
        }
        v63 = vmlaq_f32(v62, v18, v61);
      }
      else
      {
        v63 = vmlaq_f32(vmulq_f32(v17, (float32x4_t)xmmword_1B2244F00), (float32x4_t)xmmword_1B2244DB0, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
      }
      v64 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v63, (int32x4_t)v63), (int8x16_t)v63, 0xCuLL);
      v65 = (int32x4_t)vmulq_f32(v63, v63);
      v65.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v65.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v65, 2), *(float32x2_t *)v65.i8)).u32[0];
      v66 = vrsqrte_f32((float32x2_t)v65.u32[0]);
      v67 = vmul_f32(v66, vrsqrts_f32((float32x2_t)v65.u32[0], vmul_f32(v66, v66)));
      v49 = vmulq_n_f32(v64, vmul_f32(v67, vrsqrts_f32((float32x2_t)v65.u32[0], vmul_f32(v67, v67))).f32[0]);
      v49.i32[3] = 0;
    }
    else
    {
      v29 = LODWORD(v28);
      v30 = vrsqrte_f32((float32x2_t)LODWORD(v28));
      v31 = vmul_f32(v30, vrsqrts_f32((float32x2_t)v29, vmul_f32(v30, v30)));
      v32 = vmulq_n_f32(v26, vmul_f32(v31, vrsqrts_f32((float32x2_t)v29, vmul_f32(v31, v31))).f32[0]);
      v33 = vaddq_f32(v17, v32);
      v34 = (int32x4_t)vmulq_f32(v33, v33);
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
      v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
      v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
      v37 = vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
      v38 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL), vnegq_f32(v17)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL));
      v39 = vmulq_f32(v17, v37);
      v40 = vaddq_f32(v32, (float32x4_t)xmmword_1B2244DD0);
      v41 = (int32x4_t)vmulq_f32(v40, v40);
      v41.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1))).u32[0];
      *(float32x2_t *)v37.f32 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      *(float32x2_t *)v37.f32 = vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32)));
      v42 = vmulq_n_f32(v40, vmul_f32(*(float32x2_t *)v37.f32, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(*(float32x2_t *)v37.f32, *(float32x2_t *)v37.f32))).f32[0]);
      v43 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL), vnegq_f32(v32)), v42, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v32, 0xCuLL));
      v44 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v43, v43), (int8x16_t)v43, 0xCuLL);
      v45 = vmulq_f32(v32, v42);
      v44.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).u32[0];
      v46 = (int32x4_t)vnegq_f32(v44);
      v47 = (int8x16_t)vtrn2q_s32((int32x4_t)v44, vtrn1q_s32((int32x4_t)v44, v46));
      v48 = (float32x4_t)vrev64q_s32((int32x4_t)v44);
      v48.i32[0] = v46.i32[1];
      v48.i32[3] = v46.i32[2];
      v49 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]), v48, *(float32x2_t *)v38.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v44, (int8x16_t)v46, 8uLL), v38.f32[0]), (float32x4_t)vextq_s8(v47, v47, 8uLL), v38, 2));
    }
  }
  v68 = vmulq_f32(v49, (float32x4_t)xmmword_1B2244F80);
  v69 = (int32x4_t)vnegq_f32(v68);
  v70 = (int8x16_t)vtrn2q_s32((int32x4_t)v68, vtrn1q_s32((int32x4_t)v68, v69));
  v71 = vmlaq_f32((float32x4_t)vextq_s8((int8x16_t)v68, (int8x16_t)v69, 8uLL), (float32x4_t)0, (float32x4_t)vextq_s8(v70, v70, 8uLL));
  v72 = (float32x4_t)vrev64q_s32((int32x4_t)v68);
  v72.i32[0] = v69.i32[1];
  v72.i32[3] = v69.i32[2];
  v73 = vmlaq_f32(v71, (float32x4_t)0, v72);
  v74 = (int32x4_t)vnegq_f32(v73);
  v75 = (int8x16_t)vtrn2q_s32((int32x4_t)v73, vtrn1q_s32((int32x4_t)v73, v74));
  v76 = (float32x4_t)vrev64q_s32((int32x4_t)v73);
  v76.i32[0] = v74.i32[1];
  v76.i32[3] = v74.i32[2];
  v77 = (void *)objc_msgSend_pointOfView(self, v8, v9, v10, vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v73, v49, 3), v76, v49, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v73, (int8x16_t)v74, 8uLL), *(float32x2_t *)v49.f32, 1), (float32x4_t)vextq_s8(v75, v75, 8uLL), v49.f32[0])));
  objc_msgSend_worldRight(v77, v78, v79, v80);
  v82 = vmulq_f32(v81, v83);
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v82, 2), vaddq_f32(v82, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v82.f32, 1))).f32[0]) <= 0.70711)MEMORY[0x1E0DE7D20](self->_cameraController, sel_setSimdUp_, v9, v10);
  else
LABEL_19:
    MEMORY[0x1E0DE7D20](self->_cameraController, sel_setUp_, v9, v10);
}

- (void)_willBeginInteraction
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  uint32x4_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  double v46;

  if (!self->_cameraTargetComputed)
  {
    v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
    if ((objc_msgSend_automaticTarget(v5, v6, v7, v8) & 1) == 0)
    {
      v9 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
      objc_msgSend_simdTarget(v9, v10, v11, v12);
      v14 = (uint32x4_t)vceqzq_f32(v13);
      v14.i32[3] = v14.i32[2];
      if ((vminvq_u32(v14) & 0x80000000) != 0)
      {
        self->_cameraTargetComputed = 1;
        v15 = (void *)objc_msgSend_view(self, a2, v2, v3);
        v19 = objc_msgSend_world(v15, v16, v17, v18);
        objc_msgSend__defaultTargetForWorld_(self, v20, v19, v21);
        v46 = v22;
        v26 = (void *)objc_msgSend_cameraController(self, v23, v24, v25);
        objc_msgSend_setSimdTarget_(v26, v27, v28, v29, v46);
      }
    }
  }
  objc_msgSend__stopInertia(self, a2, v2, v3);
  v33 = (void *)objc_msgSend_pointOfView(self, v30, v31, v32);
  v37 = (void *)objc_msgSend_camera(v33, v34, v35, v36);
  objc_msgSend_fieldOfView(v37, v38, v39, v40);
  self->_cameraOriginalFieldOfView = v41;
  self->_fieldOfViewZoomFactor = 1.0;
  objc_msgSend__pointOfViewOrthographicScale(self, v42, v43, v44);
  self->_originalOrthoScale = v45;
  self->_orthographicZoomFactor = 1.0;
}

- (void)cameraDidChange
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = objc_msgSend_pointOfView(v9, v10, v11, v12);
  v17 = (void *)objc_msgSend_cameraController(self, v14, v15, v16);
  objc_msgSend_setPointOfView_(v17, v18, v13, v19);
  MEMORY[0x1E0DE7D20](self, sel__setupUpVector, v20, v21);
}

- (void)_stopInertia
{
  os_unfair_lock_s *p_drawAtTimeLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  p_drawAtTimeLock = &self->_drawAtTimeLock;
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  v7 = (void *)objc_msgSend_cameraController(self, v4, v5, v6);
  objc_msgSend_stopInertia(v7, v8, v9, v10);
  os_unfair_lock_unlock(p_drawAtTimeLock);
}

- (id)gestureRecognizers
{
  uint64_t v2;
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  UIGestureRecognizer *v10;
  UIGestureRecognizer *v11;
  UIGestureRecognizer *v12;
  const char *v13;
  uint64_t v14;
  UIGestureRecognizer *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;

  tapGesture = self->_tapGesture;
  if (tapGesture)
    return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], a2, (uint64_t)self->_pressGesture, v2, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
  v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC39C8]);
  objc_msgSend_setMinimumPressDuration_(v6, v7, v8, v9, 0.0);
  v10 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  v11 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3AE8]);
  v12 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3AA0]);
  objc_msgSend_setAllowedScrollTypesMask_(v12, v13, 3, v14);
  v15 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3BB8]);
  objc_msgSend_setNumberOfTapsRequired_(v10, v16, 2, v17);
  objc_msgSend_addTarget_action_(v11, v18, (uint64_t)self, (uint64_t)sel__handlePinch_);
  objc_msgSend_addTarget_action_(v12, v19, (uint64_t)self, (uint64_t)sel__handlePan_);
  objc_msgSend_addTarget_action_(v6, v20, (uint64_t)self, (uint64_t)sel__handlePress_);
  objc_msgSend_addTarget_action_(v15, v21, (uint64_t)self, (uint64_t)sel__handleRotation_);
  objc_msgSend_addTarget_action_(v10, v22, (uint64_t)self, (uint64_t)sel__handleDoubleTap_);
  objc_msgSend_setDelegate_(v6, v23, (uint64_t)self, v24);
  objc_msgSend_setDelegate_(v12, v25, (uint64_t)self, v26);
  objc_msgSend_setDelegate_(v11, v27, (uint64_t)self, v28);
  objc_msgSend_setDelegate_(v15, v29, (uint64_t)self, v30);
  objc_msgSend_setDelegate_(v10, v31, (uint64_t)self, v32);
  objc_msgSend_setDelaysTouchesBegan_(v11, v33, 0, v34);
  objc_msgSend_setDelaysTouchesBegan_(v15, v35, 0, v36);
  objc_msgSend_setDelaysTouchesBegan_(v12, v37, 0, v38);
  objc_msgSend_setDelaysTouchesBegan_(v10, v39, 0, v40);
  objc_msgSend_setDelaysTouchesBegan_(v6, v41, 0, v42);
  objc_msgSend_setCancelsTouchesInView_(v11, v43, 0, v44);
  objc_msgSend_setCancelsTouchesInView_(v15, v45, 0, v46);
  objc_msgSend_setCancelsTouchesInView_(v12, v47, 0, v48);
  objc_msgSend_setCancelsTouchesInView_(v10, v49, 0, v50);
  objc_msgSend_setCancelsTouchesInView_(v6, v51, 0, v52);
  v56 = objc_msgSend_enabled(self, v53, v54, v55);
  objc_msgSend_setEnabled_(v11, v57, v56, v58);
  v62 = objc_msgSend_enabled(self, v59, v60, v61);
  objc_msgSend_setEnabled_(v15, v63, v62, v64);
  v68 = objc_msgSend_enabled(self, v65, v66, v67);
  objc_msgSend_setEnabled_(v12, v69, v68, v70);
  v74 = objc_msgSend_enabled(self, v71, v72, v73);
  objc_msgSend_setEnabled_(v10, v75, v74, v76);
  v80 = objc_msgSend_enabled(self, v77, v78, v79);
  objc_msgSend_setEnabled_(v6, v81, v80, v82);
  self->_pinchGesture = v11;
  self->_panGesture = v12;
  self->_rotateGesture = v15;
  self->_pressGesture = v6;
  self->_tapGesture = v10;
  return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v83, (uint64_t)v6, v84, v12, v10, v11, v15, 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  int v7;
  UIGestureRecognizer *pressGesture;
  BOOL v9;
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *panGesture;

  v7 = objc_msgSend_enabled(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v7)
  {
    pressGesture = self->_pressGesture;
    v9 = pressGesture == a3 || pressGesture == a4;
    LOBYTE(v7) = v9
              || (tapGesture = self->_tapGesture, panGesture = self->_panGesture, tapGesture == a3)
              && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)
              || tapGesture == a4 && panGesture == a3
              || tapGesture == a4 && self->_pinchGesture == a3;
  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  int v8;

  v8 = objc_msgSend_enabled(self, a2, (uint64_t)a3, v3);
  if (v8)
    objc_msgSend_beginGesture_(self, v6, (uint64_t)a3, v7);
  return v8;
}

- (void)_handlePinch:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
    MEMORY[0x1E0DE7D20](self, sel_pinchWithGestureRecognizer_, a3, v6);
}

- (void)_handlePan:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
    MEMORY[0x1E0DE7D20](self, sel_panWithGestureRecognizer_, a3, v6);
}

- (void)_handleRotation:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
    MEMORY[0x1E0DE7D20](self, sel_rotateWithGestureRecognizer_, a3, v6);
}

- (void)_handleDoubleTap:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (objc_msgSend_enabled(self, a2, (uint64_t)a3, v3))
  {
    v8 = objc_msgSend_delegate(self, v5, v6, v7);
    MEMORY[0x1E0DE7D20](v8, sel_switchToNextCamera, v9, v10);
  }
}

- (void)beginGesture:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;

  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, a2, (uint64_t)a3, v3))
    objc_msgSend__switchToFreeViewCamera(self, a2, (uint64_t)a3, v3);
  objc_msgSend__willBeginInteraction(self, a2, (uint64_t)a3, v3);
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend_numberOfTouches(a3, v6, v7, v8))
  {
    v12 = objc_msgSend_view(self, v9, v10, v11);
    objc_msgSend_locationInView_(a3, v13, v12, v14);
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v16 = 0.0;
    v18 = 0.0;
  }
  self->_lastInputLocation.x = v16;
  self->_lastInputLocation.y = v18;
  self->_lastRotationAngle = 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__startBrowsingIfNeeded_(self, v19, v20, v21, v16, v18);
    v22 = 2;
LABEL_13:
    self->_browseMode = v22;
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__startBrowsingIfNeeded_(self, v23, v24, v25, v16, v18);
    if (self->_translationAllowed)
    {
      self->_browseMode = 3;
      v29 = (void *)objc_msgSend_view(self, v26, v27, v28);
      objc_msgSend_bounds(v29, v30, v31, v32);
      objc_msgSend__computeTranslationOrigin3DFromPoint_(self, v34, v35, v36, v16, v33 - v18);
    }
    v22 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_zoomFactor(self, v37, v38, v39);
    self->_initialZoom = v40;
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  uint64_t v3;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend_rotation(a3, a2, (uint64_t)a3, v3);
  v7 = v6;
  objc_msgSend__stopInertia(self, v8, v9, v10);
  if (objc_msgSend_state(a3, v11, v12, v13) == 1)
    objc_msgSend___willChangePointOfView(self, v14, v15, v16);
  objc_msgSend_begin(VFXTransaction, v14, v15, v16);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v17, v18, v19, 0.0);
  v20 = (v7 - self->_lastRotationAngle) / 3.14159265 * -180.0;
  *(float *)&v20 = v20;
  objc_msgSend_rotateOf_(self, v21, v22, v23, v20);
  objc_msgSend_commit(VFXTransaction, v24, v25, v26);
  v27 = v7;
  self->_lastRotationAngle = v27;
  if (objc_msgSend_state(a3, v28, v29, v30) == 4 || objc_msgSend_state(a3, v31, v32, v33) == 3)
    objc_msgSend___didChangePointOfView(self, v31, v32, v33);
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  objc_msgSend__stopInertia(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_state(a3, v6, v7, v8) == 1)
    objc_msgSend___willChangePointOfView(self, v9, v10, v11);
  objc_msgSend_begin(VFXTransaction, v9, v10, v11);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v12, v13, v14, 0.0);
  v15 = fmax(self->_initialZoom, 0.001);
  objc_msgSend_scale(a3, v16, v17, v18);
  v20 = v19 * v15;
  *(float *)&v20 = v20;
  objc_msgSend_setZoomFactor_(self, v21, v22, v23, v20);
  objc_msgSend_commit(VFXTransaction, v24, v25, v26);
  if (objc_msgSend_state(a3, v27, v28, v29) == 4 || objc_msgSend_state(a3, v30, v31, v32) == 3)
    objc_msgSend___didChangePointOfView(self, v30, v31, v32);
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  float v91;
  float v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  float v97;
  float v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;

  v6 = objc_msgSend_numberOfTouches(a3, a2, (uint64_t)a3, v3);
  if (self->_browseMode != 2)
  {
    v10 = v6;
    v11 = objc_msgSend_view(self, v7, v8, v9);
    objc_msgSend_locationInView_(a3, v12, v11, v13);
    v15 = v14;
    v17 = v16;
    objc_msgSend__stopInertia(self, v18, v19, v20);
    if (objc_msgSend_state(a3, v21, v22, v23) == 1)
      objc_msgSend___willChangePointOfView(self, v24, v25, v26);
    objc_msgSend_begin(VFXTransaction, v24, v25, v26);
    objc_msgSend_setAnimationDuration_(VFXTransaction, v27, v28, v29, 0.0);
    if (objc_msgSend_state(a3, v30, v31, v32) == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        v36 = objc_msgSend_view(self, v33, v34, v35);
        objc_msgSend_velocityInView_(a3, v37, v36, v38);
        v42 = (void *)objc_msgSend_view(self, v39, v40, v41);
        if (objc_msgSend_preferredFramesPerSecond(v42, v43, v44, v45))
        {
          v49 = (void *)objc_msgSend_view(self, v46, v47, v48);
          objc_msgSend_preferredFramesPerSecond(v49, v50, v51, v52);
        }
        v53 = (void *)objc_msgSend_cameraController(self, v46, v47, v48);
        v57 = (void *)objc_msgSend_view(self, v54, v55, v56);
        objc_msgSend_bounds(v57, v58, v59, v60);
        objc_msgSend_endInteraction_withViewport_velocity_(v53, v61, v62, v63, v15, v17);
        v67 = (void *)objc_msgSend_cameraController(self, v64, v65, v66);
        if ((objc_msgSend_isInertiaRunning(v67, v68, v69, v70) & 1) == 0)
          objc_msgSend___didChangePointOfView(self, v33, v34, v35);
      }
    }
    else
    {
      switch(v10)
      {
        case 3:
          if (self->_lastGestureFingerCount != 3)
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            self->_lastGestureFingerCount = 3;
          }
          objc_msgSend__translationCoef(self, v33, v34, v35);
          v92 = v91;
          v93 = v17 - self->_lastInputLocation.y;
          *(float *)&v93 = v93;
          objc_msgSend__cappedTranslationDelta_(self, v94, v95, v96, v93);
          v98 = v97;
          v102 = (void *)objc_msgSend_cameraController(self, v99, v100, v101);
          *(float *)&v103 = -(float)(v92 * v98);
          LODWORD(v104) = 0;
          LODWORD(v105) = 0;
          objc_msgSend_translateInCameraSpaceByX_Y_Z_(v102, v106, v107, v108, v104, v105, v103);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            self->_lastGestureFingerCount = 2;
          }
          v109 = (void *)objc_msgSend_view(self, v33, v34, v35);
          objc_msgSend_bounds(v109, v110, v111, v112);
          v17 = v113 - v17;
          objc_msgSend__translateToViewPoint_(self, v114, v115, v116, v15, v17);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            v71 = (void *)objc_msgSend_cameraController(self, v33, v34, v35);
            v75 = (void *)objc_msgSend_view(self, v72, v73, v74);
            objc_msgSend_bounds(v75, v76, v77, v78);
            v80 = v79;
            v82 = v81;
            objc_msgSend__modeSensitivity(self, v83, v84, v85);
            LODWORD(v87) = v86;
            objc_msgSend_continueInteraction_withViewport_sensitivity_(v71, v88, v89, v90, v15, v17, v80, v82, v87);
          }
          else
          {
            objc_msgSend_beginGesture_(self, v33, (uint64_t)a3, v35);
            v120 = (void *)objc_msgSend_cameraController(self, v117, v118, v119);
            v124 = (void *)objc_msgSend_view(self, v121, v122, v123);
            objc_msgSend_bounds(v124, v125, v126, v127);
            objc_msgSend_beginInteraction_withViewport_(v120, v128, v129, v130, v15, v17);
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
    objc_msgSend_commit(VFXTransaction, v33, v34, v35);
    self->_lastInputLocation.x = v15;
    self->_lastInputLocation.y = v17;
  }
}

- (float)_modeSensitivity
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float result;

  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  v9 = objc_msgSend_interactionMode(v5, v6, v7, v8);
  if (v9 >= 5)
  {
    if (v9 == 6)
    {
      MEMORY[0x1E0DE7D20](self, sel_truckSensitivity, v10, v11);
    }
    else if (v9 == 5)
    {
      MEMORY[0x1E0DE7D20](self, sel_panSensitivity, v10, v11);
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    MEMORY[0x1E0DE7D20](self, sel_rotationSensitivity, v10, v11);
  }
  return result;
}

- (uint64_t)worldFront
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend_cameraController(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_pointOfView(v4, v5, v6, v7);
  return objc_msgSend_worldFront(v8, v9, v10, v11);
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  VFXNode *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  __int128 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;

  y = a3.y;
  x = a3.x;
  objc_msgSend_begin(VFXTransaction, a2, v3, v4);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v8, v9, v10, 0.0);
  v17 = (VFXNode *)objc_msgSend_pointOfView(self, v11, v12, v13);
  if (self->_autoSwitchToFreeCamera || !objc_msgSend_pointOfView(self, v14, v15, v16))
    objc_msgSend__prepareFreeViewCamera(self, v14, v15, v16);
  if (!objc_msgSend_parentNode(v17, v14, v15, v16) && v17 != self->_freeViewCameraNode)
    objc_msgSend__installFreeViewCameraIfNeeded(self, v18, v19, v20);
  objc_msgSend_commit(VFXTransaction, v18, v19, v20);
  self->_initialInputLocation.x = x;
  self->_initialInputLocation.y = y;
  v24 = (void *)objc_msgSend_pointOfView(self, v21, v22, v23);
  objc_msgSend_convertPosition_toNode_(v24, v25, 0, v26, 0.0);
  *(_OWORD *)self->_initialPointOfViewWorldPosition = v27;
  objc_msgSend__pointOfViewOrthographicScale(self, v28, v29, v30);
  self->_originalOrthoScale = v31;
  self->_orthographicZoomFactor = 1.0;
}

- (double)_defaultTargetForWorld:(void *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float32x4_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  float32x4_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  float32x4_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  float v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  int32x4_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float32x4_t v38;
  double result;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *Object;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  double v63;
  float32x4_t v64;
  double v65;
  float32x4_t v66;
  float32x4_t v67;

  v6 = (void *)objc_msgSend_pointOfView(a1, a2, (uint64_t)a3, a4);
  objc_msgSend_worldFront(a1, v7, v8, v9);
  v66 = v10;
  v14 = (void *)objc_msgSend_presentationObject(v6, v11, v12, v13);
  objc_msgSend_convertPosition_toNode_(v14, v15, 0, v16, 0.0);
  v67 = v17;
  objc_msgSend__worldBoundingSphere(a1, v18, v19, v20);
  v63 = *(double *)v21.i64;
  v64 = vsubq_f32(v21, v67);
  v25 = (void *)objc_msgSend_camera(v6, v22, v23, v24);
  objc_msgSend_fieldOfView(v25, v26, v27, v28);
  v30 = v29 * 3.14159265 / 180.0;
  v34 = cosf(v30);
  v35 = (int32x4_t)vmulq_f32(v64, v64);
  v35.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1))).u32[0];
  v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  v38 = vmulq_f32(v66, vmulq_n_f32(v64, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]));
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0] > v34)return v63;
  v40 = (void *)objc_msgSend_camera(v6, v31, v32, v33);
  objc_msgSend_zFar(v40, v41, v42, v43);
  *(_QWORD *)&v65 = vmlaq_n_f32(v67, v66, v44).u64[0];
  v48 = (void *)objc_msgSend_rootNode(a3, v45, v46, v47);
  v51 = (void *)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(v48, v49, 0, v50, *(double *)v67.i64, v65);
  if (objc_msgSend_count(v51, v52, v53, v54))
  {
    Object = (void *)objc_msgSend_firstObject(v51, v55, v56, v57);
    objc_msgSend_worldCoordinates(Object, v59, v60, v61);
  }
  else
  {
    objc_msgSend__targetDistance(a1, v55, v56, v57);
    *(_QWORD *)&result = vmlaq_n_f32(v67, v66, v62).u64[0];
  }
  return result;
}

- (uint64_t)cameraAutomaticTargetPoint
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend__computeAutomaticTargetPointIfNeeded(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_cameraController(a1, v5, v6, v7);
  return objc_msgSend_target(v8, v9, v10, v11);
}

- (void)_computeAutomaticTargetPointIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  BOOL v38;
  float32x4_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  float32x4_t v44;
  float v45;
  float32x4_t v46;
  double v47;

  if (self->_target.hasAutomatic && !self->_target.automaticLocationUpToDate)
  {
    v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
    if ((objc_msgSend_automaticTarget(v5, v6, v7, v8) & 1) == 0)
    {
      self->_target.automaticLocationUpToDate = 1;
      v12 = (void *)objc_msgSend_pointOfView(self, v9, v10, v11);
      objc_msgSend_worldFront(self, v13, v14, v15);
      v44 = v16;
      objc_msgSend__targetDistance(self, v17, v18, v19);
      v45 = v20;
      v24 = (void *)objc_msgSend_presentationNode(v12, v21, v22, v23);
      objc_msgSend_worldPosition(v24, v25, v26, v27);
      v32 = v31;
      if (self->_didEverFocusNode)
      {
        v34 = v44;
        v33 = v45;
      }
      else
      {
        v46 = v31;
        objc_msgSend__worldBoundingSphere(self, v28, v29, v30);
        v32 = v46;
        v36 = vsubq_f32(v35, v46);
        v37 = vmulq_f32(v44, v36);
        v38 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0] <= 0.5;
        v34 = v44;
        v33 = v45;
        if (!v38)
        {
          v39 = vmulq_f32(v36, v36);
          v33 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]);
        }
      }
      *(_QWORD *)&v47 = vmlaq_n_f32(v32, v34, v33).u64[0];
      v40 = (void *)objc_msgSend_cameraController(self, v28, v29, v30);
      objc_msgSend_setSimdTarget_(v40, v41, v42, v43, v47);
    }
  }
}

- (__n128)_worldBoundingSphere
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 91))
  {
    v5 = (void *)objc_msgSend_view((void *)a1, a2, a3, a4);
    v9 = (void *)objc_msgSend_world(v5, v6, v7, v8);
    if (objc_msgSend_rootNode(v9, v10, v11, v12))
    {
      v16 = (void *)objc_msgSend_view((void *)a1, v13, v14, v15);
      v20 = (void *)objc_msgSend_world(v16, v17, v18, v19);
      v30[0] = objc_msgSend_rootNode(v20, v21, v22, v23);
      v25 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v30, 1);
      VFXNodeGetBoundingSphere(v25, 0, v26, v27);
      *(_OWORD *)(a1 + 112) = v28;
      *(_BYTE *)(a1 + 91) = 1;
    }
  }
  return *(__n128 *)(a1 + 112);
}

- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = MEMORY[0x1E0C809B0];
  *(_OWORD *)a4 = xmmword_1B22463E0;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = sub_1B180540C;
  v7[3] = &unk_1E63D68E8;
  v7[4] = a4;
  sub_1B186B018((uint64_t)a3, (uint64_t)v7);
  return *((float *)a4 + 3) >= 0.0;
}

- (void)_computeStickyAxisIfNeeded:(CGPoint)a3
{
  CGFloat y;
  float32x2_t v4;
  int32x2_t v5;
  int8x16_t v6;
  int64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  uint64_t v10;

  if (self->_stickyAxis.stickyMoveEnabled && !*(_QWORD *)&self->_anon_101[15])
  {
    y = a3.y;
    v4 = vcvt_f32_f64(vaddq_f64((float64x2_t)a3, vcvtq_f64_f32(*(float32x2_t *)&self->_anon_101[7])));
    *(float32x2_t *)&self->_anon_101[7] = v4;
    if (vaddv_f32(vmul_f32(v4, v4)) > 1.0)
    {
      v5 = vdup_n_s32(self->_browseMode == 3);
      v6 = (int8x16_t)vcvtq_f64_f32(v4);
      v7.i64[0] = v5.u32[0];
      v7.i64[1] = v5.u32[1];
      v8 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), v6, vextq_s8(v6, v6, 8uLL));
      v9 = vabsq_f64(v8);
      if ((vmovn_s64(vcgeq_f64(v9, (float64x2_t)vdupq_laneq_s64((int64x2_t)v9, 1))).u8[0] & 1) != 0 && v8.f64[0] != 0.0)
      {
        v10 = 1;
LABEL_10:
        *(_QWORD *)&self->_anon_101[15] = v10;
        return;
      }
      if (v8.f64[1] != 0.0)
      {
        v10 = 2;
        goto LABEL_10;
      }
    }
  }
}

- (float)_pointOfViewOrthographicScale
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float result;

  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_pointOfView(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_camera(v9, v10, v11, v12);
  v17 = (void *)objc_msgSend_cameraController(self, v14, v15, v16);
  v21 = (void *)objc_msgSend_pointOfView(v17, v18, v19, v20);
  v25 = objc_msgSend_light(v21, v22, v23, v24);
  if (!v13)
  {
    v13 = (void *)v25;
    if (!v25)
      return 1.0;
  }
  objc_msgSend_orthographicScale(v13, v26, v27, v28);
  return result;
}

- (void)_setPointOfViewOrthographicScale:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;

  v7 = (void *)objc_msgSend_cameraController(self, a2, v3, v4);
  v11 = (void *)objc_msgSend_pointOfView(v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_camera(v11, v12, v13, v14);
  v19 = (void *)objc_msgSend_cameraController(self, v16, v17, v18);
  v23 = (void *)objc_msgSend_pointOfView(v19, v20, v21, v22);
  v27 = objc_msgSend_light(v23, v24, v25, v26);
  if (v15 || (v15 = (void *)v27) != 0)
  {
    *(float *)&v31 = a3;
    objc_msgSend_setOrthographicScale_(v15, v28, v29, v30, v31);
  }
}

- (BOOL)_pointOfViewUsesOrthographicProjection
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = (void *)objc_msgSend_cameraController(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_pointOfView(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_camera(v9, v10, v11, v12);
  v17 = (void *)objc_msgSend_cameraController(self, v14, v15, v16);
  v21 = (void *)objc_msgSend_pointOfView(v17, v18, v19, v20);
  v25 = (void *)objc_msgSend_light(v21, v22, v23, v24);
  if (v13)
  {
    LOBYTE(v25) = objc_msgSend_usesOrthographicProjection(v13, v26, v27, v28);
  }
  else if (v25)
  {
    LOBYTE(v25) = objc_msgSend_type(v25, v26, v27, v28) == 2;
  }
  return (char)v25;
}

- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float64x2_t v10;
  double v11;
  float64_t v12;
  float64x2_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  int32x2_t v67;
  float32x4_t v68;
  int8x16_t v69;
  float v70;
  float32x4_t v71;
  int8x16_t v72;
  float v73;
  BOOL v74;
  float32x4_t v75;
  float32x4_t v76;
  CGFloat x;
  CGFloat y;
  __n128 v79;
  float32x4_t v80;
  float32x4_t v81;

  x = a3.x;
  y = a3.y;
  v6 = (void *)objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  v10.f64[0] = x;
  v10.f64[1] = y;
  v11 = COERCE_DOUBLE(vcvt_f32_f64(v10));
  v13.f64[1] = v12;
  v79 = (__n128)vcvt_hight_f32_f64(0, v13);
  v17 = (void *)objc_msgSend_pointOfView(self, v14, v15, v16);
  objc_msgSend__worldBoundingSphere(self, v18, v19, v20);
  *(_OWORD *)self->_translationOrigin = v21;
  v25 = (void *)objc_msgSend_view(self, v22, v23, v24);
  v29 = (void *)objc_msgSend_world(v25, v26, v27, v28);
  v33 = objc_msgSend_worldRef(v29, v30, v31, v32);
  v41 = v33;
  if (v33)
    sub_1B187973C(v33, (uint64_t)v34, v35, v36, v37, v38, v39, v40);
  v42 = objc_msgSend_nodeRef(v17, v34, v35, v36);
  v54 = sub_1B17A8594(v42, v41, &v80, &v81, v79, v11, v43, v44, v45, v46);
  if (v55)
  {
    objc_msgSend_worldFront(self, v47, v48, v49, v54);
    v63 = vmulq_f32(*(float32x4_t *)self->_translationOrigin, v64);
    v64.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).f32[0];
    v65 = vsubq_f32(v81, v80);
    v66 = vmulq_f32(v65, v65);
    v67 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v66, 2), vaddq_f32(v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 1))).u64[0];
    *(float *)v67.i32 = sqrtf(*(float *)v67.i32);
    v68 = vdivq_f32(v65, (float32x4_t)vdupq_lane_s32(v67, 0));
    v68.i32[3] = 0;
    v69 = (int8x16_t)vmulq_f32(v64, v68);
    v70 = vaddv_f32(vadd_f32(*(float32x2_t *)v69.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL)));
    if (v70 != 0.0
      && ((v71 = v80,
           v71.i32[3] = 1.0,
           v72 = (int8x16_t)vmulq_f32(v71, v64),
           v73 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL)))
               / v70,
           v73 >= 0.0)
        ? (v74 = v73 <= *(float *)v67.i32)
        : (v74 = 0),
          v74))
    {
      v76 = vmlaq_n_f32(v71, v68, v73);
    }
    else
    {
      v75.i64[0] = 0x3F0000003F000000;
      v75.i64[1] = 0x3F0000003F000000;
      v76 = vmulq_f32(vaddq_f32(v80, v81), v75);
    }
    *(float32x4_t *)self->_translationOrigin = v76;
    if (v41)
      goto LABEL_14;
  }
  else
  {
    sub_1B17C4408(0, (uint64_t)CFSTR("Warning: _computeTranslationOrigin3DFromPoint: invalid zRange"), v48, v49, v50, v51, v52, v53, *(uint64_t *)&x);
    if (v41)
LABEL_14:
      sub_1B18797B4(v41, v56, v57, v58, v59, v60, v61, v62);
  }
}

- (void)_translateToViewPoint:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  int8x16_t v65;
  float v66;
  float32x4_t v67;
  int8x16_t v68;
  float v69;
  BOOL v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  CGFloat x;
  uint64_t v90;
  CGFloat y;
  float32x4_t v92;
  __n128 v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  simd_float4x4 v99;
  simd_float4x4 v100;

  x = a3.x;
  y = a3.y;
  v6 = (void *)objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  v11.f64[1] = v10;
  v93 = (__n128)vcvt_hight_f32_f64(0, v11);
  v12.f64[0] = x;
  v12.f64[1] = y;
  v13 = COERCE_DOUBLE(vcvt_f32_f64(v12));
  v17 = (void *)objc_msgSend_pointOfView(self, v14, v15, v16);
  v21 = (void *)objc_msgSend_view(self, v18, v19, v20);
  v25 = (void *)objc_msgSend_world(v21, v22, v23, v24);
  v29 = objc_msgSend_worldRef(v25, v26, v27, v28);
  v37 = v29;
  if (v29)
    sub_1B187973C(v29, (uint64_t)v30, v31, v32, v33, v34, v35, v36);
  v38 = objc_msgSend_nodeRef(v17, v30, v31, v32);
  sub_1B17A8594(v38, v37, &v97, &v98, v93, v13, v39, v40, v41, v42);
  v51 = v50;
  if (v37)
    sub_1B18797B4(v37, (uint64_t)v43, v44, v45, v46, v47, v48, v49);
  if (v51)
  {
    v92 = v97;
    v52 = vsubq_f32(v98, v97);
    v53 = vmulq_f32(v52, v52);
    v53.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).u64[0];
    v53.f32[0] = sqrtf(v53.f32[0]);
    v90 = v53.i64[0];
    v54 = vdivq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 0));
    v54.i32[3] = 0;
    v94 = v54;
    objc_msgSend_worldFront(self, v43, v44, v45);
    v62 = *(float32x4_t *)self->_translationOrigin;
    v63 = vmulq_f32(v62, v64);
    v64.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).f32[0];
    v65 = (int8x16_t)vmulq_f32(v64, v94);
    v66 = vaddv_f32(vadd_f32(*(float32x2_t *)v65.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v65, v65, 8uLL)));
    if (v66 != 0.0
      && ((v67 = v92,
           v67.i32[3] = 1.0,
           v68 = (int8x16_t)vmulq_f32(v67, v64),
           v69 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v68.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL)))
               / v66,
           v69 >= 0.0)
        ? (v70 = v69 <= *(float *)&v90)
        : (v70 = 0),
          v70))
    {
      v95 = vsubq_f32(v62, vmlaq_n_f32(v67, v94, v69));
      objc_msgSend_worldTransform(v17, v55, v56, v57);
      v100 = __invert_f4(v99);
      v96 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v100.columns[2], v95, 2), (float32x4_t)v100.columns[1], *(float32x2_t *)v95.f32, 1), (float32x4_t)v100.columns[0], v95.f32[0]);
      objc_msgSend_begin(VFXTransaction, v71, v72, v73);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v74, v75, v76, 0.0);
      v80 = (void *)objc_msgSend_cameraController(self, v77, v78, v79);
      LODWORD(v82) = v96.i32[2];
      LODWORD(v81) = v96.i32[1];
      objc_msgSend_translateInCameraSpaceByX_Y_Z_(v80, v83, v84, v85, *(double *)v96.i64, v81, v82);
      objc_msgSend_commit(VFXTransaction, v86, v87, v88);
    }
    else
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Warning: no CFXIntersectionRay3Plane"), v56, v57, v58, v59, v60, v61, v90);
    }
  }
}

- (void)__willChangePointOfView
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!self->_recordingPointOfViewEvents)
  {
    self->_recordingPointOfViewEvents = 1;
    objc_msgSend_delegate(self, a2, v2, v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_msgSend_delegate(self, v5, v6, v7);
      MEMORY[0x1E0DE7D20](v8, sel_willChangePointOfView, v9, v10);
    }
  }
}

- (void)__didChangePointOfView
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_recordingPointOfViewEvents)
  {
    objc_msgSend_delegate(self, a2, v2, v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)objc_msgSend_delegate(self, v5, v6, v7);
      objc_msgSend_didChangePointOfView(v8, v9, v10, v11);
    }
    self->_recordingPointOfViewEvents = 0;
  }
}

- (VFXCameraNavigationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VFXCameraNavigationControllerDelegate *)a3;
}

- (VFXView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (VFXView *)a3;
}

- (VFXNode)freeCamera
{
  return self->_freeViewCameraNode;
}

- (BOOL)enableFreeCamera
{
  return self->_enableFreeCamera;
}

- (BOOL)autoSwitchToFreeCamera
{
  return self->_autoSwitchToFreeCamera;
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  self->_autoSwitchToFreeCamera = a3;
}

- (float)flyModeVelocity
{
  return self->_flyModeVelocity;
}

- (void)setFlyModeVelocity:(float)a3
{
  self->_flyModeVelocity = a3;
}

- (float)panSensitivity
{
  return self->_panSensitivity;
}

- (void)setPanSensitivity:(float)a3
{
  self->_panSensitivity = a3;
}

- (float)truckSensitivity
{
  return self->_truckSensitivity;
}

- (void)setTruckSensitivity:(float)a3
{
  self->_truckSensitivity = a3;
}

- (float)rotationSensitivity
{
  return self->_rotationSensitivity;
}

- (void)setRotationSensitivity:(float)a3
{
  self->_rotationSensitivity = a3;
}

- (void).cxx_destruct
{
  unsigned __int16 *begin;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;

  begin = self->_keyboard.right.__begin_;
  if (begin)
  {
    self->_keyboard.right.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_keyboard.left.__begin_;
  if (v4)
  {
    self->_keyboard.left.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_keyboard.backward.__begin_;
  if (v5)
  {
    self->_keyboard.backward.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_keyboard.forward.__begin_;
  if (v6)
  {
    self->_keyboard.forward.__end_ = v6;
    operator delete(v6);
  }
  sub_1B1805B90((uint64_t)&self->_keyboard.keyDown, (_QWORD *)self->_keyboard.keyDown.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 46) = 0;
  *((_QWORD *)self + 44) = (char *)self + 360;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

@end
