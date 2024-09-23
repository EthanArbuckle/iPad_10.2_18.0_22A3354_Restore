@implementation VFXPhysicsWorld

- (void)_preTick:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double elapsedTime;
  float32x4_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;

  self->_elapsedTime = self->_elapsedTime + a3;
  v6 = (void *)objc_msgSend_world(self, a2, v3, v4);
  v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  if (v10)
  {
    v18 = v10;
    if (sub_1B1879F58(v10, v11, v12, v13, v14, v15, v16, v17))
    {
      sub_1B1813528((uint64_t)&v44, (uint64_t)self->_btWorld + 320);
      v33 = (void *)sub_1B187A9C4(v18, v19, v20, v21, v22, v23, v24, v25);
      if (v33)
      {
        if (SHIDWORD(v44) >= 1)
        {
          v37 = 0;
          v38 = 8 * HIDWORD(v44);
          do
          {
            v39 = *(_QWORD *)(v45 + v37);
            v40 = *(_QWORD *)(v39 + 200);
            if (v40)
              v41 = *(_QWORD *)(v40 + 8);
            else
              v41 = -1;
            LODWORD(v35) = *(_DWORD *)(v39 + 532);
            elapsedTime = self->_elapsedTime;
            *(float *)&elapsedTime = elapsedTime;
            *(float *)&v34 = 1.0 / *(float *)(v39 + 384);
            LODWORD(v36) = 1.0;
            objc_msgSend_evaluateForceFieldsAtPosition_velocity_mass_charge_time_dt_categoryMask_(v33, v26, v41, v28, *(double *)(v39 + 64), *(double *)(v39 + 352), v34, v35, elapsedTime, v36);
            v43.i32[3] = 0;
            *(float32x4_t *)(v39 + 464) = vaddq_f32(*(float32x4_t *)(v39 + 464), vmulq_f32(v43, *(float32x4_t *)(v39 + 400)));
            v37 += 8;
          }
          while (v38 != v37);
        }
      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: physicsWorld::preTick - no vfxscene"), v27, v28, v29, v30, v31, v32, v44);
      }
      if (v45)
      {
        if (v46)
          sub_1B21FF5FC(v45);
      }
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: physicsWorld::preTick - no world"), v12, v13, v14, v15, v16, v17, v47);
  }
}

- (void)_createDynamicWorldIfNeeded
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  btCFXDebugDraw *v8;
  _QWORD *v9;
  int v10;
  id Weak;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _QWORD v18[2];
  __int128 v19;

  if (!self->_btWorld)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_btWorld)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v18[0] = 0;
      v18[1] = 0;
      v19 = xmmword_1B22464F0;
      v4 = operator new();
      sub_1B21D8C70(v4, v18);
      v5 = operator new();
      sub_1B180FF9C(v5, v4, (uint64_t)self);
      v6 = operator new();
      sub_1B21C8540(v6, 0);
      v7 = sub_1B21FF5F0(320, 16);
      sub_1B21F59AC(v7);
      v8 = (btCFXDebugDraw *)operator new();
      v8->var0 = (void **)&off_1E63CBD90;
      v8->var1 = 6157;
      v8->var3 = 0;
      self->_debugDrawer = v8;
      v8->var2 = 1.0 / self->_scale;
      v9 = (_QWORD *)sub_1B21FF5F0(464, 16);
      sub_1B21FB29C(v9, v5, v6, v7, v4);
      v9[16] = sub_1B180D870;
      v9[17] = self;
      v10 = *(_DWORD *)&self->_gravity[8];
      v15 = *(_QWORD *)self->_gravity;
      v16 = v10;
      v17 = 0;
      (*(void (**)(_QWORD *, uint64_t *))(*v9 + 144))(v9, &v15);
      *((_DWORD *)v9 + 57) = LODWORD(self->_scale);
      Weak = objc_loadWeak((id *)&self->_contactDelegate);
      if (Weak)
        sub_1B180DACC(v9[5], (uint64_t)Weak);
      self->_btWorld = v9;
      os_unfair_lock_unlock(p_lock);
      objc_msgSend__allowGhostObjects(self, v12, v13, v14);
    }
  }
}

- (id)_physicsContact
{
  id result;

  result = self->_contact;
  if (!result)
  {
    result = objc_alloc_init(VFXPhysicsContact);
    self->_contact = (VFXPhysicsContact *)result;
  }
  return result;
}

