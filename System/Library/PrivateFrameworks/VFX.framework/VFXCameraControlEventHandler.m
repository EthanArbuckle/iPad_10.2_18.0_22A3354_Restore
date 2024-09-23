@implementation VFXCameraControlEventHandler

- (VFXCameraControlEventHandler)init
{
  VFXCameraControlEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXCameraControlEventHandler;
  result = -[VFXEventHandler init](&v3, sel_init);
  if (result)
  {
    result->_zoomFactor = 1.0;
    *((_BYTE *)result + 296) |= 8u;
    *((_BYTE *)result + 296) &= ~2u;
    result->_friction = 0.05;
    result->_browseScaleFactor = 1.0;
    *((_BYTE *)result + 296) |= 0x20u;
    *((_BYTE *)result + 297) &= ~2u;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, a2, v2, v3);

  v5.receiver = self;
  v5.super_class = (Class)VFXCameraControlEventHandler;
  -[VFXEventHandler dealloc](&v5, sel_dealloc);
}

- (BOOL)enabled
{
  return *((_BYTE *)self + 296) & 1;
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
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xFE | a3;
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
        objc_msgSend_setEnabled_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v8, *((_BYTE *)self + 296) & 1, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)allowsTranslation
{
  return (*((unsigned __int8 *)self + 296) >> 5) & 1;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xDF | v3;
}

- (BOOL)enableInertia
{
  return (*((unsigned __int8 *)self + 296) >> 3) & 1;
}

- (void)setEnableInertia:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xF7 | v3;
}

- (float)friction
{
  return self->_friction;
}

- (void)setFriction:(float)a3
{
  self->_friction = a3;
}

- (BOOL)gimbalLockMode
{
  return (*((unsigned __int8 *)self + 297) >> 1) & 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xFD | v3;
}

- (BOOL)automaticCameraTarget
{
  return (*((unsigned __int8 *)self + 296) >> 1) & 1;
}

- (void)invalidateCameraTarget
{
  *((_BYTE *)self + 296) &= ~4u;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v5;

  v4 = *((_BYTE *)self + 296);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 296) = v4 & 0xFD | v5;
    objc_msgSend_invalidateCameraTarget(self, a2, a3, v3);
  }
}

- (__n128)cameraTarget
{
  return a1[21];
}

- (void)setCameraTarget:(VFXCameraControlEventHandler *)self
{
  __int128 v2;

  *(_OWORD *)self->_cameraTarget = v2;
}

- (id)freeCamera
{
  return self->_freeViewCameraNode;
}

- (void)focusNode:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float32x4_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  float32x4_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t v42;
  float v43;
  float v44;
  float32x4_t v45;
  float32x4_t v46;
  float v47;
  __int128 v48;

  if (a3)
  {
    *((_BYTE *)self + 296) |= 0x10u;
    objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
    objc_msgSend__switchToFreeViewCamera(self, v6, v7, v8);
    objc_msgSend_setAutomaticCameraTarget_(self, v9, 0, v10);
    v48 = 0uLL;
    objc_msgSend_frontVector(self, v11, v12, v13);
    v46 = v14;
    v47 = 0.0;
    if (objc_msgSend_getBoundingSphereCenter_radius_(a3, v15, (uint64_t)&v48, (uint64_t)&v47))
    {
      v19 = (float)(self->_originalFov * 0.5) / 180.0 * 3.14159265;
      objc_msgSend_worldTransform(a3, v16, v17, v18);
      v23 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v20, v47), (float32x4_t)0, v21), (float32x4_t)0, v22);
      v24 = vmulq_f32(v23, v23);
      v25 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
      v47 = v25;
      v29 = tanf(v19);
      v30 = sqrtf((float)(v25 * v25) + (float)((float)(v25 / v29) * (float)(v25 / v29)));
    }
    else
    {
      objc_msgSend__browseScale(self, v16, v17, v18);
      v30 = v31;
    }
    v32 = (void *)objc_msgSend_presentationNode(a3, v26, v27, v28);
    objc_msgSend_convertPosition_toNode_(v32, v33, 0, v34, *(double *)&v48);
    v45 = v35;
    objc_msgSend_setCameraTarget_(self, v36, v37, v38);
    v42 = vmulq_f32(v46, v46);
    v43 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0]);
    if (v43 != 0.0)
    {
      v44 = v30 / v43;
      objc_msgSend_setPosition_(self->_freeViewCameraNode, v39, v40, v41, *(double *)vsubq_f32(v45, vmulq_n_f32(v46, v30 / v43)).i64);
      self->_browseScaleFactor = v44;
    }
  }
  else
  {
    objc_msgSend_setAutomaticCameraTarget_(self, a2, 1, v3);
  }
}

- (unint64_t)stickyAxis
{
  return self->_stickyAxis;
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis = a3;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  uint64_t v3;

  self->super._enableFreeCamera = a3;
  if (!a3)
    objc_msgSend__resetFreeViewCamera(self, a2, a3, v3);
}

- (void)activateFreeCamera
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXCameraControlEventHandler;
  -[VFXEventHandler activateFreeCamera](&v6, sel_activateFreeCamera);
  objc_msgSend__prepareFreeViewCamera(self, v3, v4, v5);
}

- (void)_resetFreeViewCamera
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend_worldRef(self->_freeViewCameraNode, a2, v2, v3))
  {
    v8 = (void *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v5, v6, v7);
    v12 = objc_msgSend_worldRef(self->_freeViewCameraNode, v9, v10, v11);
    sub_1B17C5DD0(v8, v12, v13, v14, v15, v16, v17, v18);
  }
  objc_msgSend_removeFromParentNode(self->_freeViewCameraNode, v5, v6, v7);

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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  VFXNode *freeViewCameraNode;
  VFXNode *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  float32x4_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  __int128 v66;
  __int128 v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  int32x4_t v95;
  float32x4_t v96;
  float v97;
  int32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  int32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  int32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  int8x16_t v110;
  int8x16_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int8x16_t v114;
  float32x4_t v115;
  float v116;
  int32x4_t v117;
  float v118;
  float32x4_t v119;
  float v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  int8x16_t v125;
  int8x16_t v126;
  float v127;
  float32x2_t v128;
  float32x2_t v129;
  float32x2_t v130;
  uint64_t v131;
  int32x2_t v132;
  float32x4_t v133;
  float32x2_t v134;
  float32x2_t v135;
  float32x4_t v136;
  float32x4_t v137;
  int8x16_t v138;
  float32x4_t v139;
  float v140;
  float32x4_t v141;
  float32x2_t v142;
  float32x4_t v143;
  float32x4_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  __int128 v197;
  float32x4_t v198;
  __int128 v199;
  float32x4_t v200;

  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (VFXNode *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  v17 = v13;
  if (v13 && v13 == self->_freeViewCameraNode)
    return;
  v18 = (void *)objc_msgSend_presentationNode(v13, v14, v15, v16);
  if (self->_originalFov == 0.0)
    self->_originalFov = 60.0;
  v22 = (void *)objc_msgSend_camera(v18, v19, v20, v21);
  objc_msgSend_orthographicScale(v22, v23, v24, v25);
  self->_originalOrthoScale = v29;
  self->_zoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v17)
  {
    if (freeViewCameraNode)
      goto LABEL_12;
    v31 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v26, v27, v28);
    goto LABEL_11;
  }
  if (v17 == freeViewCameraNode)
  {
LABEL_16:
    v59 = (void *)objc_msgSend_presentationNode(v17, v26, v27, v28);
    objc_msgSend_worldTransform(v59, v60, v61, v62);
    v67 = v66;
    goto LABEL_21;
  }
  if (!freeViewCameraNode)
  {
    v31 = (VFXNode *)objc_msgSend_copy(v17, v26, v27, v28);
LABEL_11:
    self->_freeViewCameraNode = v31;
  }
LABEL_12:
  if (objc_msgSend_camera(v17, v26, v27, v28))
  {
    v35 = (void *)objc_msgSend_camera(v17, v32, v33, v34);
    v39 = (id)objc_msgSend_copy(v35, v36, v37, v38);
LABEL_14:
    v42 = v39;
    goto LABEL_15;
  }
  if (!objc_msgSend_light(v17, v32, v33, v34))
  {
    v39 = (id)objc_msgSend_camera(VFXCamera, v68, v69, v70);
    goto LABEL_14;
  }
  v71 = (void *)objc_msgSend_light(v17, v68, v69, v70);
  v42 = (void *)objc_msgSend_camera(VFXCamera, v72, v73, v74);
  if (v71)
  {
    objc_msgSend_spotOuterAngle(v71, v40, v75, v41);
    objc_msgSend_setFieldOfView_(v42, v76, v77, v78);
    objc_msgSend_zNear(v71, v79, v80, v81);
    objc_msgSend_setZNear_(v42, v82, v83, v84);
    objc_msgSend_zFar(v71, v85, v86, v87);
    objc_msgSend_setZFar_(v42, v88, v89, v90);
  }
LABEL_15:
  objc_msgSend_setCamera_(self->_freeViewCameraNode, v40, (uint64_t)v42, v41);
  objc_msgSend_setLight_(self->_freeViewCameraNode, v43, 0, v44);
  objc_msgSend_setModel_(self->_freeViewCameraNode, v45, 0, v46);
  v50 = objc_msgSend_immediateMode(VFXTransaction, v47, v48, v49);
  objc_msgSend_setImmediateMode_(VFXTransaction, v51, 1, v52);
  objc_msgSend_removeAllAnimations(self->_freeViewCameraNode, v53, v54, v55);
  objc_msgSend_setImmediateMode_(VFXTransaction, v56, v50, v57);
  if (v17)
    goto LABEL_16;
  v63 = (float32x4_t)VFXMatrix4Identity;
  v64 = (float32x4_t)unk_1B2247DB0;
  v65 = (float32x4_t)xmmword_1B2247DC0;
  v67 = unk_1B2247DD0;
