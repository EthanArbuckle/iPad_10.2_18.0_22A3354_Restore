@implementation UIKBKeyViewAnimator

- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5
{
  return 1;
}

- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  int v13;
  objc_class *v14;
  objc_class *v15;
  Class v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "blendForm") == 3)
    v11 = objc_msgSend(v9, "controlOpacities") ^ 1;
  else
    v11 = 0;
  if ((objc_msgSend(v9, "blurBlending") & 1) != 0
    || (objc_msgSend(v9, "variantTraits"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "blurBlending") | v11,
        v12,
        v13 == 1)
    || (v17 = -[UIKBKeyViewAnimator _keyViewClassForSpecialtyKey:screenTraits:](self, "_keyViewClassForSpecialtyKey:screenTraits:", v8, v10)) == 0)
  {
    objc_opt_class();
    v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v17;
  }
  v15 = v14;

  return v15;
}

- (Class)_keyViewClassForSpecialtyKey:(id)a3 screenTraits:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "displayType");
  v8 = 0;
  if (v7 > 35)
  {
    if (v7 == 36)
    {
      if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled")&& !_UIApplicationIsStickerPickerService())
      {
        if (v6)
        {
          v12 = objc_msgSend(v6, "idiom");
        }
        else
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v14, "userInterfaceIdiom");

        }
        +[UIKeyboardEmojiKeyDisplayController classForInputView:](UIKeyboardEmojiKeyDisplayController, "classForInputView:", v12);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (v7 != 37)
      goto LABEL_17;
    if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
    {
      if (v6)
      {
        v9 = objc_msgSend(v6, "idiom");
      }
      else
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "userInterfaceIdiom");

      }
      +[UIKeyboardEmojiKeyDisplayController classForCategoryControl:](UIKeyboardEmojiKeyDisplayController, "classForCategoryControl:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    objc_opt_class();
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v10;
    goto LABEL_17;
  }
  if (v7 == 1)
  {
    objc_msgSend(v5, "rendering");
    goto LABEL_15;
  }
  if (v7 == 12)
    goto LABEL_15;
LABEL_17:

  return (Class)v8;
}

- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  void (**v10)(id, uint64_t);
  void *v11;
  int v12;
  double v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  void *v36;
  id v37;

  v37 = a3;
  v10 = (void (**)(id, uint64_t))a6;
  objc_msgSend(v37, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v37, "isDynamicKey");
  v13 = 2.0;
  if (v12)
    v13 = 1.0;
  -[UIKBKeyViewAnimator setKeyScale:](self, "setKeyScale:", v13);
  if (objc_msgSend(v11, "displayTypeHint") == 10)
  {
    v14 = objc_msgSend(v11, "displayType");
    if (a4 != 4 && a5 == 4)
    {
      v15 = v14;
      objc_msgSend(v37, "layerForRenderFlags:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == 7)
        -[UIKBKeyViewAnimator keycapPrimaryDualStringTransform:](self, "keycapPrimaryDualStringTransform:", v37);
      else
        -[UIKBKeyViewAnimator keycapPrimaryTransform](self, "keycapPrimaryTransform");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMeshTransform:", v17);

      objc_msgSend(v16, "setShouldRasterize:", 1);
      objc_msgSend(v11, "secondaryRepresentedStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 == 1)
      {
        objc_msgSend(v37, "layerForRenderFlags:", 16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        if (v15 == 7)
        {
          LODWORD(v21) = 1.0;
          objc_msgSend(v20, "setOpacity:", v21);
          -[UIKBKeyViewAnimator keycapAlternateDualStringTransform:](self, "keycapAlternateDualStringTransform:", v37);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v37, "renderConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "lightKeyboard");
          LODWORD(v35) = 1050253722;
          if (v34)
            *(float *)&v35 = 0.25;
          objc_msgSend(v22, "setOpacity:", v35);

          -[UIKBKeyViewAnimator keycapAlternateTransform:](self, "keycapAlternateTransform:", v37);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        v36 = (void *)v23;
        objc_msgSend(v22, "setMeshTransform:", v23);

        objc_msgSend(v22, "setShouldRasterize:", 1);
      }
      else
      {
        objc_msgSend(v11, "secondaryRepresentedStrings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25 != 2)
        {
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(v37, "layerForRenderFlags:", 16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "renderConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "lightKeyboard"))
          *(float *)&v27 = 0.25;
        else
          *(float *)&v27 = 0.3;
        objc_msgSend(v22, "setOpacity:", v27);

        -[UIKBKeyViewAnimator keycapLeftTransform](self, "keycapLeftTransform");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setMeshTransform:", v28);

        objc_msgSend(v22, "setShouldRasterize:", 1);
        objc_msgSend(v37, "layerForRenderFlags:", 32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "renderConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "lightKeyboard"))
          *(float *)&v31 = 0.25;
        else
          *(float *)&v31 = 0.3;
        objc_msgSend(v29, "setOpacity:", v31);

        -[UIKBKeyViewAnimator keycapRightTransform](self, "keycapRightTransform");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setMeshTransform:", v32);

        objc_msgSend(v29, "setShouldRasterize:", 1);
      }

      goto LABEL_25;
    }
  }
LABEL_26:
  if (v10)
    v10[2](v10, 1);

}

- (void)setKeyScale:(double)a3
{
  self->_keyScale = a3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)shouldPurgeKeyViews
{
  return 0;
}

- (double)delayedDeactivationTimeForKeyView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "displayTypeHint") == 10)
  {
    objc_msgSend(v3, "layerForRenderFlags:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationForKey:", CFSTR("pan opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "endingTransitionDuration");
      v8 = v7;
    }
    else
    {
      v8 = 0.059;
    }

  }
  else
  {
    v8 = 0.059;
  }

  return v8;
}

- (void)_fadeOutKeyView:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  id v13;
  void (**v14)(void *, uint64_t);
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;
  BOOL v23;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke;
  aBlock[3] = &unk_1E16BFE60;
  v10 = v7;
  v21 = v10;
  v22 = 0;
  v23 = a4 > 0.0;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke_2;
  v15[3] = &unk_1E16D3A28;
  v12 = v10;
  v16 = v12;
  v18 = 0;
  v13 = v8;
  v17 = v13;
  v19 = a4 > 0.0;
  v14 = (void (**)(void *, uint64_t))_Block_copy(v15);
  if (a4 == 0.0)
  {
    v11[2](v11);
    v14[2](v14, 1);
  }
  else
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v11, v14, a4, 0.0);
  }

}

void __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "popupMenu");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isVisible");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "popupMenu");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 0.0);

    }
  }
}

void __59__UIKBKeyViewAnimator__fadeOutKeyView_duration_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setEndingTransitionDuration:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (fabs(v2) == fabs(*(double *)(a1 + 48)))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "popupMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5;

    if (v6 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "popupMenu");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "popupMenu");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hide");

    }
  }
}

- (void)_fadeInKeyView:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  _QWORD v10[4];
  void (**v11)(id, uint64_t);
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v7, "setAlpha:", 0.0);
  if (a4 <= 0.0)
  {
    objc_msgSend(v7, "setAlpha:", 1.0);
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v13 = v7;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke_2;
    v10[3] = &unk_1E16B1BA0;
    v11 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v12, v10, a4, 0.0);

  }
}

uint64_t __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58__UIKBKeyViewAnimator__fadeInKeyView_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (CGRect)primaryGlyphNormalizedExitRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.89;
  v3 = 0.5;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v2;
  result.origin.x = v3;
  return result;
}

- (CGRect)secondaryGlyphNormalizedExitRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.13;
  v3 = 0.5;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v2;
  result.origin.x = v3;
  return result;
}

- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[UIKBKeyViewAnimator keyScale](self, "keyScale");
  v14 = v13;
  v15 = 2.0;
  if (v14 > 0.0)
    -[UIKBKeyViewAnimator keyScale](self, "keyScale", 2.0);
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", v11, v10, v9, v8, x, y, width, height, *(_QWORD *)&v15);
}

