@implementation VFXAnimationPlayer

- (void)commonInit
{
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&self->_weight = _D0;
  self->_paused = 0;
}

+ (id)animationPlayerWithAnimation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithVFXAnimation_(v4, v5, (uint64_t)a3, v6);
}

- (VFXAnimationPlayer)initWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3
{
  VFXAnimationPlayer *v4;
  __CFXAnimationPlayer *v5;
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
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)VFXAnimationPlayer;
  v4 = -[VFXAnimationPlayer init](&v41, sel_init);
  if (v4)
  {
    v5 = (__CFXAnimationPlayer *)CFRetain(a3);
    v4->_playerRef = v5;
    v13 = sub_1B17F0ED0((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v4->_animation = (VFXAnimation *)(id)objc_msgSend_animationWithCFXAnimation_(VFXAnimation, v14, v13, v15);
    v4->_weight = sub_1B17F1218((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);
    v4->_speed = sub_1B17F1134((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
    v4->_paused = sub_1B17F1320((uint64_t)a3, v30, v31, v32, v33, v34, v35, v36);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCAnimations(v4, v37, v38, v39);
  }
  return v4;
}

+ (id)animationPlayerWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithAnimationPlayerRef_(v4, v5, (uint64_t)a3, v6);
}

- (VFXAnimationPlayer)initWithVFXAnimation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXAnimationPlayer *v7;
  const void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXAnimationPlayer;
  v7 = -[VFXAnimationPlayer init](&v13, sel_init);
  if (v7)
  {
    v8 = (const void *)objc_msgSend_animationRef(a3, v4, v5, v6);
    v7->_playerRef = (__CFXAnimationPlayer *)sub_1B17F0DA4(v8);
    v7->_animation = (VFXAnimation *)a3;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend_commonInit(v7, v9, v10, v11);
  }
  return v7;
}

+ (id)animationPlayerWithVFXAnimation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithVFXAnimation_(v4, v5, (uint64_t)a3, v6);
}

- (void)dealloc
{
  __CFXAnimationPlayer *playerRef;
  objc_super v4;

  playerRef = self->_playerRef;
  if (playerRef)
  {
    CFRelease(playerRef);
    self->_playerRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXAnimationPlayer;
  -[VFXAnimationPlayer dealloc](&v4, sel_dealloc);
}

- (void)_setAnimation:(id)a3
{
  VFXAnimation *animation;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFXAnimationPlayer *playerRef;
  const void *v10;
  __CFXAnimationPlayer *v11;
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

  animation = self->_animation;
  if (animation != a3)
  {

    self->_animation = (VFXAnimation *)a3;
    playerRef = self->_playerRef;
    if (playerRef)
    {
      CFRelease(playerRef);
      self->_playerRef = 0;
    }
    if (a3)
    {
      v10 = (const void *)objc_msgSend_animationRef(a3, v6, v7, v8);
      v11 = (__CFXAnimationPlayer *)sub_1B17F0DA4(v10);
      self->_playerRef = v11;
      sub_1B17F117C((uint64_t)v11, self->_weight, v12, v13, v14, v15, v16, v17, v18);
      sub_1B17F1094((uint64_t)self->_playerRef, self->_speed, v19, v20, v21, v22, v23, v24, v25);
      sub_1B17F1260((uint64_t)self->_playerRef, self->_paused, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (__CFXAnimationPlayer)animationPlayerRef
{
  return self->_playerRef;
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  uint64_t v4;
  __CFXAnimationPlayer *playerRef;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_prepareWithTarget_implicitDuration_(self->_animation, a2, (uint64_t)a3, v4, a4);
  playerRef = self->_playerRef;
  v10 = (const void *)objc_msgSend_animationRef(self->_animation, v7, v8, v9);
  sub_1B17F0E58((uint64_t)playerRef, v10, v11, v12, v13, v14, v15, v16);
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
  void *v14;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
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

  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  v7 = objc_alloc((Class)objc_opt_class());
  v11 = objc_msgSend_animation(self, v8, v9, v10);
  v14 = (void *)objc_msgSend_initWithVFXAnimation_(v7, v12, v11, v13);
  objc_msgSend_weight(self, v15, v16, v17);
  objc_msgSend_setWeight_(v14, v18, v19, v20);
  objc_msgSend_speed(self, v21, v22, v23);
  objc_msgSend_setSpeed_(v14, v24, v25, v26);
  v30 = objc_msgSend_paused(self, v27, v28, v29);
  objc_msgSend_setPaused_(v14, v31, v30, v32);
  v36 = objc_msgSend_usesAbsoluteTime(self, v33, v34, v35);
  objc_msgSend_setUsesAbsoluteTime_(v14, v37, v36, v38);
  objc_msgSend_commit(VFXTransaction, v39, v40, v41);
  return v14;
}

- (void)__CFObject
{
  return self->_playerRef;
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
    v22[2] = sub_1B18C7134;
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
  v12[2] = sub_1B18C7304;
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
  v14[2] = sub_1B18C73B0;
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
    v13[2] = sub_1B18C746C;
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
    v15[2] = sub_1B18C7530;
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
    v29[2] = sub_1B18C7A10;
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
  v14[2] = sub_1B18C7B3C;
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
  v8[2] = sub_1B18C7BE8;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
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

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
  ((void (*)(VFXAnimationPlayer *, char *))MEMORY[0x1E0DE7D20])(self, sel_setBlendFactor_);
}

- (float)blendFactor
{
  return self->_weight;
}

- (void)setBlendFactor:(float)a3
{
  _QWORD v3[5];
  float v4;

  if (self->_weight != a3)
  {
    self->_weight = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1B18C7CCC;
    v3[3] = &unk_1E63D53A0;
    v3[4] = self;
    v4 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, CFSTR("blendFactor"), v3);
  }
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  _QWORD v3[5];
  float v4;

  if (self->_speed != a3)
  {
    self->_speed = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1B18C7D64;
    v3[3] = &unk_1E63D53A0;
    v3[4] = self;
    v4 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, CFSTR("speed"), v3);
  }
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_paused != a3)
  {
    self->_paused = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1B18C7DF4;
    v3[3] = &unk_1E63D5328;
    v3[4] = self;
    v4 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
  }
}

- (void)play
{
  _QWORD v2[5];

  self->_paused = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1B18C7E6C;
  v2[3] = &unk_1E63D5378;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)stop
{
  _QWORD v2[5];

  self->_paused = 1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1B18C7EE0;
  v2[3] = &unk_1E63D5378;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)stopWithBlendOutDuration:(double)a3
{
  _QWORD v3[6];

  self->_paused = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1B18C7F58;
  v3[3] = &unk_1E63D5440;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (BOOL)usesAbsoluteTime
{
  return self->_usesAbsoluteTime;
}

- (void)setUsesAbsoluteTime:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_usesAbsoluteTime != a3)
  {
    self->_usesAbsoluteTime = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1B18C7FEC;
    v3[3] = &unk_1E63D5328;
    v3[4] = self;
    v4 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("weight"), v3, self->_weight);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("speed"), v7, self->_speed);
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_paused, (uint64_t)CFSTR("paused"));
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_usesAbsoluteTime, (uint64_t)CFSTR("usesAbsoluteTime"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_animation, (uint64_t)CFSTR("animation"));
  sub_1B18BDCC8(a3, self, v11, v12);
}

