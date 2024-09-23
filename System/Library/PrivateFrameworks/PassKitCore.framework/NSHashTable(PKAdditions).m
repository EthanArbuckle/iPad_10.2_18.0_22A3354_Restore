@implementation NSHashTable(PKAdditions)

+ (id)pk_weakObjectsHashTableUsingPointerPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
}

+ (id)pk_hashTableUsingPointerPersonality
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 0);
}

@end