LABEL_21:
  v91 = vmulq_f32(v63, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v65, (int8x16_t)v65, 0xCuLL), (int8x16_t)v65, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v64, (int32x4_t)v64), (int8x16_t)v64, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v65, (int32x4_t)v65), (int8x16_t)v65, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v64, (int8x16_t)v64, 0xCuLL), (int8x16_t)v64, 8uLL)));
  if (fabs(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v91, 2), vaddq_f32(v91, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v91.f32, 1))).f32[0]+ -1.0) > 0.00001)
  {
    v92 = vmulq_f32(v63, v63);
    v58.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0]);
    v93 = vmulq_f32(v64, v64);
    v94 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v93, 2);
    v95 = (int32x4_t)vaddq_f32(v94, vaddq_f32(v93, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v93.f32, 1)));
    *(float *)v95.i32 = sqrtf(*(float *)v95.i32);
    v96 = vmulq_f32(v65, v65);
    LODWORD(v97) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), vaddq_f32(v96, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1))).u32[0];
    v98 = vzip2q_s32((int32x4_t)v92, (int32x4_t)v96);
    v99 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v92, (int32x4_t)v96), (int32x4_t)v93);
    v100 = (float32x4_t)vtrn2q_s32((int32x4_t)v92, (int32x4_t)v93);
    v100.i32[2] = v96.i32[1];
    v101 = vaddq_f32((float32x4_t)vzip1q_s32(v98, (int32x4_t)v94), vaddq_f32(v99, v100));
    v100.i64[0] = 0x80000000800000;
    v100.i64[1] = 0x80000000800000;
    v102 = vcgeq_f32(v100, v101);
    v101.i32[3] = 0;
    v103 = vrsqrteq_f32(v101);
    v104 = vmulq_f32(v103, vrsqrtsq_f32(v101, vmulq_f32(v103, v103)));
    v105 = v102;
    v105.i32[3] = 0;
    v106 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v105), (int8x16_t)v101, (int8x16_t)vmulq_f32(v104, vrsqrtsq_f32(v101, vmulq_f32(v104, v104))));
    v107 = vmulq_n_f32(v63, v106.f32[0]);
    v108 = vmulq_lane_f32(v64, *(float32x2_t *)v106.f32, 1);
    v109 = vmulq_laneq_f32(v65, v106, 2);
    v110 = (int8x16_t)vuzp1q_s32((int32x4_t)v109, (int32x4_t)v109);
    v111 = (int8x16_t)vuzp1q_s32((int32x4_t)v108, (int32x4_t)v108);
    v112 = (int32x4_t)v107;
    if (v102.i32[0])
    {
      v113 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v110, (int8x16_t)v109, 0xCuLL), vnegq_f32(v108)), v109, (float32x4_t)vextq_s8(v111, (int8x16_t)v108, 0xCuLL));
      v112 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v113, v113), (int8x16_t)v113, 0xCuLL);
    }
    v114 = (int8x16_t)vuzp1q_s32((int32x4_t)v107, (int32x4_t)v107);
    v115 = v108;
    v116 = sqrtf(v97);
    if (v102.i32[1])
    {
      v117 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v114, (int8x16_t)v107, 0xCuLL), vnegq_f32(v109)), v107, (float32x4_t)vextq_s8(v110, (int8x16_t)v109, 0xCuLL));
      v115 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v117, v117), (int8x16_t)v117, 0xCuLL);
    }
    v58.i32[1] = v95.i32[0];
    if (v102.i32[2])
    {
      v95 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v111, (int8x16_t)v108, 0xCuLL), vnegq_f32(v107)), v108, (float32x4_t)vextq_s8(v114, (int8x16_t)v107, 0xCuLL));
      v109 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v95, v95), (int8x16_t)v95, 0xCuLL);
    }
    v58.f32[2] = v116;
    v118 = (float)(*(float *)v112.i32 + v115.f32[1]) + v109.f32[2];
    v198 = v58;
    v199 = v67;
    if (v118 > 0.0)
    {
      v119 = (float32x4_t)vzip2q_s32((int32x4_t)v115, vuzp1q_s32((int32x4_t)v115, (int32x4_t)v109));
      v119.i32[2] = v112.i32[1];
      v120 = sqrtf(v118 + 1.0);
      v121 = (float32x4_t)vtrn2q_s32((int32x4_t)v109, vzip2q_s32((int32x4_t)v109, v112));
      v121.i32[2] = v115.i32[0];
      v123 = vsubq_f32(v119, v121);
      v119.f32[3] = v120;
      v121.f32[3] = v120;
      v122 = vmulq_f32(v119, v121);
      v123.i32[3] = v122.i32[3];
LABEL_40:
      v122.f32[0] = 0.5 / v120;
      v133 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v122.f32, 0);
      goto LABEL_41;
    }
    if (*(float *)v112.i32 < v115.f32[1] || *(float *)v112.i32 < v109.f32[2])
    {
      if (v115.f32[1] <= v109.f32[2])
      {
        v120 = sqrtf((float)((float)(v109.f32[2] + 1.0) - *(float *)v112.i32) - v115.f32[1]);
        *(float32x2_t *)v123.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v112, (int32x4_t)v115), *(float32x2_t *)v109.f32);
        v134 = (float32x2_t)__PAIR64__(v112.u32[1], LODWORD(v120));
        v135 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v115.f32, 0);
        *(float32x2_t *)v122.f32 = vsub_f32(*(float32x2_t *)v112.i8, v135);
        v135.f32[0] = v120;
        v135.i32[0] = vmul_f32(v134, v135).u32[0];
        v135.i32[1] = v122.i32[1];
        *(float32x2_t *)&v123.u32[2] = v135;
        goto LABEL_40;
      }
      v127 = sqrtf((float)((float)(v115.f32[1] + 1.0) - *(float *)v112.i32) - v109.f32[2]);
      *(int32x2_t *)v95.i8 = vdup_laneq_s32((int32x4_t)v115, 2);
      v125 = (int8x16_t)v95;
      *(float *)v125.i32 = v127;
      v125.i32[0] = vmul_f32(*(float32x2_t *)v125.i8, (float32x2_t)__PAIR64__(v109.u32[1], LODWORD(v127))).u32[0];
      v125.i32[1] = vadd_f32(*(float32x2_t *)&v95, *(float32x2_t *)&v109).i32[1];
      v126 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v112.i8, 1), v115);
      v132 = (int32x2_t)vsubq_f32(v109, (float32x4_t)vdupq_laneq_s32(v112, 2)).u64[0];
      v133 = (float32x4_t)vextq_s8(vextq_s8(v126, v126, 4uLL), v125, 0xCuLL);
      v133.i32[3] = v132.i32[0];
    }
    else
    {
      v127 = sqrtf((float)((float)(*(float *)v112.i32 + 1.0) - v115.f32[1]) - v109.f32[2]);
      v128 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v115.f32, 0);
      v129 = vadd_f32(*(float32x2_t *)v112.i8, v128);
      v128.f32[0] = v127;
      v133.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v112.u32[1], LODWORD(v127)), v128).u32[0];
      v133.i32[1] = v129.i32[1];
      v130 = (float32x2_t)vzip2q_s32(v112, (int32x4_t)v115).u64[0];
      LODWORD(v131) = vadd_f32(v130, *(float32x2_t *)v109.f32).u32[0];
      v132 = (int32x2_t)vsub_f32(v130, *(float32x2_t *)v109.f32);
      HIDWORD(v131) = v132.i32[1];
      v133.i64[1] = v131;
    }
    *(float *)v132.i32 = 0.5 / v127;
    v123 = (float32x4_t)vdupq_lane_s32(v132, 0);
LABEL_41:
    v200 = vmulq_f32(v123, v133);
    sub_1B17C99D0(&v200);
    *(_QWORD *)&v67 = v199;
    v136 = vabsq_f32(v198);
    v136.i32[3] = 0;
    v137 = v200;
    v138.i64[0] = 0x8000000080000000;
    v138.i64[1] = 0x8000000080000000;
    v63 = (float32x4_t)vorrq_s8((int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v136, (float32x4_t)xmmword_1B2245780) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), vandq_s8((int8x16_t)v198, v138));
    v65 = vmulq_f32(v137, v137);
    v139 = vmulq_laneq_f32(v137, v137, 3);
    v140 = vmulq_lane_f32(v137, *(float32x2_t *)v137.f32, 1).f32[0];
    v141 = vaddq_f32(v63, v63);
    v65.f32[0] = 0.5 - v65.f32[0];
    v142 = vmul_laneq_f32(*(float32x2_t *)v137.f32, v137, 2);
    v64.i32[3] = 0;
    v64.f32[0] = (float)(0.5 - v65.f32[1]) - v65.f32[2];
    v64.f32[1] = v140 + v139.f32[2];
    v143.i32[3] = 0;
    v64.f32[2] = v142.f32[0] - v139.f32[1];
    v63.i64[0] = vmulq_n_f32(v64, v141.f32[0]).u64[0];
    v143.f32[0] = v140 - v139.f32[2];
    v143.f32[1] = v65.f32[0] - v65.f32[2];
    v143.f32[2] = v142.f32[1] + v139.f32[0];
    v64.i64[0] = vmulq_lane_f32(v143, *(float32x2_t *)v141.f32, 1).u64[0];
    *(int32x2_t *)v139.f32 = vrev64_s32(*(int32x2_t *)v139.f32);
    v144.i32[0] = vadd_f32(v142, *(float32x2_t *)v139.f32).u32[0];
    v144.i32[1] = vsub_f32(v142, *(float32x2_t *)&v139).i32[1];
    v144.f32[2] = v65.f32[0] - v65.f32[1];
    v144.i32[3] = 0;
    v65.i64[0] = vmulq_laneq_f32(v144, v141, 2).u64[0];
  }
  objc_msgSend_setTransform_(self->_freeViewCameraNode, v26, v27, v28, *(double *)v63.i64, *(double *)v64.i64, *(double *)v65.i64, *(double *)&v67, *(_OWORD *)&v198, v199);
  objc_msgSend_setName_(self->_freeViewCameraNode, v145, (uint64_t)CFSTR("kVFXFreeViewCameraName"), v146);
  v149 = objc_msgSend_stringByAppendingString_(CFSTR("kVFXFreeViewCameraName"), v147, (uint64_t)CFSTR("Camera"), v148);
  v153 = (void *)objc_msgSend_camera(self->_freeViewCameraNode, v150, v151, v152);
  objc_msgSend_setName_(v153, v154, v149, v155);
  v159 = (void *)objc_msgSend_view(self, v156, v157, v158);
  if (objc_msgSend__showsAuthoringEnvironment(v159, v160, v161, v162))
  {
    v166 = (void *)objc_msgSend_camera(self->_freeViewCameraNode, v163, v164, v165);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v166, v167, 1, v168);
  }
  v169 = (void *)objc_msgSend_view(self, v163, v164, v165);
  v173 = (void *)objc_msgSend_world(v169, v170, v171, v172);
  v177 = objc_msgSend_worldRef(v173, v174, v175, v176);
  if (v177)
  {
    v181 = v177;
    v182 = objc_msgSend_nodeRef(self->_freeViewCameraNode, v178, v179, v180);
    if (!sub_1B17C61FC(v182, v183, v184, v185, v186, v187, v188, v189))
    {
      v190 = (uint64_t *)objc_msgSend_nodeRef(self->_freeViewCameraNode, v178, v179, v180);
      sub_1B17C5FC0(v190, v181, v191, v192, v193, v194, v195, v196);
    }
  }
  objc_msgSend_viewedObjectSphere(self, v178, v179, v180);
  *(_OWORD *)self->_cameraTarget = v197;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3))
  {
    v8 = (void *)objc_msgSend_view(self, v5, v6, v7);
    v12 = (void *)objc_msgSend_renderer(v8, v9, v10, v11);
    if ((VFXNode *)objc_msgSend_pointOfView(v12, v13, v14, v15) != self->_freeViewCameraNode)
    {
      objc_msgSend_begin(VFXTransaction, v16, v17, v18);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v19, v20, v21, 0.0);
      objc_msgSend_setPointOfView_(v12, v22, (uint64_t)self->_freeViewCameraNode, v23);
      objc_msgSend_updateBrowseScaleFactor(self, v24, v25, v26);
      objc_msgSend_commit(VFXTransaction, v27, v28, v29);
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  if (objc_msgSend_enableFreeCamera(self, a2, v2, v3))
  {
    if ((objc_msgSend__freeCameraActivated(self, v5, v6, v7) & 1) == 0)
    {
      objc_msgSend_begin(VFXTransaction, v8, v9, v10);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.0);
      objc_msgSend__prepareFreeViewCamera(self, v14, v15, v16);
      objc_msgSend__installFreeViewCameraIfNeeded(self, v17, v18, v19);
      objc_msgSend_commit(VFXTransaction, v20, v21, v22);
    }
  }
}

- (__n128)cameraAutomaticTargetPoint
{
  if ((a1[18].n128_u8[8] & 4) == 0)
    objc_msgSend_computeAutomaticTargetPoint(a1, a2, a3, a4);
  return a1[22];
}

