@implementation VFXCamera

+ (VFXCamera)cameraWithMDLCamera:(id)a3
{
  uint64_t v3;
  VFXCamera *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL8 v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  float v105;
  float v106;
  uint64_t i;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  float v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;

  v5 = (VFXCamera *)objc_msgSend_camera(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_focalLength(a3, v6, v7, v8);
  objc_msgSend_setFocalLength_(v5, v9, v10, v11);
  objc_msgSend_sensorVerticalAperture(a3, v12, v13, v14);
  objc_msgSend_setSensorHeight_(v5, v15, v16, v17);
  objc_msgSend_focusDistance(a3, v18, v19, v20);
  objc_msgSend_setFocusDistance_(v5, v21, v22, v23);
  v27 = objc_msgSend_depthOfField(VFXCameraEffectDepthOfField, v24, v25, v26);
  objc_msgSend_setDepthOfField_(v5, v28, v27, v29);
  v33 = (void *)objc_msgSend_depthOfField(v5, v30, v31, v32);
  objc_msgSend_setEnabled_(v33, v34, 0, v35);
  objc_msgSend_fStop(a3, v36, v37, v38);
  v40 = v39;
  v44 = (void *)objc_msgSend_depthOfField(v5, v41, v42, v43);
  LODWORD(v45) = v40;
  objc_msgSend_setFStop_(v44, v46, v47, v48, v45);
  v52 = objc_msgSend_apertureBladeCount(a3, v49, v50, v51);
  v56 = (void *)objc_msgSend_depthOfField(v5, v53, v54, v55);
  objc_msgSend_setApertureBladeCount_(v56, v57, v52, v58);
  objc_msgSend_nearVisibilityDistance(a3, v59, v60, v61);
  objc_msgSend_setZNear_(v5, v62, v63, v64);
  objc_msgSend_farVisibilityDistance(a3, v65, v66, v67);
  objc_msgSend_setZFar_(v5, v68, v69, v70);
  v74 = objc_msgSend_projection(a3, v71, v72, v73) == 1;
  objc_msgSend_setUsesOrthographicProjection_(v5, v75, v74, v76);
  if (objc_msgSend_focalLengthAnimation(a3, v77, v78, v79))
  {
    objc_msgSend_focalLengthAnimation(a3, v80, v81, v82);
    v83 = (void *)objc_opt_class();
    v84 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v83, v85, v84, v86))
    {
      v87 = (void *)objc_msgSend_focalLengthAnimation(a3, v80, v81, v82);
      v91 = (void *)objc_msgSend_values(v87, v88, v89, v90);
      v95 = objc_msgSend_count(v91, v92, v93, v94);
      v98 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v96, v95, v97);
      objc_msgSend_sensorVerticalAperture(a3, v99, v100, v101);
      if (v95)
      {
        v106 = v105;
        for (i = 0; i != v95; ++i)
        {
          v108 = (void *)objc_msgSend_objectAtIndex_(v91, v102, i, v104);
          objc_msgSend_floatValue(v108, v109, v110, v111);
          *(float *)&v113 = (float)(atanf(v106 / (float)(v112 + v112)) * 360.0) / 3.1416;
          v117 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v114, v115, v116, v113);
          objc_msgSend_addObject_(v98, v118, v117, v119);
        }
      }
      v120 = (void *)objc_msgSend_animation(MEMORY[0x1E0CD2798], v102, v103, v104);
      objc_msgSend_setKeyPath_(v120, v121, (uint64_t)CFSTR("fieldOfView"), v122);
      objc_msgSend_setValues_(v120, v123, (uint64_t)v98, v124);
      v128 = objc_msgSend_keyTimes(v87, v125, v126, v127);
      objc_msgSend_setKeyTimes_(v120, v129, v128, v130);
      objc_msgSend_duration(v87, v131, v132, v133);
      objc_msgSend_setDuration_(v120, v134, v135, v136);
      objc_msgSend_setRemovedOnCompletion_(v120, v137, 0, v138);
      objc_msgSend_addAnimation_forKey_(v5, v139, (uint64_t)v120, 0);
    }
  }
  if (objc_msgSend_focalDistanceAnimation(a3, v80, v81, v82))
  {
    v143 = objc_msgSend_focalDistanceAnimation(a3, v140, v141, v142);
    objc_msgSend_addAnimation_forKey_(v5, v144, v143, (uint64_t)CFSTR("focalDistance"));
  }
  if (objc_msgSend_fStopAnimation(a3, v140, v141, v142))
  {
    v148 = objc_msgSend_fStopAnimation(a3, v145, v146, v147);
    objc_msgSend_addAnimation_forKey_(v5, v149, v148, (uint64_t)CFSTR("fstop"));
  }
  return v5;
}

- (VFXCamera)init
{
  VFXCamera *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXCamera;
  v2 = -[VFXCamera init](&v13, sel_init);
  if (v2)
  {
    v11 = sub_1B18641FC();
    v2->_camera = (__CFXCamera *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6, v11);
  }
  return v2;
}

