@implementation VFXTransformConstraint

- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4
{
  VFXTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = -[VFXConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19CA5B4;
    v8[3] = &unk_1E63DAC50;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B19BD774(v8, CFSTR("transform"));
  }
  return v6;
}

- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4
{
  VFXTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = -[VFXConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19CABC0;
    v8[3] = &unk_1E63DAC50;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B19BD774(v8, CFSTR("translation"));
  }
  return v6;
}

- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  VFXTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXTransformConstraint;
  v6 = -[VFXConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19CAD8C;
    v8[3] = &unk_1E63DAC50;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__CFXConstraint *)sub_1B19BD774(v8, CFSTR("quaternion"));
  }
  return v6;
}

+ (id)transformConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v5;
  VFXTransformConstraint *v6;
  const char *v7;

  v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  return (id)objc_msgSend_initTransformInWorld_withBlock_(v6, v7, v5, (uint64_t)a4);
}

+ (id)positionConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v5;
  VFXTransformConstraint *v6;
  const char *v7;

  v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  return (id)objc_msgSend_initPositionInWorld_withBlock_(v6, v7, v5, (uint64_t)a4);
}

+ (id)orientationConstraintInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  _BOOL8 v5;
  VFXTransformConstraint *v6;
  const char *v7;

  v5 = a3;
  v6 = [VFXTransformConstraint alloc];
  return (id)objc_msgSend_initOrientationInWorldSpace_withBlock_(v6, v7, v5, (uint64_t)a4);
}

- (VFXTransformConstraint)initWithCoder:(id)a3
{
  VFXTransformConstraint *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXTransformConstraint;
  v4 = -[VFXConstraint init](&v8, sel_init);
  if (v4)
  {
    v4->super._constraintRef = (__CFXConstraint *)sub_1B19BD774(&unk_1E63D1490, CFSTR("transform"));
    objc_msgSend_finalizeDecodeConstraint_(v4, v5, (uint64_t)a3, v6);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = sub_1B19BD858((uint64_t)self->super._constraintRef);
  objc_msgSend_setConstraintRef_(v4, v6, (uint64_t)v5, v7);
  CFRelease(v5);
  objc_msgSend_copyTo_(self, v8, (uint64_t)v4, v9);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
