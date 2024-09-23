@implementation FBSSceneSettingsDiff

void __56__FBSSceneSettingsDiff_PosterUIFoundation__pui_inspect___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE384E0]);
  v1 = (void *)pui_inspect__inspector;
  pui_inspect__inspector = (uint64_t)v0;

}

uint64_t __56__FBSSceneSettingsDiff_PosterUIFoundation__pui_inspect___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end