- (id)keycapMeshTransformFromRect:(CGRect)a3 toRect:(CGRect)a4 scale:(double)a5
{
  double v5;
  _OWORD v12[10];
  CGFloat x;
  CGFloat y;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  uint64_t v32;
  __int128 v33;
  int32x4_t v34;
  __int128 v35;
  int32x4_t v36;
  __int128 v37;
  int32x4_t v38;
  __int128 v39;
  int32x4_t v40;
  __int128 v41;
  int32x4_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a5 != 1.0)
  {
    v5 = (a5 + -1.0) * 0.5;
    a3.origin.x = 1.0 / a5 * (a3.origin.x + v5);
    a3.origin.y = 1.0 / a5 * (a3.origin.y + v5);
    a3.size.width = a3.size.width * (1.0 / a5);
    a3.size.height = a3.size.height * (1.0 / a5);
    a4.origin.x = 1.0 / a5 * (a4.origin.x + v5);
    a4.origin.y = 1.0 / a5 * (a4.origin.y + v5);
    a4.size.width = a4.size.width * (1.0 / a5);
    a4.size.height = a4.size.height * (1.0 / a5);
  }
  memset(v12, 0, 32);
  v12[2] = xmmword_18667A4D0;
  v12[3] = xmmword_18666F250;
  __asm { FMOV            V17.2D, #1.0 }
  v12[4] = xmmword_18667A4E0;
  v12[5] = _Q17;
  v12[6] = _Q17;
  v12[7] = xmmword_1866800C0;
  v12[8] = xmmword_1866721B0;
  v12[9] = xmmword_18666C8C0;
  x = a3.origin.x;
  y = a3.origin.y;
  v15 = a4.origin.x;
  v16 = a4.origin.y;
  v17 = 0x3FE0000000000000;
  v18 = a3.origin.x + a3.size.width;
  v19 = a3.origin.y;
  v20 = a4.origin.x + a4.size.width;
  v21 = a4.origin.y;
  v22 = 0x3FE0000000000000;
  v23 = a3.origin.x + a3.size.width;
  v24 = a3.origin.y + a3.size.height;
  v25 = a4.origin.x + a4.size.width;
  v26 = a4.origin.y + a4.size.height;
  v27 = 0x3FE0000000000000;
  v28 = a3.origin.x;
  v29 = a3.origin.y + a3.size.height;
  v30 = a4.origin.x;
  v31 = a4.origin.y + a4.size.height;
  v32 = 0x3FE0000000000000;
  v33 = xmmword_1866800D0;
  v34 = vdupq_n_s32(0x7F7FFFFFu);
  v35 = xmmword_1866800E0;
  v36 = v34;
  v37 = xmmword_1866800F0;
  v38 = v34;
  v39 = xmmword_186680100;
  v40 = v34;
  v41 = xmmword_186680110;
  v42 = v34;
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 8, v12, 5, &v33, *MEMORY[0x1E0CD2A90]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keycapNullTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.28, 0.77, 0.44);
}

- (id)keycapPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.45, 0.77, 0.44);
}

- (id)keycapPrimaryDualStringTransform:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  int v21;
  double v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualStyling") & 0x3F;

  if (v6 == 23)
  {
    objc_msgSend(v4, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dualStringKeyBottomTextOffset:keyplane:", v8, v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v11 / v15 + 0.115;

    objc_msgSend(v4, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v13 / v18 + 0.28;

    -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v16, v19, 0.77, 0.44);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_msgSend(v4, "isDynamicKey");
    v22 = 2.0;
    if (v21)
      v22 = 1.0;
    -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.38, 0.77, 0.44, *(_QWORD *)&v22);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v20;

  return v23;
}

- (id)keycapAlternateTransform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryDisplayStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8) == 0x7FFFFFFFFFFFFFFFLL;

  v10 = dbl_186680120[v9];
  LODWORD(v5) = objc_msgSend(v4, "isDynamicKey");

  v11 = 2.0;
  if ((_DWORD)v5)
    v11 = 1.0;
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.25, 0.13, 0.5, v10, *(_QWORD *)&v11);
}

- (id)keycapAlternateDualStringTransform:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  int v21;
  double v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualStyling") & 0x3F;

  if (v6 == 23)
  {
    objc_msgSend(v4, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dualStringKeyTopTextOffset:keyplane:", v8, v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v11 / v15 + 0.115;

    objc_msgSend(v4, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v13 / v18 + 0.28;

    -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v16, v19, 0.77, 0.44);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_msgSend(v4, "isDynamicKey");
    v22 = 2.0;
    if (v21)
      v22 = 1.0;
    -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, 0.115, 0.135, 0.77, 0.44, *(_QWORD *)&v22);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v20;

  return v23;
}

- (id)primaryReverseTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:scale:](self, "keycapMeshTransformFromRect:toRect:scale:", 0.115, 0.28, 0.77, 0.44, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0x3FF0000000000000);
}

