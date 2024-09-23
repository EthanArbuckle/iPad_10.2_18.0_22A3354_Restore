@implementation VFXKeyedArchiver

+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = objc_allocWithZone(MEMORY[0x1E0C99DF0]);
  v10 = (id)objc_msgSend_initWithLength_(v7, v8, 0, v9);
  v11 = (void *)objc_opt_new();
  v12 = objc_allocWithZone((Class)a1);
  v15 = (id)objc_msgSend_initForWritingWithMutableData_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_setOptions_(v15, v16, (uint64_t)a4, v17);
  objc_msgSend_encodeObject_forKey_(v15, v18, (uint64_t)a3, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend_finishEncoding(v15, v19, v20, v21);
  objc_msgSend_drain(v11, v22, v23, v24);
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXKeyedArchiver;
  -[NSKeyedArchiver dealloc](&v3, sel_dealloc);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  double v7;
  const char *v8;
  objc_super v9;
  float32x4_t v10[4];

  if (!strcmp(a3, "{CATransform3D=dddddddddddddddd}"))
  {
    memset(v10, 0, sizeof(v10));
    *(_QWORD *)&v7 = *(_OWORD *)&sub_1B18DFD10(v10, (float64x2_t *)a4);
    objc_msgSend_encodeBytes_length_(self, v8, (uint64_t)v10, 64, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VFXKeyedArchiver;
    -[NSKeyedArchiver encodeValueOfObjCType:at:](&v9, sel_encodeValueOfObjCType_at_, a3, a4);
  }
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)skipMorphTargets
{
  return self->skipMorphTargets;
}

- (void)setSkipMorphTargets:(BOOL)a3
{
  self->skipMorphTargets = a3;
}

@end
