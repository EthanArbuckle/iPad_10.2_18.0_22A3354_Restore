@implementation VFXMorpher

- (VFXMorpher)init
{
  VFXMorpher *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXMorpher;
  v2 = -[VFXMorpher init](&v12, sel_init);
  if (v2)
  {
    v3 = sub_1B19417F8();
    v2->_morpher = (__CFXMorph *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (VFXMorpher)initWithMorphRef:(__CFXMorph *)a3
{
  VFXMorpher *v4;
  __CFXMorph *v5;
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
  v17.super_class = (Class)VFXMorpher;
  v4 = -[VFXMorpher init](&v17, sel_init);
  if (v4)
  {
    v5 = (__CFXMorph *)CFRetain(a3);
    v4->_morpher = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationMorpherWithMorphRef:(__CFXMorph *)a3
{
  VFXMorpher *v4;
  VFXMorpher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXMorpher;
  v4 = -[VFXMorpher init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_morpher = (__CFXMorph *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXMorpher)morpherWithMorphRef:(__CFXMorph *)a3
{
  VFXMorpher *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXMorpher *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXMorpher *)(id)objc_msgSend_initWithMorphRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)morpher
{
  return objc_alloc_init((Class)a1);
}

- (void)clearInBetweens
{

  self->_mainTargetsAndInBetweens = 0;
  self->_inBetweenCounts = 0;
  self->_inBetweenInfluenceWeights = 0;
}

- (void)clearCorrectives
{

  self->_correctiveInBetweenInfluenceWeights = 0;
  *(_OWORD *)&self->_correctiveDriverIndices = 0u;
  *(_OWORD *)&self->_correctivesAndInBetweens = 0u;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMorph *morpher;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  _QWORD v14[5];

  morpher = self->_morpher;
  if (morpher)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      sub_1B193E768((uint64_t)morpher, 0, v2, v3, v4, v5, v6, v7);
      morpher = self->_morpher;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B194FEF0;
    v14[3] = &unk_1E63D4AB0;
    v14[4] = morpher;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v14);
  }
  objc_msgSend_clearInBetweens(self, a2, v2, v3);
  objc_msgSend_clearCorrectives(self, v10, v11, v12);

  free(self->_weights);
  v13.receiver = self;
  v13.super_class = (Class)VFXMorpher;
  -[VFXMorpher dealloc](&v13, sel_dealloc);
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
      v15[2] = sub_1B194FFA8;
      v15[3] = &unk_1E63D53C8;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (id)name
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  v5 = (void *)sub_1B193E568(v15, v16, v17, v18, v19, v20, v21, v22);
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

- (__CFXMorph)morphRef
{
  return self->_morpher;
}

- (NSString)description
{
  uint64_t v2;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<VFXMorpher %p>"), v2, self);
}

- (void)__CFObject
{
  return self->_morpher;
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
    v22[2] = sub_1B19502FC;
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
  v12[2] = sub_1B19504CC;
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
  v14[2] = sub_1B1950578;
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
    v13[2] = sub_1B1950634;
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
    v15[2] = sub_1B19506F8;
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
    v29[2] = sub_1B1950BD8;
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
  v14[2] = sub_1B1950D04;
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
  v8[2] = sub_1B1950DB0;
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
  __CFXMorph *morpher;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFArray *v22;
  __CFArray *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CFIndex Count;
  BOOL v31;
  CFIndex v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  unint64_t v49;
  NSArray *inBetweenCounts;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  unint64_t v61;
  NSArray *inBetweenInfluenceWeights;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  unint64_t v75;
  NSArray *correctiveDriverCounts;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  id v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  unint64_t v85;
  NSArray *correctiveDriverIndices;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  unint64_t v95;
  NSArray *correctiveInBetweenCounts;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  unint64_t v107;
  NSArray *correctiveInBetweenInfluenceWeights;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  morpher = self->_morpher;
  if (!morpher)
    goto LABEL_32;
  self->_unifyNormal = sub_1B1942600((uint64_t)self->_morpher) ^ 1;
  self->_useSparseTargets = sub_1B1942C9C((uint64_t)morpher, v15, v16, v17, v18, v19, v20, v21);
  v22 = sub_1B1942078((uint64_t)morpher);
  if (v22)
  {
    v23 = v22;

    objc_msgSend_clearInBetweens(self, v24, v25, v26);
    objc_msgSend_clearCorrectives(self, v27, v28, v29);
    self->_mainTargets = (NSArray *)sub_1B1951180(v23);
    Count = CFArrayGetCount(v23);
    v31 = Count > 0;
    if (Count >= 1)
    {
      v32 = Count;
      self->_weightCount = Count;
      v33 = 0;
      self->_weights = (float *)malloc_type_realloc(self->_weights, 4 * Count, 0x100004052888210uLL);
      do
      {
        self->_weights[v33] = sub_1B1942214((uint64_t)morpher, v33, v34, v35, v36, v37, v38, v39);
        ++v33;
      }
      while (v32 != v33);
    }
    CFRelease(v23);
  }
  else
  {
    v31 = 0;
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v122 = 0u;
  sub_1B1941894((uint64_t)morpher, (uint64_t)&v122);
  v40 = DWORD1(v122);
  if (DWORD1(v122))
  {
    v41 = (v122 + DWORD1(v122));
    v42 = (void *)sub_1B17A0A4C((uint64_t)morpher);
    self->_mainTargetsAndInBetweens = (NSArray *)sub_1B19512AC(v42, 0, v41, v43);
    v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_inBetweenCounts = (NSArray *)objc_msgSend_initWithCapacity_(v44, v45, v122, v46);
    if ((_DWORD)v122)
    {
      v49 = 0;
      do
      {
        inBetweenCounts = self->_inBetweenCounts;
        v51 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v47, *(unsigned int *)(*((_QWORD *)&v122 + 1) + 4 * v49), v48);
        objc_msgSend_addObject_(inBetweenCounts, v52, v51, v53);
        ++v49;
      }
      while (v49 < v122);
    }
    v54 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_inBetweenInfluenceWeights = (NSArray *)objc_msgSend_initWithCapacity_(v54, v55, DWORD1(v122), v56);
    v40 = DWORD1(v122);
    if (DWORD1(v122))
    {
      v61 = 0;
      do
      {
        LODWORD(v60) = *(_DWORD *)(v123 + 4 * v61);
        inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
        v63 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v57, v58, v59, v60);
        objc_msgSend_addObject_(inBetweenInfluenceWeights, v64, v63, v65);
        ++v61;
        v40 = DWORD1(v122);
      }
      while (v61 < DWORD1(v122));
    }
  }
  if (DWORD2(v123))
  {
    v66 = (const char *)(v40 + v122);
    v67 = (DWORD2(v125) + DWORD2(v123));
    v68 = (void *)sub_1B17A0A4C((uint64_t)morpher);
    self->_correctivesAndInBetweens = (NSArray *)sub_1B19512AC(v68, v66, v67, v69);
    v70 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_correctiveDriverCounts = (NSArray *)objc_msgSend_initWithCapacity_(v70, v71, DWORD2(v123), v72);
    if (DWORD2(v123))
    {
      v75 = 0;
      do
      {
        correctiveDriverCounts = self->_correctiveDriverCounts;
        v77 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v73, *(unsigned int *)(v124 + 4 * v75), v74);
        objc_msgSend_addObject_(correctiveDriverCounts, v78, v77, v79);
        ++v75;
      }
      while (v75 < DWORD2(v123));
    }
    v80 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_correctiveDriverIndices = (NSArray *)objc_msgSend_initWithCapacity_(v80, v81, DWORD2(v124), v82);
    if (DWORD2(v124))
    {
      v85 = 0;
      do
      {
        correctiveDriverIndices = self->_correctiveDriverIndices;
        v87 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v83, *(unsigned int *)(v125 + 4 * v85), v84);
        objc_msgSend_addObject_(correctiveDriverIndices, v88, v87, v89);
        ++v85;
      }
      while (v85 < DWORD2(v124));
    }
    if (DWORD2(v125))
    {
      v90 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend_initWithCapacity_(v90, v91, DWORD2(v123), v92);
      if (DWORD2(v123))
      {
        v95 = 0;
        do
        {
          correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
          v97 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v93, *(unsigned int *)(v126 + 4 * v95), v94);
          objc_msgSend_addObject_(correctiveInBetweenCounts, v98, v97, v99);
          ++v95;
        }
        while (v95 < DWORD2(v123));
      }
      v100 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend_initWithCapacity_(v100, v101, DWORD2(v125), v102);
      if (DWORD2(v125))
      {
        v107 = 0;
        do
        {
          LODWORD(v106) = *(_DWORD *)(*((_QWORD *)&v126 + 1) + 4 * v107);
          correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
          v109 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v103, v104, v105, v106);
          objc_msgSend_addObject_(correctiveInBetweenInfluenceWeights, v110, v109, v111);
          ++v107;
        }
        while (v107 < DWORD2(v125));
      }
    }
  }
  self->_calculationMode = sub_1B1942070((uint64_t)morpher) == 1;
  if (!v31)
  {
LABEL_32:
    free(self->_weights);
    self->_weightCount = 0;
  }
  objc_msgSend__syncEntityObjCModel(self, v112, v113, v114);
  if (v13)
    sub_1B18797B4(v13, v115, v116, v117, v118, v119, v120, v121);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationMorpher
{
  _QWORD *v2;
  VFXMorpher *v3;
  const char *v4;
  uint64_t v5;

  v2 = self;
  if ((*((_BYTE *)self + 16) & 1) == 0)
  {
    v3 = [VFXMorpher alloc];
    return (id)objc_msgSend_initPresentationMorpherWithMorphRef_(v3, v4, v2[1], v5);
  }
  return self;
}

+ (id)presentationMorpherWithMorpherRef:(__CFXMorpher *)a3
{
  uint64_t v3;
  VFXMorpher *v4;
  const char *v5;
  uint64_t v6;

  v3 = sub_1B17A0A4C((uint64_t)a3);
  v4 = [VFXMorpher alloc];
  return (id)objc_msgSend_initPresentationMorpherWithMorphRef_(v4, v5, v3, v6);
}

- (id)presentationObject
{
  return (id)((uint64_t (*)(VFXMorpher *, char *))MEMORY[0x1E0DE7D20])(self, sel_presentationMorpher);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (void)setTargets:(id)a3
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
  uint64_t v15;
  const char *v16;
  _QWORD v17[6];

  objc_msgSend_clearInBetweens(self, a2, (uint64_t)a3, v3);
  objc_msgSend_clearCorrectives(self, v6, v7, v8);

  self->_mainTargets = (NSArray *)objc_msgSend_copy(a3, v9, v10, v11);
  self->_mainTargetNamesToIndexes = 0;
  v15 = objc_msgSend_worldRef(self, v12, v13, v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B19514B4;
  v17[3] = &unk_1E63D53C8;
  v17[4] = self;
  v17[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
}

- (NSArray)targets
{
  uint64_t v2;
  uint64_t v3;
  NSArray *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFXMorph *morpher;
  __CFArray *v16;
  __CFArray *v17;
  void *v18;

  if ((*((_BYTE *)self + 16) & 1) == 0)
  {
    if (objc_msgSend_count(self->_mainTargets, a2, v2, v3))
      return self->_mainTargets;
    else
      return (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  morpher = self->_morpher;
  if (!morpher || (v16 = sub_1B1942078((uint64_t)morpher)) == 0)
  {
    v18 = 0;
    if (!v14)
      goto LABEL_12;
    goto LABEL_11;
  }
  v17 = v16;
  v18 = sub_1B1951180(v16);
  CFRelease(v17);
  if (v14)
LABEL_11:
    sub_1B18797B4(v14, v7, v8, v9, v10, v11, v12, v13);
LABEL_12:
  result = v18;
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (NSArray)weights
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  double v12;
  unint64_t weightCount;
  unint64_t j;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFXMorph *morpher;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSArray *v33;
  uint64_t i;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v20 = objc_msgSend_worldRef(self, a2, v2, v3);
    v28 = v20;
    if (v20)
      sub_1B187973C(v20, v21, v22, v23, v24, v25, v26, v27);
    morpher = self->_morpher;
    if (morpher)
    {
      v30 = sub_1B194217C((uint64_t)self->_morpher, v21, v22, v23, v24, v25, v26, v27);
      v33 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v31, v30, v32);
      if (v30 >= 1)
      {
        for (i = 0; i != v30; ++i)
        {
          *(float *)&v35 = sub_1B1942214((uint64_t)morpher, i, v22, v23, v24, v25, v26, v27);
          v39 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v36, v37, v38, v35);
          objc_msgSend_addObject_(v33, v40, v39, v41);
        }
      }
      if (!v28)
        goto LABEL_17;
    }
    else
    {
      v33 = 0;
      if (!v28)
      {
LABEL_17:
        if (v33)
          return v33;
        else
          return (NSArray *)MEMORY[0x1E0C9AA60];
      }
    }
    sub_1B18797B4(v28, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_17;
  }
  v5 = objc_msgSend_count(self->_mainTargets, a2, v2, v3);
  v11 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v6, self->_weightCount, v7);
  weightCount = self->_weightCount;
  if (weightCount)
  {
    for (j = 0; j < weightCount; ++j)
    {
      *(float *)&v12 = self->_weights[j];
      v15 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v8, v9, v10, v12);
      objc_msgSend_addObject_(v11, v16, v15, v17);
      weightCount = self->_weightCount;
    }
  }
  v18 = v5 > weightCount;
  v19 = v5 - weightCount;
  if (v18)
  {
    do
    {
      objc_msgSend_addObject_(v11, v8, (uint64_t)&unk_1E6478CB0, v10);
      --v19;
    }
    while (v19);
  }
  return v11;
}

- (void)setWeights:(id)a3
{
  uint64_t v3;
  unint64_t v6;
  float *weights;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t weightCount;
  float v17;
  uint64_t v18;
  const char *v19;
  _QWORD v20[6];

  v6 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  self->_weightCount = v6;
  weights = self->_weights;
  if (v6)
  {
    self->_weights = (float *)malloc_type_realloc(weights, 4 * v6, 0x100004052888210uLL);
    if (self->_weightCount)
    {
      v11 = 0;
      do
      {
        v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v8, v11, v10);
        objc_msgSend_floatValue(v12, v13, v14, v15);
        weightCount = self->_weightCount;
        self->_weights[v11++] = v17;
      }
      while (v11 < weightCount);
    }
  }
  else
  {
    free(weights);
    self->_weights = 0;
  }
  v18 = objc_msgSend_worldRef(self, v8, v9, v10);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1B1951940;
  v20[3] = &unk_1E63D53C8;
  v20[4] = self;
  v20[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v20);
}