- (id)keycapLeftTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.065, 0.13, 0.65, 0.286);
}

- (id)keycapRightTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.415, 0.13, 0.65, 0.286);
}

- (id)keycapPrimaryExitTransform
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIKBKeyViewAnimator primaryGlyphNormalizedExitRect](self, "primaryGlyphNormalizedExitRect");
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, v3, v4, v5, v6);
}

- (id)keycapLeftSelectPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.218, 0.7, 1.0, 0.44);
}

- (id)keycapLeftSelectRightTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, 0.879, 0.21, 0.65, 0.286);
}

- (id)keycapRightSelectPrimaryTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.218, 0.7, 1.0, 0.44);
}

- (id)keycapRightSelectLeftTransform
{
  return -[UIKBKeyViewAnimator keycapMeshTransformFromRect:toRect:](self, "keycapMeshTransformFromRect:toRect:", 0.115, 0.28, 0.77, 0.44, -0.529, 0.21, 0.65, 0.286);
}

+ (id)normalizedAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;

  v7 = (void *)MEMORY[0x1E0CD2710];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "animationWithKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBeginTime:", 1.0e-100);
  LODWORD(v7) = objc_msgSend(v10, "isEqualToString:", CFSTR("opacity"));

  v12 = 0.4;
  if (!(_DWORD)v7)
    v12 = 1.0;
  objc_msgSend(v11, "setDuration:", v12);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  objc_msgSend(v11, "setFromValue:", v9);

  objc_msgSend(v11, "setToValue:", v8);
  return v11;
}

+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0CD2710];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "animationWithKeyPath:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeOffset:", (1.0 - a6) * 0.150000006);
  objc_msgSend(v12, "setDuration:", 0.150000006);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setRemovedOnCompletion:", 1);
  objc_msgSend(v12, "setFromValue:", v11);

  objc_msgSend(v12, "setToValue:", v10);
  return v12;
}

+ (id)normalizedUnwindOpacityAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CD2798];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "animationWithKeyPath:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = v10;
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValues:", v13);

  objc_msgSend(v12, "setKeyTimes:", &unk_1E1A93A40);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTimingFunctions:", v15);
  objc_msgSend(v12, "setTimeOffset:", (1.0 - a6) * 0.200000003);
  objc_msgSend(v12, "setDuration:", 0.200000003);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setRemovedOnCompletion:", 1);

  return v12;
}

+ (id)normalizedUnwindAnimationWithKeyPath:(id)a3 originallyFromValue:(id)a4 toValue:(id)a5 offset:(double)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CD2710];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "animationWithKeyPath:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v13);

  objc_msgSend(v12, "setTimeOffset:", (1.0 - a6) * 0.200000003);
  objc_msgSend(v12, "setDuration:", 0.200000003);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setRemovedOnCompletion:", 1);
  objc_msgSend(v12, "setFromValue:", v10);

  objc_msgSend(v12, "setToValue:", v11);
  return v12;
}

- (BOOL)shouldAssertCurrentKeyState:(id)a3
{
  return 0;
}

- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  id v14;

  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  v14 = v12;
  if (a4 != 4
    && a4 > a5
    && objc_msgSend(v12, "interactionType") != 20
    && (objc_msgSend(v14, "displayType") == 13 || objc_msgSend(v14, "displayType") == 5))
  {
    v13 = 0.5;
  }
  objc_msgSend(v11, "changeBackgroundToActiveIfNecessary");
  -[UIKBKeyViewAnimator _fadeOutKeyView:duration:completion:](self, "_fadeOutKeyView:duration:completion:", v11, v10, v13);

}

