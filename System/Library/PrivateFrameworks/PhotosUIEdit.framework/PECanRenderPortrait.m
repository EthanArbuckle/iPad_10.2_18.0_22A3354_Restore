@implementation PECanRenderPortrait

void __PECanRenderPortrait_block_invoke()
{
  id v0;

  v0 = MTLCreateSystemDefaultDevice();
  PECanRenderPortrait_canRenderPortrait = objc_msgSend(v0, "supportsFeatureSet:", 1);

}

@end
