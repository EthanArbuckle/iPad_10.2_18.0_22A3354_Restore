@implementation VFXPhysicsJoint

+ (id)joint
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (VFXPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (VFXPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  const void *Value;
  const char *v6;
  uint64_t v7;
  const void *v8;
  const char *v9;
  uint64_t v10;

  Value = CFDictionaryGetValue(a3, self->_bodyA);
  if (Value)
    objc_msgSend_setBodyA_(self, v6, (uint64_t)Value, v7);
  v8 = CFDictionaryGetValue(a3, self->_bodyB);
  if (v8)
    objc_msgSend_setBodyB_(self, v9, (uint64_t)v8, v10);
}

- (btTypedConstraint)_createConstraint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B17C4408(16, (uint64_t)CFSTR("Error: _createConstraint not implemented for %@"), v2, v3, v4, v5, v6, v7, (uint64_t)self);
  return 0;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  if (self->_constraint)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: leaking physics constraint"), v3, v4, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)VFXPhysicsJoint;
  -[VFXPhysicsJoint dealloc](&v9, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_bodyA(self, v5, v6, v7);
  objc_msgSend_setBodyA_(v4, v9, v8, v10);
  v14 = objc_msgSend_bodyB(self, v11, v12, v13);
  objc_msgSend_setBodyB_(v4, v15, v14, v16);
  objc_msgSend_copyFrom_(v4, v17, (uint64_t)self, v18);
  return v4;
}

- (void)setBodyA:(id)a3
{
  VFXPhysicsBody *bodyA;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  VFXPhysicsWorld *physicsWorld;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[5];

  bodyA = self->_bodyA;
  if (bodyA != a3)
  {

    self->_bodyA = (VFXPhysicsBody *)a3;
    physicsWorld = self->_physicsWorld;
    if (physicsWorld)
    {
      v10 = (void *)objc_msgSend_world(physicsWorld, v6, v7, v8);
      v14 = objc_msgSend_worldRef(v10, v11, v12, v13);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1B182B100;
      v16[3] = &unk_1E63D5378;
      v16[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, 0, v16);
    }
  }
}

- (void)setBodyB:(id)a3
{
  VFXPhysicsBody *bodyB;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  VFXPhysicsWorld *physicsWorld;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[5];

  bodyB = self->_bodyB;
  if (bodyB != a3)
  {

    self->_bodyB = (VFXPhysicsBody *)a3;
    physicsWorld = self->_physicsWorld;
    if (physicsWorld)
    {
      v10 = (void *)objc_msgSend_world(physicsWorld, v6, v7, v8);
      v14 = objc_msgSend_worldRef(v10, v11, v12, v13);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1B182B1A8;
      v16[3] = &unk_1E63D5378;
      v16[4] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, 0, v16);
    }
  }
}

- (btTypedConstraint)_handle
{
  return self->_constraint;
}

- (id)physicsWorld
{
  return self->_physicsWorld;
}

- (BOOL)isActive
{
  return self->_constraint != 0;
}

- (void)_addToPhysicsWorld:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_physicsWorld)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: _addToPhysicsWorld - already in a world?"), (uint64_t)a3, v3, v4, v5, v6, v7, v13);
    objc_msgSend__removeConstraint(self, v10, v11, v12);
  }
  if (self->_constraint)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: _addToPhysicsWorld - already added?"), (uint64_t)a3, v3, v4, v5, v6, v7, v14);
  }
  else
  {
    self->_physicsWorld = (VFXPhysicsWorld *)a3;
    MEMORY[0x1E0DE7D20](self, sel__updateContraintAndAddToWorld_, a3, v3);
  }
}

- (void)_updateContraintAndAddToWorld:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  btTypedConstraint *Constraint;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (self->_physicsWorld)
  {
    objc_msgSend__removeConstraint(self, a2, (uint64_t)a3, v3);
    Constraint = (btTypedConstraint *)objc_msgSend__createConstraint(self, v6, v7, v8);
    self->_constraint = Constraint;
    if (Constraint)
    {
      v13 = objc_msgSend__handle(a3, v10, v11, v12);
      (*(void (**)(uint64_t, btTypedConstraint *, _QWORD))(*(_QWORD *)v13 + 112))(v13, self->_constraint, 0);
    }
  }
}

- (void)_removeConstraint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  btTypedConstraint *constraint;

  if (self->_constraint)
  {
    v5 = objc_msgSend__handle(self->_physicsWorld, a2, v2, v3);
    if (v5)
      (*(void (**)(uint64_t, btTypedConstraint *))(*(_QWORD *)v5 + 120))(v5, self->_constraint);
    constraint = self->_constraint;
    if (constraint)
      (*((void (**)(btTypedConstraint *))constraint->var0 + 1))(constraint);
    self->_constraint = 0;
  }
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  uint64_t v3;

  objc_msgSend__removeConstraint(self, a2, (uint64_t)a3, v3);
  self->_physicsWorld = 0;
}

- (void)encodeWithCoder:(id)a3
{
  VFXPhysicsBody *bodyA;
  VFXPhysicsBody *bodyB;

  bodyA = self->_bodyA;
  if (bodyA)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)bodyA, (uint64_t)CFSTR("bodyA"));
  bodyB = self->_bodyB;
  if (bodyB)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)bodyB, (uint64_t)CFSTR("bodyB"));
}

- (VFXPhysicsJoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsJoint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VFXPhysicsJoint;
  v7 = -[VFXPhysicsJoint init](&v18, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = objc_opt_class();
    v7->_bodyA = (VFXPhysicsBody *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("bodyA"));
    v13 = objc_opt_class();
    v7->_bodyB = (VFXPhysicsBody *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("bodyB"));
    objc_msgSend_setImmediateMode_(VFXTransaction, v15, v8, v16);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