- (void)computeAutomaticTargetPoint
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
  float v17;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  BOOL v36;
  float32x4_t v37;
  float v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  int32x4_t v45;
  int8x16_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float v49;

  *((_BYTE *)self + 296) |= 4u;
  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend__browseScale(self, v14, v15, v16);
  v49 = v17;
  objc_msgSend_frontVector(self, v18, v19, v20);
  v48 = v21;
  v25 = (void *)objc_msgSend_presentationObject(v13, v22, v23, v24);
  objc_msgSend_convertPosition_toNode_(v25, v26, 0, v27, 0.0);
  v32 = v31;
  if ((*((_BYTE *)self + 296) & 0x10) == 0)
  {
    v47 = v31;
    objc_msgSend_viewedObjectSphere(self, v28, v29, v30);
    v32 = v47;
    v34 = vsubq_f32(v33, v47);
    v35 = vmulq_f32(v48, v34);
    v36 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0] <= 0.5;
    v37 = vmulq_f32(v34, v34);
    v38 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]);
    v39 = v49;
    if (!v36)
      v39 = v38;
    v49 = v39;
  }
  v40 = vmulq_f32(v48, v48);
  v40.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).u64[0];
  v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 0);
  v41.i32[3] = 0;
  v42 = vrsqrteq_f32(v41);
  v43 = vmulq_f32(v42, vrsqrtsq_f32(v41, vmulq_f32(v42, v42)));
  v44 = (int8x16_t)vmulq_f32(v48, vmulq_n_f32(vmulq_f32(v43, vrsqrtsq_f32(v41, vmulq_f32(v43, v43))), v49));
  v45 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v40.f32[0] != 0.0)), 0x1FuLL));
  v45.i32[3] = 0;
  v46 = vbslq_s8((int8x16_t)vcltzq_s32(v45), v44, (int8x16_t)v48);
  *(float32x2_t *)v44.i8 = vadd_f32(*(float32x2_t *)v32.f32, *(float32x2_t *)v46.i8);
  *(float *)&v44.i32[2] = v32.f32[2] + *(float *)&v46.i32[2];
  *(int8x16_t *)self->_autoCameraTarget = v44;
}

- (float)_translationCoef
{
  uint64_t v2;
  uint64_t v3;
  float v4;

  objc_msgSend__browseScale(self, a2, v2, v3);
  return v4 * 0.01;
}

- (float)_browseScale
{
  return self->_browseScaleFactor;
}

- (void)_resetBrowseScaleFactor
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
  float32x4_t v21;
  float32x4_t v22;

  self->_browseScaleFactor = 1.0;
  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  if (v13)
  {
    v17 = (void *)objc_msgSend_presentationNode(v13, v14, v15, v16);
    objc_msgSend_worldTransform(v17, v18, v19, v20);
    v22 = vmulq_f32(v21, v21);
    self->_browseScaleFactor = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]);
  }
}

- (void)updateBrowseScaleFactor
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float v32;
  float v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float32x4_t v48;

  if ((*((_BYTE *)self + 296) & 2) != 0)
    objc_msgSend_cameraAutomaticTargetPoint(self, a2, v2, v3);
  else
    objc_msgSend_cameraTarget(self, a2, v2, v3);
  v10 = (void *)objc_msgSend_view(self, v5, v6, v7, v8, v9);
  v14 = (void *)objc_msgSend_renderer(v10, v11, v12, v13);
  v18 = (void *)objc_msgSend_pointOfView(v14, v15, v16, v17);
  v22 = (void *)objc_msgSend_presentationNode(v18, v19, v20, v21);
  objc_msgSend_worldTransform(v22, v23, v24, v25);
  v30 = vsubq_f32(v29, v48);
  v31 = vmulq_f32(v30, v30);
  v32 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]);
  v33 = 0.1;
  if (v32 > 0.1)
    v33 = v32;
  self->_browseScaleFactor = v33;
  objc_msgSend_begin(VFXTransaction, v26, v27, v28);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v34, v35, v36, 0.0);
  v40 = (void *)objc_msgSend_camera(v18, v37, v38, v39);
  *(float *)&v41 = v32;
  objc_msgSend_setFocusDistance_(v40, v42, v43, v44, v41);
  objc_msgSend_commit(VFXTransaction, v45, v46, v47);
}

- (void)rotateOf:(float)a3
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
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  const char *v24;
  __float2 v25;
  __float2 v26;
  __float2 v27;
  uint64_t v28;
  unint64_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  _OWORD v34[4];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  if (self->super._autoSwitchToFreeCamera)
    objc_msgSend__switchToFreeViewCamera(self, a2, v3, v4);
  *((_BYTE *)self + 297) &= ~1u;
  v7 = (void *)objc_msgSend_view(self, a2, v3, v4);
  v11 = (void *)objc_msgSend_renderer(v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_pointOfView(v11, v12, v13, v14);
  if (v15)
  {
    v19 = v15;
    objc_msgSend_transform(v15, v16, v17, v18);
    v32 = v20;
    v33 = v21;
    v30 = v23;
    v31 = v22;
    v20.f32[0] = a3 * -3.14159265 / 180.0;
    v27 = __sincosf_stret(v20.f32[0]);
    v28 = 0;
    *(float *)&v29 = -v27.__sinval;
    HIDWORD(v29) = LODWORD(v27.__cosval);
    v34[0] = __PAIR64__(LODWORD(v27.__sinval), LODWORD(v27.__cosval));
    v34[1] = v29;
    v34[2] = xmmword_1B2244D90;
    v34[3] = xmmword_1B2244E20;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    do
    {
      *(__int128 *)((char *)&v35 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v34[v28])), v33, *(float32x2_t *)&v34[v28], 1), v31, (float32x4_t)v34[v28], 2), v30, (float32x4_t)v34[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    objc_msgSend_setTransform_(v19, v24, *(_QWORD *)&v25, *(_QWORD *)&v26, *(double *)&v35, *(double *)&v36, *(double *)&v37, *(double *)&v38);
  }
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
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
  __int128 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
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
  double v38;
  double v39;
  double v40;
  __int128 v41;
  double v42;
  _OWORD v43[4];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v5 = a4;
  v7 = (void *)objc_msgSend_view(self, a2, a4, v4);
  v11 = (void *)objc_msgSend_renderer(v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_pointOfView(v11, v12, v13, v14);
  if (v15)
  {
    v19 = v15;
    *(_QWORD *)&v20 = 0;
    *((float *)&v20 + 2) = a3 * -100.0;
    HIDWORD(v20) = 1.0;
    v41 = v20;
    objc_msgSend_transform(v15, v16, v17, v18);
    v28 = 0;
    v43[0] = xmmword_1B2244DB0;
    v43[1] = xmmword_1B2244DD0;
    v43[2] = xmmword_1B2244D90;
    v43[3] = v41;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    do
    {
      *(__int128 *)((char *)&v44 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(v43[v28])), v25, *(float32x2_t *)&v43[v28], 1), v26, (float32x4_t)v43[v28], 2), v27, (float32x4_t)v43[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    if (v5)
    {
      v40 = *(double *)&v46;
      v42 = *(double *)&v47;
      v38 = *(double *)&v44;
      v39 = *(double *)&v45;
      objc_msgSend_begin(VFXTransaction, v21, v22, v23);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v29, v30, v31, 0.3);
      objc_msgSend_setTransform_(v19, v32, v33, v34, v38, v39, v40, v42);
      objc_msgSend_commit(VFXTransaction, v35, v36, v37);
    }
    else
    {
      objc_msgSend_setTransform_(v19, v21, v22, v23, *(double *)&v44, *(double *)&v45, *(double *)&v46, *(double *)&v47);
    }
  }
}

- (void)zoomBy:(float)a3
{
  ((void (*)(VFXCameraControlEventHandler *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_zoomBy_animate_, 1);
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(float)a3
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  float zoomFactor;
  float originalOrthoScale;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float v57;
  float v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  float originalFov;
  long double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  long double v71;
  float v72;
  void *v73;
  double v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;

  if (self->_zoomFactor == a3)
    return;
  v7 = (void *)objc_msgSend_view(self, a2, v3, v4);
  v11 = (void *)objc_msgSend_renderer(v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_pointOfView(v11, v12, v13, v14);
  v19 = (void *)objc_msgSend_camera(v15, v16, v17, v18);
  if (!objc_msgSend_usesOrthographicProjection(v19, v20, v21, v22))
  {
    originalFov = self->_originalFov;
    v67 = tan(originalFov * 0.0174532925 * 0.5);
    v71 = atan(v67 / a3);
    v72 = (v71 + v71) / 3.14159265 * 180.0;
    if (v72 <= 1.0 && originalFov > 0.0 || v72 >= 120.0)
      return;
    if (v15)
    {
      v73 = (void *)objc_msgSend_camera(v15, v68, v69, v70);
      *(float *)&v74 = v72;
      objc_msgSend_setFieldOfView_(v73, v75, v76, v77, v74);
    }
LABEL_22:
    self->_zoomFactor = a3;
    return;
  }
  zoomFactor = self->_zoomFactor;
  if (zoomFactor == 0.0)
    goto LABEL_22;
  originalOrthoScale = self->_originalOrthoScale;
  objc_msgSend_viewedObjectSphere(self, v23, v24, v25);
  v32 = v31;
  if (v31 == 0.0)
    return;
  v33 = originalOrthoScale / zoomFactor;
  v34 = v33;
  v35 = (void *)objc_msgSend_view(self, v28, v29, v30);
  objc_msgSend_bounds(v35, v36, v37, v38);
  v40 = v39;
  v44 = (void *)objc_msgSend_view(self, v41, v42, v43);
  objc_msgSend_bounds(v44, v45, v46, v47);
  v52 = v32;
  v53 = v52 + v52;
  v54 = self->_originalOrthoScale;
  if (v52 + v52 <= v54)
    v53 = self->_originalOrthoScale;
  if (v53 > v34)
  {
    v55 = v52 * 0.1;
    v56 = v51;
    v57 = v40;
    if (v56 >= v57)
      v58 = v40;
    else
      v58 = v56;
    v59 = v58;
    if (v56 < v57)
      v56 = v40;
    v60 = v55 * (v59 / fmax(v56, 1.0));
    if (v60 <= v54)
      v54 = v60;
    if (v54 >= v34)
    {
      if (self->_zoomFactor <= a3)
        return;
    }
    else
    {
      v61 = (void *)objc_msgSend_camera(v15, v48, v49, v50);
      *(float *)&v62 = v33;
      objc_msgSend_setOrthographicScale_(v61, v63, v64, v65, v62);
    }
    goto LABEL_22;
  }
  if (self->_zoomFactor < a3)
    goto LABEL_22;
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  float browseScaleFactor;
  float v39;
  double v40;
  float v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  double v57;
  double v58;
  _OWORD v59[4];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v57 = *(double *)&a4;
  v58 = *(double *)&a3;
  v9 = (void *)objc_msgSend_view(self, a2, v5, v6);
  v13 = (void *)objc_msgSend_renderer(v9, v10, v11, v12);
  v17 = objc_msgSend_pointOfView(v13, v14, v15, v16);
  if (v17)
  {
    v21 = (void *)v17;
    objc_msgSend_cameraAutomaticTargetPoint(self, v18, v19, v20);
    objc_msgSend_transform(v21, v22, v23, v24);
    v55 = v26;
    v56 = v25;
    v53 = v28;
    v54 = v27;
    objc_msgSend__translationCoef(self, v29, v30, v31);
    v36 = 0;
    browseScaleFactor = self->_browseScaleFactor;
    if (browseScaleFactor >= 100000.0 && a5 < 0.0)
      v39 = 0.0;
    else
      v39 = a5;
    v40 = browseScaleFactor;
    if (v39 > 0.0 && v40 < 0.1)
      v42 = 0.0;
    else
      v42 = v39;
    *(float32x2_t *)&v43 = vmul_n_f32(vneg_f32((float32x2_t)__PAIR64__(LODWORD(v57), LODWORD(v58))), v35);
    v44 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *((float *)&v43 + 2) = -(float)(v42 * v35);
    HIDWORD(v43) = *(_DWORD *)(MEMORY[0x1E0C83FF0] + 60);
    v45 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    v59[0] = *MEMORY[0x1E0C83FF0];
    v59[1] = v44;
    v59[2] = v45;
    v59[3] = v43;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    do
    {
      *(__int128 *)((char *)&v60 + v36 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v56, COERCE_FLOAT(v59[v36])), v55, *(float32x2_t *)&v59[v36], 1), v54, (float32x4_t)v59[v36], 2), v53, (float32x4_t)v59[v36], 3);
      ++v36;
    }
    while (v36 != 4);
    objc_msgSend_setTransform_(v21, v32, v33, v34, *(double *)&v60, *(double *)&v61, *(double *)&v62, *(double *)&v63);
    v49 = v58;
    if (*(float *)&v58 != 0.0 || (v49 = v57, *(float *)&v57 != 0.0))
      objc_msgSend_invalidateCameraTarget(self, v46, v47, v48, v49);
    objc_msgSend_focusNode_(self, v46, 0, v48, v49);
    objc_msgSend_updateBrowseScaleFactor(self, v50, v51, v52);
  }
}

