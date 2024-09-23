@implementation UICollectionViewListCell(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

@end
