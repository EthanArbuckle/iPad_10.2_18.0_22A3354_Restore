@implementation VFXPhysicsBody

- (VFXPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4
{
  VFXPhysicsBody *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  float v14;
  int64x2_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VFXPhysicsBody;
  v6 = -[VFXPhysicsBody init](&v22, sel_init);
  v10 = (uint64_t)v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4)
    {
      v6->_defaultShape = 0;
      v11 = a4;
      *(_QWORD *)(v10 + 48) = v11;
      objc_msgSend_didAddToPhysicsBody_(v11, v12, v10, v13);
    }
    else
    {
      v6->_defaultShape = 1;
    }
    v14 = 0.0;
    if (a3 == 1)
      v14 = 1.0;
    *(float *)(v10 + 16) = v14;
    *(_QWORD *)(v10 + 24) = 0x3F0000003F000000;
    *(_DWORD *)(v10 + 32) = 0;
    *(_DWORD *)(v10 + 64) = 1036831949;
    *(_DWORD *)(v10 + 96) = 1036831949;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v10 + 112) = _Q0;
    *(_OWORD *)(v10 + 128) = _Q0;
    *(int32x2_t *)(v10 + 164) = vdup_n_s32(0x3DCCCCCDu);
    *(_BYTE *)(v10 + 232) = 1;
    *(_BYTE *)(v10 + 160) = 0;
    *(int32x2_t *)&_Q0 = vdup_n_s32(a3 == 0);
    v20.i64[0] = _Q0;
    v20.i64[1] = DWORD1(_Q0);
    *(int8x16_t *)(v10 + 208) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v20, 0x3FuLL)), (int8x16_t)xmmword_1B2247FF0, (int8x16_t)xmmword_1B2246510);
    *(_QWORD *)(v10 + 224) = 0;
    *(_QWORD *)(v10 + 240) = objc_msgSend__createBody((void *)v10, v7, v8, v9);
  }
  return (VFXPhysicsBody *)v10;
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;

  return (__CFXWorld *)objc_msgSend_worldRef(self->_node, a2, v2, v3);
}

- (void)_handle
{
  return self->_body;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)flagAsActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)dealloc
{
  uint64_t v2;
  _QWORD *body;
  uint64_t v5;
  objc_super v6;

  body = self->_body;
  if (body)
  {
    v5 = body[67];
    if (!v5 || ((*(void (**)(_QWORD, SEL))(*(_QWORD *)v5 + 8))(body[67], a2), (body = self->_body) != 0))
      (*(void (**)(_QWORD *, SEL))(*body + 16))(body, a2);
  }
  objc_msgSend_didRemoveFromPhysicsBody_(self->_physicsShape, a2, (uint64_t)self, v2);

  v6.receiver = self;
  v6.super_class = (Class)VFXPhysicsBody;
  -[VFXPhysicsBody dealloc](&v6, sel_dealloc);
}

+ (VFXPhysicsBody)bodyWithType:(int64_t)a3 shape:(id)a4
{
  id v6;
  const char *v7;

  v6 = objc_alloc((Class)objc_opt_class());
  return (VFXPhysicsBody *)(id)objc_msgSend_initWithType_shape_(v6, v7, a3, (uint64_t)a4);
}

+ (id)staticBody
{
  void *v2;
  const char *v3;

  v2 = (void *)objc_opt_class();
  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 0, 0);
}

+ (id)dynamicBody
{
  void *v2;
  const char *v3;

  v2 = (void *)objc_opt_class();
  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 1, 0);
}

+ (id)kinematicBody
{
  void *v2;
  const char *v3;

  v2 = (void *)objc_opt_class();
  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 2, 0);
}

- (void)setType:(int64_t)a3
{
  uint64_t v3;
  int32x2_t v6;
  int64x2_t v7;
  uint64_t v8;
  VFXNode *node;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  _QWORD v15[6];

  self->_type = a3;
  v6 = vdup_n_s32(a3 == 0);
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  *(int8x16_t *)&self->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), (int8x16_t)xmmword_1B2247FF0, (int8x16_t)xmmword_1B2246510);
  v8 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B1902D20;
  v15[3] = &unk_1E63D5440;
  v15[4] = self;
  v15[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v15);
  LODWORD(v14) = 0;
  if (a3 == 1)
    *(float *)&v14 = 1.0;
  objc_msgSend_setMass_(self, v11, v12, v13, v14);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setMass:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[6];
  float v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_mass = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3020000000;
  v13 = *(_OWORD *)&self->_momentOfInertia[3];
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1902E98;
  v10[3] = &unk_1E63D9190;
  v11 = a3;
  v10[4] = self;
  v10[5] = v12;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
  _Block_object_dispose(v12, 8);
}

- (float)mass
{
  return self->_mass;
}

- (void)setMomentOfInertia:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  _QWORD v9[6];
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&self->_momentOfInertia[3] = v4;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3020000000;
  v11 = v4;
  v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B1902FC8;
  v9[3] = &unk_1E63D7F20;
  v9[4] = self;
  v9[5] = v10;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
  _Block_object_dispose(v10, 8);
}

- (__n128)momentOfInertia
{
  return a1[11];
}

- (void)setCenterOfMassOffset:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  float mass;
  BOOL explicitMomentOfInertia;
  uint64_t v8;
  VFXNode *node;
  const char *v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  VFXPhysicsBody *v16;
  float v17;
  BOOL v18;

  v12 = v4;
  *(_OWORD *)&self->_centerOfMassOffset[3] = v4;
  mass = self->_mass;
  v11 = *(_OWORD *)&self->_momentOfInertia[3];
  explicitMomentOfInertia = self->_explicitMomentOfInertia;
  v8 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B19030C0;
  v13[3] = &unk_1E63D91B8;
  v16 = self;
  v17 = mass;
  v18 = explicitMomentOfInertia;
  v14 = v12;
  v15 = v11;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v13);
}

- (__n128)centerOfMassOffset
{
  return a1[12];
}

- (void)setUsesDefaultMomentOfInertia:(BOOL)a3
{
  uint64_t v3;
  uint64_t v5;
  VFXNode *node;
  const char *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_explicitMomentOfInertia = !a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  v10 = *(_OWORD *)&self->_momentOfInertia[3];
  v5 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1903254;
  v8[3] = &unk_1E63D7F20;
  v8[4] = self;
  v8[5] = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v5, (uint64_t)node, v8);
  _Block_object_dispose(v9, 8);
}

- (BOOL)usesDefaultMomentOfInertia
{
  return !self->_explicitMomentOfInertia;
}

- (void)setCharge:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_charge = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B190332C;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)charge
{
  return self->_charge;
}

- (BOOL)isResting
{
  _DWORD *body;
  int v3;

  body = self->_body;
  if (!body)
    return 0;
  v3 = body[61];
  return v3 == 2 || v3 == 5;
}