- (int64_t)_weightIndexForTargetNamed:(id)a3
{
  uint64_t v3;
  NSDictionary *mainTargetNamesToIndexes;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  mainTargetNamesToIndexes = self->_mainTargetNamesToIndexes;
  if (!mainTargetNamesToIndexes)
  {
    v37 = a3;
    v6 = (void *)objc_msgSend_targets(self, a2, (uint64_t)a3, v3);
    v7 = (void *)MEMORY[0x1E0C99E08];
    v11 = objc_msgSend_count(v6, v8, v9, v10);
    v14 = (void *)objc_msgSend_dictionaryWithCapacity_(v7, v12, v11, v13);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v16)
    {
      v20 = v16;
      v21 = 0;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v6);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend_name(v24, v17, v18, v19))
          {
            v25 = v21 + 1;
            v26 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v17, v21, v19);
            v30 = objc_msgSend_name(v24, v27, v28, v29);
            objc_msgSend_setObject_forKeyedSubscript_(v14, v31, v26, v30);
            v21 = v25;
          }
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v20);
    }
    mainTargetNamesToIndexes = (NSDictionary *)objc_msgSend_copy(v14, v17, v18, v19);
    self->_mainTargetNamesToIndexes = mainTargetNamesToIndexes;
    a3 = v37;
  }
  v32 = (void *)objc_msgSend_objectForKeyedSubscript_(mainTargetNamesToIndexes, a2, (uint64_t)a3, v3);
  if (v32)
    return objc_msgSend_integerValue(v32, v33, v34, v35);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setWeight:(float)a3 forTargetNamed:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;

  v7 = objc_msgSend__weightIndexForTargetNamed_(self, a2, (uint64_t)a4, v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(float *)&v10 = a3;
    objc_msgSend_setWeight_forTargetAtIndex_(self, v8, v7, v9, v10);
  }
}

