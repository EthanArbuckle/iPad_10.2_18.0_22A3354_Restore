@implementation UIImageContent

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_4(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(_QWORD *)(a1 + 32)))
  {
    v2 = *(double *)(a1 + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_5;
    v12[3] = &unk_1E16C4C48;
    v3 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "_provideVectorGlyphCGImageWithSize:scale:namedColorResolver:", v12, *(double *)(a1 + 48), *(double *)(a1 + 56), v2);
    v5 = v13;
LABEL_5:

    return v4;
  }
  if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(_QWORD *)(a1 + 32)))
  {
    v6 = *(double *)(a1 + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_6;
    v10[3] = &unk_1E16C4C70;
    v7 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v7, "_provideVectorGlyphCGImageWithSize:scale:hierarchicalColorResolver:", v10, *(double *)(a1 + 48), *(double *)(a1 + 56), v6);
    v5 = v11;
    goto LABEL_5;
  }
  if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(_QWORD *)(a1 + 32)))
  {
    -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "_provideVectorGlyphCGImageWithSize:scale:paletteColors:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    return v4;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_provideCGImageWithSize:scale:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(_QWORD *)(a1 + 32), a3);
}

id *__58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a2);
}

void __24___UIImageContent_empty__block_invoke()
{
  _UIImageEmptyContent *v0;
  void *v1;

  v0 = -[_UIImageContent initWithScale:]([_UIImageEmptyContent alloc], "initWithScale:", 1.0);
  v1 = (void *)qword_1ECD79520;
  qword_1ECD79520 = (uint64_t)v0;

}

void __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke(uint64_t a1, CGContext *a2)
{
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v15;
  CGRect v16;

  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  CGContextScaleCTM(a2, v4 / v5, v4 / v5);
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 48) * v8;
  v10 = v8 * *(double *)(a1 + 56);
  +[UIColor orangeColor](UIColor, "orangeColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  +[UIColor brownColor](UIColor, "brownColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithAlphaComponent:", 0.9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStroke");

  v15.origin.x = v6;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v10;
  CGContextFillRect(a2, v15);
  v16.origin.x = v6;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v10;
  CGContextStrokeRect(a2, v16);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_drawWithSize:scale:inContext:effect:", a2, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(_QWORD *)(a1 + 40)))
    {
      v5 = *(double *)(a1 + 64);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_8;
      v13[3] = &unk_1E16C4C48;
      v6 = *(void **)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v6, "_drawVectorGlyphWithSize:scale:inContext:namedColorResolver:", a2, v13, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
      v7 = v14;
LABEL_6:

      return;
    }
    if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(_QWORD *)(a1 + 40)))
    {
      v8 = *(double *)(a1 + 64);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_9;
      v11[3] = &unk_1E16C4C70;
      v9 = *(void **)(a1 + 32);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v9, "_drawVectorGlyphWithSize:scale:inContext:hierarchicalColorResolver:", a2, v11, *(double *)(a1 + 48), *(double *)(a1 + 56), v8);
      v7 = v12;
      goto LABEL_6;
    }
    if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(_QWORD *)(a1 + 40)))
    {
      -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 40));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_drawVectorGlyphWithSize:scale:inContext:paletteColors:", a2, v10, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_drawWithSize:scale:inContext:effect:", a2, 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
  }
}

