@implementation VFXPhysicsShape

- (void)commonInit
{
  self->_physicsBodiesLock._os_unfair_lock_opaque = 0;
  self->_physicsBodies = CFArrayCreateMutable(0, 1, 0);
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)self->_scale = _Q0;
  self->_margin = 0.0;
}

- (VFXPhysicsShape)initWithContent:(id)a3
{
  VFXPhysicsShape *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXPhysicsShape *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXPhysicsShape;
  v4 = -[VFXPhysicsShape init](&v10, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    v8->_referenceObject = a3;
  }
  return v8;
}

+ (VFXPhysicsShape)shapeWithModel:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  return (VFXPhysicsShape *)(id)objc_msgSend_initWithContent_(v4, v5, (uint64_t)a3, v6);
}

+ (VFXPhysicsShape)shapeWithNode:(id)a3 flattened:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  _BYTE *v9;

  v6 = objc_alloc((Class)objc_opt_class());
  v9 = (_BYTE *)objc_msgSend_initWithContent_(v6, v7, (uint64_t)a3, v8);
  v9[80] = a4;
  return (VFXPhysicsShape *)v9;
}

+ (VFXPhysicsShape)shapeWithShapes:(id)a3 transforms:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v6 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend_initWithContent_(v6, v7, (uint64_t)a3, v8);
  objc_msgSend__setTransforms_(v9, v10, (uint64_t)a4, v11);
  return (VFXPhysicsShape *)v9;
}

- (void)didAddToPhysicsBody:(id)a3
{
  os_unfair_lock_s *p_physicsBodiesLock;

  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  CFArrayAppendValue(self->_physicsBodies, a3);
  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)didRemoveFromPhysicsBody:(id)a3
{
  os_unfair_lock_s *p_physicsBodiesLock;
  __CFArray *physicsBodies;
  CFIndex FirstIndexOfValue;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFRange v15;

  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  physicsBodies = self->_physicsBodies;
  v15.length = CFArrayGetCount(physicsBodies);
  v15.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(physicsBodies, v15, a3);
  if (FirstIndexOfValue == -1)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: didRemoveFromPhysicsBody - body not found"), v8, v9, v10, v11, v12, v13, v14);
  else
    CFArrayRemoveValueAtIndex(self->_physicsBodies, FirstIndexOfValue);
  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)didChange
{
  os_unfair_lock_s *p_physicsBodiesLock;

  p_physicsBodiesLock = &self->_physicsBodiesLock;
  os_unfair_lock_lock(&self->_physicsBodiesLock);
  sub_1B17A0470(self->_physicsBodies, (uint64_t)&unk_1E63D11B0);
  os_unfair_lock_unlock(p_physicsBodiesLock);
}

- (void)invalidate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  self->_shape = 0;
  objc_msgSend_didChange(self, v3, v4, v5);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  uint64_t v3;

  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_invalidate(self, a2, a3, v3);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsShape;
  -[VFXPhysicsShape dealloc](&v3, sel_dealloc);
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)_setTransforms:(id)a3
{

  self->_transforms = (NSArray *)a3;
}

- (id)_shapeHandle:(__CFXNode *)a3
{
  id result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t type;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float margin;
  uint64_t v28;
  uint64_t v29;

  result = self->_shape;
  if (!result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (_QWORD *)objc_msgSend_geometryRef(self->_referenceObject, v6, v7, v8);
      v10 = sub_1B190FA20(v9, self->_type);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend_nodeRef(self->_referenceObject, v11, v12, v13);
        v10 = sub_1B190FA70(v14, self->_type, self->_flattened);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = sub_1B190FC18(self->_referenceObject, (uint64_t)self->_transforms);
        }
        else if (!a3
               || ((v22 = (_QWORD *)sub_1B1868FA0((uint64_t)a3, v15, v16, v17, v18, v19, v20, v21),
                    type = self->_type,
                    !v22)
                 ? (v10 = sub_1B190FA70(a3, type, self->_flattened))
                 : (v10 = sub_1B190FA20(v22, type)),
                   !v10))
        {
          sub_1B17C4408(16, (uint64_t)CFSTR("Error: unable to create a collision shape"), v16, v17, v18, v19, v20, v21, v29);
          v10 = 0;
        }
      }
    }
    result = v10;
    self->_shape = (VFXBtShapeWrapper *)result;
    if (result)
    {
      margin = self->_margin;
      if (margin != 0.0)
      {
        v28 = objc_msgSend_btShape(result, v24, v25, v26);
        (*(void (**)(uint64_t, float))(*(_QWORD *)v28 + 88))(v28, margin);
        return self->_shape;
      }
    }
  }
  return result;
}

- (__n128)scale
{
  return a1[2];
}