- (void)commonInit
{
  if (qword_1EEF65750 != -1)
    dispatch_once(&qword_1EEF65750, &unk_1E63D0B70);
  self->_lock._os_unfair_lock_opaque = 0;
  self->_registeredBodies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
}

- (VFXPhysicsWorld)initWithWorld:(id)a3
{
  VFXPhysicsWorld *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXPhysicsWorld *v8;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXPhysicsWorld;
  v4 = -[VFXPhysicsWorld init](&v15, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    *(_OWORD *)v8->_gravity = xmmword_1B2246500;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v8->_speed = _D0;
    v8->_timeStep = 0.0166666667;
    v8->_vfxWorld = (VFXWorld *)a3;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  NSMutableArray *physicsJoints;
  const char *v5;
  NSMutableSet *registeredBodies;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  btVehicleRaycaster *vehicleRayCaster;
  btCFXDebugDraw *debugDrawer;
  _QWORD *btWorld;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  btOverlappingPairCallback *ghostPairCallback;
  void *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  physicsJoints = self->_physicsJoints;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1B180DF40;
  v33[3] = &unk_1E63D6788;
  v33[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(physicsJoints, a2, (uint64_t)v33, v2);
  if (self->_btWorld)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    registeredBodies = self->_registeredBodies;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v5, (uint64_t)&v29, (uint64_t)v34, 16);
    if (v7)
    {
      v11 = v7;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(registeredBodies);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v15 = objc_msgSend__handle(v14, v8, v9, v10);
          if (v15)
            (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_btWorld + 184))(self->_btWorld, v15);
          objc_msgSend_flagAsActive_(v14, v16, 0, v17);
        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v8, (uint64_t)&v29, (uint64_t)v34, 16);
      }
      while (v11);
    }
  }

  vehicleRayCaster = self->_vehicleRayCaster;
  if (vehicleRayCaster)
    (*((void (**)(btVehicleRaycaster *))vehicleRayCaster->var0 + 1))(vehicleRayCaster);
  debugDrawer = self->_debugDrawer;
  if (debugDrawer)
    (*((void (**)(btCFXDebugDraw *))debugDrawer->var0 + 1))(debugDrawer);
  btWorld = self->_btWorld;
  if (btWorld)
  {
    v21 = (_QWORD *)btWorld[5];
    v22 = v21[1311];
    v23 = btWorld[12];
    v24 = (*(uint64_t (**)(_QWORD *))(*btWorld + 200))(btWorld);
    if (self->_ghostPairCallback)
    {
      v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 72))(v23);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v25 + 120))(v25, 0);
      ghostPairCallback = self->_ghostPairCallback;
      if (ghostPairCallback)
        (*((void (**)(btOverlappingPairCallback *))ghostPairCallback->var0 + 1))(ghostPairCallback);
      self->_ghostPairCallback = 0;
    }
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
    (*(void (**)(_QWORD *))(*v21 + 8))(v21);
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
    v27 = self->_btWorld;
    if (v27)
      (*(void (**)(void *))(*(_QWORD *)v27 + 8))(v27);
  }
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v28.receiver = self;
  v28.super_class = (Class)VFXPhysicsWorld;
  -[VFXPhysicsWorld dealloc](&v28, sel_dealloc);
}

- (void)worldWillDie
{
  _QWORD *btWorld;
  uint64_t v3;

  self->_vfxWorld = 0;
  btWorld = self->_btWorld;
  if (btWorld)
  {
    v3 = btWorld[3];
    if (v3)
    {
      if (*((_BYTE *)btWorld + 32))
        sub_1B21FF5FC(v3);
    }
    *((_BYTE *)btWorld + 32) = 1;
    btWorld[3] = 0;
    *((_DWORD *)btWorld + 3) = 0;
    *((_DWORD *)btWorld + 4) = 0;
  }
}

- (BOOL)_isDefault
{
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = VFXVector3EqualToVector3(*(float32x4_t *)self->_gravity, (float32x4_t)xmmword_1B2246500);
  if (v3)
    LOBYTE(v3) = self->_speed == 1.0
              && self->_scale == 1.0
              && self->_timeStep == 0.0166666667
              && objc_msgSend_count(self->_physicsJoints, v4, v5, v6) == 0;
  return v3;
}

- (void)wakeUpAllBodies
{
  void *btWorld;

  btWorld = self->_btWorld;
  if (btWorld)
    sub_1B21FD0E4((uint64_t)btWorld);
}