- (float)weightForTargetNamed:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  float result;

  v5 = objc_msgSend__weightIndexForTargetNamed_(self, a2, (uint64_t)a3, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  objc_msgSend_weightForTargetAtIndex_(self, v6, v5, v7);
  return result;
}

+ (id)weightIndexStringForIndex:(int64_t)a3
{
  uint64_t v3;

  if (qword_1EEF669A8 != -1)
    dispatch_once(&qword_1EEF669A8, &unk_1E63D1310);
  if (a3 > 127)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("weights[%d]"), v3, a3);
  else
    return (id)qword_1EEF665A8[a3];
}

- (void)setWeight:(float)a3 forTargetAtIndex:(unint64_t)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float *v15;
  float *weights;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  float v31;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v23 = objc_msgSend_morphRef(self, a2, a4, v4);
    if (v23)
      sub_1B19422D0(v23, a4, v24, v25, v26, v27, v28, v29, a3);
  }
  else if (objc_msgSend_count(self->_mainTargets, a2, a4, v4) <= a4)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: %@ setWeight:forTargetAtIndex:%d - index out of bounds (%d)"), v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }
  else
  {
    if (self->_weightCount <= a4)
    {
      v15 = (float *)malloc_type_realloc(self->_weights, 4 * (a4 + 1), 0x100004052888210uLL);
      self->_weights = v15;
      bzero(&v15[self->_weightCount], 4 * (a4 + 1 - self->_weightCount));
      self->_weightCount = a4 + 1;
    }
    weights = self->_weights;
    if (weights[a4] != a3)
    {
      weights[a4] = a3;
      v17 = objc_msgSend_weightIndexStringForIndex_(VFXMorpher, v8, a4, v10);
      v21 = objc_msgSend_worldRef(self, v18, v19, v20);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_1B1951E2C;
      v30[3] = &unk_1E63D9B10;
      v30[4] = self;
      v30[5] = a4;
      v31 = a3;
      objc_msgSend_postCommandWithContext_object_key_subscriptIndex_derivedKeyPath_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, CFSTR("weights"), a4, v17, v30);
    }
  }
}

