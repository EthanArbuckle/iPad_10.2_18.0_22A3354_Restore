@implementation PHPerson(PXSelectionAssetContainer)

- (uint64_t)px_isEmpty
{
  return 0;
}

- (BOOL)px_isFavorite
{
  return objc_msgSend(a1, "type") == 1;
}

- (uint64_t)px_canPerformFavoriteAction
{
  return 1;
}

@end