- (void)updateGlobalScale:(double)a3
{
  uint64_t v3;
  float v4;

  v3 = *((_QWORD *)self->_body + 67);
  if (v3)
  {
    v4 = a3;
    *(float *)(v3 + 64) = v4;
  }
}

- (BOOL)allowsResting
{
  return self->_allowsResting;
}

- (void)setAllowsResting:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  _QWORD v9[5];
  BOOL v10;

  self->_allowsResting = a3;
  v6 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B1903470;
  v9[3] = &unk_1E63D5328;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
}

- (void)setFriction:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_friction = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1903550;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)friction
{
  return self->_friction;
}

- (void)setRestitution:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_restitution = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19035FC;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)restitution
{
  return self->_restitution;
}

- (void)setRollingFriction:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_rollingFriction = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19036A8;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)rollingFriction
{
  return self->_rollingFriction;
}

- (void)setDamping:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_damping = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1903754;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)damping
{
  return self->_damping;
}

- (void)setAngularDamping:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_angularDamping = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1903808;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)angularDamping
{
  return self->_angularDamping;
}

- (void)setLinearRestingThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float angularRestingThreshold;
  uint64_t v8;
  VFXNode *node;
  const char *v10;
  _QWORD v11[5];
  float v12;
  float v13;

  self->_linearRestingThreshold = a3;
  angularRestingThreshold = self->_angularRestingThreshold;
  v8 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B19038C0;
  v11[3] = &unk_1E63D5440;
  v11[4] = self;
  v12 = a3;
  v13 = angularRestingThreshold;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v11);
}

- (float)linearRestingThreshold
{
  return self->_linearRestingThreshold;
}

- (void)setAngularRestingThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float linearRestingThreshold;
  uint64_t v8;
  VFXNode *node;
  const char *v10;
  _QWORD v11[5];
  float v12;
  float v13;

  self->_angularRestingThreshold = a3;
  linearRestingThreshold = self->_linearRestingThreshold;
  v8 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B1903974;
  v11[3] = &unk_1E63D5440;
  v11[4] = self;
  v12 = linearRestingThreshold;
  v13 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v11);
}

- (float)angularRestingThreshold
{
  return self->_angularRestingThreshold;
}

- (float)linearSleepingThreshold
{
  return self->_linearRestingThreshold;
}

- (float)angularSleepingThreshold
{
  return self->_angularRestingThreshold;
}

- (void)_setBtShape:(id)a3
{
  VFXBtShapeWrapper *btShapeWrapper;

  btShapeWrapper = self->_btShapeWrapper;
  if (btShapeWrapper != a3)
  {

    self->_btShapeWrapper = (VFXBtShapeWrapper *)a3;
  }
}

- (void)cleanCollisionCache
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  _DWORD *v22;

  v5 = (void *)objc_msgSend_world(self->_node, a2, v2, v3);
  v9 = (void *)objc_msgSend_physicsWorld(v5, v6, v7, v8);
  v13 = objc_msgSend__handle(v9, v10, v11, v12);
  if (v13)
  {
    v14 = *(_QWORD *)(v13 + 40);
    v15 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v13 + 96) + 72))(*(_QWORD *)(v13 + 96));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v15 + 80))(v15, *((_QWORD *)self->_body + 25), v14);
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 56))(v15);
    v17 = *(_DWORD *)(v16 + 4);
    if (v17 >= 1)
    {
      v18 = v16;
      v19 = 0;
      for (i = 0; i < v17; ++i)
      {
        v21 = *(_QWORD *)(v18 + 16);
        v22 = **(_DWORD ***)(v21 + v19);
        if (v22 == self->_body)
          v22 = **(_DWORD ***)(v21 + v19 + 8);
        if (v22[61] != 4)
        {
          sub_1B21D0364((uint64_t)v22, 1);
          v17 = *(_DWORD *)(v18 + 4);
        }
        v19 += 32;
      }
    }
  }
}

- (void)_updateCollisionShape
{
  uint64_t v2;
  uint64_t v3;
  VFXPhysicsShape *physicsShape;
  float mass;
  BOOL explicitMomentOfInertia;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  __int128 v17;
  VFXNode *node;
  const char *v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  VFXPhysicsBody *v25;
  VFXPhysicsShape *v26;
  uint64_t *v27;
  float v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  physicsShape = self->_physicsShape;
  mass = self->_mass;
  explicitMomentOfInertia = self->_explicitMomentOfInertia;
  v20 = *(_OWORD *)&self->_momentOfInertia[3];
  v21 = *(_OWORD *)&self->_centerOfMassOffset[3];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v8 = (void *)objc_msgSend__owner(self, a2, v2, v3);
  v33 = objc_msgSend_nodeRef(v8, v9, v10, v11);
  v15 = (const void *)v31[3];
  if (v15)
    CFRetain(v15);
  v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
  v17 = v21;
  HIDWORD(v17) = 0;
  node = self->_node;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3321888768;
  v22[2] = sub_1B1903BDC;
  v22[3] = &unk_1E63D0920;
  v25 = self;
  v26 = physicsShape;
  v27 = &v30;
  v28 = mass;
  v29 = explicitMomentOfInertia;
  v23 = v20;
  v24 = v17;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v16, (uint64_t)node, v22);
  _Block_object_dispose(&v30, 8);
}

- (void)setPhysicsShape:(id)DefaultShapeForNode
{
  uint64_t v3;
  BOOL v5;

  if (self->_physicsShape != DefaultShapeForNode)
  {
    if (DefaultShapeForNode)
    {
      v5 = 0;
    }
    else
    {
      DefaultShapeForNode = (id)objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, a2, (uint64_t)self->_node, v3);
      v5 = 1;
    }
    self->_defaultShape = v5;
    MEMORY[0x1E0DE7D20](self, sel__setPhysicsShape_, DefaultShapeForNode, v3);
  }
}

- (VFXPhysicsShape)physicsShape
{
  if (self->_defaultShape)
    return 0;
  else
    return self->_physicsShape;
}

- (BOOL)hasDefaultShape
{
  return self->_defaultShape;
}

- (void)updateDefaultShape
{
  uint64_t v2;
  uint64_t DefaultShapeForNode;
  uint64_t v5;

  DefaultShapeForNode = objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, a2, (uint64_t)self->_node, v2);
  MEMORY[0x1E0DE7D20](self, sel__setPhysicsShape_, DefaultShapeForNode, v5);
}