- (float)weightForTargetAtIndex:(unint64_t)a3
{
  uint64_t v3;
  float v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFXMorph *morpher;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v15 = v7;
    if (v7)
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
    morpher = self->_morpher;
    if (morpher)
    {
      v6 = sub_1B1942214((uint64_t)morpher, a3, v9, v10, v11, v12, v13, v14);
      if (!v15)
        return v6;
    }
    else
    {
      v6 = 0.0;
      if (!v15)
        return v6;
    }
    sub_1B18797B4(v15, v8, v9, v10, v11, v12, v13, v14);
    return v6;
  }
  v6 = 0.0;
  if (self->_weightCount > a3)
    return self->_weights[a3];
  return v6;
}

- (float)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFXMorph *morpher;

  if (*(_QWORD *)a4 != objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Presentation instance query targets the wrong world"), v6, v7, v8, v9, v10, v11, (uint64_t)"token->worldRef == world");
  morpher = self->_morpher;
  if (morpher)
    return sub_1B1942214((uint64_t)morpher, a3, v6, v7, v8, v9, v10, v11);
  else
    return 0.0;
}

- (id)targetsAndInBetween
{
  id result;

  result = self->_mainTargetsAndInBetweens;
  if (!result)
    return self->_mainTargets;
  return result;
}

- (id)correctives
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSArray *correctiveInBetweenCounts;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(self->_correctivesAndInBetweens, a2, v2, v3))
    return 0;
  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, v5, v6, v7))
    return self->_correctivesAndInBetweens;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = objc_msgSend_count(self->_correctiveDriverCounts, v8, v9, v10);
  v15 = (void *)objc_msgSend_arrayWithCapacity_(v11, v13, v12, v14);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(correctiveInBetweenCounts, v17, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v18)
  {
    v22 = v18;
    v23 = 0;
    v24 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(correctiveInBetweenCounts);
        v23 += objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v19, v20, v21);
        v28 = objc_msgSend_objectAtIndexedSubscript_(self->_correctivesAndInBetweens, v26, v23 - 1, v27);
        objc_msgSend_addObject_(v15, v29, v28, v30);
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(correctiveInBetweenCounts, v19, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v22);
  }
  return v15;
}

- (id)correctivesAndInBetween
{
  return self->_correctivesAndInBetweens;
}

- (void)_updateTargetsAndInBetween:(id)a3
{
  uint64_t v3;
  NSArray *mainTargetsAndInBetweens;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens)
    mainTargetsAndInBetweens = self->_mainTargets;
  v7 = objc_msgSend_count(mainTargetsAndInBetweens, a2, (uint64_t)a3, v3);
  if (v7 != objc_msgSend_count(a3, v8, v9, v10))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Update can't be done in place"), v12, v13, v14, v15, v16, v17, (uint64_t)"oldTargetsAndInBetweens.count == targetsAndInBetweens.count");
  objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(self, v11, (uint64_t)a3, (uint64_t)self->_inBetweenCounts, self->_inBetweenInfluenceWeights, self->_correctivesAndInBetweens, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (void)_updateCorrectivesAndInBetween:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *mainTargetsAndInBetweens;

  v6 = objc_msgSend_count(self->_correctivesAndInBetweens, a2, (uint64_t)a3, v3);
  if (v6 != objc_msgSend_count(a3, v7, v8, v9))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Update can't be done in place"), v11, v12, v13, v14, v15, v16, (uint64_t)"_correctivesAndInBetweens.count == correctivesAndInBetweens.count");
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens)
    mainTargetsAndInBetweens = self->_mainTargets;
  objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(self, v10, (uint64_t)mainTargetsAndInBetweens, (uint64_t)self->_inBetweenCounts, self->_inBetweenInfluenceWeights, a3, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (id)inBetweenCounts
{
  return self->_inBetweenCounts;
}

- (id)inBetweenWeights
{
  return self->_inBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (!objc_msgSend_count(self->_inBetweenCounts, a2, a3, v3))
    return 0;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v6, a3, v7);
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  v15 = v12 - 1;
  if (v12 == 1)
    return 0;
  if (a3)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v13, v16, v14);
      v17 += objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    v17 = 0;
  }
  return (id)objc_msgSend_subarrayWithRange_(self->_mainTargetsAndInBetweens, v13, v17, v15);
}

- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (!objc_msgSend_count(self->_inBetweenCounts, a2, a3, v3))
    return 0;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v6, a3, v7);
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  v15 = v12 - 1;
  if (v12 == 1)
    return 0;
  if (a3)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v13, v16, v14);
      v17 = v17 + objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21) - 1;
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    v17 = 0;
  }
  return (id)objc_msgSend_subarrayWithRange_(self->_inBetweenInfluenceWeights, v13, v17, v15);
}

- (id)correctiveDriverCounts
{
  return self->_correctiveDriverCounts;
}

- (id)correctiveDriverIndices
{
  return self->_correctiveDriverIndices;
}

- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  if (!objc_msgSend_count(self->_correctiveDriverCounts, a2, a3, v3))
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v6, a3, v7);
  return objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
}

- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  if (!objc_msgSend_count(self->_correctiveDriverCounts, a2, a3, v3))
    return 0;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v6, a3, v7);
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  if (!objc_msgSend_count(self->_correctiveDriverIndices, v13, v14, v15))
    return 0;
  if (a3)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v16, v18, v17);
      v19 += objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23);
      ++v18;
    }
    while (a3 != v18);
  }
  else
  {
    v19 = 0;
  }
  return (id)objc_msgSend_subarrayWithRange_(self->_correctiveDriverIndices, v16, v19, v12);
}

- (id)correctiveInBetweenCounts
{
  return self->_correctiveInBetweenCounts;
}

- (id)correctiveInBetweenWeights
{
  return self->_correctiveInBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, a2, a3, v3))
    return 0;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v6, a3, v7);
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  v15 = v12 - 1;
  if (v12 == 1)
    return 0;
  if (a3)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v13, v16, v14);
      v17 += objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    v17 = 0;
  }
  return (id)objc_msgSend_subarrayWithRange_(self->_correctivesAndInBetweens, v13, v17, v15);
}

- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, a2, a3, v3))
    return 0;
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v6, a3, v7);
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  v15 = v12 - 1;
  if (v12 == 1)
    return 0;
  if (a3)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v13, v16, v14);
      v17 = v17 + objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21) - 1;
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    v17 = 0;
  }
  return (id)objc_msgSend_subarrayWithRange_(self->_correctiveInBetweenInfluenceWeights, v13, v17, v15);
}

- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5
{
  objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0, 0);
}

- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10
{
  id v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSArray *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  NSArray *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSArray *mainTargetsAndInBetweens;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSArray *mainTargets;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  NSArray *inBetweenInfluenceWeights;
  NSArray *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSArray *inBetweenCounts;
  NSArray *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSArray *correctivesAndInBetweens;
  NSArray *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  NSArray *correctiveDriverCounts;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSArray *correctiveDriverIndices;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  NSArray *correctiveInBetweenCounts;
  id v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  NSArray *correctiveInBetweenInfluenceWeights;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  id v117;
  VFXMorpher *v118;
  char v119;
  BOOL v120;
  BOOL v121;
  BOOL v122;
  _QWORD v123[13];
  char v124;
  BOOL v125;
  BOOL v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  NSArray *v131;
  NSArray *v132;
  NSArray *v133;
  NSArray *v134;
  _BYTE v135[128];
  uint64_t v136;

  v17 = a9;
  v136 = *MEMORY[0x1E0C80C00];
  v133 = (NSArray *)a4;
  v134 = (NSArray *)a3;
  v131 = (NSArray *)a6;
  v132 = (NSArray *)a5;
  v18 = objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v25 = objc_msgSend_count(a6, v19, v20, v21);
  if (v25)
  {
    v120 = 1;
    v26 = objc_msgSend_count(v17, v22, v23, v24);
    v27 = v26 != 0;
    if (!v18)
    {
      if (!v26)
      {
        v27 = 0;
        goto LABEL_26;
      }
      v27 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    if (!v18)
    {
      objc_msgSend_setTargets_(self, v22, (uint64_t)a3, v24);
      return;
    }
    v120 = v25 != 0;
    v27 = 0;
  }
  if (sub_1B1952AEC((_BOOL8)self, (char *)a3, a4, a5))
  {
    v117 = a8;
    sub_1B1952CA0(self, (const char *)&v134, (void **)&v133, (void **)&v132);
    v121 = v27;
    if (v27)
      sub_1B1952CA0(self, (const char *)&v131, &a9, &a10);
    v118 = self;
    v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v35 = v133;
    v39 = objc_msgSend_count(v133, v36, v37, v38);
    v42 = (NSArray *)objc_msgSend_initWithCapacity_(v34, v40, v39, v41);
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v43, (uint64_t)&v127, (uint64_t)v135, 16);
    v48 = v134;
    if (v44)
    {
      v49 = v44;
      v50 = 0;
      v51 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v128 != v51)
            objc_enumerationMutation(v35);
          v50 += objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v127 + 1) + 8 * i), v45, v46, v47);
          if (v50 - 1 >= (unint64_t)objc_msgSend_count(v48, v53, v54, v55))
            sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Invalid in-between count (out of bounds) passed to morpher initialization"), v57, v58, v59, v60, v61, v62, (uint64_t)"inBetweenIndex < targetsAndInBetweens.count");
          v63 = objc_msgSend_objectAtIndexedSubscript_(v48, v56, v50 - 1, v58);
          objc_msgSend_addObject_(v42, v64, v63, v65);
        }
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v45, (uint64_t)&v127, (uint64_t)v135, 16);
      }
      while (v49);
    }
    self = v118;

    v118->_mainTargets = v42;
    mainTargetsAndInBetweens = v118->_mainTargetsAndInBetweens;
    if (mainTargetsAndInBetweens != v48)
    {

      v118->_mainTargetsAndInBetweens = (NSArray *)objc_msgSend_copy(v48, v67, v68, v69);
    }
    v119 = 1;
    a8 = v117;
    v27 = v121;
    goto LABEL_29;
  }
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: invalid in-between buffer, ignoring in-betweens"), v28, v29, v30, v31, v32, v33, v116);
  if (v27)
LABEL_23:
    sub_1B1952CA0(self, (const char *)&v131, &a9, &a10);
LABEL_26:
  mainTargets = self->_mainTargets;
  v48 = v134;
  if (mainTargets != v134)
  {

    self->_mainTargets = (NSArray *)objc_msgSend_copy(v48, v71, v72, v73);
  }

  v119 = 0;
  self->_mainTargetsAndInBetweens = 0;
