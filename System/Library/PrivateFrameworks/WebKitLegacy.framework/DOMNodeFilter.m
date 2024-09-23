@implementation DOMNodeFilter

- (void)dealloc
{
  DOMObjectInternal *internal;
  objc_super v4;

  internal = self->super._internal;
  if (internal)
  {
    if (*((_DWORD *)internal + 4) == 1)
      (*(void (**)(DOMObjectInternal *, SEL))(*(_QWORD *)internal + 16))(internal, a2);
    else
      --*((_DWORD *)internal + 4);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMNodeFilter;
  -[DOMObject dealloc](&v4, sel_dealloc);
}

- (signed)acceptNode:(id)a3
{
  signed __int16 result;
  DOMAbstractView *v4;
  SEL v5;
  uint64_t v6;

  if (!a3)
    raiseTypeErrorException();
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, _QWORD))(*(_QWORD *)self->super._internal + 40))(&v6, self->super._internal, *((_QWORD *)a3 + 2));
  if (!HIDWORD(v6))
    return v6;
  if (HIDWORD(v6) == 1 && (_DWORD)v6)
    return 2;
  v4 = (DOMAbstractView *)std::__throw_bad_variant_access[abi:sn180100]();
  -[DOMAbstractView dealloc](v4, v5);
  return result;
}

@end