- (unint64_t)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  unint64_t collisionBitMask;
  unint64_t contactTestBitMask;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t IfNeeded;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VFXNode *node;
  const char *v18;
  _QWORD v19[9];

  self->_categoryBitMask = a3;
  collisionBitMask = self->_collisionBitMask;
  contactTestBitMask = self->_contactTestBitMask;
  v8 = (void *)objc_msgSend_world(self->_node, a2, a3, v3);
  IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    v15 = IfNeeded;
    v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B1903F18;
    v19[3] = &unk_1E63D91E0;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = collisionBitMask;
    v19[8] = contactTestBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (unint64_t)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(unint64_t)a3
{
  uint64_t v3;
  unint64_t categoryBitMask;
  unint64_t contactTestBitMask;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t IfNeeded;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VFXNode *node;
  const char *v18;
  _QWORD v19[9];

  self->_collisionBitMask = a3;
  categoryBitMask = self->_categoryBitMask;
  contactTestBitMask = self->_contactTestBitMask;
  v8 = (void *)objc_msgSend_world(self->_node, a2, a3, v3);
  IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    v15 = IfNeeded;
    v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B190403C;
    v19[3] = &unk_1E63D91E0;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = categoryBitMask;
    v19[8] = contactTestBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (unint64_t)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(unint64_t)a3
{
  uint64_t v3;
  unint64_t categoryBitMask;
  unint64_t collisionBitMask;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t IfNeeded;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VFXNode *node;
  const char *v18;
  _QWORD v19[9];

  self->_contactTestBitMask = a3;
  categoryBitMask = self->_categoryBitMask;
  collisionBitMask = self->_collisionBitMask;
  v8 = (void *)objc_msgSend_world(self->_node, a2, a3, v3);
  IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    v15 = IfNeeded;
    v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B190415C;
    v19[3] = &unk_1E63D91E0;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = collisionBitMask;
    v19[8] = categoryBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (void)setContinuousCollisionDetectionThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  _QWORD v10[5];
  float v11;

  self->_continuousCollisionDetectionThreshold = a3;
  v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B190424C;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)continuousCollisionDetection
{
  return self->_continuousCollisionDetectionThreshold;
}

- (void)setVelocity:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBody *v12;

  v9 = v4;
  *(_OWORD *)self->_velocity = v4;
  v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1904300;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)velocity
{
  __n128 result;
  unint64_t v6;

  if (objc_msgSend_immediateMode(VFXTransaction, a2, a3, a4)
    && (v6 = a1[15].n128_u64[0]) != 0)
  {
    result.n128_u64[0] = *(_QWORD *)(v6 + 352);
  }
  else
  {
    return a1[9];
  }
  return result;
}

- (void)setAffectedByGravity:(BOOL)a3
{
  uint64_t v3;
  VFXNode *node;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t IfNeeded;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  VFXNode *v16;
  _QWORD v17[6];
  BOOL v18;

  self->_ignoreGravity = !a3;
  node = self->_node;
  if (node)
  {
    v7 = (void *)objc_msgSend_world(node, a2, a3, v3);
    IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v7, v8, 0, v9);
    v14 = objc_msgSend_worldRef(self->_node, v11, v12, v13);
  }
  else
  {
    IfNeeded = 0;
    v14 = objc_msgSend_worldRef(0, a2, a3, v3);
  }
  v16 = self->_node;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B190443C;
  v17[3] = &unk_1E63D9208;
  v18 = a3;
  v17[4] = self;
  v17[5] = IfNeeded;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)v16, v17);
}

- (BOOL)isAffectedByGravity
{
  return !self->_ignoreGravity;
}

- (void)setAngularVelocity:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBody *v12;

  v9 = v4;
  *(_OWORD *)self->_angularVelocity = v4;
  v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1904564;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (int8x16_t)angularVelocity
{
  float32x4_t *v5;
  float32x4_t v6;
  float v7;
  int8x16_t result;

  if (objc_msgSend_immediateMode(VFXTransaction, a2, a3, a4)
    && (v5 = (float32x4_t *)a1[15].i64[0]) != 0)
  {
    v6 = v5[23];
    result = (int8x16_t)vmulq_f32(v6, v6);
    v7 = sqrtf(vadd_f32(vpadd_f32(*(float32x2_t *)result.i8, *(float32x2_t *)result.i8), (float32x2_t)*(_OWORD *)&vextq_s8(result, result, 8uLL)).f32[0]);
    result.i64[0] = 0;
    if (v7 > 0.0)
      result.i64[0] = vmulq_n_f32(v6, 1.0 / v7).u64[0];
  }
  else
  {
    return (int8x16_t)a1[5];
  }
  return result;
}

- (void)setVelocityFactor:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBody *v12;

  v9 = v4;
  *(_OWORD *)self->_velocityFactor = v4;
  v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B190467C;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)velocityFactor
{
  return a1[7];
}

- (void)setAngularVelocityFactor:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBody *v12;

  v9 = v4;
  *(_OWORD *)self->_angularVelocityFactor = v4;
  v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1904738;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)angularVelocityFactor
{
  return a1[8];
}

- (void)applyForce:(BOOL)a3 impulse:
{
  uint64_t v3;
  __int128 v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  VFXPhysicsBody *v13;
  BOOL v14;

  v10 = v4;
  v7 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B19047F0;
  v11[3] = &unk_1E63D9230;
  v13 = self;
  v14 = a3;
  v12 = v10;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v11);
}

- (void)applyForce:(VFXPhysicsBody *)self atPosition:(SEL)a2 impulse:(BOOL)a3
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v8;
  VFXNode *node;
  const char *v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  VFXPhysicsBody *v16;
  BOOL v17;

  v11 = v4;
  v12 = v5;
  v8 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B1904918;
  v13[3] = &unk_1E63D9258;
  v16 = self;
  v17 = a3;
  v14 = v11;
  v15 = v12;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v13);
}

- (void)applyTorque:(BOOL)a3 impulse:
{
  uint64_t v3;
  __int128 v4;
  uint64_t v7;
  VFXNode *node;
  const char *v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  VFXPhysicsBody *v13;
  BOOL v14;

  v10 = v4;
  v7 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B1904B60;
  v11[3] = &unk_1E63D9230;
  v13 = self;
  v12 = v10;
  v14 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v11);
}

- (void)_activate
{
  void *body;

  body = self->_body;
  if (body)
    sub_1B21D0384((uint64_t)body, 0);
}

- (void)clearAllForces
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  VFXNode *node;
  const char *v7;
  _QWORD v8[5];

  v5 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1904CBC;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v5, (uint64_t)node, v8);
}

- (void)setResting:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  VFXNode *node;
  const char *v8;
  _QWORD v9[5];
  BOOL v10;

  v6 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B1904D84;
  v9[3] = &unk_1E63D5328;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
}

