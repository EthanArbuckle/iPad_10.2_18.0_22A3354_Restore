@implementation VUIUpdateMPSeasonMediaCollectionIdentifierPropertyDescriptor

id __VUIUpdateMPSeasonMediaCollectionIdentifierPropertyDescriptor_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CC2428];
  v6 = (void *)MEMORY[0x1E0CC2430];
  v7 = a4;
  objc_msgSend(v5, "vui_seasonIdentifierPredicate:comparison:", v7, objc_msgSend(v6, "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
