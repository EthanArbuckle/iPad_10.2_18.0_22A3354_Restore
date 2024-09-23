@implementation TRIFBImmutableBoxedInt64

- (_QWORD)initWithBufRef:(uint64_t)a3 cppPointer:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TRIFBImmutableBoxedInt64;
    v7 = objc_msgSendSuper2(&v9, sel_init_);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
    }
  }

  return a1;
}

- (TRIFBImmutableBoxedInt64)initWithBufRef:(id)a3 rawPointer:(const void *)a4
{
  return (TRIFBImmutableBoxedInt64 *)-[TRIFBImmutableBoxedInt64 initWithBufRef:cppPointer:](self, a3, (uint64_t)a4);
}

- (const)cppPointer
{
  return self->_ptr;
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

- (int64_t)val
{
  return self->_ptr->var0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