- (uint64_t)resetToTransform:(uint64_t)a3
{
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v17[4];
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  uint64_t v22;

  v9 = objc_msgSend_worldRef(*(void **)(a1 + 8), a2, a3, a4);
  v10 = *(_QWORD *)(a1 + 8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B1904E48;
  v17[3] = &unk_1E63D6A70;
  v22 = a1;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  return objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v9, v10, v17);
}

- (void)resetTransform
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *node;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VFXNode *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  VFXPhysicsBody *v25;

  node = self->_node;
  if (node)
  {
    objc_msgSend_worldTransform(node, a2, v2, v3);
    v18 = v7;
    v19 = v6;
    v16 = v9;
    v17 = v8;
    v13 = objc_msgSend_worldRef(self->_node, v10, v11, v12);
    v14 = self->_node;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B1904F00;
    v20[3] = &unk_1E63D6A70;
    v25 = self;
    v21 = v19;
    v22 = v18;
    v23 = v17;
    v24 = v16;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v13, (uint64_t)v14, v20);
  }
}

- (void)moveToPosition:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_presentationNode(self->_node, a2, v2, v3);
  objc_msgSend_worldTransform(v5, v6, v7, v8);
  MEMORY[0x1E0DE7D20](self, sel_moveToTransform_, v9, v10);
}

- (void)rotateToAxisAngle:(VFXPhysicsBody *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int8x16_t v22;
  int32x4_t v23;
  __float2 v29;
  __float2 v30;
  __float2 v31;
  unint64_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int8x16_t v35;
  float v36;
  float32x4_t v37;
  unsigned int v38;
  float32x2_t v39;
  unsigned int v40;
  float32x2_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int8x16_t v46;
  unint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  __int128 v54;
  __int128 v55;
  float32x4_t v56;
  __int128 v57;
  _OWORD v58[4];

  v50 = v4;
  v6 = (void *)objc_msgSend_presentationNode(self->_node, a2, v2, v3);
  objc_msgSend_worldTransform(v6, v7, v8, v9);
  v53 = v10;
  v12 = vmulq_f32(v11, v11);
  v13 = vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1));
  v13.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), v13).f32[0]);
  v15 = vmulq_f32(v14, v14);
  v17 = vmulq_f32(v16, v16);
  v13.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
  v13.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
  v52 = v13;
  v15.i32[0] = v50.i32[3];
  v18 = vmulq_f32(v50, v50);
  v18.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).u64[0];
  v19 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 0);
  v19.i32[3] = 0;
  v20 = vrsqrteq_f32(v19);
  v21 = vmulq_f32(v20, vrsqrtsq_f32(v19, vmulq_f32(v20, v20)));
  v22 = (int8x16_t)vmulq_f32(v21, vrsqrtsq_f32(v19, vmulq_f32(v21, v21)));
  v23 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v18.f32[0] != 0.0)), 0x1FuLL));
  v23.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  v49 = (float32x4_t)_Q3;
  v51 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v23), v22, _Q3), v50);
  v31 = __sincosf_stret(v15.f32[0]);
  v32 = 0;
  v33 = v51;
  v34 = vmulq_f32(v33, v33);
  v35 = (int8x16_t)vmlaq_n_f32(v34, vsubq_f32(v49, v34), v31.__cosval);
  v36 = (float)(1.0 - v31.__cosval) * vmulq_lane_f32(v33, *(float32x2_t *)v33.f32, 1).f32[0];
  v37 = vmulq_n_f32(v51, -v31.__sinval);
  v33.f32[0] = v36 - v37.f32[2];
  *(float *)&v38 = v36 + v37.f32[2];
  v39 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v51.f32, v51, 2), 1.0 - v31.__cosval);
  *(float *)&v40 = v39.f32[0] + v37.f32[1];
  v41 = (float32x2_t)vrev64_s32(*(int32x2_t *)v37.f32);
  v42.i32[0] = vsub_f32(v39, v41).u32[0];
  v42.i32[1] = vadd_f32(v39, v41).i32[1];
  v42.i64[1] = vextq_s8(v35, v35, 8uLL).u32[0];
  v43.i32[0] = v35.i32[0];
  v37.f32[0] = v39.f32[1] - v37.f32[0];
  v43.i32[1] = v33.i32[0];
  v43.i64[1] = v40;
  v44.i64[0] = __PAIR64__(v35.u32[1], v38);
  v44.i64[1] = v37.u32[0];
  v45 = vabsq_f32(v52);
  v45.i32[3] = 0;
  v37.i64[0] = 0;
  v33.i64[0] = 0x8000000080000000;
  v33.i64[1] = 0x8000000080000000;
  v46 = vorrq_s8(vandq_s8((int8x16_t)v52, (int8x16_t)v33), (int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v45, (float32x4_t)xmmword_1B2245780) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  v41.i32[0] = 0;
  v41.i32[1] = v46.i32[1];
  v37.i64[1] = v46.u32[2];
  v54 = v46.u32[0];
  v55 = (unint64_t)v41;
  v56 = v37;
  v57 = xmmword_1B2244E20;
  do
  {
    v58[v32 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(__int128 *)((char *)&v54 + v32))), v44, *(float32x2_t *)((char *)&v54 + v32), 1), v42, *(float32x4_t *)((char *)&v54 + v32), 2), (float32x4_t)xmmword_1B2244E20, *(float32x4_t *)((char *)&v54 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  v47 = 0;
  v48 = v53;
  v48.i32[3] = 1.0;
  v54 = v58[0];
  v55 = v58[1];
  v56 = (float32x4_t)v58[2];
  v57 = v58[3];
  do
  {
    v58[v47 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(*(__int128 *)((char *)&v54 + v47))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)((char *)&v54 + v47), 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v54 + v47), 2), v48, *(float32x4_t *)((char *)&v54 + v47), 3);
    v47 += 16;
  }
  while (v47 != 64);
  ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_moveToTransform_, v29, v30);
}