- (void)setGravity:(VFXPhysicsWorld *)self
{
  uint64_t v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  VFXPhysicsWorld *v6;

  *(_OWORD *)self->_gravity = v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1B180E074;
  v4[3] = &unk_1E63D5468;
  v6 = self;
  v5 = v3;
  objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v4, v2);
}

- (__n128)gravity
{
  return a1[5];
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setScale:(float)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  btCFXDebugDraw *debugDrawer;
  _QWORD v10[4];
  float v11;
  _QWORD v12[5];
  float v13;

  if (self->_scale != a3)
  {
    self->_scale = a3;
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B180E1A8;
    v12[3] = &unk_1E63D53A0;
    v12[4] = self;
    v13 = a3;
    objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v12, v3);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = sub_1B180E1C0;
    v10[3] = &unk_1E63D6A18;
    v11 = a3;
    objc_msgSend_enumerateBodiesUsingBlock_(self, v7, (uint64_t)v10, v8);
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
      debugDrawer->var2 = 1.0 / self->_scale;
  }
}

- (float)scale
{
  return self->_scale;
}

- (void)setTimeStep:(double)a3
{
  self->_timeStep = a3;
}

- (double)timeStep
{
  return self->_timeStep;
}

- (VFXPhysicsContactDelegate)contactDelegate
{
  return (VFXPhysicsContactDelegate *)objc_loadWeak((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  VFXPhysicsContactDelegate **p_contactDelegate;
  const char *v6;
  uint64_t v7;
  _QWORD v8[6];

  p_contactDelegate = &self->_contactDelegate;
  if (objc_loadWeak((id *)&self->_contactDelegate) != a3)
    objc_storeWeak((id *)p_contactDelegate, a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B180E27C;
  v8[3] = &unk_1E63D53C8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v6, (uint64_t)v8, v7);
}

- (void)addPhysicsJoint:(id)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  NSMutableArray *physicsJoints;
  const char *v9;
  uint64_t v10;
  _QWORD v11[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  physicsJoints = self->_physicsJoints;
  if (!physicsJoints)
  {
    physicsJoints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_physicsJoints = physicsJoints;
  }
  objc_msgSend_addObject_(physicsJoints, v6, (uint64_t)a3, v7);
  os_unfair_lock_unlock(p_lock);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B180E33C;
  v11[3] = &unk_1E63D53C8;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v9, (uint64_t)v11, v10);
}

- (void)activatePhysicsJoint:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if ((objc_msgSend_isActive(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend__addToPhysicsWorld_(a3, v6, (uint64_t)self, v7);
    v11 = (void *)objc_msgSend_bodyA(a3, v8, v9, v10);
    objc_msgSend__activate(v11, v12, v13, v14);
    v18 = (void *)objc_msgSend_bodyB(a3, v15, v16, v17);
    objc_msgSend__activate(v18, v19, v20, v21);
  }
}

- (void)deactivatePhysicsJoint:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (objc_msgSend_isActive(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend__willRemoveFromPhysicsWorld_(a3, v6, (uint64_t)self, v7);
    v11 = (void *)objc_msgSend_bodyA(a3, v8, v9, v10);
    objc_msgSend__activate(v11, v12, v13, v14);
    v18 = (void *)objc_msgSend_bodyB(a3, v15, v16, v17);
    objc_msgSend__activate(v18, v19, v20, v21);
  }
}

- (void)removePhysicsJoint:(id)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B180E484;
  v10[3] = &unk_1E63D53C8;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v6, (uint64_t)v10, v7);
  objc_msgSend_removeObject_(self->_physicsJoints, v8, (uint64_t)a3, v9);
  os_unfair_lock_unlock(p_lock);
}

