@implementation NSMapTable(PKAdditions)

+ (id)pk_copiedToWeakObjectsMapTable
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 0);
}

+ (id)pk_strongPointerPersonalityToWeakObjectsMapTable
{
  return (id)objc_msgSend(a1, "pk_createStrongPointerPersonalityToWeakObjects");
}

+ (uint64_t)pk_createStrongPointerPersonalityToWeakObjects
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 5, 0);
}

+ (uint64_t)pk_createStrongPointerPersonalityToStrongObjects
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
}

+ (uint64_t)pk_createWeakPointerPersonalityToStrongObjects
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
}

+ (uint64_t)pk_createWeakPointerPersonalityToWeakObjects
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 5, 0);
}

+ (id)pk_weakPointerPersonalityToStrongObjectsMapTable
{
  return (id)objc_msgSend(a1, "pk_createWeakPointerPersonalityToStrongObjects");
}

+ (id)pk_strongToWeakObjectsMapTable
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
}

@end