- (void)setScale:(VFXPhysicsShape *)self
{
  int8x16_t v2;
  float32x4_t v3;
  float32x2_t v4;
  int32x2_t v5;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;

  v3 = (float32x4_t)v2;
  if (*(float *)v2.i32 != 0.0)
  {
    v4.i32[1] = v2.i32[1];
    v4.i32[0] = vextq_s8(v2, v2, 8uLL).u32[0];
    v5 = vceqz_f32(v4);
    if ((v5.i8[4] & 1) == 0 && (v5.i8[0] & 1) == 0)
    {
      v9 = v3;
      if ((VFXVector3EqualToVector3(*(float32x4_t *)self->_scale, v3) & 1) == 0)
      {
        *(float32x4_t *)self->_scale = v9;
        MEMORY[0x1E0DE7D20](self, sel__updateScale, v7, v8);
      }
    }
  }
}

- (void)_setNodeScale:(VFXPhysicsShape *)self
{
  int8x16_t v2;
  float32x4_t v3;
  float32x2_t v4;
  int32x2_t v5;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;

  v3 = (float32x4_t)v2;
  if (*(float *)v2.i32 != 0.0)
  {
    v4.i32[1] = v2.i32[1];
    v4.i32[0] = vextq_s8(v2, v2, 8uLL).u32[0];
    v5 = vceqz_f32(v4);
    if ((v5.i8[4] & 1) == 0 && (v5.i8[0] & 1) == 0)
    {
      v9 = v3;
      if ((VFXVector3EqualToVector3(*(float32x4_t *)self->_nodeScale, v3) & 1) == 0)
      {
        *(float32x4_t *)self->_nodeScale = v9;
        MEMORY[0x1E0DE7D20](self, sel__updateScale, v7, v8);
      }
    }
  }
}

- (void)_updateScale
{
  uint64_t v2;
  uint64_t v3;
  VFXBtShapeWrapper *shape;
  float32x4_t v6;
  float32x4_t v7;
  __int32 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int32 v12;
  int v13;

  shape = self->_shape;
  if (shape)
  {
    v6 = *(float32x4_t *)self->_scale;
    v7 = vmulq_f32(v6, *(float32x4_t *)self->_nodeScale);
    if (v7.f32[0] != 0.0)
    {
      v6.i32[0] = v7.i32[1];
      if (v7.f32[1] != 0.0)
      {
        v8 = v7.i32[2];
        if (v7.f32[2] != 0.0)
        {
          v10 = v7.i64[0];
          v9 = objc_msgSend_btShape(shape, a2, v2, v3, *(double *)v6.i64);
          v11 = v10;
          v12 = v8;
          v13 = 0;
          (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v9 + 48))(v9, &v11);
        }
      }
    }
    objc_msgSend_didChange(self, a2, v2, v3, *(double *)v6.i64);
  }
}

- (float)margin
{
  return self->_margin;
}

- (void)setMargin:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  VFXBtShapeWrapper *shape;
  uint64_t v7;

  if (self->_margin != a3)
  {
    self->_margin = a3;
    shape = self->_shape;
    if (shape)
    {
      v7 = objc_msgSend_btShape(shape, a2, v3, v4);
      (*(void (**)(uint64_t, float))(*(_QWORD *)v7 + 88))(v7, a3);
    }
  }
}

- (BOOL)flattened
{
  return self->_flattened;
}

- (void)setFlattened:(BOOL)a3
{
  uint64_t v3;

  if (self->_flattened != a3)
  {
    self->_flattened = a3;
    objc_msgSend_invalidate(self, a2, a3, v3);
  }
}

- (VFXModel)model
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (VFXModel *)self->_referenceObject;
  else
    return 0;
}

- (void)setModel:(id)a3
{
  uint64_t v3;
  id referenceObject;

  referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_referenceObject = a3;
  }
  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (VFXNode)shapeNode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (VFXNode *)self->_referenceObject;
  else
    return 0;
}

- (void)setShapeNode:(id)a3
{
  uint64_t v3;
  id referenceObject;

  referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_referenceObject = a3;
  }
  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (NSArray)shapes
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSArray *)self->_referenceObject;
  else
    return 0;
}