LABEL_29:

  self->_mainTargetNamesToIndexes = 0;
  free(self->_weights);
  self->_weightCount = 0;
  self->_weights = 0;
  inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
  v77 = v132;
  if (inBetweenInfluenceWeights != v132)
  {

    self->_inBetweenInfluenceWeights = (NSArray *)objc_msgSend_copy(v77, v78, v79, v80);
  }
  inBetweenCounts = self->_inBetweenCounts;
  v82 = v133;
  if (inBetweenCounts != v133)
  {

    self->_inBetweenCounts = (NSArray *)objc_msgSend_copy(v82, v83, v84, v85);
  }
  correctivesAndInBetweens = self->_correctivesAndInBetweens;
  v87 = v131;
  if (correctivesAndInBetweens != v131)
  {

    self->_correctivesAndInBetweens = (NSArray *)objc_msgSend_copy(v87, v88, v89, v90);
  }
  correctiveDriverCounts = self->_correctiveDriverCounts;
  if (correctiveDriverCounts != a7)
  {

    self->_correctiveDriverCounts = (NSArray *)objc_msgSend_copy(a7, v92, v93, v94);
  }
  v122 = v27;
  correctiveDriverIndices = self->_correctiveDriverIndices;
  if (correctiveDriverIndices != a8)
  {

    self->_correctiveDriverIndices = (NSArray *)objc_msgSend_copy(a8, v96, v97, v98);
  }
  v99 = a7;
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  v101 = a9;
  if (correctiveInBetweenCounts != a9)
  {

    self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend_copy(v101, v102, v103, v104);
  }
  correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
  v106 = a10;
  if (correctiveInBetweenInfluenceWeights != a10)
  {

    self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend_copy(v106, v107, v108, v109);
  }
  if (v25)
    v48 = (NSArray *)objc_msgSend_arrayByAddingObjectsFromArray_(v48, v74, (uint64_t)v87, v75);
  v110 = sub_1B195151C(v48);
  v114 = objc_msgSend_worldRef(self, v111, v112, v113);
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = sub_1B19530AC;
  v123[3] = &unk_1E63D9B38;
  v124 = v119;
  v123[4] = v82;
  v123[5] = v77;
  v125 = v120;
  v123[6] = v134;
  v123[7] = v99;
  v126 = v122;
  v123[8] = a8;
  v123[9] = v101;
  v123[10] = v106;
  v123[11] = self;
  v123[12] = v110;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v115, v114, (uint64_t)self, v123);

}

- (void)setCalculationMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_calculationMode != a3)
  {
    self->_calculationMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1953510;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)calculationMode
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFXMorph *morpher;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    morpher = self->_morpher;
    if (morpher)
    {
      v5 = sub_1B1942070((uint64_t)morpher) == 1;
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, v7, v8, v9, v10, v11, v12, v13);
    return v5;
  }
  return self->_calculationMode;
}

- (BOOL)unifiesNormals
{
  return self->_unifyNormal;
}

- (void)setUnifiesNormals:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_unifyNormal != a3)
  {
    self->_unifyNormal = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1953660;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)shouldMorphNormals
{
  return !self->_unifyNormal;
}

- (void)setShouldMorphNormals:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setUnifiesNormals_(self, a2, !a3, v3);
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_1B1942EF4((uint64_t)self->_morpher, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B1942F3C((uint64_t)self->_morpher, a3, a3, v3, v4, v5, v6, v7);
}