- (VFXCamera)initWithCameraRef:(__CFXCamera *)a3
{
  VFXCamera *v4;
  __CFXCamera *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VFXCamera;
  v4 = -[VFXCamera init](&v17, sel_init);
  if (v4)
  {
    v5 = (__CFXCamera *)CFRetain(a3);
    v4->_camera = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationCameraWithCameraRef:(__CFXCamera *)a3
{
  VFXCamera *v4;
  VFXCamera *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXCamera;
  v4 = -[VFXCamera init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_camera = (__CFXCamera *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXCamera)cameraWithCameraRef:(__CFXCamera *)a3
{
  VFXCamera *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXCamera *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXCamera *)(id)objc_msgSend_initWithCameraRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)camera
{
  return objc_alloc_init((Class)a1);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXCamera *camera;
  objc_super v10;
  _QWORD v11[5];

  camera = self->_camera;
  if (camera)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      sub_1B193E768((uint64_t)camera, 0, v2, v3, v4, v5, v6, v7);
      camera = self->_camera;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B187D504;
    v11[3] = &unk_1E63D4AB0;
    v11[4] = camera;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXCamera;
  -[VFXCamera dealloc](&v10, sel_dealloc);
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v20;

  v5 = (void *)objc_msgSend_name(self, a2, v2, v3);
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v16 = v12;
  if (!v9)
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v13, (uint64_t)CFSTR("<%@: %p>"), v15, v12, self);
  v20 = objc_msgSend_name(self, v13, v14, v15);
  return (NSString *)objc_msgSend_stringWithFormat_(v10, v17, (uint64_t)CFSTR("<%@: %p '%@'>"), v18, v16, self, v20);
}

- (void)setName:(id)a3
{
  uint64_t v3;
  uint64_t name;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];

  name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1B187D640;
      v15[3] = &unk_1E63D53C8;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
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

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_name;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  v5 = (NSString *)sub_1B193E568(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);
  sub_1B193E6E0(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  return sub_1B193E67C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_name = (NSString *)(id)sub_1B193E568(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v5, v6, v7);
  v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);
  sub_1B193E6E0(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return sub_1B193E758((id *)result);
  return result;
}

- (void)__CFObject
{
  return self->_camera;
}

- (__CFXAnimationManager)animationManager
{
  uint64_t v2;
  uint64_t v3;
  __CFXAnimationManager *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return (__CFXAnimationManager *)sub_1B187A97C((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v10 = (void *)objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  v16 = objc_msgSend_animation(v10, v11, v12, v13) == (_QWORD)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    v20 = (_QWORD *)objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B193EBA0(v20) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity"), v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    sub_1B193F164(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  VFXOrderedDictionary *animations;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[7];

  if (a3)
  {
    v9 = (uint64_t)a4;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B187D98C;
    v22[3] = &unk_1E63D5350;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation player on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (a3)
  {
    v9 = (uint64_t)a4;
    v10 = (uint64_t)a3;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    v17 = (void *)objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
  objc_msgSend_addAnimation_forKey_(self, a2, (uint64_t)a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B187DB5C;
  v12[3] = &unk_1E63D5378;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  float v15;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B187DC08;
  v14[3] = &unk_1E63D53A0;
  v14[4] = self;
  v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B187DCC4;
    v13[3] = &unk_1E63D53C8;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];
  float v16;

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B187DD88;
    v15[3] = &unk_1E63D53F0;
    v15[4] = self;
    v15[5] = a3;
    v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10))
    return v7;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_syncObjCAnimations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
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
  const void *v17;
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
  const __CFDictionary *v33;
  uint64_t v34;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    v25 = (uint64_t)v17;
    if ((sub_1B193EBA0(v17) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. sync animations: cftype is not an entity"), v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    v33 = sub_1B193EF14(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B18C00E8(v34, (uint64_t)sub_1B18C2084, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
    sub_1B18797B4(v13, v18, v19, v20, v21, v22, v23, v24);
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      v9 = (void *)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    v13 = (void *)v9;
    v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      v15 = v14;
      v16 = CACurrentMediaTime();
      sub_1B17F41C0(v15, v13, a4, v7, v5, v17, v18, v19, v16);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  CFXBinding *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSMutableDictionary *bindings;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD v29[17];

  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B187E268;
    v29[3] = &unk_1E63D5418;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
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
  _QWORD v14[6];

  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B187E394;
  v14[3] = &unk_1E63D53C8;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  self->_bindings = 0;
  v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B187E440;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  self->_sensorSize = sub_1B18660E0((uint64_t)self->_camera, v6, v7, v8, v9, v10, v11, v12);
  *(double *)&self->_filmOffset[4] = sub_1B1865E74((uint64_t)self->_camera, v14, v15, v16, v17, v18, v19, v20);
  *(double *)&self->_postProjectionTransformTranslation[4] = sub_1B1865F10((uint64_t)self->_camera, v21, v22, v23, v24, v25, v26, v27);
  *(double *)&self->_postProjectionTransformScale[4] = sub_1B1865FAC((uint64_t)self->_camera, v28, v29, v30, v31, v32, v33, v34);
  v42 = sub_1B1866E38((uint64_t)self->_camera, v35, v36, v37, v38, v39, v40, v41);
  self->_orthographicScale = sub_1B1866720(v42, v43, v44, v45, v46, v47, v48, v49);
  v57 = sub_1B1866E38((uint64_t)self->_camera, v50, v51, v52, v53, v54, v55, v56);
  self->_zFar = sub_1B18666D8(v57, v58, v59, v60, v61, v62, v63, v64);
  v72 = sub_1B1866E38((uint64_t)self->_camera, v65, v66, v67, v68, v69, v70, v71);
  self->_zNear = sub_1B1866690(v72, v73, v74, v75, v76, v77, v78, v79);
  self->_focalLength = sub_1B1865B64((uint64_t)self->_camera, v80, v81, v82, v83, v84, v85, v86);
  *(float *)&self->_categoryBitMask = sub_1B1865DD8((uint64_t)self->_camera, v87, v88, v89, v90, v91, v92, v93);
  LOBYTE(self[1].super.isa) = sub_1B1865A88((uint64_t)self->_camera, v94, v95, v96, v97, v98, v99, v100);
  *((_BYTE *)self + 16) = (16 * (sub_1B1865D30((uint64_t)self->_camera, v101, v102, v103, v104, v105, v106, v107) & 7)) | *((_BYTE *)self + 16) & 0x8F;
  self->_fieldOfView = sub_1B1865C48((uint64_t)self->_camera, v108, v109, v110, v111, v112, v113, v114);
  v122 = (_BYTE *)sub_1B1866E38((uint64_t)self->_camera, v115, v116, v117, v118, v119, v120, v121);
  if (sub_1B1866768(v122, v123, v124, v125, v126, v127, v128, v129))
    v133 = 4;
  else
    v133 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v133;
  objc_msgSend__updateFocalLength(self, v130, v131, v132);
  objc_msgSend__syncEntityObjCModel(self, v134, v135, v136);
  if (v13)
    sub_1B18797B4(v13, v137, v138, v139, v140, v141, v142, v143);
}

- (id)presentationCamera
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (id)((uint64_t (*)(__objc2_class *, char *, _QWORD))MEMORY[0x1E0DE7D20])(VFXCamera, sel_presentationCameraWithCameraRef_, *((_QWORD *)self + 1));
  return self;
}

+ (id)presentationCameraWithCameraRef:(__CFXCamera *)a3
{
  VFXCamera *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXCamera alloc];
  return (id)objc_msgSend_initPresentationCameraWithCameraRef_(v4, v5, (uint64_t)a3, v6);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (BOOL)hasCustomProjectionTransform
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (BOOL)automaticallyAdjustsZRange
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B1865834((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B1865834((uint64_t)self->_camera, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 3) & 1;
  }
  return v5;
}

- (void)setAutomaticallyAdjustsZRange:(BOOL)a3
{
  uint64_t v3;
  char v6;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v6 = *((_BYTE *)self + 16);
  if ((v6 & 1) != 0 || ((((v6 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 8;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v6 & 0xF7 | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187E710;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(_QWORD *)self->_anon_80;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18658E4((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B18658E4((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || *(_QWORD *)self->_anon_80 != a3)
  {
    *(_QWORD *)self->_anon_80 = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B187E828;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)orthographicScale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_orthographicScale;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865978((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865978((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setOrthographicScale:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v7 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_orthographicScale != a3)
  {
    self->_orthographicScale = a3;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187E958;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("orthographicScale"), v10);
  }
}

- (BOOL)usesOrthographicProjection
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B18659C0((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B18659C0((uint64_t)self->_camera, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 2) & 1;
  }
  return v5;
}

- (void)setUsesOrthographicProjection:(BOOL)a3
{
  uint64_t v3;
  char v6;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v6 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v6 & 0xFD;
  if ((v6 & 1) != 0 || ((((v6 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 4;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v6 & 0xF9 | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187EA90;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)wantsHDR
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (BOOL)self[1].super.isa;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865A88((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865A88((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setWantsHDR:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if ((*((_BYTE *)self + 16) & 1) != 0 || LOBYTE(self[1].super.isa) != a3)
  {
    LOBYTE(self[1].super.isa) = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B187EBAC;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)zFar
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zFar;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865AD4((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865AD4((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setZFar:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  double v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  float v12;

  v7 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v7 & 0xFD;
  v8 = a3;
  if ((v7 & 1) != 0 || self->_zFar != v8)
  {
    self->_zFar = v8;
    v9 = objc_msgSend_worldRef(self, a2, v3, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B187ECEC;
    v11[3] = &unk_1E63D53A0;
    v11[4] = self;
    v12 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("zFar"), v11);
  }
}

- (float)zNear
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zNear;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865B1C((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865B1C((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setZNear:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  char v11;
  char v12;
  int v13;
  double v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[5];
  float v19;

  v9 = a3;
  v11 = *((_BYTE *)self + 16);
  v12 = v11 & 0xFD;
  *((_BYTE *)self + 16) = v11 & 0xFD;
  v13 = v11 & 4;
  if (a3 == 0.0 && v13 == 0)
  {
    sub_1B17C4408(0, (uint64_t)CFSTR("Warning: %@: zNear of 0 is not allowed"), v3, v4, v5, v6, v7, v8, (uint64_t)self);
    v12 = *((_BYTE *)self + 16);
    v9 = 0.0001;
  }
  v15 = v9;
  if ((v12 & 1) != 0 || self->_zNear != v15)
  {
    self->_zNear = v15;
    v16 = objc_msgSend_worldRef(self, a2, v3, v4);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B187EE5C;
    v18[3] = &unk_1E63D53A0;
    v18[4] = self;
    v19 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, CFSTR("zNear"), v18);
  }
}

- (double)filmOffset
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
    return *(double *)(a1 + 88);
  v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  if (!v6)
    return sub_1B1865E74(*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865E74(*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setFilmOffset:(VFXCamera *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x2_t v4;
  float32x2_t v5;
  uint32x2_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  v5 = v4;
  if ((*((_BYTE *)self + 16) & 1) != 0
    || (v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_filmOffset[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_filmOffset[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187EF98;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("filmOffset"), v10);
  }
}

- (CGAffineTransform)postProjectionTransform
{
  uint64_t v3;
  uint64_t v4;
  CGAffineTransform *v5;
  uint64_t v7;
  __int128 v8;
  CGFloat a;
  CGFloat b;
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
  double v34;
  double v35;

  v5 = self;
  v7 = MEMORY[0x1E0C9BAA8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  if ((LOBYTE(self->c) & 1) != 0)
  {
    v11 = objc_msgSend_worldRef(self, a3, v3, v4);
    v19 = v11;
    if (v11)
      sub_1B187973C(v11, v12, v13, v14, v15, v16, v17, v18);
    v35 = sub_1B1865F10(*(_QWORD *)&v5->b, v12, v13, v14, v15, v16, v17, v18);
    v34 = sub_1B1865FAC(*(_QWORD *)&v5->b, v20, v21, v22, v23, v24, v25, v26);
    retstr->ty = *((float *)&v35 + 1);
    retstr->a = *(float *)&v34;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&v34, *(int8x8_t *)&v35, 4uLL));
    if (v19)
      return (CGAffineTransform *)sub_1B18797B4(v19, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    a = self[2].a;
    b = self[2].b;
    retstr->ty = *((float *)&a + 1);
    retstr->a = *(float *)&b;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&b, *(int8x8_t *)&a, 4uLL));
  }
  return self;
}

- (void)setPostProjectionTransform:(CGAffineTransform *)a3
{
  uint64_t v3;
  float32x2_t v5;
  float64x2_t v6;
  char v7;
  uint64_t v8;
  uint32x2_t v9;
  uint64_t v10;
  const char *v11;
  float32x2_t v12;
  uint32x2_t v13;
  uint64_t v14;
  const char *v15;
  float64x2_t v16;
  _QWORD v17[6];
  _QWORD v18[6];

  v5 = vcvt_f32_f64(*(float64x2_t *)&a3->tx);
  v6.f64[0] = a3->a;
  v6.f64[1] = a3->d;
  v7 = *((_BYTE *)self + 16);
  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) != 0
    || (v9 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v5)),
        (vpmax_u32(v9, v9).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v5;
    v10 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3, *(_OWORD *)&v6);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = sub_1B187F1DC;
    v18[3] = &unk_1E63D5440;
    v18[4] = self;
    v18[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("postProjectionTransformTranslation"), v18);
    v6 = v16;
    v7 = *((_BYTE *)self + 16);
  }
  v12 = vcvt_f32_f64(v6);
  if ((v7 & 1) != 0
    || (v13 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v12)),
        (vpmax_u32(v13, v13).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformScale[4] = v12;
    v14 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = sub_1B187F1F0;
    v17[3] = &unk_1E63D5440;
    v17[4] = self;
    v17[5] = v12;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, CFSTR("postProjectionTransformScale"), v17);
  }
}

- (void)setPostProjectionTransformTranslation:(VFXCamera *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x2_t v4;
  float32x2_t v5;
  uint32x2_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  v5 = v4;
  if ((*((_BYTE *)self + 16) & 1) != 0
    || (v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187F2B8;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("postProjectionTransformTranslation"), v10);
  }
}

- (void)setPostProjectionTransformScale:(VFXCamera *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x2_t v4;
  float32x2_t v5;
  uint32x2_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  v5 = v4;
  if ((*((_BYTE *)self + 16) & 1) != 0
    || (v7 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v4)),
        (vpmax_u32(v7, v7).u32[0] & 0x80000000) != 0))
  {
    *(float32x2_t *)&self->_postProjectionTransformScale[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B187F380;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("postProjectionTransformScale"), v10);
  }
}

- (void)_updateFieldOfView
{
  float focalLength;
  long double v4;
  double v5;
  float v6;

  focalLength = self->_focalLength;
  if (focalLength <= 0.0)
  {
    v5 = 3.14159274;
  }
  else
  {
    v4 = atan(self->_sensorSize * 0.5 / focalLength);
    *(float *)&v4 = v4 + v4;
    v5 = *(float *)&v4;
  }
  v6 = v5 / 3.14159265 * 180.0;
  self->_fieldOfView = v6;
}

- (void)_updateFocalLength
{
  float v3;
  double v4;
  float v5;

  v3 = self->_fieldOfView / 180.0 * 3.14159265;
  v4 = self->_sensorSize * 0.5;
  v5 = v4 / tanf(v3 * 0.5);
  self->_focalLength = v5;
}

+ (id)keyPathsForValuesAffectingFieldOfView
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("focalLength"), v2, CFSTR("sensorHeight"), 0);
}

+ (id)keyPathsForValuesAffectingFocalLength
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("fieldOfView"), v2, 0);
}

- (float)fieldOfView
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_fieldOfView;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865C48((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865C48((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setFieldOfView:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  float v14;

  v7 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_fieldOfView != a3)
  {
    self->_fieldOfView = a3;
    objc_msgSend__updateFocalLength(self, a2, v3, v4);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B187F61C;
    v13[3] = &unk_1E63D53A0;
    v13[4] = self;
    v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, CFSTR("fieldOfView"), v13);
  }
}

- (float)sensorHeight
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_sensorSize;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18660E0((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B18660E0((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSensorHeight:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  float v14;

  v7 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_sensorSize != a3)
  {
    self->_sensorSize = a3;
    objc_msgSend__updateFieldOfView(self, a2, v3, v4);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B187F75C;
    v13[3] = &unk_1E63D53A0;
    v13[4] = self;
    v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, CFSTR("sensorHeight"), v13);
  }
}

- (float)focalLength
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_focalLength;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865B64((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865B64((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setFocalLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  float v14;

  v7 = *((_BYTE *)self + 16);
  *((_BYTE *)self + 16) = v7 & 0xFD;
  if ((v7 & 1) != 0 || self->_focalLength != a3)
  {
    self->_focalLength = a3;
    objc_msgSend__updateFieldOfView(self, a2, v3, v4);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B187F89C;
    v13[3] = &unk_1E63D53A0;
    v13[4] = self;
    v14 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, CFSTR("focalLength"), v13);
  }
}

- (float)focusDistance
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(float *)&self->_categoryBitMask;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1865DD8((uint64_t)self->_camera, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1865DD8((uint64_t)self->_camera, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setFocusDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if ((*((_BYTE *)self + 16) & 1) != 0 || *(float *)&self->_categoryBitMask != a3)
  {
    *(float *)&self->_categoryBitMask = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B187F9CC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("focusDistance"), v9);
  }
}

- (int64_t)fillMode
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
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

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) == 0)
    return (v4 >> 4) & 7;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v7)
    return (int)sub_1B1865D30((uint64_t)self->_camera, v8, v9, v10, v11, v12, v13, v14);
  v15 = v7;
  sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
  v5 = (int)sub_1B1865D30((uint64_t)self->_camera, v16, v17, v18, v19, v20, v21, v22);
  sub_1B18797B4(v15, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setFillMode:(int64_t)a3
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[6];

  v6 = *((unsigned __int8 *)self + 16);
  if ((v6 & 1) != 0 || ((v6 >> 4) & 7) != a3)
  {
    *((_BYTE *)self + 16) = v6 & 0x8F | (16 * (a3 & 7));
    v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B187FAEC;
    v9[3] = &unk_1E63D5440;
    v9[4] = self;
    v9[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (int64_t)projectionDirection
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_fillMode(self, a2, v2, v3) != 2;
}

- (void)setProjectionDirection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    objc_msgSend_setFillMode_(self, a2, 3, v3);
  else
    objc_msgSend_setFillMode_(self, a2, 2, v3);
}

- (__CFXCamera)cameraRef
{
  return self->_camera;
}

- (uint64_t)setProjectionTransform:(uint64_t)a3
{
  unsigned __int8 v9;
  uint64_t result;
  uint64_t v11;
  const char *v12;
  __n128 v13;
  __int128 v14;
  __n128 v15;
  __int128 v16;
  __n128 v17;
  __int128 v18;
  __n128 v19;
  __int128 v20;
  _QWORD v21[4];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __n128 *v26;

  v9 = a1[1].n128_u8[0];
  a1[1].n128_u8[0] = v9 | 2;
  v17 = a7;
  v19 = a8;
  v13 = a5;
  v15 = a6;
  if ((v9 & 2) == 0
    || (result = VFXMatrix4EqualToMatrix4(a5, a6, a7, a8, a1[8], a1[9], a1[10], a1[11]),
        a5 = v13,
        a6 = v15,
        a7 = v17,
        a8 = v19,
        (result & 1) == 0))
  {
    a1[8] = a5;
    a1[9] = a6;
    a1[10] = a7;
    a1[11] = a8;
    v11 = objc_msgSend_worldRef(a1, a2, a3, a4, *(_OWORD *)&v13, *(_OWORD *)&v15, *(_OWORD *)&v17, *(_OWORD *)&v19);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1B187FC0C;
    v21[3] = &unk_1E63D6A70;
    v26 = a1;
    v22 = v14;
    v23 = v16;
    v24 = v18;
    v25 = v20;
    return objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v12, v11, (uint64_t)a1, CFSTR("projectionTransform"), v21);
  }
  return result;
}

- (uint64_t)projectionTransform
{
  return objc_msgSend_projectionTransformWithViewportSize_(a1, a2, a3, a4, 1.0, 1.0);
}

- (__n128)projectionTransformWithViewportSize:(uint64_t)a3
{
  unsigned int v11;
  int v12;
  uint64_t v13;
  __n128 result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float64x2_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __n128 *v40;
  __n128 v41;
  unint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v11 = *(unsigned __int8 *)(a1 + 16);
  if ((v11 & 1) != 0)
  {
    v43 = *(_QWORD *)&a9.f64[0];
    v15 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    v23 = v15;
    if (v15)
      sub_1B187973C(v15, v16, v17, v18, v19, v20, v21, v22);
    *(_QWORD *)&v24.f64[0] = v43;
    v24.f64[1] = a10;
    v45 = vcvt_hight_f32_f64(0, v24);
    v25 = (unsigned __int8 *)sub_1B1866E38(*(_QWORD *)(a1 + 8), v16, v17, v18, v19, v20, v21, v22);
    v32 = sub_1B18667B4(v25, (uint64_t)&v45, v26, v27, v28, v29, v30, v31);
    v40 = (__n128 *)&VFXMatrix4Identity;
    if (v32)
      v40 = (__n128 *)v32;
    result = *v40;
    if (v23)
    {
      v41 = *v40;
      sub_1B18797B4(v23, v33, v34, v35, v36, v37, v38, v39);
      return v41;
    }
  }
  else if ((v11 & 2) != 0)
  {
    return *(__n128 *)(a1 + 128);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    v45.i8[0] = (v11 >> 1) & 0x38 | ((v11 & 4) != 0);
    *(float32x2_t *)&v45.i32[1] = vcvt_f32_f64(*(float64x2_t *)(a1 + 56));
    v12 = *(_DWORD *)(a1 + 72);
    DWORD2(v47) = *(_DWORD *)(a1 + 48);
    HIDWORD(v47) = v12;
    v13 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)&v46 = *(_QWORD *)(a1 + 88);
    *((_QWORD *)&v46 + 1) = v13;
    *(_QWORD *)&v47 = *(_QWORD *)(a1 + 104);
    a9.f64[1] = a10;
    v44 = vcvt_hight_f32_f64(0, a9);
    return *(__n128 *)sub_1B18667B4((unsigned __int8 *)&v45, (uint64_t)&v44, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

- (VFXCameraEffectMotionBlur)motionBlur
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectMotionBlur *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectMotionBlur *)self->_grain;
  result = (VFXCameraEffectMotionBlur *)sub_1B186443C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectMotionBlur *)MEMORY[0x1E0DE7D20](VFXCameraEffectMotionBlur, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setMotionBlur:(id)a3
{
  VFXCameraEffectGrain *grain;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  grain = self->_grain;
  if (grain != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_grain = (VFXCameraEffectGrain *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B187FE48;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectDepthOfField)depthOfField
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectDepthOfField *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectDepthOfField *)self->_motionBlur;
  result = (VFXCameraEffectDepthOfField *)sub_1B186433C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectDepthOfField *)MEMORY[0x1E0DE7D20](VFXCameraEffectDepthOfField, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setDepthOfField:(id)a3
{
  VFXCameraEffectMotionBlur *motionBlur;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  motionBlur = self->_motionBlur;
  if (motionBlur != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_motionBlur = (VFXCameraEffectMotionBlur *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B187FF58;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectGrain)grain
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectGrain *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectGrain *)self->_exposure;
  result = (VFXCameraEffectGrain *)sub_1B186453C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectGrain *)MEMORY[0x1E0DE7D20](VFXCameraEffectGrain, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setGrain:(id)a3
{
  VFXCameraEffectExposure *exposure;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  exposure = self->_exposure;
  if (exposure != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_exposure = (VFXCameraEffectExposure *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1880068;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectExposure)exposure
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectExposure *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectExposure *)self->_toneMapping;
  result = (VFXCameraEffectExposure *)sub_1B186463C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectExposure *)MEMORY[0x1E0DE7D20](VFXCameraEffectExposure, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setExposure:(id)a3
{
  VFXCameraEffectToneMapping *toneMapping;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  toneMapping = self->_toneMapping;
  if (toneMapping != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_toneMapping = (VFXCameraEffectToneMapping *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1880178;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectToneMapping)toneMapping
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectToneMapping *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectToneMapping *)self->_bloom;
  result = (VFXCameraEffectToneMapping *)sub_1B186473C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectToneMapping *)MEMORY[0x1E0DE7D20](VFXCameraEffectToneMapping, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setToneMapping:(id)a3
{
  VFXCameraEffectBloom *bloom;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  bloom = self->_bloom;
  if (bloom != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_bloom = (VFXCameraEffectBloom *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1880288;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectBloom)bloom
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectBloom *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectBloom *)self->_colorGrading;
  result = (VFXCameraEffectBloom *)sub_1B186483C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectBloom *)MEMORY[0x1E0DE7D20](VFXCameraEffectBloom, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setBloom:(id)a3
{
  VFXCameraEffectColorGrading *colorGrading;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  colorGrading = self->_colorGrading;
  if (colorGrading != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_colorGrading = (VFXCameraEffectColorGrading *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1880398;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectVignetting)vignetting
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectVignetting *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectVignetting *)self->_lensBlur;
  result = (VFXCameraEffectVignetting *)sub_1B186493C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectVignetting *)MEMORY[0x1E0DE7D20](VFXCameraEffectVignetting, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setVignetting:(id)a3
{
  VFXCameraEffectLensBlur *lensBlur;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  lensBlur = self->_lensBlur;
  if (lensBlur != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_lensBlur = (VFXCameraEffectLensBlur *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18804A8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)lensBlur
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_chromaticTransform;
  result = (id)sub_1B1864A3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (id)MEMORY[0x1E0DE7D20](VFXCameraEffectLensBlur, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setLensBlur:(id)a3
{
  VFXCameraEffectChromaticTransform *chromaticTransform;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  chromaticTransform = self->_chromaticTransform;
  if (chromaticTransform != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_chromaticTransform = (VFXCameraEffectChromaticTransform *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18805B8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectColorFringe)colorFringe
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectColorFringe *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectColorFringe *)self->_vignetting;
  result = (VFXCameraEffectColorFringe *)sub_1B1864C3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectColorFringe *)MEMORY[0x1E0DE7D20](VFXCameraEffectColorFringe, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setColorFringe:(id)a3
{
  VFXCameraEffectVignetting *vignetting;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  vignetting = self->_vignetting;
  if (vignetting != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_vignetting = (VFXCameraEffectVignetting *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18806C8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXCameraEffectColorGrading)colorGrading
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCameraEffectColorGrading *result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (VFXCameraEffectColorGrading *)self->_colorFringe;
  result = (VFXCameraEffectColorGrading *)sub_1B1864B3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (VFXCameraEffectColorGrading *)MEMORY[0x1E0DE7D20](VFXCameraEffectColorGrading, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setColorGrading:(id)a3
{
  VFXCameraEffectColorFringe *colorFringe;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  colorFringe = self->_colorFringe;
  if (colorFringe != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_colorFringe = (VFXCameraEffectColorFringe *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18807D8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)chromaticTransform
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_doughnutBokeh;
  result = (id)sub_1B1864D3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (id)MEMORY[0x1E0DE7D20](VFXCameraEffectChromaticTransform, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setChromaticTransform:(id)a3
{
  VFXCameraEffectDoughnutBokeh *doughnutBokeh;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  doughnutBokeh = self->_doughnutBokeh;
  if (doughnutBokeh != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_doughnutBokeh = (VFXCameraEffectDoughnutBokeh *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18808E8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)doughnutBokeh
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_ssao;
  result = (id)sub_1B1864E3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (id)MEMORY[0x1E0DE7D20](VFXCameraEffectDoughnutBokeh, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setDoughnutBokeh:(id)a3
{
  VFXCameraEffectSSAO *ssao;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  ssao = self->_ssao;
  if (ssao != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    self->_ssao = (VFXCameraEffectSSAO *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18809F8;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)ssao
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(id *)&self->_wantsHDR;
  result = (id)sub_1B1864F3C((uint64_t)self->_camera, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result)
    return (id)MEMORY[0x1E0DE7D20](VFXCameraEffectSSAO, sel_presentationCameraEffectWithCameraEffectRef_, result, v9);
  return result;
}

- (void)setSsao:(id)a3
{
  id v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  v3 = *(id *)&self->_wantsHDR;
  if (v3 != a3 && (*((_BYTE *)self + 16) & 1) == 0)
  {

    *(_QWORD *)&self->_wantsHDR = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1880B08;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v3;
  _QWORD *v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isEqualToString;
  uint64_t v10;

  v4 = (_QWORD *)v3;
  isEqualToString = objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("filmOffset"), v3);
  if (isEqualToString)
  {
    objc_msgSend_filmOffset(self, v6, v7, v8);
    *v4 = v10;
  }
  return isEqualToString;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;

  v19 = 0;
  v20 = 0;
  sub_1B18BCE30(a3, (char *)&v20, (uint64_t *)&v19, v3);
  if (qword_1EEF65EC8 != -1)
    dispatch_once(&qword_1EEF65EC8, &unk_1E63D0DD0);
  if (!v19)
    return 0;
  if (!objc_msgSend_containsObject_((void *)qword_1EEF65EC0, v5, (uint64_t)v19, v6))
    return 0;
  v18 = 0.0;
  if (!objc_msgSend_rawFloat2ForKey_value_(self, v7, v20, (uint64_t)&v18))
    return 0;
  if (objc_msgSend_isEqualToString_(v19, v8, (uint64_t)CFSTR("x"), v9))
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v10, v11, v12, v18);
  if (!objc_msgSend_isEqualToString_(v19, v10, (uint64_t)CFSTR("y"), v12))
    return 0;
  LODWORD(v17) = HIDWORD(v18);
  return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v14, v15, v16, v17);
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v3;
  id result;
  objc_super v7;

  if (!a3)
    return 0;
  result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, a2, (uint64_t)a3, v3);
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)VFXCamera;
    return -[VFXCamera valueForKeyPath:](&v7, sel_valueForKeyPath_, a3);
  }
  return result;
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("filmOffset"), v3))
  {
    v9 = MEMORY[0x1E0CB3B18];
    objc_msgSend_filmOffset(self, v6, v7, v8);
    return (id)MEMORY[0x1E0DE7D20](v9, sel_valueWithVFXFloat2_, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCamera;
    return -[VFXCamera valueForKey:](&v13, sel_valueForKey_, a3);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("filmOffset"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat2Value(a3, v7, v8, v9);
    objc_msgSend_setFilmOffset_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCamera;
    -[VFXCamera setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _OWORD v117[3];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v13 = objc_msgSend_name(self, v10, v11, v12);
  objc_msgSend_setName_(v4, v14, v13, v15);
  v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_setName_(v4, v20, v19, v21);
  objc_msgSend_focusDistance(self, v22, v23, v24);
  objc_msgSend_setFocusDistance_(v4, v25, v26, v27);
  objc_msgSend_sensorHeight(self, v28, v29, v30);
  objc_msgSend_setSensorHeight_(v4, v31, v32, v33);
  objc_msgSend_fieldOfView(self, v34, v35, v36);
  objc_msgSend_setFieldOfView_(v4, v37, v38, v39);
  objc_msgSend_filmOffset(self, v40, v41, v42);
  objc_msgSend_setFilmOffset_(v4, v43, v44, v45);
  if (self)
  {
    objc_msgSend_postProjectionTransform(self, v46, v47, v48);
  }
  else
  {
    v119 = 0u;
    v120 = 0u;
    v118 = 0u;
  }
  v117[0] = v118;
  v117[1] = v119;
  v117[2] = v120;
  objc_msgSend_setPostProjectionTransform_(v4, v46, (uint64_t)v117, v48);
  v52 = objc_msgSend_fillMode(self, v49, v50, v51);
  objc_msgSend_setFillMode_(v4, v53, v52, v54);
  objc_msgSend_zNear(self, v55, v56, v57);
  objc_msgSend_setZNear_(v4, v58, v59, v60);
  objc_msgSend_zFar(self, v61, v62, v63);
  objc_msgSend_setZFar_(v4, v64, v65, v66);
  objc_msgSend_orthographicScale(self, v67, v68, v69);
  objc_msgSend_setOrthographicScale_(v4, v70, v71, v72);
  v76 = objc_msgSend_automaticallyAdjustsZRange(self, v73, v74, v75);
  objc_msgSend_setAutomaticallyAdjustsZRange_(v4, v77, v76, v78);
  v82 = objc_msgSend_usesOrthographicProjection(self, v79, v80, v81);
  objc_msgSend_setUsesOrthographicProjection_(v4, v83, v82, v84);
  v88 = objc_msgSend_wantsHDR(self, v85, v86, v87);
  objc_msgSend_setWantsHDR_(v4, v89, v88, v90);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v91, (uint64_t)&v113, (uint64_t)v121, 16);
  if (v92)
  {
    v96 = v92;
    v97 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v96; ++i)
      {
        if (*(_QWORD *)v114 != v97)
          objc_enumerationMutation(&unk_1E6478B08);
        v99 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i);
        v100 = (void *)objc_msgSend_valueForKey_(self, v93, v99, v95);
        if (v100)
        {
          v102 = (id)objc_msgSend_copy(v100, v93, v101, v95);
          objc_msgSend_setValue_forKey_(v4, v103, (uint64_t)v102, v99);
        }
      }
      v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v93, (uint64_t)&v113, (uint64_t)v121, 16);
    }
    while (v96);
  }
  v104 = objc_msgSend_categoryBitMask(self, v93, v94, v95);
  objc_msgSend_setCategoryBitMask_(v4, v105, v104, v106);
  objc_msgSend__copyAnimationsFrom_(v4, v107, (uint64_t)self, v108);
  objc_msgSend_commitImmediate(VFXTransaction, v109, v110, v111);
  return v4;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customEncodingOfVFXCamera:(id)a3
{
  if ((*((_BYTE *)self + 16) & 2) != 0)
    sub_1B18BD294(a3, CFSTR("projectionTransform"), *(__n128 *)&self->_anon_80[8], *(__n128 *)&self->_anon_80[24], *(__n128 *)&self->_anon_80[40], *(__n128 *)&self->_anon_80[56]);
}

- (void)_didDecodeVFXCamera:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend_containsValueForKey_(a3, a2, (uint64_t)CFSTR("projectionTransform"), v3))
  {
    sub_1B18BD380(a3, CFSTR("projectionTransform"));
    MEMORY[0x1E0DE7D20](self, sel_setProjectionTransform_, v6, v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSString *name;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint32x2_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint32x2_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint32x2_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double zNear;
  const char *v37;
  uint64_t v38;
  double zFar;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 16) & 1) != 0)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXCamera_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 16) >> 2) & 1, (uint64_t)CFSTR("usesOrthographicProjection"));
  objc_msgSend_encodeInt_forKey_(a3, v7, (*((unsigned __int8 *)self + 16) >> 3) & 1, (uint64_t)CFSTR("automaticallyAdjustsZRange"));
  objc_msgSend_encodeInt_forKey_(a3, v8, (*((unsigned __int8 *)self + 16) >> 4) & 7, (uint64_t)CFSTR("fill"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)name, (uint64_t)CFSTR("name"));
  *(float *)&v11 = self->_fieldOfView;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("fov"), v10, v11);
  *(float *)&v13 = self->_sensorSize;
  objc_msgSend_encodeFloat_forKey_(a3, v14, (uint64_t)CFSTR("sensorSize"), v15, v13);
  v18 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_filmOffset[4]));
  if ((vpmax_u32(v18, v18).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("filmOffsetX"), v17);
    LODWORD(v19) = *(_DWORD *)self->_postProjectionTransformTranslation;
    objc_msgSend_encodeFloat_forKey_(a3, v20, (uint64_t)CFSTR("filmOffsetY"), v21, v19);
  }
  v22 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4]));
  if ((vpmax_u32(v22, v22).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("postProjectionTransformTranslationX"), v17);
    LODWORD(v23) = *(_DWORD *)self->_postProjectionTransformScale;
    objc_msgSend_encodeFloat_forKey_(a3, v24, (uint64_t)CFSTR("postProjectionTransformTranslationY"), v25, v23);
  }
  v26 = *(double *)&self->_postProjectionTransformScale[4];
  __asm { FMOV            V1.2S, #1.0 }
  v32 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v26, _D1));
  if ((vpmax_u32(v32, v32).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("postProjectionTransformScaleX"), v17);
    *(float *)&v33 = self->_focusDistance;
    objc_msgSend_encodeFloat_forKey_(a3, v34, (uint64_t)CFSTR("postProjectionTransformScaleY"), v35, v33);
  }
  *(float *)&v26 = self->_orthographicScale;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("orthographicScale"), v17, v26);
  zNear = self->_zNear;
  *(float *)&zNear = zNear;
  objc_msgSend_encodeFloat_forKey_(a3, v37, (uint64_t)CFSTR("zNear"), v38, zNear);
  zFar = self->_zFar;
  *(float *)&zFar = zFar;
  objc_msgSend_encodeFloat_forKey_(a3, v40, (uint64_t)CFSTR("zFar"), v41, zFar);
  LODWORD(v42) = self->_categoryBitMask;
  objc_msgSend_encodeFloat_forKey_(a3, v43, (uint64_t)CFSTR("focusDistance"), v44, v42);
  objc_msgSend_encodeBool_forKey_(a3, v45, LOBYTE(self[1].super.isa), (uint64_t)CFSTR("HDR"));
  objc_msgSend_encodeInteger_forKey_(a3, v46, *(_QWORD *)self->_anon_80, (uint64_t)CFSTR("categoryBitMask"));
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v47, (uint64_t)&v59, (uint64_t)v63, 16);
  if (v48)
  {
    v52 = v48;
    v53 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v60 != v53)
          objc_enumerationMutation(&unk_1E6478B08);
        v55 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        v56 = objc_msgSend_valueForKey_(self, v49, v55, v51);
        if (v56)
          objc_msgSend_encodeObject_forKey_(a3, v49, v56, v55);
      }
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v49, (uint64_t)&v59, (uint64_t)v63, 16);
    }
    while (v52);
  }
  sub_1B18BD9B8(a3, self, v50, v51);
  sub_1B18BDCC8(a3, self, v57, v58);
}

- (VFXCamera)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCamera *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  _BOOL8 v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  _BOOL8 v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  unsigned int v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  const char *v66;
  uint64_t v67;
  unsigned int v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  const char *v75;
  uint64_t v76;
  unsigned int v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  int v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t i;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  int v147;
  int v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  float v178;
  float v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  double v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  int v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  int v206;
  int v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  double v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  int v218;
  int v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  double v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  int v230;
  int v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  double v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  int v242;
  int v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  double v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  int v254;
  int v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  double v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  int v266;
  int v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  double v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  float v277;
  float v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  double v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  int v292;
  int v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  double v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  int v306;
  int v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  double v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  int v334;
  int v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  double v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  int v346;
  int v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  double v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  float v366;
  float v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  double v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  int v381;
  int v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  double v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  int v393;
  int v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  double v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  int v405;
  int v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  double v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  float v420;
  float v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  double v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  const char *v444;
  uint64_t v445;
  unsigned int v447;
  unsigned int v448;
  unsigned int v449;
  double v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  objc_super v455;
  _BYTE v456[128];
  uint64_t v457;

  v457 = *MEMORY[0x1E0C80C00];
  v455.receiver = self;
  v455.super_class = (Class)VFXCamera;
  v7 = -[VFXCamera init](&v455, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v19 = sub_1B18641FC();
    v7->_camera = (__CFXCamera *)v11;
    if (v11)
      sub_1B193E768(v11, v7, v13, v14, v15, v16, v17, v18);
    objc_msgSend__syncObjCModel(v7, v12, v13, v14, v19);
    v22 = objc_msgSend_decodeIntForKey_(a3, v20, (uint64_t)CFSTR("usesOrthographicProjection"), v21) != 0;
    objc_msgSend_setUsesOrthographicProjection_(v7, v23, v22, v24);
    v27 = objc_msgSend_decodeIntForKey_(a3, v25, (uint64_t)CFSTR("automaticallyAdjustsZRange"), v26) != 0;
    objc_msgSend_setAutomaticallyAdjustsZRange_(v7, v28, v27, v29);
    if (objc_msgSend_containsValueForKey_(a3, v30, (uint64_t)CFSTR("projectionDirection"), v31))
    {
      v34 = objc_msgSend_decodeIntForKey_(a3, v32, (uint64_t)CFSTR("projectionDirection"), v33);
      objc_msgSend_setProjectionDirection_(v7, v35, v34, v36);
    }
    else
    {
      v37 = objc_msgSend_decodeIntForKey_(a3, v32, (uint64_t)CFSTR("fill"), v33);
      objc_msgSend_setFillMode_(v7, v38, v37, v39);
    }
    v40 = objc_opt_class();
    v42 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v43, v42, v44);
    objc_msgSend_decodeFloatForKey_(a3, v45, (uint64_t)CFSTR("sensorSize"), v46);
    objc_msgSend_setSensorHeight_(v7, v47, v48, v49);
    objc_msgSend_decodeFloatForKey_(a3, v50, (uint64_t)CFSTR("fov"), v51);
    objc_msgSend_setFieldOfView_(v7, v52, v53, v54);
    if (objc_msgSend_containsValueForKey_(a3, v55, (uint64_t)CFSTR("filmOffsetX"), v56))
    {
      objc_msgSend_decodeFloatForKey_(a3, v57, (uint64_t)CFSTR("filmOffsetX"), v58);
      v447 = v59;
      objc_msgSend_decodeFloatForKey_(a3, v60, (uint64_t)CFSTR("filmOffsetY"), v61);
      objc_msgSend_setFilmOffset_(v7, v62, v63, v64, COERCE_DOUBLE(__PAIR64__(v65, v447)));
    }
    else
    {
      *(_QWORD *)&v7->_filmOffset[4] = 0;
    }
    if (objc_msgSend_containsValueForKey_(a3, v57, (uint64_t)CFSTR("postProjectionTransformTranslationX"), v58))
    {
      objc_msgSend_decodeFloatForKey_(a3, v66, (uint64_t)CFSTR("postProjectionTransformTranslationX"), v67);
      v448 = v68;
      objc_msgSend_decodeFloatForKey_(a3, v69, (uint64_t)CFSTR("postProjectionTransformTranslationY"), v70);
      objc_msgSend_setPostProjectionTransformTranslation_(v7, v71, v72, v73, COERCE_DOUBLE(__PAIR64__(v74, v448)));
    }
    else
    {
      *(_QWORD *)&v7->_postProjectionTransformTranslation[4] = 0;
    }
    if (objc_msgSend_containsValueForKey_(a3, v66, (uint64_t)CFSTR("postProjectionTransformScaleX"), v67))
    {
      objc_msgSend_decodeFloatForKey_(a3, v75, (uint64_t)CFSTR("postProjectionTransformScaleX"), v76);
      v449 = v77;
      objc_msgSend_decodeFloatForKey_(a3, v78, (uint64_t)CFSTR("postProjectionTransformScaleY"), v79);
      objc_msgSend_setPostProjectionTransformScale_(v7, v80, v81, v82, COERCE_DOUBLE(__PAIR64__(v83, v449)));
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)&v7->_postProjectionTransformScale[4] = _D0;
    }
    objc_msgSend_decodeFloatForKey_(a3, v75, (uint64_t)CFSTR("orthographicScale"), v76);
    objc_msgSend_setOrthographicScale_(v7, v89, v90, v91);
    objc_msgSend_decodeFloatForKey_(a3, v92, (uint64_t)CFSTR("zNear"), v93);
    objc_msgSend_setZNear_(v7, v94, v95, v96);
    objc_msgSend_decodeFloatForKey_(a3, v97, (uint64_t)CFSTR("zFar"), v98);
    objc_msgSend_setZFar_(v7, v99, v100, v101);
    objc_msgSend_decodeFloatForKey_(a3, v102, (uint64_t)CFSTR("focusDistance"), v103);
    objc_msgSend_setFocusDistance_(v7, v104, v105, v106);
    v109 = objc_msgSend_decodeIntegerForKey_(a3, v107, (uint64_t)CFSTR("categoryBitMask"), v108);
    objc_msgSend_setCategoryBitMask_(v7, v110, v109, v111);
    v114 = objc_msgSend_containsValueForKey_(a3, v112, (uint64_t)CFSTR("HDR"), v113);
    v117 = objc_msgSend_decodeBoolForKey_(a3, v115, (uint64_t)CFSTR("HDR"), v116);
    objc_msgSend_setWantsHDR_(v7, v118, v117, v119);
    if (v114)
    {
      v453 = 0u;
      v454 = 0u;
      v451 = 0u;
      v452 = 0u;
      v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v120, (uint64_t)&v451, (uint64_t)v456, 16);
      if (v122)
      {
        v123 = v122;
        v124 = *(_QWORD *)v452;
        do
        {
          for (i = 0; i != v123; ++i)
          {
            if (*(_QWORD *)v452 != v124)
              objc_enumerationMutation(&unk_1E6478B08);
            v126 = *(_QWORD *)(*((_QWORD *)&v451 + 1) + 8 * i);
            if (objc_msgSend_containsValueForKey_(a3, v120, v126, v121))
            {
              v127 = objc_opt_class();
              v129 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v128, v127, v126);
              objc_msgSend_setValue_forKey_(v7, v130, v129, v126);
            }
          }
          v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B08, v120, (uint64_t)&v451, (uint64_t)v456, 16);
        }
        while (v123);
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v120, (uint64_t)CFSTR("wantsHDR"), v121))
    {
      v133 = objc_msgSend_decodeBoolForKey_(a3, v131, (uint64_t)CFSTR("wantsHDR"), v132);
      objc_msgSend_setWantsHDR_(v7, v134, v133, v135);
      objc_msgSend_decodeFloatForKey_(a3, v136, (uint64_t)CFSTR("dofIntensity"), v137);
      if (v141 > 0.0)
      {
        v142 = objc_msgSend_depthOfField(VFXCameraEffectDepthOfField, v138, v139, v140);
        objc_msgSend_setDepthOfField_(v7, v143, v142, v144);
        objc_msgSend_decodeFloatForKey_(a3, v145, (uint64_t)CFSTR("fStop"), v146);
        v148 = v147;
        v152 = (void *)objc_msgSend_depthOfField(v7, v149, v150, v151);
        LODWORD(v153) = v148;
        objc_msgSend_setFStop_(v152, v154, v155, v156, v153);
        if (objc_msgSend_containsValueForKey_(a3, v157, (uint64_t)CFSTR("bladeCount"), v158))
        {
          v161 = objc_msgSend_decodeIntegerForKey_(a3, v159, (uint64_t)CFSTR("bladeCount"), v160);
          v165 = (void *)objc_msgSend_depthOfField(v7, v162, v163, v164);
          objc_msgSend_setApertureBladeCount_(v165, v166, v161, v167);
        }
        if (objc_msgSend_containsValueForKey_(a3, v159, (uint64_t)CFSTR("focalBlurSampleCount"), v160))
        {
          v168 = objc_msgSend_decodeIntegerForKey_(a3, v138, (uint64_t)CFSTR("focalBlurSampleCount"), v140);
          v172 = (void *)objc_msgSend_depthOfField(v7, v169, v170, v171);
          objc_msgSend_setFocalBlurSampleCount_(v172, v173, v168, v174);
        }
      }
      objc_msgSend_decodeFloatForKey_(a3, v138, (uint64_t)CFSTR("exposureOffset"), v140);
      if (v178 != 0.0)
      {
        v179 = v178;
        v180 = objc_msgSend_exposure(VFXCameraEffectExposure, v175, v176, v177);
        objc_msgSend_setExposure_(v7, v181, v180, v182);
        v186 = (void *)objc_msgSend_exposure(v7, v183, v184, v185);
        *(float *)&v187 = v179;
        objc_msgSend_setOffset_(v186, v188, v189, v190, v187);
      }
      if (objc_msgSend_containsValueForKey_(a3, v175, (uint64_t)CFSTR("toneMappingMode"), v177))
      {
        v194 = objc_msgSend_decodeIntegerForKey_(a3, v191, (uint64_t)CFSTR("toneMappingMode"), v192);
        if (v194)
        {
          v195 = objc_msgSend_toneMapping(VFXCameraEffectToneMapping, v191, v193, v192);
          objc_msgSend_setToneMapping_(v7, v196, v195, v197);
          v201 = (void *)objc_msgSend_toneMapping(v7, v198, v199, v200);
          objc_msgSend_setMode_(v201, v202, v194 - 1, v203);
          objc_msgSend_decodeFloatForKey_(a3, v204, (uint64_t)CFSTR("toneMappingToeStrength"), v205);
          v207 = v206;
          v211 = (void *)objc_msgSend_toneMapping(v7, v208, v209, v210);
          LODWORD(v212) = v207;
          objc_msgSend_setToeStrength_(v211, v213, v214, v215, v212);
          objc_msgSend_decodeFloatForKey_(a3, v216, (uint64_t)CFSTR("toneMappingToeLength"), v217);
          v219 = v218;
          v223 = (void *)objc_msgSend_toneMapping(v7, v220, v221, v222);
          LODWORD(v224) = v219;
          objc_msgSend_setToeLength_(v223, v225, v226, v227, v224);
          objc_msgSend_decodeFloatForKey_(a3, v228, (uint64_t)CFSTR("toneMappingShoulderStrength"), v229);
          v231 = v230;
          v235 = (void *)objc_msgSend_toneMapping(v7, v232, v233, v234);
          LODWORD(v236) = v231;
          objc_msgSend_setShoulderStrength_(v235, v237, v238, v239, v236);
          objc_msgSend_decodeFloatForKey_(a3, v240, (uint64_t)CFSTR("toneMappingShoulderLength"), v241);
          v243 = v242;
          v247 = (void *)objc_msgSend_toneMapping(v7, v244, v245, v246);
          LODWORD(v248) = v243;
          objc_msgSend_setShoulderLength_(v247, v249, v250, v251, v248);
          objc_msgSend_decodeFloatForKey_(a3, v252, (uint64_t)CFSTR("toneMappingShoulderAngle"), v253);
          v255 = v254;
          v259 = (void *)objc_msgSend_toneMapping(v7, v256, v257, v258);
          LODWORD(v260) = v255;
          objc_msgSend_setShoulderAngle_(v259, v261, v262, v263, v260);
          objc_msgSend_decodeFloatForKey_(a3, v264, (uint64_t)CFSTR("toneMappingGamma"), v265);
          v267 = v266;
          v271 = (void *)objc_msgSend_toneMapping(v7, v268, v269, v270);
          LODWORD(v272) = v267;
          objc_msgSend_setGamma_(v271, v273, v274, v275, v272);
        }
      }
      objc_msgSend_decodeFloatForKey_(a3, v191, (uint64_t)CFSTR("bloomIntensity"), v192);
      if (v277 > 0.0)
      {
        v278 = v277;
        v279 = objc_msgSend_bloom(VFXCameraEffectBloom, v131, v276, v132);
        objc_msgSend_setBloom_(v7, v280, v279, v281);
        v285 = (void *)objc_msgSend_bloom(v7, v282, v283, v284);
        *(float *)&v286 = v278;
        objc_msgSend_setIntensity_(v285, v287, v288, v289, v286);
        objc_msgSend_decodeFloatForKey_(a3, v290, (uint64_t)CFSTR("bloomThreshold"), v291);
        v293 = v292;
        v297 = (void *)objc_msgSend_bloom(v7, v294, v295, v296);
        LODWORD(v298) = v293;
        objc_msgSend_setThreshold_(v297, v299, v300, v301, v298);
        if (objc_msgSend_containsValueForKey_(a3, v302, (uint64_t)CFSTR("bloomThresholdSmoothness"), v303))
        {
          objc_msgSend_decodeFloatForKey_(a3, v304, (uint64_t)CFSTR("bloomThresholdSmoothness"), v305);
          v307 = v306;
          v311 = (void *)objc_msgSend_bloom(v7, v308, v309, v310);
          LODWORD(v312) = v307;
          objc_msgSend_setThresholdSmoothness_(v311, v313, v314, v315, v312);
        }
        if (objc_msgSend_containsValueForKey_(a3, v304, (uint64_t)CFSTR("bloomUseHighQuality"), v305))
        {
          v318 = objc_msgSend_decodeBoolForKey_(a3, v316, (uint64_t)CFSTR("bloomUseHighQuality"), v317);
          v322 = (void *)objc_msgSend_bloom(v7, v319, v320, v321);
          objc_msgSend_setUseHighQuality_(v322, v323, v318, v324);
          v450 = sub_1B18BD300(a3, CFSTR("bloomColorFilter"));
          v328 = (void *)objc_msgSend_bloom(v7, v325, v326, v327);
          objc_msgSend_setColorFilter_(v328, v329, v330, v331, v450);
          objc_msgSend_decodeFloatForKey_(a3, v332, (uint64_t)CFSTR("bloomContrast"), v333);
          v335 = v334;
          v339 = (void *)objc_msgSend_bloom(v7, v336, v337, v338);
          LODWORD(v340) = v335;
          objc_msgSend_setContrast_(v339, v341, v342, v343, v340);
          objc_msgSend_decodeFloatForKey_(a3, v344, (uint64_t)CFSTR("bloomSaturation"), v345);
          v347 = v346;
          v351 = (void *)objc_msgSend_bloom(v7, v348, v349, v350);
          LODWORD(v352) = v347;
          objc_msgSend_setSaturation_(v351, v353, v354, v355, v352);
        }
        v356 = objc_msgSend_decodeIntegerForKey_(a3, v316, (uint64_t)CFSTR("bloomIteration"), v317);
        v360 = (void *)objc_msgSend_bloom(v7, v357, v358, v359);
        objc_msgSend_setIterationCount_(v360, v361, v356, v362);
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v131, (uint64_t)CFSTR("vignettingIntensity"), v132))
    {
      objc_msgSend_decodeFloatForKey_(a3, v363, (uint64_t)CFSTR("vignettingIntensity"), v364);
      if (v366 > 0.0)
      {
        v367 = v366;
        v368 = objc_msgSend_vignetting(VFXCameraEffectVignetting, v363, v365, v364);
        objc_msgSend_setVignetting_(v7, v369, v368, v370);
        v374 = (void *)objc_msgSend_vignetting(v7, v371, v372, v373);
        *(float *)&v375 = v367;
        objc_msgSend_setIntensity_(v374, v376, v377, v378, v375);
        if (objc_msgSend_containsValueForKey_(a3, v379, (uint64_t)CFSTR("vignettingAnamorphic"), v380))
        {
          objc_msgSend_decodeFloatForKey_(a3, v363, (uint64_t)CFSTR("vignettingAnamorphic"), v364);
          v382 = v381;
          v386 = (void *)objc_msgSend_vignetting(v7, v383, v384, v385);
          LODWORD(v387) = v382;
          objc_msgSend_setAnamorphic_(v386, v388, v389, v390, v387);
          objc_msgSend_decodeFloatForKey_(a3, v391, (uint64_t)CFSTR("vignettingSoftness"), v392);
          v394 = v393;
          v398 = (void *)objc_msgSend_vignetting(v7, v395, v396, v397);
          LODWORD(v399) = v394;
          objc_msgSend_setSoftness_(v398, v400, v401, v402, v399);
          objc_msgSend_decodeFloatForKey_(a3, v403, (uint64_t)CFSTR("vignettingRadius"), v404);
          v406 = v405;
          v410 = (void *)objc_msgSend_vignetting(v7, v407, v408, v409);
          LODWORD(v411) = v406;
          objc_msgSend_setRadius_(v410, v412, v413, v414, v411);
        }
      }
    }
    if (objc_msgSend_containsValueForKey_(a3, v363, (uint64_t)CFSTR("lensBlurRadius"), v364))
    {
      objc_msgSend_decodeFloatForKey_(a3, v415, (uint64_t)CFSTR("lensBlurRadius"), v416);
      if (v420 > 0.0)
      {
        v421 = v420;
        v422 = objc_msgSend_lensBlur(VFXCameraEffectLensBlur, v417, v418, v419);
        objc_msgSend_setLensBlur_(v7, v423, v422, v424);
        v428 = (void *)objc_msgSend_lensBlur(v7, v425, v426, v427);
        *(float *)&v429 = v421;
        objc_msgSend_setRadius_(v428, v430, v431, v432, v429);
        v435 = objc_msgSend_decodeIntegerForKey_(a3, v433, (uint64_t)CFSTR("lensBlurFilterQuality"), v434);
        v439 = (void *)objc_msgSend_lensBlur(v7, v436, v437, v438);
        objc_msgSend_setFilterQuality_(v439, v440, v435, v441);
      }
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B18BDA00(a3, v7);
    sub_1B18BDFA4(a3, v7);
    objc_msgSend__didDecodeVFXCamera_(v7, v442, (uint64_t)a3, v443);
    objc_msgSend_setImmediateMode_(VFXTransaction, v444, v8, v445);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObject
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return 0;
  v8 = (void *)objc_msgSend_worldWithWorldRef_(VFXWorld, v6, v5, v7);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_1B18A9BB4;
  v25 = sub_1B18A9BC4;
  v26 = 0;
  v12 = (void *)objc_msgSend_rootNode(v8, v9, v10, v11);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1B18A9BD0;
  v20[3] = &unk_1E63D7240;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend_enumerateChildNodesUsingBlock_(v12, v13, (uint64_t)v20, v14);
  v17 = v22[5];
  if (!v17)
  {
    _Block_object_dispose(&v21, 8);
    return 0;
  }
  v18 = (void *)objc_msgSend_debugQuickLookObjectWithPointOfView_(v8, v15, v17, v16);
  _Block_object_dispose(&v21, 8);
  return v18;
}

- (id)debugQuickLookData
{
  uint64_t v2;
  uint64_t v3;
  UIImage *v4;

  v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);
  return UIImagePNGRepresentation(v4);
}

@end
