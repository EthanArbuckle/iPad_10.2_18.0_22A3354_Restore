@implementation PXGFocusRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a3;
  v5 = a4;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableFocusRectDiagnostics");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0DC37E0];
    objc_msgSend(v13, "axGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusSystemForEnvironment:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "focusedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v14[3] = &unk_1E5121650;
    v15 = v11;
    v16 = v5;
    v12 = v11;
    objc_msgSend(v13, "enumerateDescendantsLayoutsUsingBlock:", v14);

  }
}

void __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a2, "axGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadedLeafIndexes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5121628;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v6);

}

void __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;

  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "loadedLeafAtSpriteIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(void **)(a1 + 40) != v3)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, const __CFString *, char *, double, double, double, double))(v5 + 16))(v5, v14, CFSTR("Focus Item"), &v15, v7, v9, v11, v13);

  }
}

@end
