@implementation PXGRectDiagnosticsLayer

- (void)update
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  unint64_t j;
  void *v19;
  PXGRectDiagnosticsLayer *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD aBlock[9];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  v20 = self;
  -[PXGRectDiagnosticsLayer superlayer](self, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PXGRectDiagnosticsLayer setFrame:](self, "setFrame:");

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[PXGRectDiagnosticsLayer layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsRectDiagnosticsDebugHUD");

    if (v7)
    {
      objc_msgSend(v5, "visibleRect");
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __33__PXGRectDiagnosticsLayer_update__block_invoke;
      aBlock[3] = &unk_1E5121560;
      aBlock[5] = &v28;
      aBlock[4] = self;
      aBlock[6] = v9;
      aBlock[7] = v10;
      aBlock[8] = a2;
      v11 = _Block_copy(aBlock);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[PXGRectDiagnosticsLayer rectDiagnosticsProviders](self, "rectDiagnosticsProviders");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v21[0] = v8;
            v21[1] = 3221225472;
            v21[2] = __33__PXGRectDiagnosticsLayer_update__block_invoke_2;
            v21[3] = &unk_1E5121588;
            v22 = v11;
            objc_msgSend(v16, "enumerateRectDiagnosticsForLayout:usingBlock:", v5, v21);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v13);
      }

    }
  }
  -[PXGRectDiagnosticsLayer sublayers](v20, "sublayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = v29[3]; j < objc_msgSend(v17, "count"); ++j)
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", j);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  _Block_object_dispose(&v28, 8);
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (void)setRectDiagnosticsProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (NSArray)defaultRectDiagnosticsProviders
{
  PXGAnchoringRectDiagnosticsProvider *v2;
  PXGSpritesRectDiagnosticsProvider *v3;
  PXGAssetsRectDiagnosticsProvider *v4;
  PXGFocusRectDiagnosticsProvider *v5;
  PXGCurrentFocusRectDiagnosticsProvider *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PXGAnchoringRectDiagnosticsProvider);
  v9[0] = v2;
  v3 = objc_alloc_init(PXGSpritesRectDiagnosticsProvider);
  v9[1] = v3;
  v4 = objc_alloc_init(PXGAssetsRectDiagnosticsProvider);
  v9[2] = v4;
  v5 = objc_alloc_init(PXGFocusRectDiagnosticsProvider);
  v9[3] = v5;
  v6 = objc_alloc_init(PXGCurrentFocusRectDiagnosticsProvider);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)rectDiagnosticsProviders
{
  return self->_rectDiagnosticsProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectDiagnosticsProviders, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

void __33__PXGRectDiagnosticsLayer_update__block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v13 = a2;
  v14 = a3;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(_QWORD *)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v16 + 1;
  objc_msgSend(*(id *)(a1 + 32), "sublayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  if (v18 < v19)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addSublayer:", v20);
      objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSublayer:", v21);

      objc_msgSend(*(id *)(a1 + 32), "sublayers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    }
    while (v23 < v24);
  }
  objc_msgSend(*(id *)(a1 + 32), "sublayers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "colorWithAlphaComponent:", 0.15);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

  v28 = objc_retainAutorelease(v13);
  objc_msgSend(v26, "setBorderColor:", objc_msgSend(v28, "CGColor"));
  objc_msgSend(v26, "setBorderWidth:", 5.0);
  v43.origin.x = a4;
  v43.origin.y = a5;
  v43.size.width = a6;
  v43.size.height = a7;
  v44 = CGRectOffset(v43, -*(double *)(a1 + 48), -*(double *)(a1 + 56));
  objc_msgSend(v26, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
  objc_msgSend(v26, "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "contentsScale");
  objc_msgSend(v26, "setContentsScale:");
  objc_msgSend(v26, "sublayers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 64);
    v35 = *(_QWORD *)(a1 + 32);
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("PXGRectDiagnosticsLayer.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sublayer.sublayers.firstObject"), v37);
LABEL_8:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(a1 + 64);
    v39 = *(_QWORD *)(a1 + 32);
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "px_descriptionForAssertionMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v38, v39, CFSTR("PXGRectDiagnosticsLayer.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sublayer.sublayers.firstObject"), v37, v41);

    goto LABEL_8;
  }
LABEL_5:
  objc_msgSend(v26, "bounds");
  v46 = CGRectInset(v45, 10.0, 10.0);
  objc_msgSend(v30, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  objc_msgSend(v30, "setString:", v14);
  objc_msgSend(v30, "setFontSize:", 13.0);
  v42 = objc_retainAutorelease(v28);
  objc_msgSend(v30, "setForegroundColor:", objc_msgSend(v42, "CGColor"));
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v30, "setShadowColor:", objc_msgSend(v31, "CGColor"));

  objc_msgSend(v30, "setShadowOffset:", 0.0, 0.0);
  objc_msgSend(v30, "setShadowRadius:", 5.0);
  LODWORD(v32) = 1.0;
  objc_msgSend(v30, "setShadowOpacity:", v32);
  objc_msgSend(v30, "setWrapped:", 1);
  objc_msgSend(*(id *)(a1 + 32), "contentsScale");
  objc_msgSend(v30, "setContentsScale:");

}

uint64_t __33__PXGRectDiagnosticsLayer_update__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