- (void)worldWillChange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  *((_BYTE *)self + 288) &= ~1u;
  *((_BYTE *)self + 297) &= ~1u;
  objc_msgSend__resetFreeViewCamera(self, a2, v2, v3);
  objc_msgSend__setInertiaRunning_(self, v5, 0, v6);
}

- (void)worldDidChange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_invalidateCameraTarget(self, a2, v2, v3);
  objc_msgSend__resetBrowseScaleFactor(self, v5, v6, v7);
}

- (void)cameraWillChange
{
  uint64_t v2;

  *((_BYTE *)self + 297) &= ~1u;
  objc_msgSend__setInertiaRunning_(self, a2, 0, v2);
}

- (void)cameraDidChange
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend__resetBrowseScaleFactor(self, a2, v2, v3);
  objc_msgSend_invalidateCameraTarget(self, v5, v6, v7);
}

- (void)_onInertiaTimer
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CFTimeInterval v6;
  double lastSimulationTime;
  int v8;
  float friction;
  float64x2_t inertiaVelocity;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  float v20;

  v6 = CACurrentMediaTime();
  lastSimulationTime = self->_lastSimulationTime;
  v8 = (int)((v6 - lastSimulationTime) * 60.0);
  self->_lastSimulationTime = lastSimulationTime + (double)v8 / 60.0;
  if (v8 >= 1)
  {
    friction = self->_friction;
    do
    {
      inertiaVelocity = (float64x2_t)self->_inertiaVelocity;
      if (friction != 0.0)
      {
        inertiaVelocity = vmulq_n_f64(inertiaVelocity, 1.0 - friction);
        self->_inertiaVelocity = (CGPoint)inertiaVelocity;
      }
      self->_totalDragWithInertia = (CGPoint)vaddq_f64(inertiaVelocity, (float64x2_t)self->_totalDragWithInertia);
      --v8;
    }
    while (v8);
  }
  objc_msgSend_begin(VFXTransaction, v3, v4, v5);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v11, v12, v13, 0.0);
  objc_msgSend__rotateWithDrag_mode_stickyAxis_(self, v14, self->_browseMode, self->_stickyAxis, self->_totalDragWithInertia.x, self->_totalDragWithInertia.y);
  objc_msgSend_commit(VFXTransaction, v15, v16, v17);
  v20 = self->_inertiaVelocity.y * self->_inertiaVelocity.y + self->_inertiaVelocity.x * self->_inertiaVelocity.x;
  if (v20 < 0.001)
    objc_msgSend__setInertiaRunning_(self, v18, 0, v19);
}

- (void)rotateWithVector:(int64_t)a3 mode:
{
  uint64_t v3;
  __int128 v4;
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
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  __float2 v21;
  __int128 v22;
  __int128 v23;
  __float2 v24;
  float32x4_t v25;
  float32x4_t v26;
  const char *v27;
  __float2 v28;
  __float2 v29;
  __float2 v30;
  uint64_t v31;
  float32x4_t v32;
  uint64_t v33;
  float32x4_t cosval_low;
  float32x4_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  float32x4_t v40;
  float32x4_t v41;
  __int128 v42;
  __int128 v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v48 = v4;
  v5 = (void *)objc_msgSend_view(self, a2, a3, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend_transform(v13, v14, v15, v16);
  v46 = v18;
  v47 = v17;
  v44 = v20;
  v45 = v19;
  v21 = __sincosf_stret(*(float *)&v48);
  LODWORD(v22) = 0;
  DWORD1(v22) = LODWORD(v21.__cosval);
  *((_QWORD *)&v22 + 1) = LODWORD(v21.__sinval);
  LODWORD(v23) = 0;
  *((float *)&v23 + 1) = -v21.__sinval;
  *((_QWORD *)&v23 + 1) = LODWORD(v21.__cosval);
  v42 = v23;
  v43 = v22;
  v24 = __sincosf_stret(*((float *)&v48 + 1));
  v25.i32[3] = 0;
  v25.i64[0] = LODWORD(v24.__cosval);
  v25.f32[2] = -v24.__sinval;
  v26.i64[0] = LODWORD(v24.__sinval);
  v26.i64[1] = LODWORD(v24.__cosval);
  v40 = v26;
  v41 = v25;
  v30 = __sincosf_stret(*((float *)&v48 + 2));
  v31 = 0;
  v32.i32[1] = 0;
  v32.i64[1] = 0;
  v49 = xmmword_1B2244DB0;
  v50 = v43;
  v51 = v42;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(__int128 *)((char *)&v53 + v31) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, COERCE_FLOAT(*(__int128 *)((char *)&v49 + v31))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)((char *)&v49 + v31), 1), v40, *(float32x4_t *)((char *)&v49 + v31), 2);
    v31 += 16;
  }
  while (v31 != 48);
  v33 = 0;
  cosval_low = (float32x4_t)LODWORD(v30.__cosval);
  cosval_low.i32[1] = LODWORD(v30.__sinval);
  cosval_low.i32[2] = 0;
  v32.f32[0] = -v30.__sinval;
  v35 = v32;
  v35.i32[1] = LODWORD(v30.__cosval);
  v35.i32[2] = 0;
  v49 = v53;
  v50 = v54;
  v51 = v55;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(__int128 *)((char *)&v53 + v33) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(__int128 *)((char *)&v49 + v33))), v35, *(float32x2_t *)((char *)&v49 + v33), 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v49 + v33), 2);
    v33 += 16;
  }
  while (v33 != 48);
  v36 = 0;
  v37 = v53;
  v38 = v54;
  HIDWORD(v37) = 0;
  v39 = v55;
  HIDWORD(v38) = 0;
  HIDWORD(v39) = 0;
  v49 = v37;
  v50 = v38;
  v51 = v39;
  v52 = xmmword_1B2244E20;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  do
  {
    *(__int128 *)((char *)&v53 + v36) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(__int128 *)((char *)&v49 + v36))), v46, *(float32x2_t *)((char *)&v49 + v36), 1), v45, *(float32x4_t *)((char *)&v49 + v36), 2), v44, *(float32x4_t *)((char *)&v49 + v36), 3);
    v36 += 16;
  }
  while (v36 != 64);
  objc_msgSend_setTransform_(v13, v27, *(_QWORD *)&v28, *(_QWORD *)&v29, *(double *)&v53, *(double *)&v54, *(double *)&v55, *(double *)&v56);
}

- (void)viewWillDrawAtTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend__isInertiaRunning(self, a2, v3, v4, a3))
    MEMORY[0x1E0DE7D20](self, sel__onInertiaTimer, v6, v7);
}

- (void)_setInertiaRunning:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_stateLock;
  char v6;

  v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (v3)
    v6 = 4;
  else
    v6 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xFB | v6;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)_isInertiaRunning
{
  VFXCameraControlEventHandler *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = (*((unsigned __int8 *)v2 + 297) >> 2) & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_3DConnexionIsPressed
{
  return 0;
}

- (BOOL)wantsRedraw
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  if ((objc_msgSend__isInertiaRunning(self, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return MEMORY[0x1E0DE7D20](self, sel__3DConnexionIsPressed, v5, v6);
}

- (void)endDraggingWithVelocity:(CGPoint)a3
{
  uint64_t v3;
  double v4;
  CGFloat y;
  CGPoint v8;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((*((_BYTE *)self + 296) & 8) != 0)
  {
    v4 = fabs(a3.y);
    if (fabs(a3.x) >= 10.0 || v4 >= 10.0)
    {
      y = a3.y;
      v8 = (CGPoint)vdivq_f64((float64x2_t)a3, (float64x2_t)xmmword_1B22689A0);
      self->_inertiaVelocity = v8;
      if (self->_friction == 0.0)
      {
        __asm
        {
          FMOV            V2.2D, #-20.0
          FMOV            V4.2D, #20.0
        }
        self->_inertiaVelocity = (CGPoint)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v8), (int8x16_t)vminnmq_f64((float64x2_t)v8, _Q4), vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)v8), (int8x16_t)_Q2, (int8x16_t)v8));
      }
      objc_msgSend__setInertiaRunning_(self, a2, 1, v3);
      self->_lastSimulationTime = CACurrentMediaTime();
      v17 = objc_msgSend_view(self, v14, v15, v16);
      MEMORY[0x1E0DE7D20](v17, sel_eventHandlerWantsRedraw, v18, v19);
    }
  }
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  VFXNode *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  VFXNode *freeViewCameraNode;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  y = a3.y;
  x = a3.x;
  if (self->super._autoSwitchToFreeCamera)
    objc_msgSend__switchToFreeViewCamera(self, a2, v3, v4);
  v8 = (void *)objc_msgSend_view(self, a2, v3, v4);
  v12 = (void *)objc_msgSend_renderer(v8, v9, v10, v11);
  v16 = (VFXNode *)objc_msgSend_pointOfView(v12, v13, v14, v15);
  objc_msgSend_begin(VFXTransaction, v17, v18, v19);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v20, v21, v22, 0.0);
  if (self->super._autoSwitchToFreeCamera)
    objc_msgSend__prepareFreeViewCamera(self, v23, v24, v25);
  if (objc_msgSend_parentNode(v16, v23, v24, v25) || v16 == self->_freeViewCameraNode)
  {
    v29 = (void *)objc_msgSend_presentationNode(v16, v26, v27, v28);
    v33 = (void *)objc_msgSend_camera(v29, v30, v31, v32);
    objc_msgSend_fieldOfView(v33, v34, v35, v36);
    if (v40 == 0.0)
      v40 = 60.0;
    self->_originalFov = v40;
    v41 = (void *)objc_msgSend_camera(v29, v37, v38, v39);
    objc_msgSend_orthographicScale(v41, v42, v43, v44);
    self->_originalOrthoScale = v48;
    self->_zoomFactor = 1.0;
  }
  else
  {
    objc_msgSend__installFreeViewCameraIfNeeded(self, v26, v27, v28);
  }
  objc_msgSend_commit(VFXTransaction, v45, v46, v47);
  objc_msgSend_computeAutomaticTargetPoint(self, v49, v50, v51);
  freeViewCameraNode = self->_freeViewCameraNode;
  if (freeViewCameraNode)
  {
    objc_msgSend_transform(freeViewCameraNode, v52, v53, v54);
    *(_OWORD *)self->_anon_30 = v56;
    *(_OWORD *)&self->_anon_30[16] = v57;
    *(_OWORD *)&self->_anon_30[32] = v58;
    *(_OWORD *)&self->_anon_30[48] = v59;
    self->_initialPoint.x = x;
    self->_initialPoint.y = y;
    *((_BYTE *)self + 297) &= ~1u;
  }
}

- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__CFXNode *)a3 sphere:(CFXSphere *)a4
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = MEMORY[0x1E0C809B0];
  *(_OWORD *)a4 = xmmword_1B22463E0;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = sub_1B19852FC;
  v7[3] = &unk_1E63D68E8;
  v7[4] = a4;
  sub_1B186B018((uint64_t)a3, (uint64_t)v7);
  return *((float *)a4 + 3) >= 0.0;
}