- (uint64_t)moveToTransform:(float32x4_t)a3
{
  float32x4_t v5;
  uint64_t result;
  float32x4_t v8;
  float v9;
  float32x4_t v10;
  float v11;
  float v12;
  float32x4_t v13;
  float v14;
  float v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  int32x4_t v19;
  float32x2_t v20;
  float32x2_t v21;
  int32x4_t v22;
  float v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x4_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t *v31;
  float32x4_t v32;
  uint32x4_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  float v37;
  float v38;
  float32x4_t v39;
  unint64_t v40;
  __int32 v41;
  int v42;
  int32x2_t v43;
  __int32 v44;
  int v45;
  unint64_t v46;
  __int32 v47;
  int v48;
  unint64_t v49;
  unsigned __int32 v50;
  int v51;

  result = a1[30];
  if (result)
  {
    v8 = vmulq_f32(a2, a2);
    LODWORD(v9) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).u32[0];
    v5.f32[0] = sqrtf(v9);
    if (v5.f32[0] != 0.0)
    {
      v10 = vmulq_f32(a3, a3);
      LODWORD(v11) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u32[0];
      v12 = sqrtf(v11);
      if (v12 != 0.0)
      {
        v13 = vmulq_f32(a4, a4);
        LODWORD(v14) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
        v15 = sqrtf(v14);
        if (v15 != 0.0)
        {
          v37 = v15;
          v38 = v12;
          v39 = v5;
          v16 = v9;
          v17 = vrsqrte_f32((float32x2_t)LODWORD(v9));
          v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v17, v17)));
          v19 = (int32x4_t)vmulq_n_f32(a2, vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v18, v18))).f32[0]);
          v18.f32[0] = v11;
          v20 = vrsqrte_f32((float32x2_t)LODWORD(v11));
          v21 = vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20)));
          v22 = (int32x4_t)vmulq_n_f32(a3, vmul_f32(v21, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v21, v21))).f32[0]);
          v23 = v14;
          v24 = vrsqrte_f32((float32x2_t)LODWORD(v14));
          v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v24, v24)));
          v40 = (unint64_t)vzip1_s32(*(int32x2_t *)v19.i8, *(int32x2_t *)v22.i8);
          v26 = vmulq_n_f32(a4, vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v25, v25))).f32[0]);
          v41 = v26.i32[0];
          v42 = 0;
          v43 = vzip2_s32(*(int32x2_t *)v19.i8, *(int32x2_t *)v22.i8);
          v44 = v26.i32[1];
          v45 = 0;
          v46 = vzip2q_s32(v19, v22).u64[0];
          v47 = v26.i32[2];
          v48 = 0;
          v49 = a5.n128_u64[0];
          v50 = a5.n128_u32[2];
          v51 = 0;
          sub_1B21FEE3C();
          v30 = a1[30];
          v31 = *(float32x4_t **)(v30 + 536);
          if (v31)
          {
            v32 = v39;
            v32.f32[1] = v38;
            v32.f32[2] = v37;
            v33 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v31[1], v32));
            v33.i32[3] = v33.i32[2];
            if ((vmaxvq_u32(v33) & 0x80000000) != 0)
            {
              v31[1] = v32;
              v34 = (void *)a1[6];
              if (v34)
              {
                objc_msgSend__setNodeScale_(v34, v27, v28, v29);
              }
              else
              {
                v35 = (void *)a1[31];
                if (v35)
                {
                  v36 = objc_msgSend_btShape(v35, v27, v28, v29);
                  v40 = __PAIR64__(LODWORD(v38), v39.u32[0]);
                  v41 = LODWORD(v37);
                  v42 = 0;
                  (*(void (**)(uint64_t, unint64_t *))(*(_QWORD *)v36 + 48))(v36, &v40);
                }
              }
            }
            else if (a1[7] == 2)
            {
              goto LABEL_14;
            }
            objc_msgSend_cleanCollisionCache(a1, v27, v28, v29);
            v30 = a1[30];
          }
LABEL_14:
          sub_1B1902904(v30);
          return sub_1B21D0384(a1[30], 1);
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
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
  const char *v52;
  uint64_t v53;
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
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t isAffectedByGravity;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;

  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  v7 = objc_alloc((Class)objc_opt_class());
  v11 = objc_msgSend_type(self, v8, v9, v10);
  v15 = (void *)objc_msgSend_physicsShape(self, v12, v13, v14);
  v19 = (id)objc_msgSend_copy(v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithType_shape_(v7, v20, v11, (uint64_t)v19);
  objc_msgSend_mass(self, v22, v23, v24);
  objc_msgSend_setMass_(v21, v25, v26, v27);
  objc_msgSend_charge(self, v28, v29, v30);
  objc_msgSend_setCharge_(v21, v31, v32, v33);
  objc_msgSend_friction(self, v34, v35, v36);
  objc_msgSend_setFriction_(v21, v37, v38, v39);
  objc_msgSend_restitution(self, v40, v41, v42);
  objc_msgSend_setRestitution_(v21, v43, v44, v45);
  objc_msgSend_rollingFriction(self, v46, v47, v48);
  objc_msgSend_setRollingFriction_(v21, v49, v50, v51);
  objc_msgSend_damping(self, v52, v53, v54);
  objc_msgSend_setDamping_(v21, v55, v56, v57);
  objc_msgSend_angularVelocity(self, v58, v59, v60);
  objc_msgSend_setAngularVelocity_(v21, v61, v62, v63);
  objc_msgSend_angularDamping(self, v64, v65, v66);
  objc_msgSend_setAngularDamping_(v21, v67, v68, v69);
  objc_msgSend_linearRestingThreshold(self, v70, v71, v72);
  objc_msgSend_setLinearRestingThreshold_(v21, v73, v74, v75);
  objc_msgSend_angularRestingThreshold(self, v76, v77, v78);
  objc_msgSend_setAngularRestingThreshold_(v21, v79, v80, v81);
  objc_msgSend_velocityFactor(self, v82, v83, v84);
  objc_msgSend_setVelocityFactor_(v21, v85, v86, v87);
  objc_msgSend_angularVelocityFactor(self, v88, v89, v90);
  objc_msgSend_setAngularVelocityFactor_(v21, v91, v92, v93);
  objc_msgSend_velocity(self, v94, v95, v96);
  objc_msgSend_setVelocity_(v21, v97, v98, v99);
  v103 = objc_msgSend_categoryBitMask(self, v100, v101, v102);
  objc_msgSend_setCategoryBitMask_(v21, v104, v103, v105);
  v109 = objc_msgSend_collisionBitMask(self, v106, v107, v108);
  objc_msgSend_setCollisionBitMask_(v21, v110, v109, v111);
  v115 = objc_msgSend_contactTestBitMask(self, v112, v113, v114);
  objc_msgSend_setContactTestBitMask_(v21, v116, v115, v117);
  v121 = objc_msgSend_allowsResting(self, v118, v119, v120);
  objc_msgSend_setAllowsResting_(v21, v122, v121, v123);
  objc_msgSend_angularVelocity(self, v124, v125, v126);
  objc_msgSend_setAngularVelocity_(v21, v127, v128, v129);
  isAffectedByGravity = objc_msgSend_isAffectedByGravity(self, v130, v131, v132);
  objc_msgSend_setAffectedByGravity_(v21, v134, isAffectedByGravity, v135);
  v139 = objc_msgSend_usesDefaultMomentOfInertia(self, v136, v137, v138);
  objc_msgSend_setUsesDefaultMomentOfInertia_(v21, v140, v139, v141);
  objc_msgSend_momentOfInertia(self, v142, v143, v144);
  objc_msgSend_setMomentOfInertia_(v21, v145, v146, v147);
  objc_msgSend_centerOfMassOffset(self, v148, v149, v150);
  objc_msgSend_setCenterOfMassOffset_(v21, v151, v152, v153);
  objc_msgSend_continuousCollisionDetectionThreshold(self, v154, v155, v156);
  objc_msgSend_setContinuousCollisionDetectionThreshold_(v21, v157, v158, v159);
  objc_msgSend_commitImmediate(VFXTransaction, v160, v161, v162);
  return v21;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_createBody
{
  float angularDamping;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  float32x4_t v9;
  float32x4_t v10;
  __int128 v11;
  int v12;
  float32x4_t v14;
  float mass;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float damping;
  float v26;
  float friction;
  __int128 v28;
  char v29;
  __int128 v30;

  mass = self->_mass;
  v16 = 0;
  v23 = 0;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v29 = 0;
  v30 = xmmword_1B2248000;
  v17 = xmmword_1B2244DB0;
  v18 = xmmword_1B2244DD0;
  v19 = xmmword_1B2244D90;
  v20 = 0;
  angularDamping = self->_angularDamping;
  damping = self->_damping;
  v26 = angularDamping;
  v4 = *(_QWORD *)&self->_linearRestingThreshold;
  friction = self->_friction;
  *(int32x2_t *)&v5 = vrev64_s32(*(int32x2_t *)&self->_restitution);
  *((_QWORD *)&v5 + 1) = v4;
  v28 = v5;
  v6 = sub_1B21FF5F0(704, 16);
  sub_1B21FE938(v6, (uint64_t)&mass);
  sub_1B1902894(v6, self->_type);
  v7 = *(_OWORD *)self->_velocity;
  HIDWORD(v7) = 0;
  *(_OWORD *)(v6 + 352) = v7;
  v8 = *(_OWORD *)self->_angularVelocity;
  HIDWORD(v8) = 0;
  *(_OWORD *)(v6 + 368) = v8;
  v9 = *(float32x4_t *)self->_velocityFactor;
  v10 = vmulq_n_f32(v9, *(float *)(v6 + 384));
  v9.i32[3] = 0;
  *(float32x4_t *)(v6 + 400) = v9;
  v10.i32[3] = 0;
  *(float32x4_t *)(v6 + 640) = v10;
  v11 = *(_OWORD *)self->_angularVelocityFactor;
  HIDWORD(v11) = 0;
  *(_OWORD *)(v6 + 624) = v11;
  if (self->_allowsResting)
    v12 = 1;
  else
    v12 = 4;
  sub_1B21D0364(v6, v12);
  *(float *)(v6 + 532) = self->_charge;
  *(float *)(v6 + 288) = self->_continuousCollisionDetectionThreshold;
  if (self->_ignoreGravity)
  {
    *(_DWORD *)(v6 + 576) = 1;
    v14 = 0uLL;
    sub_1B21FEC54((float32x4_t *)v6, &v14);
  }
  return (void *)v6;
}

- (void)_ownerWillDie
{
  self->_node = 0;
}

- (void)_removeOwner
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *node;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *body;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[8];

  node = self->_node;
  v6 = (void *)objc_msgSend_world(node, a2, v2, v3);
  v10 = objc_msgSend_physicsWorld(v6, v7, v8, v9);
  self->_node = 0;
  body = self->_body;
  if (body)
  {
    v15 = v10;
    v16 = objc_msgSend_worldRef(node, v11, v12, v13);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B19057FC;
    v18[3] = &unk_1E63D7ED0;
    v18[4] = node;
    v18[5] = v15;
    v18[6] = self;
    v18[7] = body;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)node, v18);
  }
}

