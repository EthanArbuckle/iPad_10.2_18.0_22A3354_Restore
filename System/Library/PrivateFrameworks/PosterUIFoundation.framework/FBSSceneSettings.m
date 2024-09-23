@implementation FBSSceneSettings

uint64_t __60__FBSSceneSettings_PosterUIFoundation__pui_sceneAttachments__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t uint64;
  uint64_t v6;
  int64_t int64;
  void *v8;
  PUIPosterSceneAttachment *v9;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "contextId");
  v6 = xpc_dictionary_get_uint64(v4, "renderId");
  int64 = xpc_dictionary_get_int64(v4, "level");

  v8 = *(void **)(a1 + 32);
  v9 = -[PUIPosterSceneAttachment initWithContextId:renderId:level:]([PUIPosterSceneAttachment alloc], "initWithContextId:renderId:level:", uint64, v6, int64);
  objc_msgSend(v8, "addObject:", v9);

  return 1;
}

@end
