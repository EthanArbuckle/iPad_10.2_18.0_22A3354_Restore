@implementation PXGPPTLayoutTester

- (void)runGridLayoutTestWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, PXStatsCalculator *, uint64_t, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  PXGGridLayout *v15;
  PXStatsCalculator *v16;
  PXGGridLayout *v17;
  PXStatsCalculator *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  PXGGridLayout *v22;
  PXStatsCalculator *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  __CFString *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  __CFString *v37;

  v7 = a3;
  v8 = (void (**)(id, PXStatsCalculator *, uint64_t, uint64_t))a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTLayoutTester.m"), 34, CFSTR("itemsCount option is required to run test"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsIncrement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTLayoutTester.m"), 35, CFSTR("itemsIncrement option is required to run test"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsIncrement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  v15 = objc_alloc_init(PXGGridLayout);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5432;
  v36 = __Block_byref_object_dispose__5433;
  v37 = &stru_1E5149688;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5432;
  v30 = __Block_byref_object_dispose__5433;
  v31 = &stru_1E5149688;
  v16 = objc_alloc_init(PXStatsCalculator);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PXGPPTLayoutTester_runGridLayoutTestWithOptions_completionHandler___block_invoke;
  v21[3] = &unk_1E5117028;
  v17 = v15;
  v22 = v17;
  v18 = v16;
  v23 = v18;
  v24 = &v32;
  v25 = &v26;
  -[PXGPPTLayoutTester _iterateGridConfigurationsForItemsCount:itemsIncrement:handler:](self, "_iterateGridConfigurationsForItemsCount:itemsIncrement:handler:", v12, v14, v21);
  v8[2](v8, v18, v33[5], v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

- (void)runEditorialLayoutTestWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, PXStatsCalculator *, uint64_t, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PXEditorialTungstenLayout *v16;
  PXStatsCalculator *v17;
  PXEditorialTungstenLayout *v18;
  PXStatsCalculator *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  PXEditorialTungstenLayout *v23;
  PXStatsCalculator *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  __CFString *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  __CFString *v38;

  v7 = a3;
  v8 = (void (**)(id, PXStatsCalculator *, uint64_t, uint64_t))a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTLayoutTester.m"), 71, CFSTR("itemsCount option is required to run test"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsIncrement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTLayoutTester.m"), 72, CFSTR("itemsIncrement option is required to run test"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("itemsIncrement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  +[PXGPPTLayoutTesterItemInput createItemInputsForCount:](PXGPPTLayoutTesterItemInput, "createItemInputsForCount:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGPPTLayoutTester setInputItems:](self, "setInputItems:", v15);

  v16 = objc_alloc_init(PXEditorialTungstenLayout);
  -[PXGItemsLayout setDelegate:](v16, "setDelegate:", self);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5432;
  v37 = __Block_byref_object_dispose__5433;
  v38 = &stru_1E5149688;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5432;
  v31 = __Block_byref_object_dispose__5433;
  v32 = &stru_1E5149688;
  v17 = objc_alloc_init(PXStatsCalculator);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__PXGPPTLayoutTester_runEditorialLayoutTestWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E5117050;
  v18 = v16;
  v23 = v18;
  v19 = v17;
  v24 = v19;
  v25 = &v33;
  v26 = &v27;
  -[PXGPPTLayoutTester _iterateEditorialConfigurationsForItemsCount:itemsIncrement:handler:](self, "_iterateEditorialConfigurationsForItemsCount:itemsIncrement:handler:", v12, v14, v22);
  v8[2](v8, v19, v34[5], v28[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

}

- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4
{
  return 0;
}

- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4
{
  void *v5;
  void *v6;

  -[PXGPPTLayoutTester inputItems](self, "inputItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[PXGPPTLayoutTester inputItems](self, "inputItems", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredCropRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_iterateGridConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5
{
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v30;
  char v31;
  void (**v34)(id, uint64_t, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double);

  v34 = (void (**)(id, uint64_t, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double))a5;
  +[PXLayoutMetricInterpolator allLayoutMetricConfigurationSizes](PXLayoutMetricInterpolator, "allLayoutMetricConfigurationSizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGPPTLayoutTester mockPaddingValues](PXGPPTLayoutTester, "mockPaddingValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 1;
  do
  {
    v31 = v8;
    if (a4 < a3)
    {
      v9 = *((_QWORD *)&xmmword_1A7BA6CB0 + v7);
      v10 = a4;
      do
      {
        if (objc_msgSend(v5, "count"))
        {
          v11 = 0;
          do
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "CGSizeValue");
            v14 = v13;
            v16 = v15;

            if (objc_msgSend(v6, "count"))
            {
              v17 = 0;
              do
              {
                objc_msgSend(v6, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "PXEdgeInsetsValue");
                v20 = v19;
                v22 = v21;
                v24 = v23;
                v26 = v25;

                for (i = 1; i != 10; ++i)
                {
                  for (j = 0; j != 10; ++j)
                  {
                    for (k = 1; k != 3; ++k)
                    {
                      v30 = (void *)MEMORY[0x1A85CE17C]();
                      v34[2](v34, v9, v10, i, j, k, v14, v16, v20, v22, v24, v26);
                      objc_autoreleasePoolPop(v30);
                    }
                  }
                }
                ++v17;
              }
              while (v17 < objc_msgSend(v6, "count"));
            }
            ++v11;
          }
          while (v11 < objc_msgSend(v5, "count"));
        }
        v10 += a4;
      }
      while (v10 < a3);
    }
    v8 = 0;
    v7 = 1;
  }
  while ((v31 & 1) != 0);

}

- (void)_iterateEditorialConfigurationsForItemsCount:(int64_t)a3 itemsIncrement:(int64_t)a4 handler:(id)a5
{
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t i;
  int64_t v32;
  void (**v33)(id, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double);

  v33 = (void (**)(id, int64_t, uint64_t, uint64_t, uint64_t, double, double, double, double, double, double))a5;
  +[PXLayoutMetricInterpolator allLayoutMetricConfigurationSizes](PXLayoutMetricInterpolator, "allLayoutMetricConfigurationSizes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGPPTLayoutTester mockPaddingValues](PXGPPTLayoutTester, "mockPaddingValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = a4;
  if (a4 < a3)
  {
    v9 = a4;
    do
    {
      if (objc_msgSend(v7, "count"))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "CGSizeValue");
          v13 = v12;
          v15 = v14;

          if (objc_msgSend(v8, "count"))
          {
            v16 = 0;
            do
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "PXEdgeInsetsValue");
              v19 = v18;
              v21 = v20;
              v23 = v22;
              v25 = v24;

              v26 = 0;
              v27 = 1;
              do
              {
                v28 = 0;
                v29 = v27;
                v30 = qword_1A7C0CA00[v26];
                do
                {
                  for (i = 1; i != 3; ++i)
                    v33[2](v33, v9, v30, v28, i, v13, v15, v19, v21, v23, v25);
                  ++v28;
                }
                while (v28 != 5);
                v27 = 0;
                v26 = 1;
              }
              while ((v29 & 1) != 0);
              ++v16;
            }
            while (v16 < objc_msgSend(v8, "count"));
          }
          ++v10;
        }
        while (v10 < objc_msgSend(v7, "count"));
      }
      v9 += v32;
    }
    while (v9 < a3);
  }

}

