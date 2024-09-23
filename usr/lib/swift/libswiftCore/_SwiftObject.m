@implementation _SwiftObject

+ (_TtCs12_SwiftObject)allocWithZone:(_NSZone *)a3
{
  size_t InstanceSize;

  InstanceSize = class_getInstanceSize((Class)a1);
  return (_TtCs12_SwiftObject *)swift_allocObject((uint64_t)a1, InstanceSize, 0xFuLL);
}

+ (_TtCs12_SwiftObject)alloc
{
  size_t InstanceSize;

  InstanceSize = class_getInstanceSize((Class)a1);
  return (_TtCs12_SwiftObject *)swift_allocObject((uint64_t)a1, InstanceSize, 0xFuLL);
}

- (Class)class
{
  return (Class)((uint64_t)self->isa & 0xFFFFFFFF8);
}

+ (Class)superclass
{
  return (Class)*((_QWORD *)a1 + 1);
}

- (Class)superclass
{
  return *(Class *)(((uint64_t)self->isa & 0xFFFFFFFF8) + 8);
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(_QWORD *)a1 & 0xFFFFFFFF8) == (_QWORD)a3;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return ((uint64_t)self->isa & 0xFFFFFFFF8) == (_QWORD)a3;
}

- (BOOL)isProxy
{
  return 0;
}

- (_NSZone)zone
{
  _NSZone *result;

  result = (_NSZone *)malloc_zone_from_ptr(self);
  if (!result)
    return (_NSZone *)malloc_default_zone();
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  objc_class *v4;
  _BOOL4 isMetaClass;
  const char *v6;
  char *v7;
  uint64_t v8;
  const char *Name;
  const char *v10;

  v4 = (objc_class *)((uint64_t)self->isa & 0xFFFFFFFF8);
  isMetaClass = class_isMetaClass(v4);
  Name = class_getName(v4);
  v10 = sel_getName(a3);
  v8 = 45;
  if (isMetaClass)
    v8 = 43;
  swift::fatalError(0, "Unrecognized selector %c[%s %s]\n", v6, v7, v8, Name, v10);
}

- (_TtCs12_SwiftObject)retain
{
  uint64_t v2;
  char *v3;

  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  return self;
}

- (BOOL)_tryRetain
{
  const char *v2;
  char *v3;

  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (BOOL)allowsWeakReference
{
  return swift_isDeallocating((uint64_t)self) ^ 1;
}

- (BOOL)retainWeakReference
{
  const char *v2;
  char *v3;

  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (void)_setWeaklyReferenced
{
  Class isa;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  isa = self[1].isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    v3 = (unint64_t *)&self[1];
    v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3))
            return;
        }
        else
        {
          __clrex();
        }
        v4 = v5;
      }
    }
    if (__stxr((unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, v3))
      goto LABEL_10;
  }
}

- (void)_noteAssociatedObjects
{
  Class isa;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  isa = self[1].isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    v3 = (unint64_t *)&self[1];
    v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3))
            return;
        }
        else
        {
          __clrex();
        }
        v4 = v5;
      }
    }
    if (__stxr((unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, v3))
      goto LABEL_10;
  }
}

+ (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  BOOL i;
  _QWORD *v4;
  BOOL result;

  v4 = (_QWORD *)((uint64_t)self->isa & 0xFFFFFFFF8);
  for (i = v4 == 0; ; i = v4 == 0)
  {
    result = !i;
    if (v4 == (_QWORD *)a3 || v4 == 0)
      break;
    v4 = (_QWORD *)v4[1];
  }
  return result;
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  BOOL v3;

  v3 = a1 != 0;
  if (a1 != a3 && a1)
  {
    do
    {
      a1 = (id)*((_QWORD *)a1 + 1);
      v3 = a1 != 0;
    }
    while (a1 != a3 && a1 != 0);
  }
  return v3;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)(*(_QWORD *)a1 & 0xFFFFFFFF8), a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)((uint64_t)self->isa & 0xFFFFFFFF8), a3);
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)a1, a3);
}