- (__n128)viewedObjectSphere
{
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
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;

  if ((a1[18].i8[0] & 1) == 0)
  {
    v49 = 0uLL;
    v5 = (void *)objc_msgSend_view(a1, a2, a3, a4);
    v9 = (void *)objc_msgSend_world(v5, v6, v7, v8);
    v13 = (void *)objc_msgSend_rootNode(v9, v10, v11, v12);
    v17 = objc_msgSend_nodeRef(v13, v14, v15, v16);
    if (objc_msgSend_computeBoundingSphereOmittingFloorsForNode_sphere_(a1, v18, v17, (uint64_t)&v49))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v22 = (void *)objc_msgSend_view(a1, v19, v20, v21);
      v26 = (void *)objc_msgSend_world(v22, v23, v24, v25);
      v30 = (void *)objc_msgSend_rootNode(v26, v27, v28, v29);
      v34 = objc_msgSend_nodeRef(v30, v31, v32, v33);
      sub_1B186BDB8(v34, (uint64_t)&v45, v35, v36, v37, v38, v39, v40);
      v41 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v48, v47, v49, 2), v46, *(float32x2_t *)v49.f32, 1), v45, v49.f32[0]);
      v42 = vmlaq_f32(vmlaq_f32(vmulq_laneq_f32(v47, v49, 3), (float32x4_t)0, v46), (float32x4_t)0, v45);
      v43 = vmulq_f32(v42, v42);
      v41.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0]);
      v49 = v41;
      a1[17] = v41;
    }
    else
    {
      a1[17] = (float32x4_t)xmmword_1B2244E20;
    }
    a1[18].i8[0] |= 1u;
  }
  return (__n128)a1[17];
}

+ (double)frontVectorWithPointOfView:(void *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  double result;
  float32x4_t v24;

  v5 = (void *)objc_msgSend_camera(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_cameraRef(v5, v6, v7, v8);
  *(double *)v9.i64 = sub_1B186658C();
  v24 = v9;
  objc_msgSend_worldTransform(a3, v10, v11, v12);
  v16 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32(v13, v24, 2), v14, *(float32x2_t *)v24.f32, 1), v15, v24.f32[0]);
  v17 = vmulq_f32(v24, v24);
  v18 = vmulq_f32(v16, v16);
  v18.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).u64[0];
  v19 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 0);
  v19.i32[3] = 0;
  v20 = vrsqrteq_f32(v19);
  v21 = vmulq_f32(v20, vrsqrtsq_f32(v19, vmulq_f32(v20, v20)));
  v22 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v18.f32[0] != 0.0)), 0x1FuLL));
  v22.i32[3] = 0;
  *(_QWORD *)&result = vbslq_s8((int8x16_t)vcltzq_s32(v22), (int8x16_t)vmulq_f32(v16, vmulq_n_f32(vmulq_f32(v21, vrsqrtsq_f32(v19, vmulq_f32(v21, v21))), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]))), (int8x16_t)v16).u64[0];
  return result;
}

- (uint64_t)frontVector
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend_view(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_renderer(v4, v5, v6, v7);
  v12 = objc_msgSend_pointOfView(v8, v9, v10, v11);
  v13 = objc_opt_class();
  return MEMORY[0x1E0DE7D20](v13, sel_frontVectorWithPointOfView_, v12, v14);
}

- (void)_beginTranslateAtLocation:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  float64x2_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  float32x4_t *clickOrigin;
  __int128 v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  float32x4_t v41;
  const char *v42;
  uint64_t v43;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  float32x4_t v70;
  uint64_t v71;
  CGFloat x;
  CGFloat y;
  float32x4_t v74;
  float64_t v75;
  __n128 v76;
  __n128 v77;
  float32x4_t v78;
  float32x4_t v79;

  x = a3.x;
  y = a3.y;
  v6 = (void *)objc_msgSend_view(self, a2, v3, v4);
  objc_msgSend_bounds(v6, v7, v8, v9);
  v75 = v10;
  v14 = (void *)objc_msgSend_view(self, v11, v12, v13);
  objc_msgSend_bounds(v14, v15, v16, v17);
  v71 = v18;
  v22 = (void *)objc_msgSend_view(self, v19, v20, v21);
  v26 = (void *)objc_msgSend_renderer(v22, v23, v24, v25);
  v30 = (void *)objc_msgSend_pointOfView(v26, v27, v28, v29);
  v31.f64[0] = v75;
  *(_QWORD *)&v31.f64[1] = v71;
  v76 = (__n128)vcvt_hight_f32_f64(0, v31);
  v31.f64[0] = x;
  v31.f64[1] = y;
  v32 = COERCE_DOUBLE(vcvt_f32_f64(v31));
  objc_msgSend_viewedObjectSphere(self, v33, v34, v35);
  clickOrigin = (float32x4_t *)self->_clickOrigin;
  *(_OWORD *)self->_clickOrigin = v37;
  objc_msgSend_frontVector(self, v38, v39, v40);
  v74 = v41;
  v78 = 0u;
  v79 = 0u;
  v45 = objc_msgSend_nodeRef(v30, v42, v43, v44);
  v49 = (void *)objc_msgSend_view(self, v46, v47, v48);
  v53 = (void *)objc_msgSend_world(v49, v50, v51, v52);
  v57 = objc_msgSend_worldRef(v53, v54, v55, v56);
  sub_1B17A8594(v45, v57, &v78, &v79, v76, v32, v58, v59, v60, v61);
  if (v69)
  {
    v77 = 0uLL;
    sub_1B17C4A6C(&v77, *clickOrigin, v74, v62, v63, v64, v65, v66, v67, v68);
    if (!sub_1B17C3100(&v78, (float *)&v77, (float32x4_t *)self->_clickOrigin))
    {
      v70.i64[0] = 0x3F0000003F000000;
      v70.i64[1] = 0x3F0000003F000000;
      *clickOrigin = vmulq_f32(vaddq_f32(v78, v79), v70);
    }
  }
  else
  {
    sub_1B17C4408(0, (uint64_t)CFSTR("Warning: _beginTranslateAtLocation: invalid zRange"), v63, v64, v65, v66, v67, v68, v71);
  }
}

+ (double)matrixWithNoRoll:(float32x4_t)a3
{
  float32x4_t v6;
  int32x2_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;
  int32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  int32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int32x4_t v42;
  __float2 v43;
  uint64_t v44;
  float32x4_t v45;
  float32x4_t v46;
  int8x16_t v51;
  float32x4_t v52;
  unsigned int v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x4_t v56;
  float v57;
  float32x4_t v58;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v65;
  _OWORD v67[4];
  _OWORD v68[4];

  v14 = vmlaq_f32(vaddq_f32(a2, vmulq_f32(a3, (float32x4_t)0)), (float32x4_t)0, a1);
  v6 = vmulq_f32(v14, v14);
  v7 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).u64[0];
  v8 = (float32x4_t)vdupq_lane_s32(v7, 0);
  v8.i32[3] = 0;
  v9 = vrsqrteq_f32(v8);
  v10 = vmulq_f32(v9, vrsqrtsq_f32(v8, vmulq_f32(v9, v9)));
  v11 = (int8x16_t)vmulq_f32(v14, vmulq_f32(v10, vrsqrtsq_f32(v8, vmulq_f32(v10, v10))));
  v12 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v7.i32 != 0.0)), 0x1FuLL));
  v12.i32[3] = 0;
  v13 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v12), v11, (int8x16_t)v14);
  v14.i32[0] = 0;
  v15 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)), 0), (int8x16_t)xmmword_1B2244DE0, (int8x16_t)xmmword_1B2244DD0);
  v65 = a3;
  v63 = a1;
  v16 = vmlaq_f32(vmlaq_f32(vnegq_f32(a3), (float32x4_t)0, a2), (float32x4_t)0, a1);
  v17 = vmulq_f32(v16, v16);
  v17.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
  v18 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 0);
  v18.i32[3] = 0;
  v19 = vrsqrteq_f32(v18);
  v20 = vmulq_f32(v19, vrsqrtsq_f32(v18, vmulq_f32(v19, v19)));
  v21 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v17.f32[0] != 0.0)), 0x1FuLL));
  v21.i32[3] = 0;
  v22 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v21), (int8x16_t)vmulq_f32(v16, vmulq_f32(v20, vrsqrtsq_f32(v18, vmulq_f32(v20, v20)))), (int8x16_t)v16);
  v23 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v22, (int32x4_t)v22), (int8x16_t)v22, 0xCuLL);
  v24 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL), vnegq_f32(v22)), v15, v23);
  v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v24, v24), (int8x16_t)v24, 0xCuLL);
  v26 = vmlaq_f32(vmulq_f32(v23, vnegq_f32(v25)), v22, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL));
  v27 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26), (int8x16_t)v26, 0xCuLL);
  v28 = (int32x4_t)vmulq_f32(v26, v26);
  v28.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), *(float32x2_t *)v28.i8)).u32[0];
  *(float32x2_t *)v23.f32 = vrsqrte_f32((float32x2_t)v28.u32[0]);
  *(float32x2_t *)v23.f32 = vmul_f32(*(float32x2_t *)v23.f32, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(*(float32x2_t *)v23.f32, *(float32x2_t *)v23.f32)));
  v29 = vmulq_n_f32(v27, vmul_f32(*(float32x2_t *)v23.f32, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(*(float32x2_t *)v23.f32, *(float32x2_t *)v23.f32))).f32[0]);
  v30 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL), vnegq_f32(v29)), v13, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), (int8x16_t)v29, 0xCuLL));
  v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL);
  v32 = (int32x4_t)vmulq_f32(v30, v30);
  v32.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), *(float32x2_t *)v32.i8)).u32[0];
  *(float32x2_t *)v24.i8 = vrsqrte_f32((float32x2_t)v32.u32[0]);
  *(float32x2_t *)v24.i8 = vmul_f32(*(float32x2_t *)v24.i8, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(*(float32x2_t *)v24.i8, *(float32x2_t *)v24.i8)));
  v33 = vmulq_n_f32(v31, vmul_f32(*(float32x2_t *)v24.i8, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(*(float32x2_t *)v24.i8, *(float32x2_t *)v24.i8))).f32[0]);
  v34 = vmulq_f32(v29, v29);
  v35 = vmulq_f32(v13, v13);
  v36 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0])* sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0]);
  if (v36 > 0.0)
  {
    v37 = vmulq_f32(v29, v13);
    v61 = v33;
    v14.f32[0] = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]/ v36);
    v33 = v61;
  }
  v38 = vmulq_f32(v33, v33);
  v38.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).u64[0];
  v39 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 0);
  v39.i32[3] = 0;
  v40 = vrsqrteq_f32(v39);
  v41 = vmulq_f32(v40, vrsqrtsq_f32(v39, vmulq_f32(v40, v40)));
  v42 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v38.f32[0] != 0.0)), 0x1FuLL));
  v42.i32[3] = 0;
  v62 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v42), (int8x16_t)vmulq_f32(v33, vmulq_f32(v41, vrsqrtsq_f32(v39, vmulq_f32(v41, v41)))), (int8x16_t)v33);
  v43 = __sincosf_stret(v14.f32[0]);
  v44 = 0;
  v45 = v62;
  v46 = vmulq_f32(v45, v45);
  __asm { FMOV            V2.4S, #1.0 }
  v51 = (int8x16_t)vmlaq_n_f32(v46, vsubq_f32(_Q2, v46), v43.__cosval);
  _Q2.f32[0] = (float)(1.0 - v43.__cosval) * vmulq_lane_f32(v45, *(float32x2_t *)v45.f32, 1).f32[0];
  v52 = vmulq_n_f32(v62, v43.__sinval);
  v45.f32[0] = _Q2.f32[0] - v52.f32[2];
  *(float *)&v53 = _Q2.f32[0] + v52.f32[2];
  v54 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v62.f32, v62, 2), 1.0 - v43.__cosval);
  _Q2.f32[0] = v54.f32[0] + v52.f32[1];
  v55 = (float32x2_t)vrev64_s32(*(int32x2_t *)v52.f32);
  v56.i32[0] = vsub_f32(v54, v55).u32[0];
  v56.i32[1] = vadd_f32(v54, v55).i32[1];
  v56.i64[1] = vextq_s8(v51, v51, 8uLL).u32[0];
  v57 = v54.f32[1];
  v58.i64[0] = __PAIR64__(v45.u32[0], v51.u32[0]);
  v58.i64[1] = _Q2.u32[0];
  _Q2.i32[3] = 0;
  _Q2.i64[0] = __PAIR64__(v51.u32[1], v53);
  v67[0] = v63;
  v67[1] = a2;
  v67[2] = v65;
  v67[3] = a4;
  memset(v68, 0, sizeof(v68));
  do
  {
    _Q2.f32[2] = v57 - v52.f32[0];
    v68[v44] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v58, COERCE_FLOAT(v67[v44])), _Q2, *(float32x2_t *)&v67[v44], 1), v56, (float32x4_t)v67[v44], 2), (float32x4_t)xmmword_1B2244E20, (float32x4_t)v67[v44], 3);
    ++v44;
  }
  while (v44 != 4);
  return *(double *)v68;
}

