@implementation _PASZonedObject

- (_NSZone)allocationZone
{
  _NSZone *v4;

  v4 = (_NSZone *)MEMORY[0x1A1AFD6B0]();
  if (!v4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASZonedObject.m"), 42, CFSTR("NSZoneFromPointer() unexpectedly returned nil"));
  return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  size_t InstanceSize;
  void *v6;

  InstanceSize = class_getInstanceSize((Class)a1);
  v6 = NSZoneCalloc(a3, 1uLL, InstanceSize);
  return objc_constructInstance((Class)a1, v6);
}

- (void)dealloc
{
  NSZone *v4;
  void *v5;

  v4 = (NSZone *)MEMORY[0x1A1AFD6B0]();
  v5 = objc_destructInstance(self);
  if (!v5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASZonedObject.m"), 28, CFSTR("objc_destructInstance unexpectedly returned nil"));
  NSZoneFree(v4, v5);
}

@end