- (void)transitionStartedForKeyView:(id)a3 alternateCount:(unint64_t)a4 toLeft:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  BOOL v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;

  v5 = a5;
  v79 = a3;
  objc_msgSend(v79, "layerForRenderFlags:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v79, "isDynamicKey");
  v10 = 2.0;
  if (v9)
    v10 = 1.0;
  -[UIKBKeyViewAnimator setKeyScale:](self, "setKeyScale:", v10);
  objc_msgSend(v8, "animationForKey:", CFSTR("pan transform"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1 && !v11)
  {
    objc_msgSend(v79, "layerForRenderFlags:", 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldRasterize:", 0);
    objc_msgSend(v12, "setShouldRasterize:", 0);
    LODWORD(v13) = 0;
    objc_msgSend(v8, "setSpeed:", v13);
    LODWORD(v14) = 0;
    objc_msgSend(v12, "setSpeed:", v14);
    objc_msgSend(v79, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "displayType");

    v17 = 1.0;
    if (v16 != 7)
    {
      objc_msgSend(v79, "renderConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "lightKeyboard"))
        v17 = 0.25;
      else
        v17 = 0.3;

    }
    objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A95A90, &unk_1E1A98358);
    v76 = v8;
    v19 = objc_claimAutoreleasedReturnValue();
    if (v16 == 7)
      -[UIKBKeyViewAnimator keycapPrimaryDualStringTransform:](self, "keycapPrimaryDualStringTransform:", v79);
    else
      -[UIKBKeyViewAnimator keycapPrimaryTransform](self, "keycapPrimaryTransform");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyViewAnimator keycapPrimaryExitTransform](self, "keycapPrimaryExitTransform");
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), v50, &unk_1E1A95A90);
    v51 = objc_claimAutoreleasedReturnValue();

    v52 = v16 == 7;
    v53 = (void *)v48;
    if (v52)
      -[UIKBKeyViewAnimator keycapAlternateDualStringTransform:](self, "keycapAlternateDualStringTransform:", v79);
    else
      -[UIKBKeyViewAnimator keycapAlternateTransform:](self, "keycapAlternateTransform:", v79);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v19;
    -[UIKBKeyViewAnimator keycapNullTransform](self, "keycapNullTransform");
    v56 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v54;
    objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v54, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v76;
    objc_msgSend(v76, "addAnimation:forKey:", v55, CFSTR("pan opacity"));
    objc_msgSend(v76, "addAnimation:forKey:", v53, CFSTR("pan transform"));
    objc_msgSend(v12, "addAnimation:forKey:", v51, CFSTR("pan opacity"));
    objc_msgSend(v12, "addAnimation:forKey:", v57, CFSTR("pan transform"));

    v58 = (void *)v47;
    v36 = (void *)v51;
    v44 = (void *)v56;
LABEL_47:

    goto LABEL_48;
  }
  if (a4 == 2)
  {
    objc_msgSend(v8, "animationForKey:", CFSTR("pan transform left"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "animationForKey:", CFSTR("pan transform right"));
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = !v21 || v5;
    v23 = v20 && v5;
    if (!v23 && v22)
    {
      if (v20 | v21)
      {
        if (v20)
          v24 = CFSTR("pan transform left");
        else
          v24 = CFSTR("pan transform right");
        objc_msgSend(v8, "removeAnimationForKey:", v24);
      }
      objc_msgSend(v79, "layerForRenderFlags:", 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "layerForRenderFlags:", 32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShouldRasterize:", 0);
      objc_msgSend(v12, "setShouldRasterize:", 0);
      objc_msgSend(v25, "setShouldRasterize:", 0);
      LODWORD(v26) = 0;
      objc_msgSend(v8, "setSpeed:", v26);
      LODWORD(v27) = 0;
      objc_msgSend(v12, "setSpeed:", v27);
      LODWORD(v28) = 0;
      v75 = v25;
      objc_msgSend(v25, "setSpeed:", v28);
      objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A95A90, &unk_1E1A98358);
      v74 = objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimator keycapPrimaryTransform](self, "keycapPrimaryTransform");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[UIKBKeyViewAnimator keycapLeftSelectPrimaryTransform](self, "keycapLeftSelectPrimaryTransform");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:");
        v77 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_opt_class();
        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "renderConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "lightKeyboard"))
          v32 = 0.25;
        else
          v32 = 0.3;
        objc_msgSend(v30, "numberWithDouble:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), v33, &unk_1E1A95A90);
        v72 = objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapLeftTransform](self, "keycapLeftTransform");
        v34 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapLeftSelectLeftTransform](self, "keycapLeftSelectLeftTransform");
        v70 = (void *)v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_opt_class();
        v38 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "renderConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "lightKeyboard"))
          v40 = 0.25;
        else
          v40 = 0.3;
        objc_msgSend(v38, "numberWithDouble:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), v41, &unk_1E1A98358);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapRightTransform](self, "keycapRightTransform");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapLeftSelectRightTransform](self, "keycapLeftSelectRightTransform");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("pan transform left");
      }
      else
      {
        -[UIKBKeyViewAnimator keycapRightSelectPrimaryTransform](self, "keycapRightSelectPrimaryTransform");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:");
        v77 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)objc_opt_class();
        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "renderConfig");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "lightKeyboard"))
          v62 = 0.25;
        else
          v62 = 0.3;
        objc_msgSend(v60, "numberWithDouble:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), v63, &unk_1E1A98358);
        v72 = objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapLeftTransform](self, "keycapLeftTransform");
        v64 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapRightSelectLeftTransform](self, "keycapRightSelectLeftTransform");
        v70 = (void *)v64;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v64, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_opt_class();
        v66 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v79, "renderConfig");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v67, "lightKeyboard"))
          v68 = 0.25;
        else
          v68 = 0.3;
        objc_msgSend(v66, "numberWithDouble:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), v69, &unk_1E1A95A90);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapRightTransform](self, "keycapRightTransform");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapRightSelectRightTransform](self, "keycapRightSelectRightTransform");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("pan transform right");
      }

      v46 = (void *)v74;
      objc_msgSend(v8, "addAnimation:forKey:", v74, CFSTR("pan opacity"));
      objc_msgSend(v8, "addAnimation:forKey:", v77, v45);
      v53 = (void *)v72;
      objc_msgSend(v12, "addAnimation:forKey:", v72, CFSTR("pan opacity"));
      objc_msgSend(v12, "addAnimation:forKey:", v36, CFSTR("pan transform"));
      v55 = v75;
      v58 = (void *)v77;
      objc_msgSend(v75, "addAnimation:forKey:", v78, CFSTR("pan opacity"));
      objc_msgSend(v75, "addAnimation:forKey:", v44, CFSTR("pan transform"));
      goto LABEL_47;
    }
  }
