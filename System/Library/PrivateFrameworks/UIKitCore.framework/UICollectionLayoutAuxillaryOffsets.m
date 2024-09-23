@implementation UICollectionLayoutAuxillaryOffsets

void __55___UICollectionLayoutAuxillaryOffsets_initWithOffsets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, a2);

}

void __50___UICollectionLayoutAuxillaryOffsets_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSRange v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:"), a2);
  v6.location = objc_msgSend(*(id *)(a1 + 40), "rangeForElementKind:", a2);
  v4 = *(void **)(a1 + 32);
  NSStringFromRange(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@)"), v5);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

@end
