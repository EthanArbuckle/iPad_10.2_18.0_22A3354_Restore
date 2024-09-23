@implementation PHSuggestion(PhotosUICore)

- (uint64_t)px_isFeaturedPhoto
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CD17D0], "allFeaturedStateEnabledSuggestionTypesForWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (uint64_t)px_keyAssetFilteringPredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(additionalAttributes.importedBy != %d) AND (kindSubtype != %d)"), 7, 10);
}

@end
