@implementation MLMultiArray(Typed)

- (uint64_t)initForFloat32TypeWithShape:()Typed
{
  return objc_msgSend(a1, "initWithShape:dataType:error:", a3, 65568, 0);
}

- (uint64_t)initForDoubleTypeWithShape:()Typed
{
  return objc_msgSend(a1, "initWithShape:dataType:error:", a3, 65600, 0);
}

- (uint64_t)floatPointer
{
  return objc_msgSend(objc_retainAutorelease(a1), "dataPointer");
}

- (uint64_t)doublePointer
{
  return objc_msgSend(objc_retainAutorelease(a1), "dataPointer");
}

@end
