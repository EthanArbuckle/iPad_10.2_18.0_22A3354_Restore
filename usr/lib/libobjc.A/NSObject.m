@implementation NSObject

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

+ (BOOL)isEqual:(id)a3
{
  return a3 == a1;
}

- (_NSZone)zone
{
  return 0;
}

- (BOOL)isProxy
{
  return 0;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
  return 0;
}

- (BOOL)retainWeakReference
{
  return -[NSObject _tryRetain](self, sel__tryRetain);
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
  return 0;
}

- (BOOL)allowsWeakReference
{
  return !-[NSObject _isDeallocating](self, sel__isDeallocating);
}

- (BOOL)_isDeallocating
{
  if (((unint64_t)self & 0x8000000000000000) != 0)
    return 0;
  if (((uint64_t)self->isa & 1) != 0)
    return (unint64_t)self->isa >> 44 == 0;
  return objc_object::sidetable_isDeallocating((objc_object *)self);
}

- (id)mutableCopy
{
  return -[NSObject mutableCopyWithZone:](self, sel_mutableCopyWithZone_, 0);
}

- (IMP)methodForSelector:(SEL)aSelector
{
  uint64_t v3;
  uint64_t v4;

  if (aSelector)
    return (IMP)object_getMethodImplementation((unint64_t)self, (objc_selector *)aSelector);
  -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_, v3, v4);
  return 0;
}

+ (BOOL)isSubclassOfClass:(Class)aClass
{
  BOOL v3;

  v3 = a1 != 0;
  if (a1 != aClass && a1)
  {
    do
    {
      a1 = (id)*((_QWORD *)a1 + 1);
      v3 = a1 != 0;
    }
    while (a1 != aClass && a1 != 0);
  }
  return v3;
}

+ (BOOL)isProxy
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return class_respondsToSelector_inst((objc_object *)self, (objc_selector *)a3, -[NSObject class](self, sel_class));
}

- (BOOL)conformsToProtocol:(id)a3
{
  Class v4;
  objc_class *v5;

  if (a3)
  {
    v4 = -[NSObject class](self, sel_class);
    if (v4)
    {
      v5 = v4;
      do
      {
        LOBYTE(v4) = class_conformsToProtocol(v5, (Protocol *)a3);
        if ((v4 & 1) != 0)
          break;
        v5 = (objc_class *)*((_QWORD *)v5 + 1);
      }
      while (v5);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return -[NSObject class](self, sel_class) == a3;
}

- (Class)class
{
  Class v2;

  if (self)
  {
    v2 = self;
    if (((unint64_t)self & 0x8000000000000000) != 0)
    {
      self = (Class)objc_debug_taggedpointer_classes[self & 7];
      if (self == (Class)__NSUnrecognizedTaggedPointer)
        return (Class)objc_debug_taggedpointer_ext_classes[((unint64_t)v2 >> 55)];
    }
    else
    {
      return (Class)(*(_QWORD *)self & 0xFFFFFFFF8);
    }
  }
  return self;
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class i;

  for (i = -[NSObject class](self, sel_class); i != a3 && i != 0; i = (Class)*((_QWORD *)i + 1))
    ;
  return i != 0;
}

+ (NSObject)new
{
  void (*v2)(void);

  if ((*(_WORD *)((*(_QWORD *)a1 & 0xFFFFFFFF8) + 0x1E) & 0x4000) != 0)
    v2 = _objc_rootAllocWithZone((uint64_t)a1);
  else
    v2 = (void (*)(void))objc_msgSend(a1, sel_alloc);
  return objc_msgSend(v2, sel_init);
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
  return class_respondsToSelector_inst(0, (objc_selector *)aSelector, (objc_class *)a1);
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector
{
  uint64_t v3;
  uint64_t v4;

  if (aSelector)
    return class_getMethodImplementation((Class)a1, aSelector);
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, v3, v4);
  return 0;
}

- (id)copy
{
  return -[NSObject copyWithZone:](self, sel_copyWithZone_, 0);
}

+ (Class)superclass
{
  return (Class)*((_QWORD *)a1 + 1);
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol
{
  BOOL result;

  result = 0;
  if (protocol && a1)
  {
    do
    {
      result = class_conformsToProtocol((Class)a1, protocol);
      if (result)
        break;
      a1 = (id)*((_QWORD *)a1 + 1);
    }
    while (a1);
  }
  return result;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
  return 0;
}

- (NSString)debugDescription
{
  return -[NSObject description](self, sel_description);
}

+ (void)methodForSelector:(SEL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return (void *)object_getMethodImplementation((unint64_t)a1, (objc_selector *)a3);
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, v3, v4);
  return 0;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return class_respondsToSelector_inst((objc_object *)a1, (objc_selector *)a3, (objc_class *)(*(_QWORD *)a1 & 0xFFFFFFFF8));
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(_QWORD *)a1 & 0xFFFFFFFF8) == (_QWORD)a3;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3)
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  return objc_msgSend(self, a3, a4);
}