- (NSArray)inputItems
{
  return self->_inputItems;
}

- (void)setInputItems:(id)a3
{
  objc_storeStrong((id *)&self->_inputItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputItems, 0);
}

void __74__PXGPPTLayoutTester_runEditorialLayoutTestWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double Current;
  double v21;
  double v22;
  double v23;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:");
  objc_msgSend(*(id *)(a1 + 32), "setPadding:", a8, a9, a10, a11);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfColumns:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfItems:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setInteritemSpacing:", (double)a4);
  objc_msgSend(*(id *)(a1 + 32), "setDisplayScale:", (double)a5);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "updateIfNeeded");
  v21 = CFAbsoluteTimeGetCurrent() - Current;
  objc_msgSend(*(id *)(a1 + 40), "addValue:", v21);
  objc_msgSend(*(id *)(a1 + 32), "diagnosticDescription");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "min");
  if (v21 == v22)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  objc_msgSend(*(id *)(a1 + 40), "max");
  if (v21 == v23)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);

}

void __69__PXGPPTLayoutTester_runGridLayoutTestWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double Current;
  double v24;
  double v25;
  double v26;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "setStyle:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setReferenceSize:", a7, a8);
  objc_msgSend(*(id *)(a1 + 32), "setPadding:", a9, a10, a11, a12);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfColumns:", a4);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfItems:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setInterItemSpacing:", (double)a5, (double)a5);
  objc_msgSend(*(id *)(a1 + 32), "setDisplayScale:", (double)a6);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "updateIfNeeded");
  v24 = CFAbsoluteTimeGetCurrent() - Current;
  objc_msgSend(*(id *)(a1 + 40), "addValue:", v24);
  objc_msgSend(*(id *)(a1 + 32), "diagnosticDescription");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "min");
  if (v24 == v25)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  objc_msgSend(*(id *)(a1 + 40), "max");
  if (v24 == v26)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);

}

+ (NSArray)mockPaddingValues
{
  if (mockPaddingValues_onceToken != -1)
    dispatch_once(&mockPaddingValues_onceToken, &__block_literal_global_5448);
  return (NSArray *)(id)mockPaddingValues_paddingValues;
}

void __39__PXGPPTLayoutTester_mockPaddingValues__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPXEdgeInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3B18];
  PXEdgeInsetsMake();
  objc_msgSend(v1, "valueWithPXEdgeInsets:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v3 = (void *)MEMORY[0x1E0CB3B18];
  PXEdgeInsetsMake();
  objc_msgSend(v3, "valueWithPXEdgeInsets:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v5 = (void *)MEMORY[0x1E0CB3B18];
  PXEdgeInsetsMake();
  objc_msgSend(v5, "valueWithPXEdgeInsets:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v7 = (void *)MEMORY[0x1E0CB3B18];
  PXEdgeInsetsMake();
  objc_msgSend(v7, "valueWithPXEdgeInsets:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)mockPaddingValues_paddingValues;
  mockPaddingValues_paddingValues = v9;

}

@end