- (void)_setOwner:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *body;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  VFXNode *node;
  uint64_t v31;
  float mass;
  BOOL explicitMomentOfInertia;
  __int128 v34;
  VFXPhysicsShape *DefaultShapeForNode;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  VFXNode *v39;
  const char *v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  __int128 v44;
  __int128 v45;
  id v46;
  VFXPhysicsBody *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  BOOL v54;

  if (self->_node && self->_body)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. VFXPhysicsBody is already attached to a VFXNode"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"!_node || _body == 0");
  self->_node = (VFXNode *)a3;
  v10 = objc_msgSend_nodeRef(a3, a2, (uint64_t)a3, v3);
  body = self->_body;
  v15 = objc_msgSend_categoryBitMask(self, v12, v13, v14);
  v19 = objc_msgSend_collisionBitMask(self, v16, v17, v18);
  v23 = objc_msgSend_contactTestBitMask(self, v20, v21, v22);
  node = self->_node;
  if (node)
  {
    v31 = v23;
    mass = self->_mass;
    explicitMomentOfInertia = self->_explicitMomentOfInertia;
    v34 = *(_OWORD *)&self->_centerOfMassOffset[3];
    HIDWORD(v34) = 0;
    v41 = *(_OWORD *)&self->_momentOfInertia[3];
    v42 = v34;
    if (!self->_physicsShape)
    {
      DefaultShapeForNode = (VFXPhysicsShape *)objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, v24, (uint64_t)node, v25);
      self->_physicsShape = DefaultShapeForNode;
      objc_msgSend_didAddToPhysicsBody_(DefaultShapeForNode, v36, (uint64_t)self, v37);
    }
    v38 = objc_msgSend_worldRef(self, v24, (uint64_t)node, v25);
    v39 = self->_node;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3321888768;
    v43[2] = sub_1B19059B0;
    v43[3] = &unk_1E63D0888;
    v46 = a3;
    v47 = self;
    v48 = v10;
    v49 = body;
    v53 = mass;
    v54 = explicitMomentOfInertia;
    v44 = v41;
    v45 = v42;
    v50 = v15;
    v51 = v19;
    v52 = v31;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v40, v38, (uint64_t)v39, v43);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot attach a body to a null node %p"), 0, v25, v26, v27, v28, v29, (uint64_t)self);
  }
}

- (id)_owner
{
  return self->_node;
}

+ (id)_generateDefaultShapeForNode:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v7;

  if (objc_msgSend_model(a3, a2, (uint64_t)a3, v3))
    v7 = (void *)objc_msgSend_shapeWithModel_(VFXPhysicsShape, v5, 0, v6);
  else
    v7 = (void *)objc_msgSend_shapeWithNode_flattened_(VFXPhysicsShape, v5, (uint64_t)a3, 0);
  return v7;
}

