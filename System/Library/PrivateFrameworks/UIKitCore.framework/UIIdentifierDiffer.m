@implementation UIIdentifierDiffer

void __43___UIIdentifierDiffer_collectionDifference__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __43___UIIdentifierDiffer_collectionDifference__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

@end