- (id)objectInAllJointsAtIndex:(unint64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_physicsJoints, a2, a3, v3);
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  v8 = objc_msgSend_rangeOfString_(a3, a2, (uint64_t)CFSTR("["), (uint64_t)a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v12 = v8;
  v13 = v8 + 1;
  if (v8 + 1 >= (unint64_t)objc_msgSend_length(a3, v9, v10, v11))
    return 0;
  v16 = objc_msgSend_substringToIndex_(a3, v14, v12, v15);
  v19 = (void *)objc_msgSend_substringFromIndex_(a3, v17, v13, v18);
  v22 = objc_msgSend_rangeOfString_(v19, v20, (uint64_t)CFSTR("]"), v21);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v25 = (void *)objc_msgSend_substringToIndex_(v19, v23, v22, v24);
  v29 = objc_msgSend_intValue(v25, v26, v27, v28);
  v32 = (void *)objc_msgSend_valueForKey_(self, v30, v16, v31);
  if (objc_msgSend_count(v32, v33, v34, v35) <= (unint64_t)v29)
    return 0;
  *a5 = (id)objc_msgSend_objectAtIndex_(v32, v36, v29, v37);
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  void *v16;

  v16 = 0;
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, a2, (uint64_t)a3, (uint64_t)a3, &v16))
    return v16;
  if (objc_msgSend_isEqual_(a3, v5, (uint64_t)CFSTR("gravity"), v6))
  {
    v11 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_gravity(self, v8, v9, v10);
    return (id)objc_msgSend_valueWithVFXFloat3_(v11, v12, v13, v14);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VFXPhysicsWorld;
    return -[VFXPhysicsWorld valueForUndefinedKey:](&v15, sel_valueForUndefinedKey_, a3);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend_isEqual_(a4, a2, (uint64_t)CFSTR("gravity"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setGravity_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXPhysicsWorld;
    -[VFXPhysicsWorld setValue:forUndefinedKey:](&v13, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (NSArray)physicsJoints
{
  if (self->_physicsJoints)
    return &self->_physicsJoints->super;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)rayTestWithSegmentFromPoint:(VFXPhysicsWorld *)self toPoint:(SEL)a2 options:(id)a3
{
  __int128 v3;
  __int128 v4;
  id result;
  __int128 v6;
  __int128 v7;

  HIDWORD(v3) = 0;
  HIDWORD(v4) = 0;
  v6 = v4;
  v7 = v3;
  result = (id)objc_msgSend__rayTestWithSegmentFromPoint_toPoint_options_(self, a2, (uint64_t)&v7, (uint64_t)&v6, a3);
  if (!result)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 *v8;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  void *v31;
  const char *v32;
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
  const char *v47;
  uint64_t v48;
  int v49;
  void *v50;
  uint64_t i;
  const char *v52;
  id v53;
  uint64_t v54;
  const char *v55;
  id v56;
  uint64_t v57;
  char v58;
  uint64_t (**v60)();
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  int v65;
  __int128 v66;
  __int128 v67;
  int v68;
  float32x4_t v69;
  float32x4_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  char v82;

  v7 = v6;
  v8 = (__int128 *)v5;
  v11 = (void *)objc_msgSend_world(self, a2, (uint64_t)a5, v5, *(double *)a3.var0.var0, *(double *)&a3.var0.var0[1], *(double *)&a3.var0.var0[2], *(double *)&a3.var0.var0[3], *(double *)a4.var0.var0, *(double *)&a4.var0.var0[1], *(double *)&a4.var0.var0[2], *(double *)&a4.var0.var0[3]);
  v15 = objc_msgSend_worldRef(v11, v12, v13, v14);
  if (!v15 || !self->_btWorld)
    return 0;
  v18 = v15;
  LODWORD(v61) = 1065353216;
  v62 = 0;
  v65 = 0;
  v60 = &off_1E63CD040;
  v19 = *v8;
  v66 = *(_OWORD *)a5;
  v67 = v19;
  v73 = 1;
  v72 = 0;
  v71 = 0;
  v76 = 1;
  v75 = 0;
  v74 = 0;
  v79 = 1;
  v78 = 0;
  v77 = 0;
  v82 = 1;
  v81 = 0;
  v80 = 0;
  *(_QWORD *)&v20 = -1;
  *((_QWORD *)&v20 + 1) = -1;
  v63 = v20;
  v64 = 0;
  v21 = (void *)objc_msgSend_objectForKey_(v7, v16, (uint64_t)CFSTR("backfaceCulling"), v17, &off_1E63CD040, v61);
  if (!v21 || objc_msgSend_BOOLValue(v21, v22, v23, v24))
    v65 |= 1u;
  v25 = (void *)objc_msgSend_objectForKey_(v7, v22, (uint64_t)CFSTR("results"), v24);
  if ((objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("all"), v27) & 1) != 0)
    v30 = 2;
  else
    v30 = objc_msgSend_isEqualToString_(v25, v28, (uint64_t)CFSTR("closest"), v29) ^ 1;
  v68 = v30;
  v31 = (void *)objc_msgSend_objectForKey_(v7, v28, (uint64_t)CFSTR("collisionBitMask"), v29);
  if (v31)
    v39 = objc_msgSend_unsignedIntegerValue(v31, v32, v33, v34);
  else
    v39 = -1;
  *((_QWORD *)&v63 + 1) = v39;
  sub_1B187973C(v18, (uint64_t)v32, v33, v34, v35, v36, v37, v38);
  (*(void (**)(void *, id, __int128 *, uint64_t (***)()))(*(_QWORD *)self->_btWorld + 64))(self->_btWorld, a5, v8, &v60);
  sub_1B18797B4(v18, v40, v41, v42, v43, v44, v45, v46);
  if (v68 == 2)
  {
    v49 = v71;
    v50 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v47, (int)v71, v48);
    if (v49 >= 1)
    {
      for (i = 0; i != v49; ++i)
      {
        v53 = sub_1B180E6E0(*(_QWORD *)(v72 + 8 * i), (float32x4_t *)(v78 + 16 * i), (float32x4_t *)(v75 + 16 * i));
        if (v53)
          objc_msgSend_addObject_(v50, v52, (uint64_t)v53, v54);
      }
    }
  }
  else
  {
    v56 = sub_1B180E6E0(v62, &v70, &v69);
    if (!v56)
    {
      v50 = 0;
      v58 = 0;
      goto LABEL_22;
    }
    v50 = (void *)objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v55, (uint64_t)v56, v57);
  }
  v58 = 1;
LABEL_22:
  v60 = &off_1E63CD040;
  if (v81 && v82)
    sub_1B21FF5FC(v81);
  v82 = 1;
  v81 = 0;
  v80 = 0;
  if (v78 && v79)
    sub_1B21FF5FC(v78);
  v79 = 1;
  v78 = 0;
  v77 = 0;
  if (v75 && v76)
    sub_1B21FF5FC(v75);
  v76 = 1;
  v75 = 0;
  v74 = 0;
  if (v72 && v73)
    sub_1B21FF5FC(v72);
  if ((v58 & 1) == 0)
    return 0;
  return v50;
}

- (id)contactTestBetweenBody:(id)a3 andBody:(id)a4 options:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *btWorld;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  uint64_t v41;
  uint64_t (**v43)();
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;

  v9 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a4);
  v13 = objc_msgSend_worldRef(v9, v10, v11, v12);
  if (v13)
  {
    btWorld = self->_btWorld;
    if (btWorld)
    {
      v17 = v13;
      v18 = (void *)objc_msgSend_objectForKey_(a5, v14, (uint64_t)CFSTR("collisionBitMask"), v15);
      if (v18)
        v26 = objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      else
        v26 = -1;
      v43 = &off_1E63CD8C8;
      v44 = xmmword_1B2246510;
      v45 = xmmword_1B2244C80;
      v46 = v26;
      v47 = 0;
      sub_1B187973C(v17, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
      v30 = objc_msgSend__handle(a3, v27, v28, v29);
      v34 = objc_msgSend__handle(a4, v31, v32, v33);
      if (v30)
      {
        v36 = v34;
        if (v34)
          sub_1B21D21FC((uint64_t)self->_btWorld, v30, v34, (uint64_t)&v43);
      }
      sub_1B18797B4(v17, v35, v36, v37, v38, v39, v40, v41);
      btWorld = v47;
    }
  }
  else
  {
    btWorld = 0;
  }
  if (btWorld)
    return btWorld;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)contactTestWithBody:(id)a3 options:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *btWorld;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
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
  uint64_t (**v37)();
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;

  v7 = (void *)objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  if (v11)
  {
    btWorld = self->_btWorld;
    if (btWorld)
    {
      v15 = v11;
      v16 = (void *)objc_msgSend_objectForKey_(a4, v12, (uint64_t)CFSTR("collisionBitMask"), v13);
      if (v16)
        v24 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
      else
        v24 = -1;
      v37 = &off_1E63CD8C8;
      v38 = xmmword_1B2246510;
      v39 = xmmword_1B2244C80;
      v40 = v24;
      v41 = 0;
      sub_1B187973C(v15, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
      v28 = objc_msgSend__handle(a3, v25, v26, v27);
      if (v28)
        sub_1B21D217C((uint64_t)self->_btWorld, v28, (uint64_t)&v37);
      sub_1B18797B4(v15, v29, v30, v31, v32, v33, v34, v35);
      btWorld = v41;
    }
  }
  else
  {
    btWorld = 0;
  }
  if (btWorld)
    return btWorld;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (uint64_t)convexSweepTestWithShape:(void *)a3 fromTransform:(void *)a4 toTransform:(int8x16_t)a5 options:(int8x16_t)a6
{
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int32x2_t v70;
  unsigned __int32 v71;
  int v72;
  int32x2_t v73;
  unsigned __int32 v74;
  int v75;
  int32x2_t v76;
  unsigned __int32 v77;
  int v78;
  __int128 v79;
  int32x2_t v80;
  unsigned __int32 v81;
  int v82;
  int32x2_t v83;
  unsigned __int32 v84;
  int v85;
  int32x2_t v86;
  unsigned __int32 v87;
  int v88;
  __int128 v89;
  uint64_t (**v90)();
  float v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  int v97;
  uint64_t v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend_world(a1, a2, (uint64_t)a3, (uint64_t)a4);
  v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
  if (!v19)
    return MEMORY[0x1E0C9AA60];
  v22 = MEMORY[0x1E0C9AA60];
  if (a1[1])
  {
    v23 = v19;
    v24 = (void *)objc_msgSend_objectForKey_(a4, v20, (uint64_t)CFSTR("ccdPenetration"), v21);
    if (v24)
    {
      objc_msgSend_floatValue(v24, v25, v26, v27);
      v29 = v28;
    }
    else
    {
      v29 = 0.0;
    }
    v30 = (void *)objc_msgSend_objectForKey_(a4, v25, (uint64_t)CFSTR("collisionBitMask"), v27);
    if (v30)
      v34 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33);
    else
      v34 = -1;
    v35 = (void *)objc_msgSend_objectForKey_(a4, v31, (uint64_t)CFSTR("results"), v33);
    if ((objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("all"), v37) & 1) != 0)
      v45 = 2;
    else
      v45 = objc_msgSend_isEqualToString_(v35, v38, (uint64_t)CFSTR("closest"), v40) ^ 1;
    sub_1B187973C(v23, (uint64_t)v38, v39, v40, v41, v42, v43, v44);
    v48 = (void *)objc_msgSend__shapeHandle_(a3, v46, 0, v47);
    v52 = objc_msgSend_btShape(v48, v49, v50, v51);
    if (v52)
    {
      if (*(int *)(v52 + 8) > 19)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: convexSweep only works with convex shapes"), (uint64_t)v54, v55, v56, v57, v58, v59, a5.i64[0]);
      }
      else
      {
        v80 = vzip1_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
        v81 = a7.n128_u32[0];
        v82 = 0;
        v83 = vzip2_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
        v84 = a7.n128_u32[1];
        v85 = 0;
        v86 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a6, a6, 8uLL));
        v87 = a7.n128_u32[2];
        v88 = 0;
        *(_QWORD *)&v89 = a8.n128_u64[0];
        *((_QWORD *)&v89 + 1) = a8.n128_u32[2];
        v70 = vzip1_s32(*(int32x2_t *)a9.i8, *(int32x2_t *)a10.i8);
        v71 = a11.n128_u32[0];
        v72 = 0;
        v73 = vzip2_s32(*(int32x2_t *)a9.i8, *(int32x2_t *)a10.i8);
        v74 = a11.n128_u32[1];
        v75 = 0;
        v76 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a9, a9, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a10, a10, 8uLL));
        v77 = a11.n128_u32[2];
        v78 = 0;
        *(_QWORD *)&v79 = a12.n128_u64[0];
        *((_QWORD *)&v79 + 1) = a12.n128_u32[2];
        v91 = 1.0;
        v90 = &off_1E63CD6A0;
        v93 = v34;
        v94 = 0;
        v95 = v89;
        v96 = v79;
        v98 = 0;
        v101 = 0;
        v92 = 1;
        v97 = v45;
        sub_1B21D2020(a1[1], v52, (uint64_t)&v80, (uint64_t)&v70, (uint64_t)&v90, v29);
        if (v91 < 1.0)
        {
          if (v45 == 2)
          {
            v60 = v101;
            goto LABEL_20;
          }
          v54 = sub_1B180EFB0(v98, 0, &v100, &v99, 0.0, v91);
          if (v54)
          {
            v60 = objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v53, (uint64_t)v54, v55);
LABEL_20:
            sub_1B18797B4(v23, (uint64_t)v53, (uint64_t)v54, v55, v56, v57, v58, v59);
            if (v60)
              return v60;
            return v22;
          }
        }
      }
    }
    v60 = 0;
    goto LABEL_20;
  }
  return v22;
}

