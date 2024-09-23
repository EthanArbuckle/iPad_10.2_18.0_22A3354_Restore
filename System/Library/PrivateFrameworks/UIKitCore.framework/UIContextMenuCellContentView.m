@implementation UIContextMenuCellContentView

void __42___UIContextMenuCellContentView_setTitle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_createLabelStackViewIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "_installTitleLabelIfNeeded");
  }
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

  objc_msgSend(*(id *)(a1 + 40), "_updateTitleLabelNumberOfLines");
  objc_msgSend(*(id *)(a1 + 40), "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredSymbolConfiguration:", v5);

}

uint64_t __52___UIContextMenuCellContentView_setAttributedTitle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_createLabelStackViewIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "_installTitleLabelIfNeeded");
  }
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "_updateTitleLabelNumberOfLines");
}

void __45___UIContextMenuCellContentView_setSubtitle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_createLabelStackViewIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "_installSubtitleLabelIfNeeded");
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(*(id *)(a1 + 40), "subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v2 == 0);

}

uint64_t __42___UIContextMenuCellContentView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_contentImageViewForImage:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setIconImageView:", v5);

      v6 = dyld_program_sdk_at_least();
      objc_msgSend(*(id *)(a1 + 40), "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "iconImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v6)
        objc_msgSend(v8, "setPreferredSymbolConfiguration:", v7);
      else
        objc_msgSend(v8, "_setOverridingSymbolConfiguration:", v7);

    }
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "iconImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v10);

    objc_msgSend(*(id *)(a1 + 40), "iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeToFit");

  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "setIconImageView:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_setNeedsConstraintRebuild");
}

void __53___UIContextMenuCellContentView__setDecorationImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "decorationImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_contentImageViewForImage:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setDecorationImageView:", v5);

    }
    objc_msgSend(*(id *)(a1 + 40), "_childIndicatorColorForCurrentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "decorationImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "decorationImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

    objc_msgSend(*(id *)(a1 + 40), "decorationImageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "setDecorationImageView:", 0);
  }
}

BOOL __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return ((*(_QWORD *)(a1 + 40) ^ objc_msgSend(*(id *)(a1 + 32), "options")) & a2) != 0;
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 4) != 0)
  {
    objc_msgSend(v3, "_selectionImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setDecorationImage:", v4);

  }
  else
  {
    objc_msgSend(v3, "_setDecorationImage:", 0);
  }
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_3(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 8) != 0)
  {
    objc_msgSend(v3, "_mixedSelectionImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setDecorationImage:", v4);

  }
  else
  {
    objc_msgSend(v3, "_setDecorationImage:", 0);
  }
}

void __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_4(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 0x10) != 0)
  {
    objc_msgSend(v3, "_childIndicatorImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setDecorationImage:", v4);

  }
  else
  {
    objc_msgSend(v3, "_setDecorationImage:", 0);
  }
}

uint64_t __50___UIContextMenuCellContentView__updateSecureView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedStyleForStyle:", a2);
}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_3;
  block[3] = &unk_1E16D5C70;
  v16[1] = a2;
  v13 = v7;
  v14 = *(id *)(a1 + 32);
  v10 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  v15 = v8;
  v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  +[_UIConcretePasteboard _remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:](_UIConcretePasteboard, "_remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_4;
    block[3] = &unk_1E16D5C48;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    v5 = *(id *)(a1 + 48);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v6);
  }

}

void __50___UIContextMenuCellContentView__updateSecureView__block_invoke_4(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  int v5;
  id WeakRetained;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pasteVariant");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    if (!v5)
      return;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_hideContents");
  }

}

void __49___UIContextMenuCellContentView_setIsEmphasized___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[418])
  {
    objc_msgSend(v2, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_6;
      objc_msgSend(*(id *)(a1 + 32), "_primaryTitleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEmphasizedTitleLabel:", v6);

      objc_msgSend(*(id *)(a1 + 32), "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleEmphasizedFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v10);

      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "textAlignment");
      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextAlignment:", v13);

      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "adjustsFontSizeToFitWidth");
      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", v16);

      objc_msgSend(*(id *)(a1 + 32), "_primaryCompositingFilterForCurrentTraitsAndState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCompositingFilter:", v18);

      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "titleLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertSubview:aboveSubview:", v21, v22);

    }
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    objc_msgSend(*(id *)(a1 + 32), "emphasizedTitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "iconImageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "image");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(*(id *)(a1 + 32), "emphasizediconImageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v31 = *(void **)(a1 + 32);
        objc_msgSend(v31, "iconImageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "image");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_contentImageViewForImage:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setEmphasizediconImageView:", v34);

        objc_msgSend(*(id *)(a1 + 32), "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "emphasizediconImageView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_setOverridingSymbolConfiguration:", v35);
LABEL_12:

        objc_msgSend(*(id *)(a1 + 32), "emphasizediconImageView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "sizeToFit");

        objc_msgSend(*(id *)(a1 + 32), "emphasizediconImageView");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAlpha:", 0.0);

        return;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "iconImageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "image");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emphasizediconImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setImage:", v36);

    goto LABEL_12;
  }
}

uint64_t __74___UIContextMenuCellContentView_setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearanceForStateChange");
}

@end
