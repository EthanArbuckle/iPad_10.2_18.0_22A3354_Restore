@implementation PUPhotosGridLayoutHelper

+ (int64_t)zIndexForItemAtIndexPath:(id)a3
{
  return 2147483646;
}

+ (int64_t)zIndexForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("PUFullMomentsHeader"), a4, a5);
  return 0;
}

+ (int64_t)zIndexForFloatingHeaderForVisualSection:(int64_t)a3
{
  return 0x7FFFFFFFLL;
}

@end
