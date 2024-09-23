@implementation UIInterfaceActionRepresentationViewContext

uint64_t __79___UIInterfaceActionRepresentationViewContext_AppleTV__applyHighlightTransform__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned __int8 *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BYTE *v14;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  void *v23;
  _OWORD v24[8];
  _OWORD v25[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 17) || *(_BYTE *)(v2 + 16))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    objc_msgSend(WeakRetained, "bounds");
    v5 = v4;
    v7 = v6;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = *(unsigned __int8 **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v8, "_enlargedTransformForSize:pressed:", v8[17], v5, v7);
      v9 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
    }
    v30 = v38;
    v31 = v39;
    v32 = v40;
    v33 = v41;
    v26 = v34;
    v27 = v35;
    v28 = v36;
    v29 = v37;
    v10 = objc_loadWeakRetained((id *)(v9 + 24));
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v30;
    v25[5] = v31;
    v25[6] = v32;
    v25[7] = v33;
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    v25[3] = v29;
    objc_msgSend(v11, "setTransform:", v25);

    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setZPosition:", 1000.0);

    v14 = *(_BYTE **)(a1 + 32);
    if (!v14[17])
      return objc_msgSend(v14, "_insertMotionEffects");
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)(v2 + 24));
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v24[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v24[5] = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v24[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v24[7] = v19;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v24[0] = *MEMORY[0x1E0CD2610];
    v24[1] = v20;
    v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v24[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v24[3] = v21;
    objc_msgSend(v17, "setTransform:", v24);

    v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setZPosition:", 0.0);

    v14 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v14, "_removeMotionEffects");
}

void __75___UIInterfaceActionRepresentationViewContext_AppleTV__insertMotionEffects__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "addMotionEffect:", v3);

}

void __75___UIInterfaceActionRepresentationViewContext_AppleTV__removeMotionEffects__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "removeMotionEffect:", v3);

}

@end
