@implementation BLSBacklightFBSSceneEnvironment

id __56__BLSBacklightFBSSceneEnvironment_UIKit__initWithScene___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bls_scenes_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "create BLSBacklightFBSSceneEnvironment (BacklightUIServices) for scene:%@", (uint8_t *)&v5, 0xCu);

  }
  return (id)objc_msgSend(*(id *)(a1 + 40), "initWithFBSScene:", *(_QWORD *)(a1 + 48));
}

@end
