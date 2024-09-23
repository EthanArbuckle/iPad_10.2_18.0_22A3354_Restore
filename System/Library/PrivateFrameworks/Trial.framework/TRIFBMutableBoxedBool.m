@implementation TRIFBMutableBoxedBool

- (BOOL)val
{
  return self->_ptr->var0 != 0;
}

- (void)setVal:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (self && !self->_allowMutation)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ mutating method sent to immutable object"), v5);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInternalInconsistencyException"), v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  self->_ptr->var0 = a3;
}

- (TRIFBMutableBoxedBool)init
{
  BoxedBool *v3;
  TRIFBMutableBoxedBool *result;
  objc_super v5;

  v3 = (BoxedBool *)operator new();
  v3->var0 = 0;
  if (!self)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)TRIFBMutableBoxedBool;
  result = -[TRIFBBoxedBool init_](&v5, sel_init_);
  if (result)
  {
    result->_ptr = v3;
    result->_deleteWhenDone = 1;
    result->_allowMutation = 1;
  }
  return result;
}

- (void)dealloc
{
  BoxedBool *ptr;
  objc_super v4;

  if (self->_deleteWhenDone)
  {
    ptr = self->_ptr;
    if (ptr)
      MEMORY[0x1A1AC6820](ptr, 0x1000C4077774924);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBMutableBoxedBool;
  -[TRIFBMutableBoxedBool dealloc](&v4, sel_dealloc);
}

- (const)cppPointer
{
  return self->_ptr;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  id result;
  objc_super v6;

  v4 = (_BYTE *)operator new();
  *v4 = self->_ptr->var0;
  result = [TRIFBMutableBoxedBool alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)TRIFBMutableBoxedBool;
    result = -[TRIFBBoxedBool init_](&v6, sel_init_);
    if (result)
    {
      *((_QWORD *)result + 1) = v4;
      *((_BYTE *)result + 16) = 1;
      *((_BYTE *)result + 17) = 0;
    }
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  id result;
  objc_super v6;

  v4 = (_BYTE *)operator new();
  *v4 = self->_ptr->var0;
  result = [TRIFBMutableBoxedBool alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)TRIFBMutableBoxedBool;
    result = -[TRIFBBoxedBool init_](&v6, sel_init_);
    if (result)
    {
      *((_QWORD *)result + 1) = v4;
      *((_BYTE *)result + 16) = 1;
      *((_BYTE *)result + 17) = 1;
    }
  }
  return result;
}

- (TRIFBMutableBoxedBool)initWithVal:(BOOL)a3
{
  _BOOL8 v3;
  TRIFBMutableBoxedBool *v4;
  TRIFBMutableBoxedBool *v5;

  v3 = a3;
  v4 = -[TRIFBMutableBoxedBool init](self, "init");
  v5 = v4;
  if (v4)
    -[TRIFBMutableBoxedBool setVal:](v4, "setVal:", v3);
  return v5;
}

@end
