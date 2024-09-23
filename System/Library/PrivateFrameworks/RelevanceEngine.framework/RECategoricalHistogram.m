@implementation RECategoricalHistogram

uint64_t __53___RECategoricalHistogram_enumerateValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "countForValue:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
