@implementation NSArray

void __68__NSArray_SiriUIFoundationAdditions__sruif_arrayByMappingWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

@end