- (void)_setPhysicsShape:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXPhysicsShape *physicsShape;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"shape");
  physicsShape = self->_physicsShape;
  if (physicsShape == a3)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. setting the same shape"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"shape != _physicsShape");
    physicsShape = self->_physicsShape;
  }
  self->_physicsShape = (VFXPhysicsShape *)a3;
  objc_msgSend_didRemoveFromPhysicsBody_(physicsShape, v11, (uint64_t)self, v12);
  objc_msgSend_didAddToPhysicsBody_(self->_physicsShape, v13, (uint64_t)self, v14);
  MEMORY[0x1E0DE7D20](self, sel__updateCollisionShape, v15, v16);
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("momentOfInertia"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_momentOfInertia(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("velocity"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_velocity(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("angularVelocity"), v15))
  {
    v19 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_angularVelocity(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat4_(v19, v20, v21, v22);
  }
  if (objc_msgSend_isEqualToString_(a3, v16, (uint64_t)CFSTR("velocityFactor"), v18))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_velocityFactor(self, v24, v25, v26);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v24, (uint64_t)CFSTR("angularVelocityFactor"), v26))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_angularVelocityFactor(self, v27, v28, v29);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v27, (uint64_t)CFSTR("centerOfMassOffset"), v29))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_centerOfMassOffset(self, v30, v31, v32);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v33.receiver = self;
  v33.super_class = (Class)VFXPhysicsBody;
  return -[VFXPhysicsBody valueForKey:](&v33, sel_valueForKey_, a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
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
  objc_super v43;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("momentOfInertia"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setMomentOfInertia_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("velocity"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setVelocity_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("angularVelocity"), v15))
  {
    objc_msgSend_VFXFloat4Value(a3, v19, v20, v21);
    objc_msgSend_setAngularVelocity_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, (uint64_t)CFSTR("velocityFactor"), v21))
  {
    objc_msgSend_VFXFloat3Value(a3, v25, v26, v27);
    objc_msgSend_setVelocityFactor_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, (uint64_t)CFSTR("angularVelocityFactor"), v27))
  {
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setAngularVelocityFactor_(self, v34, v35, v36);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, (uint64_t)CFSTR("centerOfMassOffset"), v33))
  {
    objc_msgSend_VFXFloat3Value(a3, v37, v38, v39);
    objc_msgSend_setCenterOfMassOffset_(self, v40, v41, v42);
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)VFXPhysicsBody;
    -[VFXPhysicsBody setValue:forKey:](&v43, sel_setValue_forKey_, a3, a4);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  VFXPhysicsShape *physicsShape;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("mass"), v3, self->_mass);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("charge"), v7, self->_charge);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("friction"), v9, self->_friction);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("restitution"), v11, self->_restitution);
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("rollingFriction"), v13, self->_rollingFriction);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("ccdThreshold"), v15, self->_continuousCollisionDetectionThreshold);
  physicsShape = self->_physicsShape;
  if (physicsShape)
    objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)physicsShape, (uint64_t)CFSTR("physicsShape"));
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_type, (uint64_t)CFSTR("type"));
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("damping"), v19, self->_damping);
  sub_1B18BD23C(a3, CFSTR("angularVelocity"), *(__n128 *)self->_angularVelocity);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("angularDamping"), v21, self->_angularDamping);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("linearRestingThreshold"), v23, self->_linearRestingThreshold);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("angularRestingThreshold"), v25, self->_angularRestingThreshold);
  sub_1B18BD1D8(a3, CFSTR("velocityFactor"), *(__n128 *)self->_velocityFactor);
  sub_1B18BD1D8(a3, CFSTR("angularVelocityFactor"), *(__n128 *)self->_angularVelocityFactor);
  sub_1B18BD1D8(a3, CFSTR("velocity"), *(__n128 *)self->_velocity);
  objc_msgSend_encodeBool_forKey_(a3, v26, self->_ignoreGravity, (uint64_t)CFSTR("ignoreGravity"));
  objc_msgSend_encodeBool_forKey_(a3, v27, self->_explicitMomentOfInertia, (uint64_t)CFSTR("explicitMomentOfInertia"));
  sub_1B18BD1D8(a3, CFSTR("momentOfInertia"), *(__n128 *)&self->_momentOfInertia[3]);
  sub_1B18BD1D8(a3, CFSTR("centerOfMassOffset"), *(__n128 *)&self->_centerOfMassOffset[3]);
  objc_msgSend_encodeInteger_forKey_(a3, v28, self->_categoryBitMask, (uint64_t)CFSTR("categoryBitMask"));
  objc_msgSend_encodeInteger_forKey_(a3, v29, self->_collisionBitMask, (uint64_t)CFSTR("collisionBitMask"));
  objc_msgSend_encodeInteger_forKey_(a3, v30, self->_contactTestBitMask, (uint64_t)CFSTR("contactTestBitMask"));
  objc_msgSend_encodeBool_forKey_(a3, v31, self->_allowsResting, (uint64_t)CFSTR("allowsResting"));
  objc_msgSend_encodeBool_forKey_(a3, v32, self->_defaultShape, (uint64_t)CFSTR("defaultShape"));
}