- (float)weightIncrementalThreshold
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
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B1942F88((uint64_t)self->_morpher, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B1942F88((uint64_t)self->_morpher, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setWeightIncrementalThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19537B0;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (void)convertToAdditiveWithBaseMesh:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1953858;
  v8[3] = &unk_1E63D53C8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)_isUsingSparseTargets
{
  return self->_useSparseTargets;
}

- (void)convertToSparseWithBaseMesh:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1953988;
  v8[3] = &unk_1E63D53C8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
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

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSArray *inBetweenCounts;
  NSArray *mainTargetsAndInBetweens;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  unint64_t weightCount;
  uint64_t i;
  const char *v43;
  uint64_t v44;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v4[161] = self->_useSparseTargets;
  inBetweenCounts = self->_inBetweenCounts;
  if (inBetweenCounts || self->_correctiveDriverCounts)
  {
    mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
    if (!mainTargetsAndInBetweens)
      mainTargetsAndInBetweens = self->_mainTargets;
    objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(v4, v10, (uint64_t)mainTargetsAndInBetweens, (uint64_t)inBetweenCounts, self->_inBetweenInfluenceWeights, self->_correctivesAndInBetweens, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
  }
  else
  {
    v38 = objc_msgSend_targets(self, v10, v11, 0);
    objc_msgSend_setTargets_(v4, v39, v38, v40);
    weightCount = self->_weightCount;
    if (weightCount)
    {
      for (i = 0; i != weightCount; ++i)
      {
        objc_msgSend_weightForTargetAtIndex_(self, v14, i, v16);
        objc_msgSend_setWeight_forTargetAtIndex_(v4, v43, i, v44);
      }
    }
  }
  v17 = objc_msgSend_calculationMode(self, v14, v15, v16);
  objc_msgSend_setCalculationMode_(v4, v18, v17, v19);
  v23 = objc_msgSend_name(self, v20, v21, v22);
  objc_msgSend_setName_(v4, v24, v23, v25);
  v29 = objc_msgSend_unifiesNormals(self, v26, v27, v28);
  objc_msgSend_setUnifiesNormals_(v4, v30, v29, v31);
  objc_msgSend__copyAnimationsFrom_(v4, v32, (uint64_t)self, v33);
  objc_msgSend_commitImmediate(VFXTransaction, v34, v35, v36);
  return v4;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customDecodingOfVFXMorpher:(id)a3
{
  __CFXMorph *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (__CFXMorph *)sub_1B19417F8();
  self->_morpher = v4;
  if (v4)
    sub_1B193E768((uint64_t)v4, self, v5, v6, v7, v8, v9, v10);
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;

  if (objc_msgSend_rangeOfString_(a3, a2, (uint64_t)CFSTR("weights["), v3)
    || (v9 = (uint64_t)v6, (unint64_t)objc_msgSend_length(a3, v6, v7, v8) < 2)
    || (v12 = (void *)objc_msgSend_substringFromIndex_(a3, v10, v9, v11),
        v15 = objc_msgSend_rangeOfString_(v12, v13, (uint64_t)CFSTR("]"), v14),
        v15 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v29.receiver = self;
    v29.super_class = (Class)VFXMorpher;
    return -[VFXMorpher valueForUndefinedKey:](&v29, sel_valueForUndefinedKey_, a3);
  }
  else
  {
    v19 = (void *)objc_msgSend_substringToIndex_(v12, v16, v15, v17);
    v23 = objc_msgSend_integerValue(v19, v20, v21, v22);
    objc_msgSend_weightForTargetAtIndex_(self, v24, v23, v25);
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v26, v27, v28);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  const char *v7;
  uint64_t v8;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  if (objc_msgSend_rangeOfString_(a4, a2, (uint64_t)CFSTR("weights["), (uint64_t)a4)
    || (v10 = (uint64_t)v7, (unint64_t)objc_msgSend_length(a4, v7, v8, v9) < 2)
    || (v13 = (void *)objc_msgSend_substringFromIndex_(a4, v11, v10, v12),
        v16 = objc_msgSend_rangeOfString_(v13, v14, (uint64_t)CFSTR("]"), v15),
        v16 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v29.receiver = self;
    v29.super_class = (Class)VFXMorpher;
    -[VFXMorpher setValue:forUndefinedKey:](&v29, sel_setValue_forUndefinedKey_, a3, a4);
  }
  else
  {
    v19 = (void *)objc_msgSend_substringToIndex_(v13, v17, v16, v18);
    v23 = objc_msgSend_integerValue(v19, v20, v21, v22);
    objc_msgSend_floatValue(a3, v24, v25, v26);
    objc_msgSend_setWeight_forTargetAtIndex_(self, v27, v23, v28);
  }
}

- (void)_customEncodingOfVFXMorpher:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v4 = sub_1B194203C((uint64_t)self->_morpher);
  if (v4)
  {
    v12 = sub_1B193E634(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12)
      objc_msgSend_encodeObject_forKey_(a3, v13, v12, (uint64_t)CFSTR("weightID"));
  }
}

- (void)_didDecodeVFXMorpher:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("weightID"));
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = sub_1B194203C((uint64_t)self->_morpher);
    if (v9)
      sub_1B193E6E0(v9, v8, v10, v11, v12, v13, v14, v15);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSString *name;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXMorpher_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_calculationMode, (uint64_t)CFSTR("calculationMode"));
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_useSparseTargets, (uint64_t)CFSTR("useSparseTargets"));
  if (self->_weightCount)
  {
    v11 = objc_msgSend_weights(self, v8, v9, v10);
    objc_msgSend_encodeObject_forKey_(a3, v12, v11, (uint64_t)CFSTR("weights"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = objc_msgSend_skipMorphTargets(a3, v13, v14, v15);
  else
    v16 = 0;
  if (objc_msgSend_count(self->_inBetweenCounts, v13, v14, v15)
    && objc_msgSend_count(self->_inBetweenInfluenceWeights, v17, v18, v19))
  {
    if ((v16 & 1) == 0)
      objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_mainTargetsAndInBetweens, (uint64_t)CFSTR("targetMeshes"));
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_inBetweenCounts, (uint64_t)CFSTR("inBetweenCounts"));
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_inBetweenInfluenceWeights, (uint64_t)CFSTR("inBetweenInfluenceWeights"));
  }
  else if ((v16 & 1) == 0)
  {
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_mainTargets, (uint64_t)CFSTR("targetMeshes"));
  }
  if (objc_msgSend_count(self->_correctiveDriverCounts, v17, v18, v19)
    && objc_msgSend_count(self->_correctiveDriverIndices, v21, v22, v23))
  {
    if ((v16 & 1) == 0)
      objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctivesAndInBetweens, (uint64_t)CFSTR("correctiveMeshes"));
    objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctiveDriverCounts, (uint64_t)CFSTR("correctiveDriverCounts"));
    objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)self->_correctiveDriverIndices, (uint64_t)CFSTR("correctiveDriverIndices"));
    if (objc_msgSend_count(self->_correctiveInBetweenCounts, v25, v26, v27)
      && objc_msgSend_count(self->_correctiveInBetweenInfluenceWeights, v21, v28, v29))
    {
      objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctiveInBetweenCounts, (uint64_t)CFSTR("correctiveInBetweenCounts"));
      objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)self->_correctiveInBetweenInfluenceWeights, (uint64_t)CFSTR("correctiveInBetweenInfluenceWeights"));
    }
  }
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)name, (uint64_t)CFSTR("name"));
  objc_msgSend_encodeBool_forKey_(a3, v21, !self->_unifyNormal, (uint64_t)CFSTR("shouldMorphNormals"));
  sub_1B18BD9B8(a3, self, v32, v33);
  sub_1B18BDCC8(a3, self, v34, v35);
}

