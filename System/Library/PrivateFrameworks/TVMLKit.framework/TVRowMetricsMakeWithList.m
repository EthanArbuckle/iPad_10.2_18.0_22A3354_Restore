@implementation TVRowMetricsMakeWithList

void __TVRowMetricsMakeWithList_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = 0;
    if (v5)
      objc_msgSend(v5, "tv_rowMetricsValue", 0);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + 0.0;
    if (objc_msgSend(*(id *)(a1 + 32), "count", v7) - 1 == a3)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 72) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 88) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 104) = 0;
    }
  }

}

@end
