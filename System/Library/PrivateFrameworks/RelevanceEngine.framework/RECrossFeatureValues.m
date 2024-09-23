@implementation RECrossFeatureValues

void __RECrossFeatureValues_block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = objc_msgSend(a2, "integerValue");
  v6 = *(void **)(a1[6] + 8 * a3);
  if (REFeatureValueTypeForTaggedPointer((unint64_t)v6) == 1)
  {
    v7 = REIntegerValueForTaggedPointer((unint64_t)v6);
  }
  else
  {
    REFeatureValueForTaggedPointer(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "_integralFeatureValue");

  }
  v9 = ~(-1 << v5);
  if (v5 > 0x3F)
    v9 = -1;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) |= (v7 & v9) << *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v5;
}

@end
