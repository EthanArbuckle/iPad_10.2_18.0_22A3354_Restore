@implementation PXScoreLabGraphView

void __43___PXScoreLabGraphView_loadCorrelationData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  id v20;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 656) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 632);
  }
  else
  {
    objc_msgSend(v20, "doubleValue");
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(double *)(v10 + 464);
    if (v11 >= v9)
      v11 = v9;
    *(double *)(v10 + 464) = v11;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(double *)(v12 + 472);
    if (v13 < v9)
      v13 = v9;
    *(double *)(v12 + 472) = v13;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
    objc_msgSend(v6, "doubleValue");
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(double *)(v16 + 480);
    if (v17 >= v15)
      v17 = v15;
    *(double *)(v16 + 480) = v17;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(double *)(v18 + 488);
    if (v19 < v15)
      v19 = v15;
    *(double *)(v18 + 488) = v19;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    *(double *)(*(_QWORD *)(a1 + 32) + 592) = v9 + *(double *)(*(_QWORD *)(a1 + 32) + 592);
    *(double *)(*(_QWORD *)(a1 + 32) + 600) = *(double *)(*(_QWORD *)(a1 + 32) + 600) + v9 * v9;
    *(double *)(*(_QWORD *)(a1 + 32) + 608) = v15 + *(double *)(*(_QWORD *)(a1 + 32) + 608);
    *(double *)(*(_QWORD *)(a1 + 32) + 616) = *(double *)(*(_QWORD *)(a1 + 32) + 616) + v15 * v15;
    *(double *)(*(_QWORD *)(a1 + 32) + 624) = *(double *)(*(_QWORD *)(a1 + 32) + 624) + v9 * v15;
  }

}

void __44___PXScoreLabGraphView_loadDistributionData__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    objc_msgSend(v2, "doubleValue");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(double *)(v4 + 464);
    if (v5 >= v3)
      v5 = v3;
    *(double *)(v4 + 464) = v5;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(double *)(v6 + 472);
    if (v7 < v3)
      v7 = v3;
    *(double *)(v6 + 472) = v7;
    *(double *)(*(_QWORD *)(a1 + 32) + 592) = v3 + *(double *)(*(_QWORD *)(a1 + 32) + 592);
    *(double *)(*(_QWORD *)(a1 + 32) + 600) = *(double *)(*(_QWORD *)(a1 + 32) + 600) + v3 * v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v2 = v8;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 632);
  }

}

void __34___PXScoreLabGraphView_reloadData__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  unint64_t v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[83];
    if (v3 >= 2)
    {
      if (v3 == 2)
        objc_msgSend(WeakRetained, "loadCorrelationData");
    }
    else
    {
      objc_msgSend(WeakRetained, "loadDistributionData");
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34___PXScoreLabGraphView_reloadData__block_invoke_2;
    block[3] = &unk_1E5149198;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __34___PXScoreLabGraphView_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 680));
  objc_msgSend(WeakRetained, "scoreLabGraphViewDidFinishReloading:", *(_QWORD *)(a1 + 32));

}

@end