- (void)setShapes:(id)a3
{
  uint64_t v3;
  id referenceObject;

  referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {

    self->_referenceObject = a3;
  }
  objc_msgSend_invalidate(self, a2, (uint64_t)a3, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
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
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithContent_(v4, v5, (uint64_t)self->_referenceObject, v6);
  objc_msgSend_margin(self, v8, v9, v10);
  objc_msgSend_setMargin_((void *)v7, v11, v12, v13);
  objc_msgSend_scale(self, v14, v15, v16);
  objc_msgSend_setScale_((void *)v7, v17, v18, v19);
  *(_BYTE *)(v7 + 80) = self->_flattened;
  v23 = objc_msgSend_type(self, v20, v21, v22);
  objc_msgSend_setType_((void *)v7, v24, v23, v25);
  *(_QWORD *)(v7 + 16) = objc_msgSend_transforms(self, v26, v27, v28);
  return (id)v7;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

+ (id)defaultShapeForGeometry:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v5 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("VFXDefaultPhysicsShape"), v3);
  v11 = (void *)objc_msgSend_pointerValue(v5, v6, v7, v8);
  if (!v11)
  {
    v11 = (void *)objc_msgSend_shapeWithModel_(VFXPhysicsShape, v9, (uint64_t)a3, v10);
    v14 = objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v12, (uint64_t)v11, v13);
    objc_msgSend_setValue_forKey_(a3, v15, v14, (uint64_t)CFSTR("VFXDefaultPhysicsShape"));
  }
  return v11;
}

- (void)_customEncodingOfVFXPhysicsShape:(id)a3
{
  uint64_t v3;
  NSArray *transforms;
  uint64_t v7;
  const char *v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[3];
  int v14;

  transforms = self->_transforms;
  if (transforms)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    v7 = objc_msgSend_count(transforms, a2, (uint64_t)a3, v3);
    objc_msgSend_encodeInteger_forKey_(a3, v8, v7, (uint64_t)CFSTR("transformsCount"));
    v9 = self->_transforms;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1911544;
    v12[3] = &unk_1E63D5908;
    v12[4] = a3;
    v12[5] = v13;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v12, v11);
    _Block_object_dispose(v13, 8);
  }
}

- (void)_customDecodingOfVFXPhysicsShape:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSArray *transforms;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v6 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("transformsCount"), v3);
  if (v6 >= 1)
  {
    v9 = v6;
    v10 = 0;
    self->_transforms = (NSArray *)(id)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v7, v6, v8);
    do
    {
      transforms = self->_transforms;
      v14 = (void *)MEMORY[0x1E0CB3B18];
      v15 = (const char *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("transform%d"), v12, v10);
      *(_QWORD *)&v16 = sub_1B18BD380(a3, v15).n128_u64[0];
      v20 = objc_msgSend_valueWithVFXMatrix4_(v14, v17, v18, v19, v16);
      objc_msgSend_addObject_(transforms, v21, v20, v22);
      ++v10;
    }
    while (v9 != v10);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  id referenceObject;
  const char *v10;

  objc_msgSend__customEncodingOfVFXPhysicsShape_(self, a2, (uint64_t)a3, v3);
  referenceObject = self->_referenceObject;
  if (referenceObject)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)referenceObject, (uint64_t)CFSTR("referenceObject"));
  *(float *)&v8 = self->_margin;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("margin"), v7, v8);
  if (self->_flattened)
    objc_msgSend_encodeBool_forKey_(a3, v10, 1, (uint64_t)CFSTR("flattened"));
  sub_1B18BD1D8(a3, CFSTR("scale"), *(__n128 *)self->_scale);
}

- (VFXPhysicsShape)initWithCoder:(id)a3
{
  VFXPhysicsShape *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXPhysicsShape *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  float v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)VFXPhysicsShape;
  v4 = -[VFXPhysicsShape init](&v35, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    objc_msgSend__customDecodingOfVFXPhysicsShape_(v8, v15, (uint64_t)a3, v16);
    v17 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v36[3] = objc_opt_class();
    v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v36, 4);
    v22 = objc_msgSend_setWithArray_(v17, v20, v19, v21);
    v8->_referenceObject = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v23, v22, (uint64_t)CFSTR("referenceObject"));
    objc_msgSend_decodeFloatForKey_(a3, v24, (uint64_t)CFSTR("margin"), v25);
    v8->_margin = v26;
    v8->_flattened = objc_msgSend_decodeBoolForKey_(a3, v27, (uint64_t)CFSTR("flattened"), v28);
    if (objc_msgSend_containsValueForKey_(a3, v29, (uint64_t)CFSTR("scale"), v30))
    {
      *(double *)&v33 = sub_1B18BD300(a3, CFSTR("scale"));
      *(_OWORD *)v8->_scale = v33;
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v31, v12, v32);
  }
  return v8;
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
  objc_super v14;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("scale"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_scale(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXPhysicsShape;
    return -[VFXPhysicsShape valueForKey:](&v14, sel_valueForKey_, a3);
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

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("scale"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setScale_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXPhysicsShape;
    -[VFXPhysicsShape setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
  }
}

- (id)scaleValue
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
  objc_msgSend_scale(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scale(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scale(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setScaleValue:(id)a3
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
  objc_msgSend_setScale_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

@end
