@implementation UIStickerPickerViewController

void __42___UIStickerPickerViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  char isKindOfClass;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    _stickersLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v10)
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Loaded remote view controller %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(WeakRetained, "_remoteViewDidLoad:", v5);
    }
    else
    {
      if (v10)
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Unable to load remote view controller: %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "dismissCard");
    }
    objc_msgSend(*(id *)(a1 + 32), "_viewServiceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForAddStickerFromSubjectLift");

  }
}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_35(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v13 = a2;
  v14 = a3;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2;
  v20[3] = &unk_1E16E2D30;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v21 = v14;
  v22 = v15;
  v20[1] = 3221225472;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v23 = v16;
  v24 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v25 = v13;
  v26 = v17;
  v18 = v13;
  v19 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _stickersLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected error adding stickers to store: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "dismissCard");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCGRect(*(CGRect *)(a1 + 80));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Got a successful add to sticker store with target sticker bounds %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_addStickerWithRepresentations:previewView:animatingTo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

void __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_37(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v11 = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2_38;
  v15[3] = &unk_1E16E2D80;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v16 = v11;
  v17 = v12;
  v15[1] = 3221225472;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v18 = v13;
  v19 = *(id *)(a1 + 48);
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2_38(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _stickersLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected error adding stickers to store: %@", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "dismissCard");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCGRect(*(CGRect *)(a1 + 64));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Got a successful add to sticker store with target sticker bounds %@", (uint8_t *)&v8, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_addStickerWithRepresentations:previewView:animatingTo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_2;
  v7[3] = &unk_1E16B4E70;
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  *(float *)&v5 = maximum;
  *(float *)&v6 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v7, COERCE_DOUBLE(__PAIR64__(DWORD1(v9), LODWORD(minimum))), v5, v6);

}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_4(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  __int128 v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_5;
  v8[3] = &unk_1E16BF720;
  v9 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 72);
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);

}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_5(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_7(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  __int128 v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_8;
  v8[3] = &unk_1E16BF720;
  v9 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 72);
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);

}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_8(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_10(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  __int128 v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CAFrameRateRange v13;

  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v13.minimum;
  maximum = v13.maximum;
  preferred = v13.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_11;
  v8[3] = &unk_1E16BF720;
  v9 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 72);
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);

}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_11(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_12(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_13(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_viewServiceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_14;
  v5[3] = &unk_1E16B1B50;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "addStickerAnimationDidFinishWithCompletion:", v5);

}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_14(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_15;
  v4[3] = &unk_1E16B1B50;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_viewServiceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didRemoveStickerPreview");

}

uint64_t __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v4);
    v9 = *(void **)(a1 + 32);
    v8 = (void **)(a1 + 32);
    objc_msgSend(v9, "setKeyWindowChangedDuringInsert:", v6 != v7);

  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v8 = (void **)(a1 + 32);
    objc_msgSend(v10, "setKeyWindowChangedDuringInsert:", 0);
  }

  v11 = *v8;
  if (!a2)
    return objc_msgSend(v11, "setKeyWindowChangedDuringInsert:", 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke_2;
  v13[3] = &unk_1E16B1B28;
  v13[4] = v11;
  return objc_msgSend(v11, "dismissCardAnimated:completion:", 1, v13);
}

uint64_t __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyWindowChangedDuringInsert:", 0);
}

uint64_t __65___UIStickerPickerViewController_dismissCardAnimated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissCard");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __45___UIStickerPickerViewController_dismissCard__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromParentViewController");

  objc_msgSend(*(id *)(a1 + 32), "setCard:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stickerPickerViewControllerDidDismiss");

  }
}

@end
