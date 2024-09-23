@implementation UIWindowSceneStandardPlacement

+ (unint64_t)_placementType
{
  return 1;
}

+ (UIWindowSceneStandardPlacement)standardPlacement
{
  return (UIWindowSceneStandardPlacement *)(id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

- (id)_createConfigurationWithError:(id *)a3
{
  return objc_alloc_init(MEMORY[0x1E0DC5C40]);
}

@end