+ (void)methodForSelector:(SEL)a3
{
  objc_class *Class;

  Class = object_getClass(a1);
  return class_getMethodImplementation(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  objc_class *Class;

  Class = object_getClass(self);
  return class_getMethodImplementation(Class, a3);
}

+ (void)instanceMethodForSelector:(SEL)a3
{
  return class_getMethodImplementation((Class)a1, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_class *Superclass;
  BOOL v5;

  if (!a3)
    return 0;
  Superclass = (objc_class *)((uint64_t)self->isa & 0xFFFFFFFF8);
  if (!Superclass)
    return 0;
  do
  {
    v5 = class_conformsToProtocol(Superclass, (Protocol *)a3);
    if (v5)
      break;
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  return v5;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  BOOL v3;
  objc_class *Superclass;

  v3 = 0;
  if (a3)
  {
    Superclass = (objc_class *)a1;
    if (a1)
    {
      do
      {
        v3 = class_conformsToProtocol(Superclass, (Protocol *)a3);
        if (v3)
          break;
        Superclass = class_getSuperclass(Superclass);
      }
      while (Superclass);
    }
  }
  return v3;
}

- (unint64_t)hash
{
  _TtCs12_SwiftObject *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  objc_class *v6;
  const char *Name;
  const char *v8;
  char *v9;
  uint64_t v11;
  _TtCs12_SwiftObject *v12;

  v2 = self;
  v12 = self;
  if (!swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self))
  {
    v3 = (uint64_t)v2->isa & 0xFFFFFFFF8;
    v4 = swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Hashable);
    if (v4)
    {
      return _getErrorCode<A>(_:)(&v12, v3, v4);
    }
    else if (swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Equatable))
    {
      v11 = objc_opt_class();
      os_unfair_lock_lock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      if (qword_1EDC2B848 != -1)
        dispatch_once_f(&qword_1EDC2B848, &-[_TtCs12_SwiftObject hash]::warned, (dispatch_function_t)swift::Lazy<std::unordered_set<objc_class *>>::defaultInitCallback);
      std::__hash_table<objc_class *,std::hash<objc_class *>,std::equal_to<objc_class *>,std::allocator<objc_class *>>::__emplace_unique_key_args<objc_class *,objc_class * const&>((uint64_t)&-[_TtCs12_SwiftObject hash]::warned, &v11, &v11);
      if (v5)
      {
        v6 = (objc_class *)objc_opt_class();
        Name = class_getName(v6);
          "ead to severe performance problems.\n",
          v8,
          v9,
          Name);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      return 1;
    }
  }
  return (unint64_t)v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *ConformingSuperclass;
  id v10;
  _TtCs12_SwiftObject *v11;

  v10 = a3;
  v11 = self;
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6 & 1;
  }
  if ((swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self) & 1) != 0)
    goto LABEL_6;
  v5 = (uint64_t)self->isa & 0xFFFFFFFF8;
  v6 = swift_conformsToProtocolCommon(v5, (uint64_t)&protocol descriptor for Equatable);
  if (v6)
  {
    v7 = v6;
    ConformingSuperclass = (uint64_t *)swift::findConformingSuperclass(v5, *(_QWORD *)v6);
    if ((_swift_class_isSubclass(*(_QWORD *)a3 & 0xFFFFFFFF8, ConformingSuperclass) & 1) != 0)
    {
      LOBYTE(v6) = _swift_stdlib_Equatable_isEqual_indirect((uint64_t)&v11, (uint64_t)&v10, (uint64_t)ConformingSuperclass, v7);
      return v6 & 1;
    }
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (id)performSelector:(SEL)a3
{
  return objc_msgSend(self, a3);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  return objc_msgSend(self, a3, a4);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  return objc_msgSend(self, a3, a4, a5);
}

- (NSString)description
{
  uint64_t v2;
  char *v3;
  Class *v5;
  void *Description;
  _TtCs12_SwiftObject *v8;

  v8 = self;
  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  v5 = (Class *)((uint64_t)self->isa & 0xFFFFFFFF8);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v8, v5);
  (*((void (**)(_TtCs12_SwiftObject **, Class *))*(v5 - 1) + 1))(&v8, v5);
  return (NSString *)Description;
}

- (NSString)debugDescription
{
  uint64_t v2;
  char *v3;
  Class *v5;
  void *Description;
  _TtCs12_SwiftObject *v8;

  v8 = self;
  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  v5 = (Class *)((uint64_t)self->isa & 0xFFFFFFFF8);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v8, v5);
  (*((void (**)(_TtCs12_SwiftObject **, Class *))*(v5 - 1) + 1))(&v8, v5);
  return (NSString *)Description;
}

+ (id)description
{
  uint8x16_t *Name;
  size_t v3;

  Name = (uint8x16_t *)class_getName((Class)a1);
  v3 = strlen(Name->i8);
  return (id)swift_stdlib_NSStringFromUTF8(Name, v3);
}

+ (id)debugDescription
{
  uint8x16_t *Name;
  size_t v3;

  Name = (uint8x16_t *)class_getName((Class)a1);
  v3 = strlen(Name->i8);
  return (id)swift_stdlib_NSStringFromUTF8(Name, v3);
}

- (id)_copyDescription
{
  return -[_SwiftObject description](self, "description");
}

- (unint64_t)_cfTypeID
{
  return 1;
}

- (BOOL)isNSArray__
{
  return 0;
}

- (BOOL)isNSCFConstantString__
{
  return 0;
}

- (BOOL)isNSData__
{
  return 0;
}

- (BOOL)isNSDate__
{
  return 0;
}

- (BOOL)isNSDictionary__
{
  return 0;
}

- (BOOL)isNSObject__
{
  return 0;
}

- (BOOL)isNSOrderedSet__
{
  return 0;
}

- (BOOL)isNSNumber__
{
  return 0;
}

- (BOOL)isNSSet__
{
  return 0;
}

- (BOOL)isNSString__
{
  return 0;
}

- (BOOL)isNSTimeZone__
{
  return 0;
}

- (BOOL)isNSValue__
{
  return 0;
}

@end