- (void)updateCollisionPairs
{
  uint64_t v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B180F0E0;
  v3[3] = &unk_1E63D5378;
  v3[4] = self;
  objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v3, v2);
}

- (BOOL)_needsRedraw
{
  _BYTE *btWorld;

  return self->_speed != 0.0 && (btWorld = self->_btWorld) != 0 && btWorld[448] != 0;
}

- (void)enumerateBodiesUsingBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *registeredBodies;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  registeredBodies = self->_registeredBodies;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v7, (uint64_t)&v13, (uint64_t)v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(registeredBodies);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), &v17);
      if (v17)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v12, (uint64_t)&v13, (uint64_t)v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *registeredBodies;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  registeredBodies = self->_registeredBodies;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v5, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(registeredBodies);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend_clearAllForces(v13, v7, v8, v9);
        objc_msgSend_resetTransform(v13, v14, v15, v16);
        objc_msgSend_setVelocity_(v13, v17, v18, v19, 0.0);
        objc_msgSend_setAngularVelocity_(v13, v20, v21, v22, 0.0);
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_step:(double)a3
{
  _QWORD *btWorld;
  float timeStep;
  float speed;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  btWorld = self->_btWorld;
  if (btWorld)
  {
    timeStep = self->_timeStep;
    speed = self->_speed;
    a3 = speed * a3;
    *(float *)&a3 = a3;
    v7 = vcvtps_s32_f32(speed * (float)((float)(1.0 / timeStep) / 15.0));
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    v9 = btWorld[5];
    if (!self->_firstSimulationDone)
    {
      self->_firstSimulationDone = 1;
      if (timeStep >= *(float *)&a3)
        *(float *)&a3 = timeStep;
    }
    (*(void (**)(_QWORD *, uint64_t, __n128))(*btWorld + 104))(btWorld, v8, *(__n128 *)&a3);
    if (objc_loadWeak((id *)&self->_contactDelegate))
      sub_1B180F588(v9, v10, v11, v12);
  }
}