- (VFXPhysicsBody)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsBody *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
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
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const __CFString *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  double v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const __CFString *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  int v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  int v110;
  const char *v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  objc_super v147;

  v147.receiver = self;
  v147.super_class = (Class)VFXPhysicsBody;
  v7 = -[VFXPhysicsBody init](&v147, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("charge"), v12);
    *(float *)&v13 = v13;
    objc_msgSend_setCharge_(v7, v14, v15, v16, v13);
    objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("friction"), v18);
    *(float *)&v19 = v19;
    objc_msgSend_setFriction_(v7, v20, v21, v22, v19);
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("restitution"), v24);
    *(float *)&v25 = v25;
    objc_msgSend_setRestitution_(v7, v26, v27, v28, v25);
    objc_msgSend_decodeDoubleForKey_(a3, v29, (uint64_t)CFSTR("rollingFriction"), v30);
    *(float *)&v31 = v31;
    objc_msgSend_setRollingFriction_(v7, v32, v33, v34, v31);
    if (objc_msgSend_containsValueForKey_(a3, v35, (uint64_t)CFSTR("defaultShape"), v36))
      v7->_defaultShape = objc_msgSend_decodeBoolForKey_(a3, v37, (uint64_t)CFSTR("defaultShape"), v38);
    v39 = objc_opt_class();
    v41 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, (uint64_t)CFSTR("physicsShape"));
    if (v41)
      objc_msgSend_setPhysicsShape_(v7, v42, v41, v43);
    if (objc_msgSend_containsValueForKey_(a3, v42, (uint64_t)CFSTR("ccdThreshold"), v43))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v44, (uint64_t)CFSTR("ccdThreshold"), v45);
      *(float *)&v46 = v46;
      objc_msgSend_setContinuousCollisionDetectionThreshold_(v7, v47, v48, v49, v46);
    }
    v50 = objc_msgSend_decodeIntegerForKey_(a3, v44, (uint64_t)CFSTR("type"), v45);
    objc_msgSend_setType_(v7, v51, v50, v52);
    objc_msgSend_decodeDoubleForKey_(a3, v53, (uint64_t)CFSTR("mass"), v54);
    *(float *)&v55 = v55;
    objc_msgSend_setMass_(v7, v56, v57, v58, v55);
    objc_msgSend_decodeDoubleForKey_(a3, v59, (uint64_t)CFSTR("damping"), v60);
    *(float *)&v61 = v61;
    objc_msgSend_setDamping_(v7, v62, v63, v64, v61);
    *(_QWORD *)&v65 = sub_1B18BD344(a3, CFSTR("angularVelocity")).n128_u64[0];
    objc_msgSend_setAngularVelocity_(v7, v66, v67, v68, v65);
    objc_msgSend_decodeDoubleForKey_(a3, v69, (uint64_t)CFSTR("angularDamping"), v70);
    *(float *)&v71 = v71;
    objc_msgSend_setAngularDamping_(v7, v72, v73, v74, v71);
    v75 = CFSTR("linearRestingThreshold");
    if ((objc_msgSend_containsValueForKey_(a3, v76, (uint64_t)CFSTR("linearRestingThreshold"), v77) & 1) != 0
      || (v75 = CFSTR("linearSleepingThreshold"),
          objc_msgSend_containsValueForKey_(a3, v78, (uint64_t)CFSTR("linearSleepingThreshold"), v79)))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v78, (uint64_t)v75, v79);
      *(float *)&v80 = v80;
      objc_msgSend_setLinearRestingThreshold_(v7, v81, v82, v83, v80);
    }
    v84 = CFSTR("angularRestingThreshold");
    if ((objc_msgSend_containsValueForKey_(a3, v78, (uint64_t)CFSTR("angularRestingThreshold"), v79) & 1) != 0
      || (v84 = CFSTR("angularSleepingThreshold"),
          objc_msgSend_containsValueForKey_(a3, v85, (uint64_t)CFSTR("angularSleepingThreshold"), v86)))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v85, (uint64_t)v84, v86);
      *(float *)&v87 = v87;
      objc_msgSend_setAngularRestingThreshold_(v7, v88, v89, v90, v87);
    }
    v91 = sub_1B18BD300(a3, CFSTR("velocityFactor"));
    objc_msgSend_setVelocityFactor_(v7, v92, v93, v94, v91);
    v95 = sub_1B18BD300(a3, CFSTR("angularVelocityFactor"));
    objc_msgSend_setAngularVelocityFactor_(v7, v96, v97, v98, v95);
    v99 = sub_1B18BD300(a3, CFSTR("velocity"));
    objc_msgSend_setVelocity_(v7, v100, v101, v102, v99);
    v105 = objc_msgSend_decodeBoolForKey_(a3, v103, (uint64_t)CFSTR("ignoreGravity"), v104);
    objc_msgSend_setAffectedByGravity_(v7, v106, v105 ^ 1u, v107);
    v110 = objc_msgSend_decodeBoolForKey_(a3, v108, (uint64_t)CFSTR("explicitMomentOfInertia"), v109);
    objc_msgSend_setUsesDefaultMomentOfInertia_(v7, v111, v110 ^ 1u, v112);
    v113 = sub_1B18BD300(a3, CFSTR("momentOfInertia"));
    objc_msgSend_setMomentOfInertia_(v7, v114, v115, v116, v113);
    v117 = sub_1B18BD300(a3, CFSTR("centerOfMassOffset"));
    objc_msgSend_setCenterOfMassOffset_(v7, v118, v119, v120, v117);
    v123 = objc_msgSend_decodeIntegerForKey_(a3, v121, (uint64_t)CFSTR("categoryBitMask"), v122);
    objc_msgSend_setCategoryBitMask_(v7, v124, v123, v125);
    v128 = objc_msgSend_decodeIntegerForKey_(a3, v126, (uint64_t)CFSTR("collisionBitMask"), v127);
    objc_msgSend_setCollisionBitMask_(v7, v129, v128, v130);
    v133 = objc_msgSend_decodeIntegerForKey_(a3, v131, (uint64_t)CFSTR("contactTestBitMask"), v132);
    objc_msgSend_setContactTestBitMask_(v7, v134, v133, v135);
    v138 = objc_msgSend_decodeBoolForKey_(a3, v136, (uint64_t)CFSTR("allowsResting"), v137);
    objc_msgSend_setAllowsResting_(v7, v139, v138, v140);
    v7->_body = (void *)objc_msgSend__createBody(v7, v141, v142, v143);
    objc_msgSend_setImmediateMode_(VFXTransaction, v144, v8, v145);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)continuousCollisionDetectionThreshold
{
  return self->_continuousCollisionDetectionThreshold;
}

- (id)momentOfInertiaValue
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
  objc_msgSend_momentOfInertia(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_momentOfInertia(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_momentOfInertia(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setMomentOfInertiaValue:(id)a3
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
  objc_msgSend_setMomentOfInertia_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)velocityValue
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
  objc_msgSend_velocity(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_velocity(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_velocity(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setVelocityValue:(id)a3
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
  objc_msgSend_setVelocity_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)angularVelocityValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocity(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocity(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocity(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocity(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v37, 4);
}

- (void)setAngularVelocityValue:(id)a3
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
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v34 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v33 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  objc_msgSend_setAngularVelocity_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)velocityFactorValue
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
  objc_msgSend_velocityFactor(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_velocityFactor(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_velocityFactor(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setVelocityFactorValue:(id)a3
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
  objc_msgSend_setVelocityFactor_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)angularVelocityFactorValue
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
  objc_msgSend_angularVelocityFactor(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocityFactor(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_angularVelocityFactor(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setAngularVelocityFactorValue:(id)a3
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
  objc_msgSend_setAngularVelocityFactor_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (void)applyForceValue:(id)a3 impulse:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a4;
  v7 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v19 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v17, 2, v18);
  objc_msgSend_floatValue(v19, v20, v21, v22);
  MEMORY[0x1E0DE7D20](self, sel_applyForce_impulse_, v4, v23);
}

- (void)applyForceValue:(id)a3 atPosition:(id)a4 impulse:(BOOL)a5
{
  _BOOL8 v5;
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

  v5 = a5;
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
  MEMORY[0x1E0DE7D20](self, sel_applyForce_atPosition_impulse_, v5, v43);
}

- (void)applyTorqueValue:(id)a3 impulse:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
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
  uint64_t v29;

  v4 = a4;
  v7 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v19 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v17, 2, v18);
  objc_msgSend_floatValue(v19, v20, v21, v22);
  v25 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v23, 3, v24);
  objc_msgSend_floatValue(v25, v26, v27, v28);
  MEMORY[0x1E0DE7D20](self, sel_applyTorque_impulse_, v4, v29);
}

@end
