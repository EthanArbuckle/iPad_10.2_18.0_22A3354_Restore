@implementation _UIWindowSceneFullscreenPlacement

+ (unint64_t)_placementType
{
  return 4;
}

- (_UIWindowSceneFullscreenPlacement)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneFullscreenPlacement;
  return (_UIWindowSceneFullscreenPlacement *)-[UIWindowScenePlacement _init](&v3, sel__init);
}

- (id)_createConfigurationWithError:(id *)a3
{
  return objc_alloc_init(MEMORY[0x1E0DC5C00]);
}

- (BOOL)_requestFullscreen
{
  return 1;
}

@end