- (btVehicleRaycaster)_defaultVehicleRayCaster
{
  uint64_t v2;
  uint64_t v3;
  btVehicleRaycaster *result;
  void **btWorld;

  result = self->_vehicleRayCaster;
  if (!result)
  {
    objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
    result = (btVehicleRaycaster *)operator new();
    btWorld = (void **)self->_btWorld;
    result->var0 = (void **)&unk_1E63CD7E0;
    result[1].var0 = btWorld;
    self->_vehicleRayCaster = result;
  }
  return result;
}

- (void)_handle
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
  return self->_btWorld;
}

- (void)_handleIfAny
{
  return self->_btWorld;
}

- (void)_allowGhostObjects
{
  uint64_t v2;
  uint64_t v3;
  btOverlappingPairCallback *v5;
  uint64_t v6;

  if (!self->_ghostPairCallback)
  {
    objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
    v5 = (btOverlappingPairCallback *)operator new();
    v5->var0 = (void **)&off_1E63CCBC0;
    self->_ghostPairCallback = v5;
    v6 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)self->_btWorld + 12) + 72))(*((_QWORD *)self->_btWorld + 12));
    (*(void (**)(uint64_t, btOverlappingPairCallback *))(*(_QWORD *)v6 + 120))(v6, self->_ghostPairCallback);
  }
}

