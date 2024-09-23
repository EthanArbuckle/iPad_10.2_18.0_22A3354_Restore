@implementation VFXLOD

- (void)dealloc
{
  __CFXLOD *lod;
  objc_super v4;

  lod = self->_lod;
  if (lod)
  {
    CFRelease(lod);
    self->_lod = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)VFXLOD;
  -[VFXLOD dealloc](&v4, sel_dealloc);
}

- (void)_setupWithModel:(id)a3 thresholdMode:(int64_t)a4 value:(float)a5
{
  VFXModel *model;
  const void *v10;

  model = self->_model;
  if (model != a3)
  {

    self->_model = (VFXModel *)a3;
  }
  self->_mode = a4;
  v10 = (const void *)objc_msgSend___CFObject(a3, a2, (uint64_t)a3, a4);
  self->_lod = (__CFXLOD *)sub_1B18468C0(v10, a4, a5);
}

- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 lod:(__CFXLOD *)a5
{
  VFXLOD *v7;
  VFXLOD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXLOD;
  v7 = -[VFXLOD init](&v10, sel_init, a3);
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    if (a5)
      v7->_lod = (__CFXLOD *)CFRetain(a5);
    v8->_mode = a4;
  }
  return v8;
}

- (VFXLOD)initWithModel:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  VFXLOD *v11;
  double v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXLOD;
  v11 = -[VFXLOD init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend_doubleValue(a5, v8, v9, v10);
    *(float *)&v12 = v12;
    objc_msgSend__setupWithModel_thresholdMode_value_(v11, v13, (uint64_t)a3, a4, v12);
  }
  return v11;
}

+ (id)levelOfDetailWithModel:(id)a3 screenSpaceRadius:(float)a4
{
  VFXLOD *v6;
  double v7;
  const char *v8;

  v6 = objc_alloc_init(VFXLOD);
  *(float *)&v7 = a4;
  objc_msgSend__setupWithModel_thresholdMode_value_(v6, v8, (uint64_t)a3, 1, v7);
  return v6;
}

+ (id)levelOfDetailWithModel:(id)a3 worldSpaceDistance:(float)a4
{
  VFXLOD *v6;
  double v7;
  const char *v8;

  v6 = objc_alloc_init(VFXLOD);
  *(float *)&v7 = a4;
  objc_msgSend__setupWithModel_thresholdMode_value_(v6, v8, (uint64_t)a3, 0, v7);
  return v6;
}

- (void)__CFObject
{
  return self->_lod;
}

- (VFXModel)model
{
  return self->_model;
}

- (int64_t)thresholdMode
{
  return self->_mode;
}

- (id)thresholdValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_1B18469FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return (id)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v9, v10, v11, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class());
  return (id)MEMORY[0x1E0DE7D20](v4, sel_initWithModel_thresholdMode_lod_, self->_model, self->_mode);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (float)screenSpaceRadius
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_mode == 1)
    return sub_1B18469FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return 0.0;
}

- (float)worldSpaceDistance
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_mode)
    return 0.0;
  else
    return sub_1B18469FC((uint64_t)self->_lod, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_model(self, a2, v2, v3);
  v14 = sub_1B18469FC((uint64_t)self->_lod, v7, v8, v9, v10, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("levelOfDetail <%p>: model:%@ threshold:%f useDistance:%d"), v16, self, v6, *(_QWORD *)&v14, self->_mode == 0);
}

- (void)_customEncodingOfVFXLOD:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  float v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = sub_1B18469FC((uint64_t)self->_lod, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v14 = objc_msgSend_numberWithDouble_(v9, v11, v12, v13, v10);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("threshold"));
}

- (void)_didDecodeVFXLOD:(id)a3
{
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;

  v5 = objc_opt_class();
  v7 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("threshold"));
  objc_msgSend_doubleValue(v7, v8, v9, v10);
  *(float *)&v11 = v11;
  objc_msgSend__setupWithModel_thresholdMode_value_(self, v12, (uint64_t)self->_model, self->_mode, v11);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  VFXModel *model;

  objc_msgSend__customEncodingOfVFXLOD_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_mode, (uint64_t)CFSTR("mode"));
  model = self->_model;
  if (model)
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)model, (uint64_t)CFSTR("model"));
}

- (VFXLOD)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXLOD *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VFXLOD;
  v7 = -[VFXLOD init](&v20, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->_mode = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("mode"), v12);
    v13 = objc_opt_class();
    v7->_model = (VFXModel *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("model"));
    objc_msgSend__didDecodeVFXLOD_(v7, v15, (uint64_t)a3, v16);
    objc_msgSend_setImmediateMode_(VFXTransaction, v17, v8, v18);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
