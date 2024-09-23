@implementation WTTextEffectView

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _WTReplaceRemainderTextEffect *v5;
  void *v6;
  _WTReplaceRemainderTextEffect *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat MaxY;
  void *v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _WTReplaceRemainderTextEffect *v29;
  void *v30;
  void *v31;
  void (**v32)(void);
  void *v33;
  _QWORD v34[4];
  void (**v35)(void);
  _QWORD v36[4];
  _WTReplaceRemainderTextEffect *v37;
  id v38;
  id v39;
  CGRect v40;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateEffectWith:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_cacheHeightOfPreviews:forEffect:", v4, *(_QWORD *)(a1 + 32));

  if (objc_msgSend(*(id *)(a1 + 40), "_shouldApplyRemainderEffectForEffect:", *(_QWORD *)(a1 + 32)))
  {
    v5 = [_WTReplaceRemainderTextEffect alloc];
    objc_msgSend(*(id *)(a1 + 32), "chunk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_WTReplaceTextEffect initWithChunk:effectView:](v5, "initWithChunk:effectView:", v6, *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "textEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, v8);

    -[_WTTextEffect setIdentifier:](v7, "setIdentifier:", v8);
    objc_msgSend(*(id *)(a1 + 40), "replaceSourceRect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "platformCGRectValue");
    v12 = v11;

    objc_msgSend(*(id *)(a1 + 40), "replaceDestinationRect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "platformCGRectValue");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[_WTReplaceRemainderTextEffect setOffset:](v7, "setOffset:", v21 - v12);
    v40.origin.x = v15;
    v40.origin.y = v17;
    v40.size.width = v19;
    v40.size.height = v21;
    MaxY = CGRectGetMaxY(v40);
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = MaxY
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                             + 40);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 56)
                                                                - MaxY;
    v23 = *(void **)(a1 + 48);
    v24 = *(double **)(*(_QWORD *)(a1 + 56) + 8);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_2;
    v36[3] = &unk_251C074A0;
    v37 = v7;
    v38 = v23;
    v39 = *(id *)(a1 + 32);
    v25 = v24[4];
    v26 = v24[5];
    v27 = v24[6];
    v28 = v24[7];
    v29 = v7;
    objc_msgSend(v23, "textPreviewForRect:completion:", v36, v25, v26, v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hidesOriginal"))
  {
    v30 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "chunk");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_4;
    v34[3] = &unk_251C07238;
    v35 = (void (**)(void))*(id *)(a1 + 32);
    objc_msgSend(v30, "updateIsTextVisible:forChunk:completion:", 0, v31, v34);

    v32 = v35;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preCompletion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      return;
    objc_msgSend(*(id *)(a1 + 32), "preCompletion");
    v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v32[2]();
  }

}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  _QWORD v11[4];
  void (**v12)(void);
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v13[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateEffectWith:", v6);

    if (objc_msgSend(*(id *)(a1 + 32), "hidesOriginal"))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "chunk");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_3;
      v11[3] = &unk_251C07238;
      v12 = (void (**)(void))*(id *)(a1 + 48);
      objc_msgSend(v7, "updateIsTextVisible:forChunk:completion:", 0, v8, v11);

      v9 = v12;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 48), "preCompletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 48), "preCompletion");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "preCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "preCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "preCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "preCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __43___WTTextEffectView_removeEffect_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textEffects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __47___WTTextEffectView_updateSnapshotForEffectID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateEffectWith:", a2);
  if (objc_msgSend(*(id *)(a1 + 32), "hidesOriginal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "asyncSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chunk");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateIsTextVisible:forChunk:completion:", 0, v3, 0);

  }
}

@end
