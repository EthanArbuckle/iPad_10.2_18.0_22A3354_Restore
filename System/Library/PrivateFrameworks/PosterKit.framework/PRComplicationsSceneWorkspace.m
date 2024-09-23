@implementation PRComplicationsSceneWorkspace

void __PRComplicationsSceneWorkspace_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", CFSTR("PRComplicationsSceneWorkspace"));
  v1 = (void *)PRComplicationsSceneWorkspace_workspace;
  PRComplicationsSceneWorkspace_workspace = v0;

}

@end