- (id)world
{
  return self->_vfxWorld;
}

- (void)setWorld:(id)a3
{
  self->_vfxWorld = (VFXWorld *)a3;
}

- (void)_postCommandWithBlock:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;

  v6 = objc_msgSend_worldRef(self->_vfxWorld, a2, (uint64_t)a3, v3);
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self->_vfxWorld, a3);
}

- (void)_drawDebugInAuthoringEnvironment:(void *)a3
{
  btCFXDebugDraw *debugDrawer;

  if (self->_btWorld)
  {
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      debugDrawer->var3 = a3;
      (*(void (**)(void *, btCFXDebugDraw *))(*(_QWORD *)self->_btWorld + 32))(self->_btWorld, self->_debugDrawer);
      (*(void (**)(void *))(*(_QWORD *)self->_btWorld + 48))(self->_btWorld);
      (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_btWorld + 32))(self->_btWorld, 0);
      self->_debugDrawer->var3 = 0;
    }
  }
}

- (void)addPhysicsBody:(id)a3 nodeRef:(__CFXNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7
{
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  __n128 v27;

  v13 = objc_msgSend__handle(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v13)
  {
    v17 = v13;
    objc_msgSend_centerOfMassOffset(a3, v14, v15, v16);
    v27 = v18;
    v22 = objc_msgSend__handle(a3, v19, v20, v21);
    sub_1B180F39C(v17, v22, a4, a5, a6, a7, v27);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_addObject_(self->_registeredBodies, v23, (uint64_t)a3, v24);
  objc_msgSend_flagAsActive_(a3, v25, 1, v26);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removePhysicsBody:(id)a3 handle:(void *)a4
{
  void *btWorld;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSMutableArray *physicsJoints;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  btWorld = self->_btWorld;
  if (btWorld)
    (*(void (**)(void *, void *))(*(_QWORD *)btWorld + 184))(btWorld, a4);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeObject_(self->_registeredBodies, v7, (uint64_t)a3, v8);
  objc_msgSend_flagAsActive_(a3, v9, 0, v10);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  physicsJoints = self->_physicsJoints;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(physicsJoints, v12, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(physicsJoints);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((id)objc_msgSend_bodyA(v20, v14, v15, v16) == a3 || (id)objc_msgSend_bodyB(v20, v14, v21, v16) == a3)
          objc_msgSend_deactivatePhysicsJoint_(self, v14, (uint64_t)v20, v16);
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(physicsJoints, v14, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v17);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)encodeWithCoder:(id)a3
{
  VFXWorld *vfxWorld;
  NSMutableArray *physicsJoints;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  vfxWorld = self->_vfxWorld;
  if (vfxWorld)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)vfxWorld, (uint64_t)CFSTR("world"));
  physicsJoints = self->_physicsJoints;
  if (physicsJoints)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)physicsJoints, (uint64_t)CFSTR("joints"));
  sub_1B18BD1D8(a3, CFSTR("gravity"), *(__n128 *)self->_gravity);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("speed"), v8, self->_speed);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("scale"), v10, self->_scale);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("timeStep"), v12, self->_timeStep);
}

