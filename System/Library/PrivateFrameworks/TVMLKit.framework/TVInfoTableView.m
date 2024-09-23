@implementation TVInfoTableView

void __33___TVInfoTableView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = *(double *)(a1 + 56);
  v6 = 0.0;
  if (v5 > 0.0)
    v6 = v5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = *(double *)(a1 + 48);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(double *)(a1 + 64) > 0.0)
    objc_msgSend(v9, "sizeThatFits:withHeaderWidth:", v7, v6);
  else
    objc_msgSend(v9, "sizeThatFits:", v7, v6);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "count") - 1 > a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 72)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

}

@end
