@implementation CALayer(TSDTilingLayerSupport)

- (uint64_t)setNeedsLayoutForTilingLayers
{
  return objc_msgSend((id)objc_msgSend(a1, "sublayers"), "makeObjectsPerformSelector:", a2);
}

- (uint64_t)tilingSafeSetSublayers:()TSDTilingLayerSupport
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqualToArray:", objc_msgSend(a1, "sublayers"));
  if ((result & 1) == 0)
    return objc_msgSend(a1, "setSublayers:", a3);
  return result;
}

- (BOOL)tilingSafeHasContents
{
  return objc_msgSend(a1, "contents") != 0;
}

- (uint64_t)setNeedsDisplayForDirtyTiles:()TSDTilingLayerSupport
{
  return objc_msgSend((id)objc_msgSend(a1, "superlayer"), "setNeedsDisplayForDirtyTiles:", a3);
}

- (uint64_t)setTileContents:()TSDTilingLayerSupport
{
  char isKindOfClass;
  uint64_t v7;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a3 && (isKindOfClass & 1) == 0)
    return objc_msgSend(a1, "setContents:", a3);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "sublayers"), "objectAtIndex:", 0), "setDelegate:", 0);
  if (a3)
    v7 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
  else
    v7 = 0;
  objc_msgSend(a1, "setSublayers:", v7);
  objc_msgSend(a1, "setContents:", 0);
  objc_msgSend(a3, "setEdgeAntialiasingMask:", objc_msgSend(a1, "edgeAntialiasingMask"));
  return objc_msgSend(a3, "setDelegate:", objc_msgSend(a1, "superlayer"));
}

- (uint64_t)tileContentsLayer
{
  return 0;
}

@end