- (void)clearRoll
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
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;

  v5 = (void *)objc_msgSend_view(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_renderer(v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_pointOfView(v9, v10, v11, v12);
  objc_msgSend_worldTransform(v13, v14, v15, v16);
  v50 = v17;
  v46 = v19;
  v48 = v18;
  v44 = v20;
  v21 = (void *)objc_opt_class();
  objc_msgSend_matrixWithNoRoll_(v21, v22, v23, v24, v50, v48, v46, v44);
  v51 = v25;
  v47 = v27;
  v49 = v26;
  v45 = v28;
  v32 = (void *)objc_msgSend_view(self, v29, v30, v31);
  v36 = (void *)objc_msgSend_renderer(v32, v33, v34, v35);
  v40 = (void *)objc_msgSend_pointOfView(v36, v37, v38, v39);
  objc_msgSend_setWorldTransform_(v40, v41, v42, v43, v51, v49, v47, v45);
}

- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5
{
  double y;
  double x;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int32x4_t v42;
  float32x2_t v43;
  float32x2_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  int32x4_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x4_t v51;
  double v52;
  double v53;
  float32x2_t v54;
  float32x4_t v55;
  int32x4_t v56;
  float32x2_t v57;
  float32x2_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  int32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  int32x4_t v68;
  __float2 v69;
  float32x4_t v70;
  float32x4_t v71;
  int8x16_t v77;
  float32x4_t v78;
  float32x2_t v79;
  unsigned int v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  int32x4_t v89;
  __float2 v90;
  float32x4_t v91;
  float32x4_t v92;
  int8x16_t v94;
  float32x4_t v95;
  float32x2_t v96;
  float32x2_t v97;
  __int128 v98;
  float v99;
  float32x4_t v100;
  float32x4_t v101;
  __float2 v102;
  unint64_t v103;
  float32x4_t v104;
  float32x4_t v105;
  int8x16_t v106;
  float32x4_t v107;
  unsigned int v108;
  float32x2_t v109;
  float32x2_t v110;
  float32x4_t v111;
  float v112;
  float32x4_t v113;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  int32x4_t v123;
  uint64_t v124;
  float32x4_t v125;
  float32x4_t v126;
  unint64_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  __int128 v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  __int128 v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  __int128 v150;

  y = a3.y;
  x = a3.x;
  self->_totalDragWithInertia = a3;
  v10 = (void *)objc_msgSend_view(self, a2, a4, a5);
  v14 = (void *)objc_msgSend_renderer(v10, v11, v12, v13);
  v21 = (void *)objc_msgSend_pointOfView(v14, v15, v16, v17);
  if ((*((_BYTE *)self + 297) & 1) == 0)
  {
    *(_OWORD *)self->_upDir = xmmword_1B2244DD0;
    v22 = vmlaq_f32(vaddq_f32(*(float32x4_t *)&self->_anon_30[16], vmulq_f32(*(float32x4_t *)&self->_anon_30[32], (float32x4_t)0)), (float32x4_t)0, *(float32x4_t *)self->_anon_30);
    v23 = vmulq_f32(v22, v22);
    v23.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).u64[0];
    v24 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0);
    v24.i32[3] = 0;
    v25 = vrsqrteq_f32(v24);
    v26 = vmulq_f32(v25, vrsqrtsq_f32(v24, vmulq_f32(v25, v25)));
    v27 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v23.f32[0] != 0.0)), 0x1FuLL));
    v27.i32[3] = 0;
    *(int8x16_t *)self->_upDir = vbslq_s8((int8x16_t)vcltzq_s32(v27), (int8x16_t)vmulq_f32(v22, vmulq_f32(v26, vrsqrtsq_f32(v24, vmulq_f32(v26, v26)))), (int8x16_t)v22);
    *((_BYTE *)self + 297) |= 1u;
  }
  v28 = *(float32x4_t *)&self->_anon_30[48];
  v142 = v28;
  if (a4 == 1)
  {
    if ((*((_BYTE *)self + 296) & 2) != 0)
      objc_msgSend_cameraAutomaticTargetPoint(self, v18, v19, v20);
    else
      objc_msgSend_cameraTarget(self, v18, v19, v20);
    v28 = v142;
    v30 = v29;
    v37 = vsubq_f32(v29, v142);
  }
  else
  {
    v30 = 0uLL;
    v31 = vmlaq_f32(vmlaq_f32(vnegq_f32(*(float32x4_t *)&self->_anon_30[32]), (float32x4_t)0, *(float32x4_t *)&self->_anon_30[16]), (float32x4_t)0, *(float32x4_t *)self->_anon_30);
    v32 = vmulq_f32(v31, v31);
    v32.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).u64[0];
    v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 0);
    v33.i32[3] = 0;
    v34 = vrsqrteq_f32(v33);
    v35 = vmulq_f32(v34, vrsqrtsq_f32(v33, vmulq_f32(v34, v34)));
    v36 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v32.f32[0] != 0.0)), 0x1FuLL));
    v36.i32[3] = 0;
    v37 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v36), (int8x16_t)vmulq_f32(v31, vmulq_f32(v35, vrsqrtsq_f32(v33, vmulq_f32(v35, v35)))), (int8x16_t)v31);
    x = -x;
    y = -y;
  }
  v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
  v39 = vnegq_f32(v37);
  v40 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)self->_upDir, *(int32x4_t *)self->_upDir), *(int8x16_t *)self->_upDir, 0xCuLL), v39), *(float32x4_t *)self->_upDir, v38);
  v41 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v40, (int32x4_t)v40), (int8x16_t)v40, 0xCuLL);
  v42 = (int32x4_t)vmulq_f32(v40, v40);
  v42.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v42.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v42, 2), *(float32x2_t *)v42.i8)).u32[0];
  v43 = vrsqrte_f32((float32x2_t)v42.u32[0]);
  v44 = vmul_f32(v43, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(v43, v43)));
  v45 = vmulq_n_f32(v41, vmul_f32(v44, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(v44, v44))).f32[0]);
  v141 = v30;
  if ((*((_BYTE *)self + 297) & 2) != 0)
  {
    if (a5 > 1)
    {
      v83 = (float32x4_t)xmmword_1B22689E0;
      v98 = unk_1B22689F0;
      v81 = (float32x4_t)xmmword_1B22689C0;
      v82 = (float32x4_t)unk_1B22689D0;
    }
    else
    {
      v84 = y * -0.00872664626;
      v85 = vmulq_f32(v45, v45);
      v85.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v85, 2), vaddq_f32(v85, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 1))).u64[0];
      v86 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.f32, 0);
      v86.i32[3] = 0;
      v87 = vrsqrteq_f32(v86);
      v88 = vmulq_f32(v87, vrsqrtsq_f32(v86, vmulq_f32(v87, v87)));
      v89 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v85.f32[0] != 0.0)), 0x1FuLL));
      v89.i32[3] = 0;
      v138 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v89), (int8x16_t)vmulq_f32(v45, vmulq_f32(v88, vrsqrtsq_f32(v86, vmulq_f32(v88, v88)))), (int8x16_t)v45);
      v90 = __sincosf_stret(v84);
      v30 = v141;
      v28 = v142;
      v91 = v138;
      v92 = vmulq_f32(v91, v91);
      __asm { FMOV            V3.4S, #1.0 }
      v94 = (int8x16_t)vmlaq_n_f32(v92, vsubq_f32(_Q3, v92), v90.__cosval);
      _Q3.f32[0] = (float)(1.0 - v90.__cosval) * vmulq_lane_f32(v91, *(float32x2_t *)v91.f32, 1).f32[0];
      v95 = vmulq_n_f32(v138, v90.__sinval);
      v96 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v138.f32, v138, 2), 1.0 - v90.__cosval);
      v97 = (float32x2_t)vrev64_s32(*(int32x2_t *)v95.f32);
      v83.i32[0] = vsub_f32(v96, v97).u32[0];
      v83.i32[1] = vadd_f32(v96, v97).i32[1];
      v81.i32[3] = 0;
      v81.i32[0] = v94.i32[0];
      v81.f32[1] = _Q3.f32[0] - v95.f32[2];
      v82.i32[3] = 0;
      v81.f32[2] = v96.f32[0] + v95.f32[1];
      v82.f32[0] = _Q3.f32[0] + v95.f32[2];
      v82.i32[1] = v94.i32[1];
      v82.f32[2] = v96.f32[1] - v95.f32[0];
      v83.i64[1] = vextq_s8(v94, v94, 8uLL).u32[0];
      v98 = xmmword_1B2244E20;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v132 = v98;
      v99 = x * -0.00872664626;
      v100 = vrsqrteq_f32((float32x4_t)xmmword_1B2244F70);
      v101 = vmulq_f32(v100, vrsqrtsq_f32((float32x4_t)xmmword_1B2244F70, vmulq_f32(v100, v100)));
      v131 = vmulq_f32(vmulq_f32(v101, vrsqrtsq_f32((float32x4_t)xmmword_1B2244F70, vmulq_f32(v101, v101))), (float32x4_t)xmmword_1B2244DE0);
      v135 = v81;
      v139 = v83;
      v133 = v82;
      v102 = __sincosf_stret(v99);
      v103 = 0;
      v104 = v131;
      v105 = vmulq_f32(v104, v104);
      __asm { FMOV            V2.4S, #1.0 }
      v106 = (int8x16_t)vmlaq_n_f32(v105, vsubq_f32(_Q2, v105), v102.__cosval);
      _Q2.f32[0] = (float)(1.0 - v102.__cosval) * vmulq_lane_f32(v104, *(float32x2_t *)v104.f32, 1).f32[0];
      v107 = vmulq_n_f32(v131, v102.__sinval);
      v104.f32[0] = _Q2.f32[0] - v107.f32[2];
      *(float *)&v108 = v107.f32[2] + _Q2.f32[0];
      v109 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v131.f32, v131, 2), 1.0 - v102.__cosval);
      _Q2.f32[0] = v107.f32[1] + v109.f32[0];
      v110 = (float32x2_t)vrev64_s32(*(int32x2_t *)v107.f32);
      v111.i32[0] = vsub_f32(v109, v110).u32[0];
      v111.i32[1] = vadd_f32(v109, v110).i32[1];
      v111.i64[1] = vextq_s8(v106, v106, 8uLL).u32[0];
      v112 = v109.f32[1];
      v113.i64[0] = __PAIR64__(v104.u32[0], v106.u32[0]);
      v113.i64[1] = _Q2.u32[0];
      _Q2.i32[3] = 0;
      _Q2.i64[0] = __PAIR64__(v106.u32[1], v108);
      v143 = v135;
      v144 = v133;
      v145 = v139;
      v146 = v132;
      v147 = 0u;
      v148 = 0u;
      v149 = 0u;
      v150 = 0u;
      do
      {
        _Q2.f32[2] = v112 - v107.f32[0];
        *(float32x4_t *)((char *)&v147 + v103) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)((char *)&v143 + v103))), _Q2, *(float32x2_t *)&v143.f32[v103 / 4], 1), v111, *(float32x4_t *)((char *)&v143 + v103), 2), (float32x4_t)xmmword_1B2244E20, *(float32x4_t *)((char *)&v143 + v103), 3);
        v103 += 16;
      }
      while (v103 != 64);
      v81 = v147;
      v82 = v148;
      v83 = v149;
      v30 = v141;
      v28 = v142;
    }
  }
  else
  {
    v46 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v45, (int32x4_t)v45), (int8x16_t)v45, 0xCuLL), v39), v45, v38);
    v47 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v46, (int32x4_t)v46), (int8x16_t)v46, 0xCuLL);
    v48 = (int32x4_t)vmulq_f32(v46, v46);
    v48.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), *(float32x2_t *)v48.i8)).u32[0];
    v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
    v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
    v51 = vmulq_n_f32(v47, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
    v52 = 0.0;
    if (a5 == 2)
      v53 = 0.0;
    else
      v53 = y;
    if (a5 == 1)
      v53 = y;
    else
      v52 = x;
    *(float *)&v53 = v53;
    v54.f32[0] = v52;
    v55 = vmlsq_lane_f32(vmulq_n_f32(v45, v54.f32[0]), v51, *(float32x2_t *)&v53, 0);
    v56 = (int32x4_t)vmulq_f32(v55, v55);
    v56.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v56, 2), vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v56.i8, 1))).u32[0];
    v57 = vrsqrte_f32((float32x2_t)v56.u32[0]);
    v58 = vmul_f32(v57, vrsqrts_f32((float32x2_t)v56.u32[0], vmul_f32(v57, v57)));
    v59 = vmulq_n_f32(v55, vmul_f32(v58, vrsqrts_f32((float32x2_t)v56.u32[0], vmul_f32(v58, v58))).f32[0]);
    v60 = vmlaq_f32(vmulq_f32(v38, vnegq_f32(v59)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v59, (int32x4_t)v59), (int8x16_t)v59, 0xCuLL));
    v61 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v60, (int32x4_t)v60), (int8x16_t)v60, 0xCuLL);
    v62 = (int32x4_t)vmulq_f32(v60, v60);
    v62.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), *(float32x2_t *)v62.i8)).u32[0];
    *(float32x2_t *)v59.f32 = vrsqrte_f32((float32x2_t)v62.u32[0]);
    *(float32x2_t *)v59.f32 = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32)));
    v63 = vmulq_n_f32(v61, vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32))).f32[0]);
    v54.i32[1] = LODWORD(v53);
    v61.f32[0] = sqrtf(vaddv_f32(vmul_f32(v54, v54))) * 0.00872664626;
    v64 = vmulq_f32(v63, v63);
    v64.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v64, 2), vaddq_f32(v64, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 1))).u64[0];
    v65 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 0);
    v65.i32[3] = 0;
    v66 = vrsqrteq_f32(v65);
    v67 = vmulq_f32(v66, vrsqrtsq_f32(v65, vmulq_f32(v66, v66)));
    v68 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v64.f32[0] != 0.0)), 0x1FuLL));
    v68.i32[3] = 0;
    v137 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v68), (int8x16_t)vmulq_f32(v63, vmulq_f32(v67, vrsqrtsq_f32(v65, vmulq_f32(v67, v67)))), (int8x16_t)v63);
    v69 = __sincosf_stret(v61.f32[0]);
    v30 = v141;
    v28 = v142;
    v70 = v137;
    v71 = vmulq_f32(v70, v70);
    __asm { FMOV            V3.4S, #1.0 }
    v77 = (int8x16_t)vmlaq_n_f32(v71, vsubq_f32(_Q3, v71), v69.__cosval);
    _Q3.f32[0] = (float)(1.0 - v69.__cosval) * vmulq_lane_f32(v70, *(float32x2_t *)v70.f32, 1).f32[0];
    v78 = vmulq_n_f32(v137, v69.__sinval);
    v79 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v137.f32, v137, 2), 1.0 - v69.__cosval);
    v70.f32[0] = v79.f32[0] + v78.f32[1];
    *(float *)&v80 = v79.f32[1] - v78.f32[0];
    *(int32x2_t *)v78.f32 = vrev64_s32(*(int32x2_t *)v78.f32);
    v83.i32[0] = vsub_f32(v79, *(float32x2_t *)v78.f32).u32[0];
    v83.i32[1] = vadd_f32(v79, *(float32x2_t *)&v78).i32[1];
    v81.i32[0] = v77.i32[0];
    v81.f32[1] = _Q3.f32[0] - v78.f32[2];
    v81.i64[1] = v70.u32[0];
    v82.f32[0] = _Q3.f32[0] + v78.f32[2];
    v82.i32[1] = v77.i32[1];
    v82.i64[1] = v80;
    v83.i64[1] = vextq_s8(v77, v77, 8uLL).u32[0];
  }
  if (a4 == 2)
  {
    v136 = v81;
    v140 = v83;
    v134 = v82;
    objc_msgSend_invalidateCameraTarget(self, v18, v19, v20);
    v82 = v134;
    v81 = v136;
    v83 = v140;
    v115 = v142;
  }
  else
  {
    v116 = vsubq_f32(v28, v30);
    v117 = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32(v83, v116, 2), v82, *(float32x2_t *)v116.f32, 1), v81, v116.f32[0]);
    v118 = vmulq_f32(v116, v116);
    v119 = vmulq_f32(v117, v117);
    v119.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v119, 2), vaddq_f32(v119, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.f32, 1))).u64[0];
    v120 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.f32, 0);
    v120.i32[3] = 0;
    v121 = vrsqrteq_f32(v120);
    v122 = vmulq_f32(v121, vrsqrtsq_f32(v120, vmulq_f32(v121, v121)));
    v123 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v119.f32[0] != 0.0)), 0x1FuLL));
    v123.i32[3] = 0;
    v115 = vaddq_f32(v30, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v123), (int8x16_t)vmulq_f32(v117, vmulq_n_f32(vmulq_f32(v122, vrsqrtsq_f32(v120, vmulq_f32(v122, v122))), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1))).f32[0]))), (int8x16_t)v117));
  }
  v124 = 0;
  v125 = *(float32x4_t *)&self->_anon_30[16];
  v126 = *(float32x4_t *)&self->_anon_30[32];
  v143 = *(float32x4_t *)self->_anon_30;
  v144 = v125;
  v145 = v126;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v147 + v124 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)((char *)&v143 + v124 * 4))), v82, *(float32x2_t *)&v143.f32[v124], 1), v83, *(float32x4_t *)((char *)&v143 + v124 * 4), 2);
    v124 += 4;
  }
  while (v124 != 12);
  v127 = 0;
  v128 = v147;
  v129 = v148;
  v128.i32[3] = 0;
  v129.i32[3] = 0;
  v130 = v149;
  v130.i32[3] = 0;
  v115.i32[3] = 1.0;
  v143 = v128;
  v144 = v129;
  v145 = v130;
  v146 = xmmword_1B2244E20;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v147 + v127) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(*(_OWORD *)((char *)&v143 + v127))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)&v143.f32[v127 / 4], 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v143 + v127), 2), v115, *(float32x4_t *)((char *)&v143 + v127), 3);
    v127 += 16;
  }
  while (v127 != 64);
  objc_msgSend_setTransform_(v21, v18, v19, v20, *(double *)v147.i64, *(double *)v148.i64, *(double *)v149.i64, *(double *)&v150);
}

