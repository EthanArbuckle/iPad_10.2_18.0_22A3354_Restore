@implementation UIVectorLabelLayer

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
  _UIMorphLayerPaths(*(void **)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return *(id *)(a1 + 32);
}

uint64_t __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a2;
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "setPath:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v3, "setFillColor:", *(_QWORD *)(a1 + 80));
  LODWORD(v5) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v5);
  _UIMorphLayerPaths(*(void **)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFillColor:", *(_QWORD *)(a1 + 80));
}

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_3(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  LODWORD(v2) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v2);
  return *(id *)(a1 + 32);
}

uint64_t __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_4(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  LODWORD(v3) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_5(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  LODWORD(a2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 48), "size");
  v9 = v7 / v4;
  v10 = 1.0;
  if (v4 == 0.0)
    v9 = 1.0;
  if (v6 != 0.0)
    v10 = v8 / v6;
  v11 = v8 - v6;
  if (v6 >= 0.01)
    v12 = v6;
  else
    v12 = 0.01;
  v13 = *(double *)(a1 + 64) + v11 * (*(double *)(a1 + 64) / v12);
  v14 = v7 - v4;
  if (v4 >= 0.01)
    v15 = v4;
  else
    v15 = 0.01;
  v16 = *(double *)(a1 + 56) + v14 * (*(double *)(a1 + 56) / v15);
  if (v9 >= v10)
    v17 = v10;
  else
    v17 = v9;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v16, v13, *(double *)(a1 + 72) * v17, *(double *)(a1 + 80) * v17);
  return *(id *)(a1 + 32);
}

void __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_6(double *a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setOpacity:", v3);
  objc_msgSend(v4, "setFrame:", a1[4], a1[5], a1[6], a1[7]);

}

uint64_t __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __44___UIVectorLabelLayer__layersForTextLayout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  UIGraphicsImageRenderer *v4;
  double v5;
  double v6;
  UIGraphicsImageRenderer *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (objc_msgSend(v3, "shouldRender"))
  {
    v4 = [UIGraphicsImageRenderer alloc];
    objc_msgSend(v3, "usedRunRect");
    v7 = -[UIGraphicsImageRenderer initWithSize:format:](v4, "initWithSize:format:", *(_QWORD *)(a1 + 32), v5, v6);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_2;
    v13[3] = &unk_1E16B5018;
    v8 = v3;
    v14 = v8;
    -[UIGraphicsImageRenderer imageWithActions:](v7, "imageWithActions:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "_ui_setLayoutRun:", v8);
    objc_msgSend(v10, "setAnchorPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v11 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));
    objc_msgSend(v8, "usedRunRect");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_3;
    v12[3] = &__block_descriptor_40_e40_v24__0____UIVectorTextLayoutGlyph__8_B16l;
    v12[4] = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "enumerateGlyphsUsingBlock:", v12);
  }

}

uint64_t __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderInContext:", objc_msgSend(a2, "CGContext"));
}

void __44___UIVectorLabelLayer__layersForTextLayout___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CGPath *v5;
  id v6;
  CGAffineTransform v7;

  v3 = a2;
  v4 = v3;
  memset(&v7, 0, sizeof(v7));
  if (v3)
    objc_msgSend(v3, "pathTransform", *(_OWORD *)&v7.a, *(_OWORD *)&v7.c, *(_OWORD *)&v7.tx);
  v5 = *(CGPath **)(a1 + 32);
  objc_msgSend(v4, "path", *(_OWORD *)&v7.a, *(_OWORD *)&v7.c, *(_OWORD *)&v7.tx);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGPathAddPath(v5, &v7, (CGPathRef)objc_msgSend(v6, "CGPath"));

}

@end