LABEL_48:

}

- (void)transitionEndedForKeyView:(id)a3 alternateCount:(unint64_t)a4
{
  void *v6;
  double v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;

  v89 = a3;
  objc_msgSend(v89, "layerForRenderFlags:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeOffset");
  objc_msgSend(v89, "setEndingTransitionDuration:", v7 * 0.200000003);
  v8 = objc_msgSend(v89, "isDynamicKey");
  v9 = 2.0;
  if (v8)
    v9 = 1.0;
  -[UIKBKeyViewAnimator setKeyScale:](self, "setKeyScale:", v9);
  objc_msgSend(v6, "animationForKey:", CFSTR("pan transform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1 && v10)
  {
    objc_msgSend(v89, "changeBackgroundToEnabled");
    objc_msgSend(v89, "layerForRenderFlags:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldRasterize:", 1);
    objc_msgSend(v11, "setShouldRasterize:", 1);
    objc_msgSend(v6, "timeOffset");
    v13 = v12;
    objc_msgSend(v11, "timeOffset");
    v15 = v14;
    LODWORD(v14) = 1.0;
    objc_msgSend(v6, "setSpeed:", v14);
    LODWORD(v16) = 1.0;
    objc_msgSend(v11, "setSpeed:", v16);
    objc_msgSend(v6, "setTimeOffset:", 0.0);
    objc_msgSend(v11, "setTimeOffset:", 0.0);
    objc_msgSend(v89, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "displayType");

    v19 = 1.0;
    if (v18 != 7)
    {
      objc_msgSend(v89, "renderConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "lightKeyboard"))
        v19 = 0.25;
      else
        v19 = 0.3;

    }
    objc_msgSend((id)objc_opt_class(), "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), &unk_1E1A95A90, &unk_1E1A98358, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v11;
    if (v18 == 7)
      -[UIKBKeyViewAnimator keycapPrimaryDualStringTransform:](self, "keycapPrimaryDualStringTransform:", v89);
    else
      -[UIKBKeyViewAnimator keycapPrimaryTransform](self, "keycapPrimaryTransform");
    v56 = objc_claimAutoreleasedReturnValue();
    -[UIKBKeyViewAnimator keycapPrimaryExitTransform](self, "keycapPrimaryExitTransform");
    v57 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v56, v57, v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), v59, &unk_1E1A95A90, v15);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 == 7)
    {
      v61 = (void *)v57;
      v62 = (void *)v56;
      -[UIKBKeyViewAnimator keycapAlternateDualStringTransform:](self, "keycapAlternateDualStringTransform:", v89);
    }
    else
    {
      v61 = (void *)v57;
      v62 = (void *)v56;
      -[UIKBKeyViewAnimator keycapAlternateTransform:](self, "keycapAlternateTransform:", v89);
    }
    v63 = objc_claimAutoreleasedReturnValue();
    -[UIKBKeyViewAnimator keycapNullTransform](self, "keycapNullTransform");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v63;
    objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v63, v54, v15);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v21, CFSTR("pan opacity"));
    objc_msgSend(v6, "addAnimation:forKey:", v42, CFSTR("pan transform"));
    v65 = v86;
    objc_msgSend(v86, "addAnimation:forKey:", v60, CFSTR("pan opacity"));
    objc_msgSend(v86, "addAnimation:forKey:", v64, CFSTR("pan transform"));

    v66 = v62;
    v35 = v61;
    goto LABEL_27;
  }
  if (a4 == 2)
  {
    objc_msgSend(v6, "animationForKey:", CFSTR("pan transform left"));
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "animationForKey:", CFSTR("pan transform right"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22 | v23;

    if (v24)
    {
      objc_msgSend(v89, "layerForRenderFlags:", 16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "layerForRenderFlags:", 32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShouldRasterize:", 1);
      objc_msgSend(v25, "setShouldRasterize:", 1);
      objc_msgSend(v21, "setShouldRasterize:", 1);
      objc_msgSend(v6, "timeOffset");
      v27 = v26;
      objc_msgSend(v25, "timeOffset");
      v29 = v28;
      objc_msgSend(v21, "timeOffset");
      v31 = v30;
      LODWORD(v30) = 1.0;
      objc_msgSend(v6, "setSpeed:", v30);
      LODWORD(v32) = 1.0;
      objc_msgSend(v25, "setSpeed:", v32);
      LODWORD(v33) = 1.0;
      objc_msgSend(v21, "setSpeed:", v33);
      objc_msgSend(v6, "setTimeOffset:", 0.0);
      objc_msgSend(v25, "setTimeOffset:", 0.0);
      objc_msgSend(v21, "setTimeOffset:", 0.0);
      objc_msgSend((id)objc_opt_class(), "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), &unk_1E1A95A90, &unk_1E1A98358, v27);
      v81 = objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimator keycapPrimaryTransform](self, "keycapPrimaryTransform");
      v34 = objc_claimAutoreleasedReturnValue();
      v85 = (void *)v34;
      v87 = v25;
      if (v22)
      {
        -[UIKBKeyViewAnimator keycapLeftSelectPrimaryTransform](self, "keycapLeftSelectPrimaryTransform");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v34, v83, v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_opt_class();
        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "renderConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "lightKeyboard"))
          v39 = 0.25;
        else
          v39 = 0.3;
        objc_msgSend(v37, "numberWithDouble:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), v40, &unk_1E1A95A90, v29);
        v41 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v41;
        -[UIKBKeyViewAnimator keycapLeftTransform](self, "keycapLeftTransform");
        v43 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapLeftSelectLeftTransform](self, "keycapLeftSelectLeftTransform");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v43, v82, v29);
        v84 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_opt_class();
        v45 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "renderConfig");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "lightKeyboard"))
          v47 = 0.25;
        else
          v47 = 0.3;
        v48 = v45;
        v49 = (void *)v43;
        objc_msgSend(v48, "numberWithDouble:", v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), v50, &unk_1E1A98358, v31);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapRightTransform](self, "keycapRightTransform");
        v51 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapLeftSelectRightTransform](self, "keycapLeftSelectRightTransform");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)v51;
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v51, v52, v31);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = CFSTR("pan transform left");
      }
      else
      {
        -[UIKBKeyViewAnimator keycapRightSelectPrimaryTransform](self, "keycapRightSelectPrimaryTransform");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v34, v83, v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_opt_class();
        v68 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "renderConfig");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v69, "lightKeyboard"))
          v70 = 0.25;
        else
          v70 = 0.3;
        objc_msgSend(v68, "numberWithDouble:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), v71, &unk_1E1A98358, v29);
        v72 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v72;
        -[UIKBKeyViewAnimator keycapLeftTransform](self, "keycapLeftTransform");
        v73 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapRightSelectLeftTransform](self, "keycapRightSelectLeftTransform");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v73, v82, v29);
        v84 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_opt_class();
        v75 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "renderConfig");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v76, "lightKeyboard"))
          v77 = 0.25;
        else
          v77 = 0.3;
        v78 = v75;
        v49 = (void *)v73;
        objc_msgSend(v78, "numberWithDouble:", v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "normalizedUnwindOpacityAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("opacity"), v79, &unk_1E1A95A90, v31);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBKeyViewAnimator keycapRightTransform](self, "keycapRightTransform");
        v80 = objc_claimAutoreleasedReturnValue();
        -[UIKBKeyViewAnimator keycapRightSelectRightTransform](self, "keycapRightSelectRightTransform");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)v80;
        objc_msgSend((id)objc_opt_class(), "normalizedUnwindAnimationWithKeyPath:originallyFromValue:toValue:offset:", CFSTR("meshTransform"), v80, v52, v31);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = CFSTR("pan transform right");
      }
      v66 = (void *)v81;

      objc_msgSend(v6, "addAnimation:forKey:", v81, CFSTR("pan opacity"));
      objc_msgSend(v6, "addAnimation:forKey:", v35, v55);
      objc_msgSend(v87, "addAnimation:forKey:", v42, CFSTR("pan opacity"));
      objc_msgSend(v87, "addAnimation:forKey:", v84, CFSTR("pan transform"));
      v65 = v87;
      v60 = (void *)v84;
      objc_msgSend(v21, "addAnimation:forKey:", v88, CFSTR("pan opacity"));
      objc_msgSend(v21, "addAnimation:forKey:", v54, CFSTR("pan transform"));