- (id)performSelector:(SEL)a3
{
  if (!a3)
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  return objc_msgSend(self, a3);
}

- (BOOL)isFault
{
  return 0;
}

+ (BOOL)isKindOfClass:(Class)a3
{
  BOOL i;
  _QWORD *v4;
  BOOL result;

  v4 = (_QWORD *)(*(_QWORD *)a1 & 0xFFFFFFFF8);
  for (i = v4 == 0; ; i = v4 == 0)
  {
    result = !i;
    if (v4 == (_QWORD *)a3 || v4 == 0)
      break;
    v4 = (_QWORD *)v4[1];
  }
  return result;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3)
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  return objc_msgSend(self, a3, a4, a5);
}

+ (id)performSelector:(SEL)a3
{
  if (!a3)
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  return objc_msgSend(a1, a3);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3)
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  return objc_msgSend(a1, a3, a4);
}

- (Class)superclass
{
  return (Class)*((_QWORD *)-[NSObject class](self, sel_class) + 1);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3)
    objc_msgSend(a1, sel_doesNotRecognizeSelector_);
  return objc_msgSend(a1, a3, a4, a5);
}

+ (BOOL)isAncestorOfObject:(id)a3
{
  _QWORD *i;

  for (i = objc_msgSend(a3, sel_class); i != a1 && i != 0; i = (_QWORD *)i[1])
    ;
  return i != 0;
}

+ (BOOL)isFault
{
  return 0;
}

+ (void)doesNotRecognizeSelector:(SEL)a3
{
  const char *Name;
  uint64_t v6;
  const char *v7;
  char *v8;
  SEL v9;

  Name = class_getName((Class)a1);
  v9 = "<null selector>";
  if (a3)
    v9 = a3;
  _objc_fatal("+[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, Name, v9, a1);
}

+ (NSMethodSignature)instanceMethodSignatureForSelector:(SEL)aSelector
{
  char *v3;

  _objc_fatal("+[NSObject instanceMethodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, aSelector, v3);
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  char *v3;

  _objc_fatal("+[NSObject methodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, a3, v3);
}

+ (void)forwardInvocation:(id)a3
{
  if (a3)
    a3 = objc_msgSend(a3, sel_selector);
  objc_msgSend(a1, sel_doesNotRecognizeSelector_, a3);
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

+ (NSString)description
{
  return 0;
}

+ (NSString)debugDescription
{
  return (NSString *)objc_msgSend(a1, sel_description);
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

+ (unint64_t)retainCount
{
  return -1;
}

+ (_NSZone)zone
{
  return 0;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
  const char *ClassName;
  uint64_t v6;
  const char *v7;
  char *v8;
  SEL v9;

  ClassName = object_getClassName(self);
  v9 = "<null selector>";
  if (aSelector)
    v9 = aSelector;
  _objc_fatal("-[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, ClassName, v9, self);
}

- (NSMethodSignature)methodSignatureForSelector:(SEL)aSelector
{
  char *v3;

  _objc_fatal("-[NSObject methodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, aSelector, v3);
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
  if (anInvocation)
    anInvocation = -[NSInvocation selector](anInvocation, sel_selector);
  -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_, anInvocation);
}

- (NSString)description
{
  return 0;
}

@end
