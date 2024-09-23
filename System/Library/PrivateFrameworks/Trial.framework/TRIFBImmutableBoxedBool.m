@implementation TRIFBImmutableBoxedBool

- (_QWORD)initWithBufRef:(uint64_t)a3 cppPointer:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TRIFBImmutableBoxedBool;
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

- (TRIFBImmutableBoxedBool)initWithBufRef:(id)a3 rawPointer:(const void *)a4
{
  return (TRIFBImmutableBoxedBool *)-[TRIFBImmutableBoxedBool initWithBufRef:cppPointer:](self, a3, (uint64_t)a4);
}

- (const)cppPointer
{
  return self->_ptr;
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

- (BOOL)val
{
  return self->_ptr->var0 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