LABEL_27:

    }
  }

}

- (void)updateTransitionForKeyView:(id)a3 normalizedDragSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  int v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  height = a4.height;
  width = a4.width;
  v21 = a3;
  objc_msgSend(v21, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v21, "isDynamicKey");
  v9 = 2.0;
  if (v8)
    v9 = 1.0;
  -[UIKBKeyViewAnimator setKeyScale:](self, "setKeyScale:", v9);
  if (objc_msgSend(v7, "displayTypeHint") == 10)
  {
    objc_msgSend(v7, "secondaryRepresentedStrings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 2)
    {
      objc_msgSend(v21, "layerForRenderFlags:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layerForRenderFlags:", 16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layerForRenderFlags:", 32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -width;
      if (width >= 0.0)
        v17 = width;
      v18 = fmin((v17 + -0.07) / 0.3, 1.0);
      if (v18 < 0.0)
        v18 = 0.0;
      v19 = fmin(height + -0.07 + height + -0.07, 1.0);
      if (v19 < 0.0)
        v19 = 0.0;
      if (v18 >= v19)
        v20 = v19;
      else
        v20 = v18;
      -[UIKBKeyViewAnimator transitionStartedForKeyView:alternateCount:toLeft:](self, "transitionStartedForKeyView:alternateCount:toLeft:", v21, 2, width < 0.0);
      objc_msgSend(v12, "setTimeOffset:", v20);
      objc_msgSend(v13, "setTimeOffset:", v20);
      objc_msgSend(v16, "setTimeOffset:", v20);

      goto LABEL_20;
    }
    if (v11 == 1)
    {
      objc_msgSend(v21, "layerForRenderFlags:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layerForRenderFlags:", 16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimator transitionStartedForKeyView:alternateCount:toLeft:](self, "transitionStartedForKeyView:alternateCount:toLeft:", v21, 1, 0);
      v14 = fmin(height + -0.07 + height + -0.07, 1.0);
      if (v14 >= 0.0)
        v15 = v14;
      else
        v15 = 0.0;
      objc_msgSend(v12, "setTimeOffset:", v15);
      objc_msgSend(v13, "setTimeOffset:", v15);
LABEL_20:

    }
  }

}

- (void)endTransitionForKeyView:(id)a3
{
  void *v4;
  int v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isDynamicKey");
  v6 = 2.0;
  if (v5)
    v6 = 1.0;
  -[UIKBKeyViewAnimator setKeyScale:](self, "setKeyScale:", v6);
  if (objc_msgSend(v4, "displayTypeHint") == 10)
  {
    objc_msgSend(v4, "secondaryRepresentedStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[UIKBKeyViewAnimator transitionEndedForKeyView:alternateCount:](self, "transitionEndedForKeyView:alternateCount:", v9, v8);
  }

}

- (BOOL)disabled
{
  return self->_disabled;
}

- (double)keyScale
{
  return self->_keyScale;
}

@end
