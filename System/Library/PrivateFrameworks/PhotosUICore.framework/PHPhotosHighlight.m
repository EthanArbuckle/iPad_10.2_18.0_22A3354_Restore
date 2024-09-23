@implementation PHPhotosHighlight

uint64_t __91__PHPhotosHighlight_SharingSuggestionContainer__px_sl_getKeyAsset_suggestedDate_locations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "count");
  v6 = objc_msgSend(v4, "count");

  return v5 - v6;
}

@end