- (VFXPhysicsWorld)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsWorld *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)VFXPhysicsWorld;
  v7 = -[VFXPhysicsWorld init](&v45, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_commonInit(v7, v11, v12, v13);
    v14 = objc_opt_class();
    v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("world"));
    objc_msgSend_setWorld_(v7, v17, v16, v18);
    v19 = sub_1B18BD300(a3, CFSTR("gravity"));
    objc_msgSend_setGravity_(v7, v20, v21, v22, v19);
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("speed"), v24);
    *(float *)&v25 = v25;
    objc_msgSend_setSpeed_(v7, v26, v27, v28, v25);
    objc_msgSend_decodeDoubleForKey_(a3, v29, (uint64_t)CFSTR("scale"), v30);
    *(float *)&v31 = v31;
    objc_msgSend_setScale_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeDoubleForKey_(a3, v35, (uint64_t)CFSTR("timeStep"), v36);
    objc_msgSend_setTimeStep_(v7, v37, v38, v39);
    v40 = objc_opt_class();
    v7->_tempLoadedJoints = (NSArray *)(id)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v41, v40, (uint64_t)CFSTR("joints"));
    objc_msgSend_setImmediateMode_(VFXTransaction, v42, v8, v43);
  }
  return v7;
}

- (void)_registerPhysicsJoints
{
  NSArray *tempLoadedJoints;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  tempLoadedJoints = self->_tempLoadedJoints;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(tempLoadedJoints, a2, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(tempLoadedJoints);
        objc_msgSend_addPhysicsJoint_(self, v5, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), v6);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(tempLoadedJoints, v5, (uint64_t)&v10, (uint64_t)v14, 16);
    }
    while (v7);
  }

  self->_tempLoadedJoints = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)gravityValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_gravity(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_gravity(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_gravity(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setGravityValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setGravity_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)rayTestWithSegmentFrom:(id)a3 to:(id)a4 options:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v9 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  return (id)MEMORY[0x1E0DE7D20](self, sel_rayTestWithSegmentFromPoint_toPoint_options_, a5, v43);
}

@end