- (VFXMorpher)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMorpher *v7;
  _UNKNOWN **v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
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
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  int v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  unsigned int v130;
  unsigned int v131;
  uint64_t v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  objc_super v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v138.receiver = self;
  v138.super_class = (Class)VFXMorpher;
  v7 = -[VFXMorpher init](&v138, sel_init);
  if (!v7)
    return v7;
  v8 = &off_1E636B000;
  v9 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  objc_msgSend__customDecodingOfVFXMorpher_(v7, v12, (uint64_t)a3, v13);
  v7->_useSparseTargets = objc_msgSend_decodeBoolForKey_(a3, v14, (uint64_t)CFSTR("useSparseTargets"), v15);
  v18 = objc_msgSend_decodeIntegerForKey_(a3, v16, (uint64_t)CFSTR("calculationMode"), v17);
  objc_msgSend_setCalculationMode_(v7, v19, v18, v20);
  v21 = objc_opt_class();
  v23 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v22, v21, (uint64_t)CFSTR("inBetweenCounts"));
  v24 = objc_opt_class();
  v26 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("inBetweenInfluenceWeights"));
  if (v23 | v26)
  {
    v41 = (void *)v26;
    goto LABEL_16;
  }
  v130 = v9;
  v27 = objc_opt_class();
  v23 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("channelTargetCounts"));
  v29 = objc_opt_class();
  v31 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("channelTargetWeights"));
  if (!objc_msgSend_count((void *)v23, v32, v33, v34) || !objc_msgSend_count(v31, v35, v36, v37))
  {
    v41 = 0;
    v23 = 0;
    goto LABEL_15;
  }
  v41 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40);
  if (!objc_msgSend_count((void *)v23, v42, v43, v44))
  {
LABEL_15:
    v9 = v130;
    goto LABEL_16;
  }
  v47 = 0;
  v48 = 0;
  do
  {
    v49 = (void *)objc_msgSend_objectAtIndexedSubscript_((void *)v23, v45, v48, v46);
    v53 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52);
    v57 = v53 - 1;
    if (v53 != 1)
    {
      v58 = v57 + v47;
      do
      {
        v59 = objc_msgSend_objectAtIndexedSubscript_(v31, v54, v47, v56);
        objc_msgSend_addObject_(v41, v60, v59, v61);
        ++v47;
        --v57;
      }
      while (v57);
      v47 = v58;
    }
    ++v47;
    ++v48;
  }
  while (v48 < objc_msgSend_count((void *)v23, v54, v55, v56));
  v8 = &off_1E636B000;
  v9 = v130;
LABEL_16:
  v62 = objc_opt_class();
  v133 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v63, v62, (uint64_t)CFSTR("correctiveDriverCounts"));
  v64 = objc_opt_class();
  objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v65, v64, (uint64_t)CFSTR("correctiveDriverIndices"));
  v66 = objc_opt_class();
  v68 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v67, v66, (uint64_t)CFSTR("correctiveInBetweenCounts"));
  v69 = objc_opt_class();
  v132 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v70, v69, (uint64_t)CFSTR("correctiveInBetweenInfluenceWeights"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v74 = objc_msgSend_allTargetsFromAnimCodec(a3, v71, v72, v73)) == 0)
  {
    if (objc_msgSend_containsValueForKey_(a3, v71, (uint64_t)CFSTR("targets"), v73))
    {
      v93 = objc_opt_class();
      v95 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v94, v93, (uint64_t)CFSTR("targets"));
      v76 = (void *)objc_msgSend_VFX_compactMapObjectsUsingBlock_(v95, v96, (uint64_t)&unk_1E63D1C10, v97);
      v98 = objc_opt_class();
      v100 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v99, v98, (uint64_t)CFSTR("correctives"));
      v103 = objc_msgSend_VFX_compactMapObjectsUsingBlock_(v100, v101, (uint64_t)&unk_1E63D9BC0, v102);
    }
    else
    {
      v104 = objc_opt_class();
      v76 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v105, v104, (uint64_t)CFSTR("targetMeshes"));
      v106 = objc_opt_class();
      v103 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v107, v106, (uint64_t)CFSTR("correctiveMeshes"));
    }
    v92 = v103;
    goto LABEL_36;
  }
  v76 = (void *)v74;
  if (objc_msgSend_count(v68, v71, v75, v73))
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v77, (uint64_t)&v134, (uint64_t)v139, 16);
    if (!v80)
    {
      v92 = 0;
      goto LABEL_36;
    }
    v84 = v80;
    v131 = v9;
    v85 = 0;
    v86 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != v84; ++i)
      {
        if (*(_QWORD *)v135 != v86)
          objc_enumerationMutation(v68);
        v85 += objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v134 + 1) + 8 * i), v81, v82, v83);
      }
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v81, (uint64_t)&v134, (uint64_t)v139, 16);
    }
    while (v84);
    if (v85)
      goto LABEL_27;
LABEL_33:
    v92 = 0;
    goto LABEL_34;
  }
  v131 = v9;
  v85 = objc_msgSend_count(v133, v77, v78, v79);
  if (!v85)
    goto LABEL_33;
LABEL_27:
  v88 = objc_msgSend_count(v76, v81, v82, v83) - v85;
  v90 = objc_msgSend_subarrayWithRange_(v76, v89, 0, v88);
  v92 = objc_msgSend_subarrayWithRange_(v76, v91, v88, v85);
  v76 = (void *)v90;
LABEL_34:
  v8 = &off_1E636B000;
  v9 = v131;
LABEL_36:
  if (v23 | v92)
    objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(v7, v81, (uint64_t)v76, v23, v41, v68, v132);
  else
    objc_msgSend_setTargets_(v7, v81, (uint64_t)v76, v83);
  v108 = objc_opt_class();
  v110 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v109, v108, (uint64_t)CFSTR("weights"));
  objc_msgSend_setWeights_(v7, v111, v110, v112);
  v113 = objc_opt_class();
  v115 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v114, v113, (uint64_t)CFSTR("name"));
  objc_msgSend_setName_(v7, v116, v115, v117);
  if (objc_msgSend_containsValueForKey_(a3, v118, (uint64_t)CFSTR("shouldMorphNormals"), v119))
  {
    v122 = objc_msgSend_decodeBoolForKey_(a3, v120, (uint64_t)CFSTR("shouldMorphNormals"), v121);
    objc_msgSend_setUnifiesNormals_(v7, v123, v122 ^ 1u, v124);
  }
  v7->_animationsLock._os_unfair_lock_opaque = 0;
  sub_1B18BDA00(a3, v7);
  sub_1B18BDFA4(a3, v7);
  objc_msgSend__didDecodeVFXMorpher_(v7, v125, (uint64_t)a3, v126);
  objc_msgSend_setImmediateMode_(v8[223], v127, v9, v128);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)VFXUID_classForElementOfArray:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("weights"), v3) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v5, (uint64_t)CFSTR("channelTargetWeights"), v6) & 1) != 0
    || objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("channelTargetCounts"), v8))
  {
    return (Class)objc_opt_class();
  }
  else
  {
    return 0;
  }
}

@end
