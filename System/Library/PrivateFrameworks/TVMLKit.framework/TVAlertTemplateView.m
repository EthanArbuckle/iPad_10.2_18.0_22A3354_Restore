@implementation TVAlertTemplateView

void __38___TVAlertTemplateView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  objc_msgSend(v5, "tv_margin");
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tv_margin");
  if (v8 >= v7)
    v9 = v8;
  else
    v9 = v7;
  if (!a3)
    v9 = 0.0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v9;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 440) == v5)
  {
    objc_msgSend(v5, "contentInset");
    v11 = v15 + *(double *)(a1 + 56) + v14;
    v13 = *(double *)(a1 + 72);
  }
  else
  {
    objc_msgSend(v5, "tv_maxWidth");
    objc_msgSend(v5, "tv_sizeThatFits:");
    v11 = v10;
    v13 = v12;
  }
  v16 = (*(double *)(a1 + 96) - v11) * 0.5;
  objc_msgSend(v5, "setFrame:", floorf(v16), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v11, v13);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v5;

}

@end
