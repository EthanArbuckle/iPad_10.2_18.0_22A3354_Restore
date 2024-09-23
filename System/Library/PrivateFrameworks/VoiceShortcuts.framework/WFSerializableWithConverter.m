@implementation WFSerializableWithConverter

uint64_t __WFSerializableWithConverter_block_invoke(uint64_t a1, uint64_t a2)
{
  return WFSerializableWithConverter(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __WFSerializableWithConverter_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id result;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a2;
  WFSerializableWithConverter(a3, v9, v10);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  WFSerializableWithConverter(v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  result = v12;
  *a4 = result;
  return result;
}

@end
