@implementation WTSweepTextEffect

void __33___WTSweepTextEffect_invalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "displayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setDisplayLink:", 0);
  objc_msgSend(*(id *)(a1 + 32), "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

void __39___WTSweepTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "fadeOutLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeFromSuperlayer");

}

void __39___WTSweepTextEffect_updateEffectWith___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "rootMaskLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v51;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v8++), "removeFromSuperlayer");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v6);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v13), "layerWithContents", (_QWORD)v46);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "rootMaskLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSublayer:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "rootMaskLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  objc_msgSend(*(id *)(a1 + 32), "rootLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  objc_msgSend(*(id *)(a1 + 32), "rbLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

}

@end
