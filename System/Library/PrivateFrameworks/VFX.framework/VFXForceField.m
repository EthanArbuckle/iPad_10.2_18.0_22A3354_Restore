@implementation VFXForceField

- (VFXForceField)init
{
  VFXForceField *v2;
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
  v13.super_class = (Class)VFXForceField;
  v2 = -[VFXForceField init](&v13, sel_init);
  if (v2)
  {
    *(_QWORD *)&v11 = -[VFXForceField __createCFObject]_0().n128_u64[0];
    v2->_forceField = (__CFXForceField *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6, v11);
  }
  return v2;
}

- (VFXForceField)initWithFieldType:(int64_t)a3
{
  VFXForceField *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t forceField;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VFXForceField;
  v4 = -[VFXForceField init](&v21, sel_init);
  if (v4)
  {
    -[VFXForceField __createCFObject]_0();
    v4->_forceField = (__CFXForceField *)v5;
    sub_1B198A24C(v5, a3, v6, v7, v8, v9, v10, v11);
    forceField = (uint64_t)v4->_forceField;
    if (forceField)
      sub_1B193E768(forceField, v4, v13, v14, v15, v16, v17, v18);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v12, v13, v14);
  }
  return v4;
}

- (VFXForceField)initWithForceFieldRef:(__CFXForceField *)a3
{
  VFXForceField *v4;
  __CFXForceField *v5;
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
  v17.super_class = (Class)VFXForceField;
  v4 = -[VFXForceField init](&v17, sel_init);
  if (v4)
  {
    v5 = (__CFXForceField *)CFRetain(a3);
    v4->_forceField = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationForceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  VFXForceField *v4;
  VFXForceField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXForceField;
  v4 = -[VFXForceField init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_forceField = (__CFXForceField *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXForceField)forceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  VFXForceField *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXForceField *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXForceField *)(id)objc_msgSend_initWithForceFieldRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)field
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)presentationObject
{
  id v3;
  const char *v4;
  uint64_t v5;

  v3 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initPresentationForceFieldWithForceFieldRef_(v3, v4, (uint64_t)self->_forceField, v5);
}

+ (id)presentationForceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  VFXForceField *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXForceField alloc];
  return (id)objc_msgSend_initPresentationForceFieldWithForceFieldRef_(v4, v5, (uint64_t)a3, v6);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXForceField *forceField;
  objc_super v10;
  _QWORD v11[5];

  forceField = self->_forceField;
  if (forceField)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      sub_1B193E768((uint64_t)forceField, 0, v2, v3, v4, v5, v6, v7);
      forceField = self->_forceField;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B19463F4;
    v11[3] = &unk_1E63D4AB0;
    v11[4] = forceField;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXForceField;
  -[VFXForceField dealloc](&v10, sel_dealloc);
}

- (int64_t)fieldType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    return sub_1B198A324((uint64_t)self->_forceField, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return self->_settings.kind;
}

- (void)setFieldType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.kind != a3)
  {
    self->_settings.kind = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19464CC;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("fieldType"), v8);
  }
}

+ (id)dragField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 8, v4);
}

+ (id)vortexField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 2, v4);
}

+ (id)radialField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 1, v4);
}

+ (id)linearField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 0, v4);
}

+ (id)noiseFieldWithSmoothness:(float)a3 animationSpeed:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = objc_alloc((Class)objc_opt_class());
  v9 = (id)objc_msgSend_initWithFieldType_(v6, v7, 3, v8);
  *(float *)&v10 = a3;
  objc_msgSend_setSmoothness_(v9, v11, v12, v13, v10);
  *(float *)&v14 = a4;
  objc_msgSend_setSpeed_(v9, v15, v16, v17, v14);
  return v9;
}

+ (id)turbulenceFieldWithSmoothness:(float)a3 animationSpeed:(float)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = objc_alloc((Class)objc_opt_class());
  v9 = (id)objc_msgSend_initWithFieldType_(v6, v7, 4, v8);
  *(float *)&v10 = a3;
  objc_msgSend_setSmoothness_(v9, v11, v12, v13, v10);
  *(float *)&v14 = a4;
  objc_msgSend_setSpeed_(v9, v15, v16, v17, v14);
  return v9;
}

+ (id)springField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 5, v4);
}

+ (id)magneticField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 6, v4);
}