- (VFXAnimationPlayer)initWithCoder:(id)a3
{
  VFXAnimationPlayer *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXAnimationPlayer *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  VFXAnimation *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)VFXAnimationPlayer;
  v4 = -[VFXAnimationPlayer init](&v51, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    v15 = objc_opt_class();
    v17 = (VFXAnimation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("animation"));
    v8->_animation = v17;
    if (v17)
    {
      v8->_animationsLock._os_unfair_lock_opaque = 0;
      v25 = (const void *)objc_msgSend_animationRef(v17, v18, v19, v20);
      v8->_playerRef = (__CFXAnimationPlayer *)sub_1B17F0DA4(v25);
      objc_msgSend_decodeDoubleForKey_(a3, v26, (uint64_t)CFSTR("weight"), v27);
      *(float *)&v28 = v28;
      objc_msgSend_setWeight_(v8, v29, v30, v31, v28);
      objc_msgSend_decodeDoubleForKey_(a3, v32, (uint64_t)CFSTR("speed"), v33);
      *(float *)&v34 = v34;
      objc_msgSend_setSpeed_(v8, v35, v36, v37, v34);
      v40 = objc_msgSend_decodeBoolForKey_(a3, v38, (uint64_t)CFSTR("paused"), v39);
      objc_msgSend_setPaused_(v8, v41, v40, v42);
      v45 = objc_msgSend_decodeBoolForKey_(a3, v43, (uint64_t)CFSTR("usesAbsoluteTime"), v44);
      objc_msgSend_setUsesAbsoluteTime_(v8, v46, v45, v47);
      sub_1B18BDFA4(a3, v8);
      objc_msgSend_setImmediateMode_(VFXTransaction, v48, v12, v49);
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: can't decode old format animations"), v19, v20, v21, v22, v23, v24, (uint64_t)v51.receiver);
      return 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_animation(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<VFXAnimationPlayer(%p) animation=%@>"), v8, self, v6);
}

- (VFXAnimation)animation
{
  return self->_animation;
}

@end
