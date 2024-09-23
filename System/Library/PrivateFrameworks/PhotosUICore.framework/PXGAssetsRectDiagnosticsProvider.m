@implementation PXGAssetsRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v16 = a3;
  v5 = a4;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableAssetsRectDiagnostics");

  if (v7)
  {
    objc_msgSend(v16, "visibleRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__PXGAssetsRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v17[3] = &unk_1E5121600;
    v18 = v5;
    objc_msgSend(v16, "enumerateSpritesInRect:usingBlock:", v17, v9, v11, v13, v15);

  }
}

void __81__PXGAssetsRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  long double v24;
  void *v25;
  void *v26;
  id v27;

  if (*(_BYTE *)(a6 + 1) == 2)
  {
    v9 = a7;
    objc_msgSend(v9, "displayAssetSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayAssetFetchResultForSpritesInRange:inLayout:", a2 | 0x100000000, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndex:", 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "conformsToProtocol:", &unk_1EEA65780))
    {
      objc_msgSend(v27, "weightUsingCriterion:", 0);
      v13 = v12;
      PXRectWithCenterAndSize();
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = (void *)MEMORY[0x1E0DC3658];
      if (v13 >= 0.0)
        v23 = v13;
      else
        v23 = 0.0;
      v24 = tanh(v23) * 0.25;
      objc_msgSend(v22, "colorWithHue:saturation:brightness:alpha:", (double)v24, 1.0, (double)(tanh(fmin(v13, 0.0)) + 1.0), 1.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Weight=%f"), *(_QWORD *)&v13);
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v15, v17, v19, v21);

    }
  }
}

@end
