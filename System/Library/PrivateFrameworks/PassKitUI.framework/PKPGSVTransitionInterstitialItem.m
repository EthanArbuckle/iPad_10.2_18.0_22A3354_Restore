@implementation PKPGSVTransitionInterstitialItem

- (PKPGSVTransitionInterstitialItem)init
{

  return 0;
}

- (id)initWithView:(id *)a1
{
  id *result;
  id *v5;
  id *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id *v28;
  _QWORD v29[4];
  id *v30;
  objc_super v31;

  result = a2;
  v5 = result;
  if (!a1)
    goto LABEL_5;
  if (result)
  {
    v31.receiver = a1;
    v31.super_class = (Class)PKPGSVTransitionInterstitialItem;
    v6 = (id *)objc_msgSendSuper2(&v31, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      *((_BYTE *)a1 + 16) = objc_msgSend(a1[1], "isHidden");
      v7 = objc_alloc(MEMORY[0x1E0DC3828]);
      objc_msgSend(v5, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v7, "initWithBounds:format:", v16, v9, v11, v13, v15);

      v18 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke;
      v29[3] = &unk_1E3E64BE8;
      v30 = v5;
      objc_msgSend(v17, "imageWithActions:", v29);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a1[3];
      a1[3] = (id)v19;

      v21 = a1[3];
      objc_msgSend(a1[1], "alignmentRectInsets");
      objc_msgSend(v21, "imageWithAlignmentRectInsets:");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = a1[3];
      a1[3] = (id)v22;

      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = a1[4];
      a1[4] = v24;

      v26 = (void *)MEMORY[0x1E0DC3F10];
      v27[0] = v18;
      v27[1] = 3221225472;
      v27[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_3;
      v27[3] = &unk_1E3E612E8;
      a1 = a1;
      v28 = a1;
      objc_msgSend(v26, "performWithoutAnimation:", v27);

    }
LABEL_5:

    return a1;
  }
  __break(1u);
  return result;
}

void __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  PKUIPerformWithEffectiveTraitCollection(v4, v6);

}

void __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "CGContext"));

}

uint64_t __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHidden:", 1);
}

- (void)dealloc
{
  UIView *v3;
  BOOL viewWasHidden;
  UIView *v5;
  objc_super v6;
  _QWORD block[4];
  UIView *v8;
  BOOL v9;

  if (!self->_invalidated)
  {
    v3 = self->_view;
    viewWasHidden = self->_viewWasHidden;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke;
    block[3] = &unk_1E3E64C10;
    v8 = v3;
    v9 = viewWasHidden;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVTransitionInterstitialItem;
  -[PKPGSVTransitionInterstitialItem dealloc](&v6, sel_dealloc);
}

void __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke_2;
  v3[3] = &unk_1E3E64C10;
  v4 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "performWithoutAnimation:", v3);

}

uint64_t __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)beginTrackingWithConfiguration:(void *)a3 handler:
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id location;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    __break(1u);
LABEL_13:
    v21 = *MEMORY[0x1E0C9D538];
    v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(*(id *)(a1 + 24), "size");
    objc_msgSend(v4, "setFrame:", v21, v22, v23, v24);
    goto LABEL_6;
  }
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  v8 = objc_alloc(MEMORY[0x1E0DC3890]);
  if (*(_BYTE *)(a1 + 40))
    v9 = 0;
  else
    v9 = *(_QWORD *)(a1 + 24);
  v4 = (void *)objc_msgSend(v8, "initWithImage:", v9);
  if (*(_BYTE *)(a1 + 40))
    goto LABEL_13;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 8), "anchorPoint");
  objc_msgSend(v4, "setAnchorPoint:");
  objc_msgSend(v4, "setHidden:", 1);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.33333333);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("inputRadius"));

    v34[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v13);

  }
  objc_msgSend(v4, "pkui_setAlpha:animated:", 0, 0.0);
  if (*(_BYTE *)(a1 + 40))
  {
    ((void (**)(_QWORD, void *, void *))v3)[2](v3, v4, &__block_literal_global_35);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_initWeak(&location, (id)a1);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_2;
    aBlock[3] = &unk_1E3E61B68;
    objc_copyWeak(&v32, &location);
    v15 = v4;
    v31 = v15;
    v16 = _Block_copy(aBlock);
    v17 = objc_alloc(MEMORY[0x1E0D66CA8]);
    v28[0] = v14;
    v28[1] = 3221225472;
    v28[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_3;
    v28[3] = &unk_1E3E61590;
    v18 = v16;
    v29 = v18;
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_4;
    v25[3] = &unk_1E3E61850;
    v19 = (id)objc_msgSend(v17, "initWithBlock:", v28);
    v26 = v19;
    v20 = v18;
    v27 = v20;
    ((void (**)(_QWORD, id, _QWORD *))v3)[2](v3, v15, v25);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

}

void __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:", 0);
    objc_msgSend(WeakRetained[4], "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__PKPGSVTransitionInterstitialItem_invalidate__block_invoke;
    v11[3] = &unk_1E3E612E8;
    v11[4] = a1;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setImage:", 0, (_QWORD)v7);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
      }
      while (v4);
    }

  }
}

uint64_t __46__PKPGSVTransitionInterstitialItem_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHidden:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendedSnapshots, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
