@implementation NumericalValuesForKeyPath

void ___NumericalValuesForKeyPath_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D71718], "distinctValuesForKeyPath:inManagedObjectContext:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void ___NumericalValuesForKeyPath_block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  PXLabeledValue *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "doubleValue");
  if (v3 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringFromNumber:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXLabeledValue initWithValue:localizedLabel:]([PXLabeledValue alloc], "initWithValue:localizedLabel:", v6, v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

uint64_t ___NumericalValuesForKeyPath_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
