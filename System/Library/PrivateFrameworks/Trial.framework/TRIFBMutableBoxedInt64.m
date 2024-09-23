@implementation TRIFBMutableBoxedInt64

- (int64_t)val
{
  return self->_ptr->var0;
}

- (void)setVal:(int64_t)a3
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

- (TRIFBMutableBoxedInt64)init
{
  BoxedInt64 *v3;
  TRIFBMutableBoxedInt64 *result;
  objc_super v5;

  v3 = (BoxedInt64 *)operator new();
  v3->var0 = 0;
  if (!self)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)TRIFBMutableBoxedInt64;
  result = -[TRIFBBoxedInt64 init_](&v5, sel_init_);
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
  BoxedInt64 *ptr;
  objc_super v4;

  if (self->_deleteWhenDone)
  {
    ptr = self->_ptr;
    if (ptr)
      MEMORY[0x1A1AC6820](ptr, 0x1000C4000313F17);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBMutableBoxedInt64;
  -[TRIFBMutableBoxedInt64 dealloc](&v4, sel_dealloc);
}

- (const)cppPointer
{
  return self->_ptr;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id result;
  objc_super v6;

  v4 = (_QWORD *)operator new();
  *v4 = self->_ptr->var0;
  result = [TRIFBMutableBoxedInt64 alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)TRIFBMutableBoxedInt64;
    result = -[TRIFBBoxedInt64 init_](&v6, sel_init_);
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
  _QWORD *v4;
  id result;
  objc_super v6;

  v4 = (_QWORD *)operator new();
  *v4 = self->_ptr->var0;
  result = [TRIFBMutableBoxedInt64 alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)TRIFBMutableBoxedInt64;
    result = -[TRIFBBoxedInt64 init_](&v6, sel_init_);
    if (result)
    {
      *((_QWORD *)result + 1) = v4;
      *((_BYTE *)result + 16) = 1;
      *((_BYTE *)result + 17) = 1;
    }
  }
  return result;
}

- (TRIFBMutableBoxedInt64)initWithVal:(int64_t)a3
{
  TRIFBMutableBoxedInt64 *v4;
  TRIFBMutableBoxedInt64 *v5;

  v4 = -[TRIFBMutableBoxedInt64 init](self, "init");
  v5 = v4;
  if (v4)
    -[TRIFBMutableBoxedInt64 setVal:](v4, "setVal:", a3);
  return v5;
}

@end
