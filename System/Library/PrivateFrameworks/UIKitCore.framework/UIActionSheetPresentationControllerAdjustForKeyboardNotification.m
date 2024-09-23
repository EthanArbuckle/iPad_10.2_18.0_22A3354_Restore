@implementation UIActionSheetPresentationControllerAdjustForKeyboardNotification

void __UIActionSheetPresentationControllerAdjustForKeyboardNotification_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(void **)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 160);
  v11[4] = *(_OWORD *)(a1 + 144);
  v11[5] = v7;
  v8 = *(_OWORD *)(a1 + 192);
  v11[6] = *(_OWORD *)(a1 + 176);
  v11[7] = v8;
  v9 = *(_OWORD *)(a1 + 96);
  v11[0] = *(_OWORD *)(a1 + 80);
  v11[1] = v9;
  v10 = *(_OWORD *)(a1 + 128);
  v11[2] = *(_OWORD *)(a1 + 112);
  v11[3] = v10;
  UIActionSheetPresentationControllerLayoutViews(v2, v1, v3, v4, v5, v6, (unsigned __int8 *)v11, *(double *)(a1 + 208), *(double *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232));
}

@end
