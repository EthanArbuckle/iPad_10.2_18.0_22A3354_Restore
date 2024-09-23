@implementation VKRasterTileOverlayTileLoader

void __VKRasterTileOverlayTileLoader_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D275D8]);
  objc_msgSend(v2, "setServerProxyClass:", objc_opt_class());
  objc_msgSend(v2, "setDiskCacheLocation:", 0);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D275D0]), "initWithConfiguration:", v2);
  v1 = (void *)VKRasterTileOverlayTileLoader::_loader;
  VKRasterTileOverlayTileLoader::_loader = v0;

}

@end