id *__58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a2);
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(_QWORD *)(a1 + 32), a3);
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  id v3;
  const char *v4;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  double v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  _QWORD newValue[4];
  id v29;
  void *v30;

  v2 = objc_opt_new();
  if (-[_UIImageContentContextualEffect _shouldResolveNamedColorStyles](*(_QWORD *)(a1 + 32)))
  {
    if (v2)
      *(_DWORD *)(v2 + 8) = 2;
    newValue[0] = MEMORY[0x1E0C809B0];
    newValue[1] = 3221225472;
    newValue[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_12;
    newValue[3] = &unk_1E16C4D30;
    v3 = *(id *)(a1 + 32);
    v5 = &__block_literal_global_21_0;
    v29 = v3;
    v30 = &__block_literal_global_21_0;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v4, newValue, 24);
      v5 = v30;
    }

    v6 = v29;
  }
  else if (-[_UIImageContentContextualEffect _shouldResolveHierarchicalColors](*(_QWORD *)(a1 + 32)))
  {
    if (v2)
      *(_DWORD *)(v2 + 8) = 3;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_14;
    v25[3] = &unk_1E16C4D30;
    v7 = *(id *)(a1 + 32);
    v9 = &__block_literal_global_21_0;
    v26 = v7;
    v27 = &__block_literal_global_21_0;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v8, v25, 24);
      v9 = v27;
    }

    v6 = v26;
  }
  else if (-[_UIImageContentContextualEffect _shouldResolvePaletteColors](*(_QWORD *)(a1 + 32)))
  {
    if (v2)
      *(_DWORD *)(v2 + 8) = 4;
    -[_UIImageContentContextualEffect _resolvedPaletteColors](*(id **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_16;
    v22[3] = &unk_1E16C4D30;
    v12 = &__block_literal_global_21_0;
    v23 = v11;
    v24 = &__block_literal_global_21_0;
    v6 = v11;
    if (v2)
    {
      objc_setProperty_nonatomic_copy((id)v2, v13, v22, 24);
      v12 = v24;
    }

  }
  else if (v2)
  {
    *(_DWORD *)(v2 + 8) = 1;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_18;
    v20 = &unk_1E16C4D58;
    v21 = &__block_literal_global_21_0;
    objc_setProperty_nonatomic_copy((id)v2, v10, &v17, 24);
    v6 = v21;
  }
  else
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_18;
    v20 = &unk_1E16C4D58;
    v6 = &__block_literal_global_21_0;
    v21 = &__block_literal_global_21_0;
  }

  -[_UIImageContentContextualEffect vectorGlyph](*(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeWeak((id *)(v2 + 16), v14);

  v15 = -[_UIImageContentContextualEffect variableValue](*(_QWORD *)(a1 + 32));
  if (v2)
    *(double *)(v2 + 32) = v15;
  return (id)v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_11(int a1, id a2)
{
  float result;

  if (!a2)
    return *MEMORY[0x1E0D87468];
  objc_msgSend(objc_retainAutorelease(a2), "CGColor");
  RBColorFromCGColor2();
  return result;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_12(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_13;
  v4[3] = &unk_1E16C4D08;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  float v5;

  -[_UIImageContentContextualEffect _resolvedColorForNamedStyle:](*(id **)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(float (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v5;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_14(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_15;
  v4[3] = &unk_1E16C4D08;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_15(uint64_t a1)
{
  void *v2;
  float v3;

  -[_UIImageContentContextualEffect _resolvedHierarchicalColorForLayerLevel:](*(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(float (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v3;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_16(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_17;
  v4[3] = &unk_1E16C4D08;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v2 = _Block_copy(v4);

  return v2;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_17(uint64_t a1, int a2)
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  float v8;

  if (a2 == 6)
    v3 = 2;
  else
    v3 = a2 == 5;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "count");
  if (v3 >= v5 - 1)
    v6 = v5 - 1;
  else
    v6 = v3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(float (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v8;
}

id __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_19;
  v7[3] = &unk_1E16C4D08;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = _Block_copy(v7);

  return v5;
}

float __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_19(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  float v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = (*(float (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v5;
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_20(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_drawWithSize:scale:inContext:effect:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

CFTypeRef __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_25(uint64_t a1)
{
  void *v2;
  void *v3;
  UIGraphicsImageRenderer *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CGImageRef v8;
  _QWORD v10[4];
  id v11;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setScale:", *(double *)(a1 + 48));
    v4 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2_27;
    v10[3] = &unk_1E16C4DA8;
    v11 = *(id *)(a1 + 32);
    -[UIGraphicsImageRenderer imageWithActions:](v4, "imageWithActions:", v10);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v8 = CGImageRetain((CGImageRef)objc_msgSend(objc_retainAutorelease(v2), "CGImage"));
  return CFAutorelease(v8);
}

uint64_t __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2_27(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "CGContext"));
  return result;
}

@end
