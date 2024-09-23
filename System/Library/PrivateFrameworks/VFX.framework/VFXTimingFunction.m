@implementation VFXTimingFunction

- (VFXTimingFunction)initWithTimingFunctionRef:(__CFXTimingFunction *)a3
{
  VFXTimingFunction *v4;
  __CFXTimingFunction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXTimingFunction;
  v4 = -[VFXTimingFunction init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (__CFXTimingFunction *)CFRetain(a3);
    else
      v5 = 0;
    v4->_timingFunction = v5;
  }
  return v4;
}

- (void)dealloc
{
  __CFXTimingFunction *timingFunction;
  objc_super v4;

  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    CFRelease(timingFunction);
    self->_timingFunction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXTimingFunction;
  -[VFXTimingFunction dealloc](&v4, sel_dealloc);
}

+ (id)functionWithCAMediaTimingFunction:(id)a3
{
  id v3;
  uint64_t v4;
  VFXTimingFunction *v5;
  const char *v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v3 = sub_1B1881E78(a3, a2);
  if (!v3)
    return 0;
  v4 = (uint64_t)v3;
  v5 = [VFXTimingFunction alloc];
  return (id)objc_msgSend_initWithTimingFunctionRef_(v5, v6, v4, v7);
}

- (__CFXTimingFunction)cfxTimingFunction
{
  return self->_timingFunction;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  const char *v31;

  v10 = (_DWORD *)sub_1B180283C((uint64_t)self->_timingFunction, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v18 = sub_1B1802884((uint64_t)self->_timingFunction, v11, v12, v13, v14, v15, v16, v17);
  LODWORD(v19) = *v10;
  objc_msgSend_encodeFloat_forKey_(a3, v20, (uint64_t)CFSTR("c0"), v21, v19);
  LODWORD(v22) = v10[1];
  objc_msgSend_encodeFloat_forKey_(a3, v23, (uint64_t)CFSTR("c1"), v24, v22);
  LODWORD(v25) = v10[2];
  objc_msgSend_encodeFloat_forKey_(a3, v26, (uint64_t)CFSTR("c2"), v27, v25);
  LODWORD(v28) = v10[3];
  objc_msgSend_encodeFloat_forKey_(a3, v29, (uint64_t)CFSTR("c3"), v30, v28);
  objc_msgSend_encodeBool_forKey_(a3, v31, v18, (uint64_t)CFSTR("linear"));
}

- (VFXTimingFunction)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXTimingFunction *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  const char *v14;
  uint64_t v15;
  float v16;
  float v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  float v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VFXTimingFunction;
  v6 = -[VFXTimingFunction init](&v26, sel_init);
  if (v6)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("linear"), v5)
      && !objc_msgSend_decodeBoolForKey_(a3, v7, (uint64_t)CFSTR("linear"), v8))
    {
      objc_msgSend_decodeFloatForKey_(a3, v9, (uint64_t)CFSTR("c0"), v10);
      v13 = v12;
      objc_msgSend_decodeFloatForKey_(a3, v14, (uint64_t)CFSTR("c1"), v15);
      v17 = v16;
      objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("c2"), v19);
      v21 = v20;
      objc_msgSend_decodeFloatForKey_(a3, v22, (uint64_t)CFSTR("c3"), v23);
      v11 = sub_1B18027C0(v13, v17, v21, v24);
    }
    else
    {
      sub_1B18025CC(CFSTR("linear"));
    }
    v6->_timingFunction = (__CFXTimingFunction *)v11;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
