@implementation _UIWindowSceneBackgroundPlacement

+ (unint64_t)_placementType
{
  return 5;
}

- (_UIWindowSceneBackgroundPlacement)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneBackgroundPlacement;
  return (_UIWindowSceneBackgroundPlacement *)-[UIWindowScenePlacement _init](&v3, sel__init);
}

- (id)_createConfigurationWithError:(id *)a3
{
  return objc_alloc_init(MEMORY[0x1E0DC5BF8]);
}

- (BOOL)_requestBackground
{
  return 1;
}

@end