+ (id)harmonicField
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithFieldType_(v2, v3, 7, v4);
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
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_fieldType(self, v5, v6, v7);
  v11 = (void *)objc_msgSend_initWithFieldType_(v4, v9, v8, v10);
  objc_msgSend_begin(VFXTransaction, v12, v13, v14);
  objc_msgSend_setImmediateMode_(VFXTransaction, v15, 1, v16);
  v20 = objc_msgSend_name(self, v17, v18, v19);
  objc_msgSend_setName_(v11, v21, v20, v22);
  v26 = objc_msgSend_categoryBitMask(self, v23, v24, v25);
  objc_msgSend_setCategoryBitMask_(v11, v27, v26, v28);
  objc_msgSend_setSettings_(v11, v29, (uint64_t)&self->_settings, v30);
  objc_msgSend__copyAnimationsFrom_(v11, v31, (uint64_t)self, v32);
  objc_msgSend_commitImmediate(VFXTransaction, v33, v34, v35);
  return v11;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)setSettings:(void *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  VFXForceField *v22;

  v4 = *((_OWORD *)a3 + 5);
  v18 = *((_OWORD *)a3 + 4);
  v19 = v4;
  v5 = *((_OWORD *)a3 + 7);
  v20 = *((_OWORD *)a3 + 6);
  v21 = v5;
  v6 = *((_OWORD *)a3 + 1);
  v14 = *(_OWORD *)a3;
  v15 = v6;
  v7 = *((_OWORD *)a3 + 3);
  v16 = *((_OWORD *)a3 + 2);
  v17 = v7;
  memmove(&self->_settings, a3, 0x80uLL);
  v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B19467CC;
  v13[3] = &unk_1E63D99F8;
  v22 = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (float)strength
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
    return self->_settings.strength;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A3E4((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198A3E4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setStrength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.strength != a3)
  {
    self->_settings.strength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19468FC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("strength"), v9);
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
    return self->_settings.categoryBitMask;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A84C((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198A84C((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.categoryBitMask != a3)
  {
    self->_settings.categoryBitMask = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1946A14;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)falloffExponent
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
    return self->_settings.falloffExponent;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A4A4((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198A4A4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setFalloffExponent:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.falloffExponent != a3)
  {
    self->_settings.falloffExponent = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1946B44;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("falloffExponent"), v9);
  }
}

- (BOOL)isActive
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
    return self->_settings.active;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A558((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198A558((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setActive:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.active != a3)
  {
    self->_settings.active = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1946C60;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)scope
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

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_settings.scope;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A6D4((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B198A6D4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setScope:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.scope != a3)
  {
    self->_settings.scope = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1946D80;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("scope"), v8);
  }
}

- (double)halfExtent
{
  __int128 v5;
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
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B198A61C((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B198A61C((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 112);
  }
  return *(double *)&v5;
}

- (void)setHalfExtent:(VFXForceField *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXForceField *v12;

  if ((*((_BYTE *)self + 16) & 1) != 0
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_68[8], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_anon_68[8] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1946EB8;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("halfExtent"), v10);
  }
}

- (double)offset
{
  __int128 v5;
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
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B198A798((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B198A798((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v5;
}

- (void)setOffset:(VFXForceField *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXForceField *v12;

  if ((*((_BYTE *)self + 16) & 1) != 0
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_68[24], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_anon_68[24] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1946FF0;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("offset"), v10);
  }
}

- (BOOL)supportsOffset
{
  return (self->_settings.kind > 8uLL) | (0xA6u >> self->_settings.kind) & 1;
}

- (float)smoothness
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
    return *(float *)&self->_anon_68[40];
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A9C4((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198A9C4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSmoothness:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if ((*((_BYTE *)self + 16) & 1) != 0 || *(float *)&self->_anon_68[40] != a3)
  {
    *(float *)&self->_anon_68[40] = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1947140;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("smoothness"), v9);
  }
}

- (int64_t)shape
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

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_settings.shape;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198AB3C((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B198AB3C((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setShape:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.shape != a3)
  {
    self->_settings.shape = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1947260;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("shape"), v8);
  }
}

- (int64_t)cullMode
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

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_settings.cullMode;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198A904((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B198A904((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setCullMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0 || self->_settings.cullMode != a3)
  {
    self->_settings.cullMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1947380;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("cullMode"), v8);
  }
}

- (float)speed
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
    return *(float *)&self->_anon_68[44];
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B198AA84((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B198AA84((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSpeed:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if ((*((_BYTE *)self + 16) & 1) != 0 || *(float *)&self->_anon_68[44] != a3)
  {
    *(float *)&self->_anon_68[44] = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19474B0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("speed"), v9);
  }
}

+ (void)_setDisplayScaleFactor:(float)a3
{
  dword_1EEF55B58 = LODWORD(a3);
}

+ (float)_displayScaleFactor
{
  return *(float *)&dword_1EEF55B58;
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
      v15[2] = sub_1B194758C;
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
  return self->_forceField;
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
    v22[2] = sub_1B19478DC;
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
  v12[2] = sub_1B1947AAC;
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
  v14[2] = sub_1B1947B58;
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
    v13[2] = sub_1B1947C14;
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
    v15[2] = sub_1B1947CD8;
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
    v29[2] = sub_1B19481B8;
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
  v14[2] = sub_1B19482E4;
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
  v8[2] = sub_1B1948390;
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
  __int128 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    v13 = v5;
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
    v21 = (__int128 *)sub_1B198AB84((uint64_t)self->_forceField, v14, v15, v16, v17, v18, v19, v20);
    v22 = v21[3];
    v24 = *v21;
    v23 = v21[1];
    *(_OWORD *)&self->_settings.categoryBitMask = v21[2];
    *(_OWORD *)&self->_settings.scope = v22;
    *(_OWORD *)&self->_settings.kind = v24;
    *(_OWORD *)&self->_settings.dampening = v23;
    v25 = v21[7];
    v27 = v21[4];
    v26 = v21[5];
    *(_OWORD *)&self->_anon_68[24] = v21[6];
    *(_OWORD *)&self->_anon_68[40] = v25;
    *(_OWORD *)&self->_settings.falloffExponent = v27;
    *(_OWORD *)&self->_anon_68[8] = v26;
    objc_msgSend__syncEntityObjCModel(self, v28, v29, v30);
    sub_1B18797B4(v13, v31, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    v38 = (__int128 *)sub_1B198AB84((uint64_t)self->_forceField, v6, v7, v8, v9, v10, v11, v12);
    v39 = v38[3];
    v41 = *v38;
    v40 = v38[1];
    *(_OWORD *)&self->_settings.categoryBitMask = v38[2];
    *(_OWORD *)&self->_settings.scope = v39;
    *(_OWORD *)&self->_settings.kind = v41;
    *(_OWORD *)&self->_settings.dampening = v40;
    v42 = v38[7];
    v44 = v38[4];
    v43 = v38[5];
    *(_OWORD *)&self->_anon_68[24] = v38[6];
    *(_OWORD *)&self->_anon_68[40] = v42;
    *(_OWORD *)&self->_settings.falloffExponent = v44;
    *(_OWORD *)&self->_anon_68[8] = v43;
    objc_msgSend__syncEntityObjCModel(self, v45, v46, v47);
  }
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;

  sub_1B18BD1D8(a3, CFSTR("halfExtent"), *(__n128 *)&self->_anon_68[8]);
  objc_msgSend_encodeInt_forKey_(a3, v5, LODWORD(self->_settings.kind), (uint64_t)CFSTR("type"));
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("strength"), v7, self->_settings.strength);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("falloffExponent"), v9, self->_settings.falloffExponent);
  objc_msgSend_encodeBool_forKey_(a3, v10, self->_settings.active, (uint64_t)CFSTR("active"));
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->_settings.scope, (uint64_t)CFSTR("scope"));
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->_settings.shape, (uint64_t)CFSTR("shape"));
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("smoothness"), v14, *(float *)&self->_anon_68[40]);
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->_settings.categoryBitMask, (uint64_t)CFSTR("categoryMask"));
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("speed"), v17, *(float *)&self->_anon_68[44]);
  sub_1B18BD1D8(a3, CFSTR("offset"), *(__n128 *)&self->_anon_68[24]);
}

- (VFXForceField)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXForceField *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t CFObject;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  objc_super v82;

  v82.receiver = self;
  v82.super_class = (Class)VFXForceField;
  v7 = -[VFXForceField init](&v82, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    v7->_forceField = (__CFXForceField *)CFObject;
    if (CFObject)
      sub_1B193E768(CFObject, v7, v16, v17, v18, v19, v20, v21);
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    v24 = objc_msgSend_decodeIntForKey_(a3, v22, (uint64_t)CFSTR("type"), v23);
    objc_msgSend_setFieldType_(v7, v25, v24, v26);
    v27 = sub_1B18BD300(a3, CFSTR("halfExtent"));
    objc_msgSend_setHalfExtent_(v7, v28, v29, v30, v27);
    objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("strength"), v32);
    *(float *)&v33 = v33;
    objc_msgSend_setStrength_(v7, v34, v35, v36, v33);
    objc_msgSend_decodeDoubleForKey_(a3, v37, (uint64_t)CFSTR("falloffExponent"), v38);
    *(float *)&v39 = v39;
    objc_msgSend_setFalloffExponent_(v7, v40, v41, v42, v39);
    v45 = objc_msgSend_decodeBoolForKey_(a3, v43, (uint64_t)CFSTR("active"), v44);
    objc_msgSend_setActive_(v7, v46, v45, v47);
    v50 = objc_msgSend_decodeIntegerForKey_(a3, v48, (uint64_t)CFSTR("scope"), v49);
    objc_msgSend_setScope_(v7, v51, v50, v52);
    v55 = objc_msgSend_decodeIntegerForKey_(a3, v53, (uint64_t)CFSTR("shape"), v54);
    objc_msgSend_setShape_(v7, v56, v55, v57);
    v58 = sub_1B18BD300(a3, CFSTR("offset"));
    objc_msgSend_setOffset_(v7, v59, v60, v61, v58);
    objc_msgSend_decodeDoubleForKey_(a3, v62, (uint64_t)CFSTR("smoothness"), v63);
    *(float *)&v64 = v64;
    objc_msgSend_setSmoothness_(v7, v65, v66, v67, v64);
    objc_msgSend_decodeDoubleForKey_(a3, v68, (uint64_t)CFSTR("speed"), v69);
    *(float *)&v70 = v70;
    objc_msgSend_setSpeed_(v7, v71, v72, v73, v70);
    v76 = objc_msgSend_decodeIntForKey_(a3, v74, (uint64_t)CFSTR("categoryMask"), v75);
    objc_msgSend_setCategoryBitMask_(v7, v77, v76, v78);
    objc_msgSend_setImmediateMode_(VFXTransaction, v79, v8, v80);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  objc_super v17;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("halfExtent"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_halfExtent(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("offset"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_offset(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)VFXForceField;
  return -[VFXForceField valueForKey:](&v17, sel_valueForKey_, a3);
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
  objc_super v19;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("halfExtent"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setHalfExtent_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("offset"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setOffset_(self, v16, v17, v18);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VFXForceField;
    -[VFXForceField setValue:forKey:](&v19, sel_setValue_forKey_, a3, a4);
  }
}

- (id)halfExtentValue
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
  objc_msgSend_halfExtent(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_halfExtent(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_halfExtent(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setHalfExtentValue:(id)a3
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
  objc_msgSend_setHalfExtent_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)offsetValue
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
  objc_msgSend_offset(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_offset(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_offset(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setOffsetValue:(id)a3
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
  objc_msgSend_setOffset_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (__n128)__createCFObject
{
  uint64_t v0;
  __n128 result;

  if (qword_1ED4CEC88 != -1)
    dispatch_once(&qword_1ED4CEC88, &unk_1E63D1390);
  v0 = sub_1B179CB90(qword_1ED4CEC90, 0xC0uLL);
  *(_QWORD *)(v0 + 64) = 0;
  *(_BYTE *)(v0 + 72) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(v0 + 76) = _D0;
  *(_DWORD *)(v0 + 84) = 0;
  *(_OWORD *)(v0 + 88) = xmmword_1B2268A10;
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 104) = 0;
  *(_DWORD *)(v0 + 128) = 1065353216;
  __asm { FMOV            V0.4S, #1.0 }
  *(__n128 *)(v0 + 144) = result;
  *(_QWORD *)(v0 + 160) = 0;
  *(_QWORD *)(v0 + 168) = 0;
  *(_QWORD *)(v0 + 176) = 0x3F80000000000000;
  return result;
}

@end