- (void)_translateTo:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  float64x2_t v30;
  float64_t v31;
  double v32;
  const char *v33;
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
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  float32x4_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float32x4_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  const char *v96;
  uint64_t v97;
  float64_t v98;
  __n128 v99;
  CGFloat x;
  CGFloat y;
  float32x4_t v102;
  float32x4_t v103;
  __n128 v104;
  float32x4_t v105;
  float32x4_t v106[2];
  float32x4_t v107;
  __int128 v108;
  _OWORD v109[4];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;

  x = a3.x;
  y = a3.y;
  v107 = 0u;
  v108 = 0u;
  memset(v106, 0, sizeof(v106));
  v105.i32[2] = 0;
  v105.i64[0] = 0;
  v104 = 0uLL;
  v6 = (void *)objc_msgSend_view(self, a2, v3, v4);
  v10 = (void *)objc_msgSend_renderer(v6, v7, v8, v9);
  v14 = (void *)objc_msgSend_pointOfView(v10, v11, v12, v13);
  v18 = (void *)objc_msgSend_view(self, v15, v16, v17);
  objc_msgSend_bounds(v18, v19, v20, v21);
  v98 = v22;
  v26 = (void *)objc_msgSend_view(self, v23, v24, v25);
  objc_msgSend_bounds(v26, v27, v28, v29);
  v30.f64[0] = v98;
  v30.f64[1] = v31;
  v99 = (__n128)vcvt_hight_f32_f64(0, v30);
  v30.f64[0] = x;
  v30.f64[1] = y;
  v32 = COERCE_DOUBLE(vcvt_f32_f64(v30));
  v36 = objc_msgSend_nodeRef(v14, v33, v34, v35);
  v40 = (void *)objc_msgSend_view(self, v37, v38, v39);
  v44 = (void *)objc_msgSend_world(v40, v41, v42, v43);
  v48 = objc_msgSend_worldRef(v44, v45, v46, v47);
  sub_1B17A8594(v36, v48, &v108, &v107, v99, v32, v49, v50, v51, v52);
  if (v53)
  {
    *(_QWORD *)&v54 = sub_1B182409C(v106, &v107).u64[0];
    v103.i32[2] = 0;
    v103.i64[0] = 0;
    v58 = objc_msgSend_nodeRef(v14, v55, v56, v57, v54);
    sub_1B186B5BC(v58, (__n128 *)&v103, v59, v60, v61, v62, v63, v64);
    v107 = v103;
    objc_msgSend_frontVector(self, v65, v66, v67);
    sub_1B17C4A6C(&v104, *(float32x4_t *)self->_clickOrigin, v75, v68, v69, v70, v71, v72, v73, v74);
    if ((sub_1B17C2FB4((uint64_t)v106, (float *)&v104, &v105) & 1) != 0)
    {
      v83 = vnegq_f32(vsubq_f32(v105, *(float32x4_t *)self->_clickOrigin));
      v83.i32[3] = 1.0;
      v102 = v83;
      v84 = (void *)objc_msgSend_presentationNode(v14, v76, v77, v78);
      objc_msgSend_transform(v84, v85, v86, v87);
      v91 = 0;
      v109[0] = v92;
      v109[1] = v93;
      v109[2] = v94;
      v109[3] = v95;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      do
      {
        *(__int128 *)((char *)&v110 + v91 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(v109[v91])), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)&v109[v91], 1), (float32x4_t)xmmword_1B2244D90, (float32x4_t)v109[v91], 2), v102, (float32x4_t)v109[v91], 3);
        ++v91;
      }
      while (v91 != 4);
      objc_msgSend_setTransform_(v14, v88, v89, v90, *(double *)&v110, *(double *)&v111, *(double *)&v112, *(double *)&v113);
      objc_msgSend_focusNode_(self, v96, 0, v97);
    }
    else
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Warning: no CFXIntersectionRay3Plane"), v77, v78, v79, v80, v81, v82, v99.n128_i64[0]);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIGestureRecognizer *pressGesture;
  UIGestureRecognizer *tapGesture;
  UIGestureRecognizer *panGesture;

  pressGesture = self->_pressGesture;
  if (pressGesture == a3 || pressGesture == a4)
    return 1;
  tapGesture = self->_tapGesture;
  panGesture = self->_panGesture;
  if (tapGesture == a3 && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4))
    return 1;
  if (tapGesture == a4 && panGesture == a3)
    return 1;
  return tapGesture == a4 && self->_pinchGesture == a3;
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
  UIGestureRecognizer *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
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
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;

  tapGesture = self->_tapGesture;
  if (tapGesture)
    return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], a2, (uint64_t)self->_pressGesture, v2, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
  v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC39C8]);
  objc_msgSend_setMinimumPressDuration_(v6, v7, v8, v9, 0.0);
  v10 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  v11 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3AE8]);
  v12 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3AA0]);
  v13 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3BB8]);
  objc_msgSend_setNumberOfTapsRequired_(v10, v14, 2, v15);
  objc_msgSend_addTarget_action_(v11, v16, (uint64_t)self, (uint64_t)sel__handlePinch_);
  objc_msgSend_addTarget_action_(v12, v17, (uint64_t)self, (uint64_t)sel__handlePan_);
  objc_msgSend_addTarget_action_(v6, v18, (uint64_t)self, (uint64_t)sel__handlePress_);
  objc_msgSend_addTarget_action_(v13, v19, (uint64_t)self, (uint64_t)sel__handleRotation_);
  objc_msgSend_addTarget_action_(v10, v20, (uint64_t)self, (uint64_t)sel__handleDoubleTap_);
  objc_msgSend_setDelegate_(v6, v21, (uint64_t)self, v22);
  objc_msgSend_setDelegate_(v12, v23, (uint64_t)self, v24);
  objc_msgSend_setDelegate_(v11, v25, (uint64_t)self, v26);
  objc_msgSend_setDelegate_(v13, v27, (uint64_t)self, v28);
  objc_msgSend_setDelegate_(v10, v29, (uint64_t)self, v30);
  objc_msgSend_setDelaysTouchesBegan_(v11, v31, 0, v32);
  objc_msgSend_setDelaysTouchesBegan_(v13, v33, 0, v34);
  objc_msgSend_setDelaysTouchesBegan_(v12, v35, 0, v36);
  objc_msgSend_setDelaysTouchesBegan_(v10, v37, 0, v38);
  objc_msgSend_setDelaysTouchesBegan_(v6, v39, 0, v40);
  objc_msgSend_setCancelsTouchesInView_(v11, v41, 0, v42);
  objc_msgSend_setCancelsTouchesInView_(v13, v43, 0, v44);
  objc_msgSend_setCancelsTouchesInView_(v12, v45, 0, v46);
  objc_msgSend_setCancelsTouchesInView_(v10, v47, 0, v48);
  objc_msgSend_setCancelsTouchesInView_(v6, v49, 0, v50);
  v54 = objc_msgSend_enabled(self, v51, v52, v53);
  objc_msgSend_setEnabled_(v11, v55, v54, v56);
  v60 = objc_msgSend_enabled(self, v57, v58, v59);
  objc_msgSend_setEnabled_(v13, v61, v60, v62);
  v66 = objc_msgSend_enabled(self, v63, v64, v65);
  objc_msgSend_setEnabled_(v12, v67, v66, v68);
  v72 = objc_msgSend_enabled(self, v69, v70, v71);
  objc_msgSend_setEnabled_(v10, v73, v72, v74);
  v78 = objc_msgSend_enabled(self, v75, v76, v77);
  objc_msgSend_setEnabled_(v6, v79, v78, v80);
  self->_tapGesture = v10;
  self->_panGesture = v12;
  self->_pinchGesture = v11;
  self->_rotateGesture = v13;
  self->_pressGesture = v6;
  return (id)objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v81, (uint64_t)v6, v82, self->_panGesture, self->_tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v3;

  objc_msgSend_beginGesture_(self, a2, (uint64_t)a3, v3);
  return 1;
}

