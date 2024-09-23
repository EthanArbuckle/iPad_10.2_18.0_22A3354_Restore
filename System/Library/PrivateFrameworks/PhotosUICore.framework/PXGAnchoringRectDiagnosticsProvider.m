@implementation PXGAnchoringRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];

  v5 = a3;
  v6 = a4;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enableAnchoringRectDiagnostics");

  if (v8)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PXGAnchoringRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v9[3] = &unk_1E51215B0;
    v10 = v5;
    v11 = v6;
    v12 = v13;
    objc_msgSend(v10, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v9);

    _Block_object_dispose(v13, 8);
  }

}

void __84__PXGAnchoringRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _OWORD v26[2];
  uint64_t v27;
  _OWORD v28[2];
  int v29;
  _OWORD v30[10];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = *(_DWORD *)off_1E50B8298;
  v7 = *((_OWORD *)off_1E50B8358 + 1);
  v28[0] = *(_OWORD *)off_1E50B8358;
  v28[1] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 7);
  v30[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v30[7] = v8;
  v9 = *((_OWORD *)off_1E50B83A0 + 9);
  v30[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v30[9] = v9;
  v10 = *((_OWORD *)off_1E50B83A0 + 3);
  v30[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v30[3] = v10;
  v11 = *((_OWORD *)off_1E50B83A0 + 5);
  v30[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v30[5] = v11;
  v12 = *((_OWORD *)off_1E50B83A0 + 1);
  v30[0] = *(_OWORD *)off_1E50B83A0;
  v30[1] = v12;
  v13 = *((_OWORD *)off_1E50B8398 + 1);
  v26[0] = *(_OWORD *)off_1E50B8398;
  v26[1] = v13;
  v27 = *((_QWORD *)off_1E50B8398 + 4);
  objc_msgSend(*(id *)(a1 + 32), "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", a2 | 0x100000000, &v29, v28, v30, v26);
  PXRectWithCenterAndSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Anchor #%li"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, uint64_t, double, double, double, double))(v24 + 16))(v24, v23, v25, a4, v15, v17, v19, v21);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

@end
