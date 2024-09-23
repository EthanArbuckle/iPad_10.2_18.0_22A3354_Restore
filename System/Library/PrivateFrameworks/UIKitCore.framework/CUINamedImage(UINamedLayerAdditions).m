@implementation CUINamedImage(UINamedLayerAdditions)

- (uint64_t)imageObj
{
  return objc_msgSend(a1, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", 0, 0, 0, 0);
}

@end
