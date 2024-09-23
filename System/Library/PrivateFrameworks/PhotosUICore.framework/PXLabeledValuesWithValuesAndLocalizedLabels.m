@implementation PXLabeledValuesWithValuesAndLocalizedLabels

void __PXLabeledValuesWithValuesAndLocalizedLabels_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  PXLabeledValue *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

@end