- (void)_handlePinch:(id)a3
{
  if ((*((_BYTE *)self + 296) & 1) != 0)
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_pinchWithGestureRecognizer_, a3);
}

- (void)_handlePan:(id)a3
{
  if ((*((_BYTE *)self + 296) & 1) != 0)
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_panWithGestureRecognizer_, a3);
}

- (void)_handleRotation:(id)a3
{
  if ((*((_BYTE *)self + 296) & 1) != 0)
    ((void (*)(VFXCameraControlEventHandler *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_rotateWithGestureRecognizer_, a3);
}

- (void)_handleDoubleTap:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*((_BYTE *)self + 296) & 1) != 0)
  {
    v4 = objc_msgSend_view(self, a2, (uint64_t)a3, v3);
    MEMORY[0x1E0DE7D20](v4, sel_switchToNextCamera, v5, v6);
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
  double v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if (objc_msgSend_numberOfTouches(a3, v6, v7, v8))
  {
    v12 = objc_msgSend_view(self, v9, v10, v11);
    objc_msgSend_locationOfTouch_inView_(a3, v13, 0, v12);
    v15 = v14;
    v17 = v16;
    v21 = (void *)objc_msgSend_view(self, v18, v19, v20);
    objc_msgSend_bounds(v21, v22, v23, v24);
    v26 = v25 - v17;
  }
  else
  {
    v26 = 0.0;
    v15 = 0.0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_roll = 0.0;
    objc_msgSend__startBrowsingIfNeeded_(self, v27, v28, v29, v15, v26);
    v30 = *(_OWORD *)&self->_anon_30[48];
    v32 = *(_OWORD *)self->_anon_30;
    v31 = *(_OWORD *)&self->_anon_30[16];
    *(_OWORD *)&self->_anon_a0[36] = *(_OWORD *)&self->_anon_30[32];
    *(_OWORD *)&self->_anon_a0[52] = v30;
    *(_OWORD *)&self->_anon_a0[4] = v32;
    *(_OWORD *)&self->_anon_a0[20] = v31;
    self->_browseMode = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend__startBrowsingIfNeeded_(self, v33, v34, v35, v15, v26);
      if ((*((_BYTE *)self + 296) & 0x20) != 0)
      {
        self->_browseMode = 4;
        objc_msgSend__beginTranslateAtLocation_(self, v36, v37, v38, v15, v26);
      }
      self->_browseMode = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        self->_initialZoom = self->_zoomFactor;
    }
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  uint64_t v3;
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  const char *v23;
  __float2 v24;
  __float2 v25;
  __float2 v26;
  uint64_t v27;
  unint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  _OWORD v33[4];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  objc_msgSend__setInertiaRunning_(self, a2, 0, v3);
  *((_BYTE *)self + 297) &= ~1u;
  v9 = (void *)objc_msgSend_view(self, v6, v7, v8);
  v13 = (void *)objc_msgSend_renderer(v9, v10, v11, v12);
  v17 = objc_msgSend_pointOfView(v13, v14, v15, v16);
  if (v17)
  {
    v21 = (void *)v17;
    objc_msgSend_rotation(a3, v18, v19, v20);
    *(float *)&v22 = v22;
    self->_roll = *(float *)&v22;
    v26 = __sincosf_stret(*(float *)&v22);
    v27 = 0;
    *(float *)&v28 = -v26.__sinval;
    HIDWORD(v28) = LODWORD(v26.__cosval);
    v29 = *(float32x4_t *)&self->_anon_a0[4];
    v30 = *(float32x4_t *)&self->_anon_a0[20];
    v31 = *(float32x4_t *)&self->_anon_a0[36];
    v32 = *(float32x4_t *)&self->_anon_a0[52];
    v33[0] = __PAIR64__(LODWORD(v26.__sinval), LODWORD(v26.__cosval));
    v33[1] = v28;
    v33[2] = xmmword_1B2244D90;
    v33[3] = xmmword_1B2244E20;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    do
    {
      *(__int128 *)((char *)&v34 + v27 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(v33[v27])), v30, *(float32x2_t *)&v33[v27], 1), v31, (float32x4_t)v33[v27], 2), v32, (float32x4_t)v33[v27], 3);
      ++v27;
    }
    while (v27 != 4);
    objc_msgSend_setTransform_(v21, v23, *(_QWORD *)&v24, *(_QWORD *)&v25, *(double *)&v34, *(double *)&v35, *(double *)&v36, *(double *)&v37);
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = fmax(self->_initialZoom, 0.001);
  objc_msgSend_scale(a3, a2, (uint64_t)a3, v3);
  v7 = v6 * v5;
  *(float *)&v7 = v7;
  objc_msgSend_setZoomFactor_(self, v8, v9, v10, v7);
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  __int128 v31;
  unsigned int v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _OWORD v72[4];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v6 = objc_msgSend_numberOfTouches(a3, a2, (uint64_t)a3, v3);
  if (self->_browseMode != 3)
  {
    v10 = v6;
    if (objc_msgSend_state(a3, v7, v8, v9) == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        v14 = objc_msgSend_view(self, v11, v12, v13);
        objc_msgSend_velocityInView_(a3, v15, v14, v16);
        MEMORY[0x1E0DE7D20](self, sel_endDraggingWithVelocity_, v66, v67);
      }
    }
    else
    {
      v17 = objc_msgSend_view(self, v11, v12, v13);
      objc_msgSend_translationInView_(a3, v18, v17, v19);
      switch(v10)
      {
        case 3:
          v25 = -v24;
          if (self->_lastGestureFingerCount != 3)
          {
            objc_msgSend_beginGesture_(self, v20, (uint64_t)a3, v22);
            self->_lastGestureFingerCount = 3;
          }
          objc_msgSend__translationCoef(self, v20, v21, v22);
          v29 = 0;
          *(_QWORD *)&v31 = 0;
          *(float *)&v32 = v25 * v30;
          *((_QWORD *)&v31 + 1) = __PAIR64__(1.0, v32);
          v33 = *(float32x4_t *)self->_anon_30;
          v34 = *(float32x4_t *)&self->_anon_30[16];
          v35 = *(float32x4_t *)&self->_anon_30[32];
          v36 = *(float32x4_t *)&self->_anon_30[48];
          v72[0] = xmmword_1B2244DB0;
          v72[1] = xmmword_1B2244DD0;
          v72[2] = xmmword_1B2244D90;
          v72[3] = v31;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          do
          {
            *(__int128 *)((char *)&v73 + v29 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(v72[v29])), v34, *(float32x2_t *)&v72[v29], 1), v35, (float32x4_t)v72[v29], 2), v36, (float32x4_t)v72[v29], 3);
            ++v29;
          }
          while (v29 != 4);
          v70 = *(double *)&v75;
          v71 = *(double *)&v76;
          v68 = *(double *)&v73;
          v69 = *(double *)&v74;
          v37 = (void *)objc_msgSend_view(self, v26, v27, v28);
          v41 = (void *)objc_msgSend_renderer(v37, v38, v39, v40);
          v45 = (void *)objc_msgSend_pointOfView(v41, v42, v43, v44);
          objc_msgSend_setTransform_(v45, v46, v47, v48, v68, v69, v70, v71);
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            objc_msgSend_beginGesture_(self, v20, (uint64_t)a3, v22);
            self->_lastGestureFingerCount = 2;
          }
          v49 = objc_msgSend_view(self, v20, v21, v22);
          objc_msgSend_locationOfTouch_inView_(a3, v50, 0, v49);
          v54 = (void *)objc_msgSend_view(self, v51, v52, v53);
          objc_msgSend_bounds(v54, v55, v56, v57);
          MEMORY[0x1E0DE7D20](self, sel__translateTo_, v64, v65);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            objc_msgSend__rotateWithDrag_mode_stickyAxis_(self, v20, self->_browseMode, self->_stickyAxis, v23 + v23, v24 * -2.0);
          }
          else
          {
            objc_msgSend_beginGesture_(self, v20, (uint64_t)a3, v22);
            v61 = objc_msgSend_view(self, v58, v59, v60);
            objc_msgSend_setTranslation_inView_(a3, v62, v61, v63, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
  }
}

@end
