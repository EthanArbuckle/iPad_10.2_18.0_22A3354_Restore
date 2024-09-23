@implementation __SwiftNativeNSError

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1EDC1B980 = (uint64_t)"__SwiftNativeNSError cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  Class Class;
  unint64_t v4;
  unint64_t ObjCClassMetadata;
  Class isa;
  uint64_t v7;
  objc_super v8;

  Class = swift::_swift_getClass((unint64_t)self, a2);
  if (qword_1ECD25400 != -1)
    dispatch_once_f(&qword_1ECD25400, &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
  {
    isa = self[1].super.super.isa;
    ObjCClassMetadata = (unint64_t)isa;
  }
  else
  {
    v4 = objc_opt_class();
    ObjCClassMetadata = swift_getObjCClassMetadata(v4);
    isa = self[1].super.super.isa;
  }
  v7 = *(unsigned __int8 *)(*((_QWORD *)isa - 1) + 80);
  (*(void (**)(unint64_t))(*(_QWORD *)(ObjCClassMetadata - 8) + 8))(((unint64_t)&self[1].super._userInfo
                                                                                       + v7) & ~v7);
  v8.receiver = self;
  v8.super_class = (Class)__SwiftNativeNSError;
  -[__SwiftNativeNSError dealloc](&v8, sel_dealloc);
}

- (id)domain
{
  return self->super._domain;
}

- (id)description
{
  Class *isa;
  uint64_t v4;
  unint64_t v5;
  _QWORD *BufferIn;
  id Description;
  void *v9[3];

  isa = (Class *)self[1].super.super.isa;
  v4 = *((unsigned __int8 *)*(isa - 1) + 80);
  v5 = ((unint64_t)&self[1].super._userInfo + v4) & ~v4;
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v9);
  (*(void (**)(_QWORD *, unint64_t))(*((_QWORD *)self[1].super.super.isa - 1) + 16))(BufferIn, v5);
  Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v9);
  return Description;
}

- (int64_t)code
{
  return self->super._code;
}

- (id)userInfo
{
  return self->super._userInfo;
}

- (Class)classForCoder
{
  if (qword_1ECD253F0 != -1)
    dispatch_once_f(&qword_1ECD253F0, &swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)swift::getNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  return (Class)swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const void *v7;
  Class Class;
  unsigned __int8 isEqual_indirect;
  unint64_t HashableBaseType;
  const void *v12;
  uint64_t v13;
  const void *v14;
  uint64_t HashableConformance;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;

  if (self == a3)
    return 1;
  v23 = v3;
  v24 = v4;
  if (a3)
  {
    Class = swift::_swift_getClass((unint64_t)a3, a2);
    if (qword_1ECD25400 != -1)
      dispatch_once_f(&qword_1ECD25400, &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
    if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
    {
      HashableBaseType = swift::SwiftError::getHashableBaseType((swift::SwiftError *)self, v7);
      if (HashableBaseType
        && (v13 = HashableBaseType,
            swift::SwiftError::getHashableBaseType((swift::SwiftError *)a3, v12) == HashableBaseType))
      {
        HashableConformance = swift::SwiftError::getHashableConformance((swift::SwiftError *)self, v14);
        if (HashableConformance)
        {
          v16 = HashableConformance;
          v17 = *(unsigned __int8 *)(*((_QWORD *)self[1].super.super.isa - 1) + 80);
          v18 = ((unint64_t)&self[1].super._userInfo + v17) & ~v17;
          v19 = *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)a3 + 5) - 8) + 80);
          isEqual_indirect = _swift_stdlib_Hashable_isEqual_indirect(v18, ((unint64_t)a3 + v19 + 72) & ~v19, v13, v16);
        }
        else
        {
          isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v20, sel_isEqual_, a3, self, __SwiftNativeNSError, v21.receiver, v21.super_class, v22.receiver, v22.super_class);
        }
      }
      else
      {
        isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v21, sel_isEqual_, a3, v20.receiver, v20.super_class, self, __SwiftNativeNSError, v22.receiver, v22.super_class);
      }
    }
    else
    {
      isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v22, sel_isEqual_, a3, v20.receiver, v20.super_class, v21.receiver, v21.super_class, self, __SwiftNativeNSError);
    }
  }
  else
  {
    isEqual_indirect = 0;
  }
  return isEqual_indirect & 1;
}

@end
