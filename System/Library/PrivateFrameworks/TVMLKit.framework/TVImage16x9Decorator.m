@implementation TVImage16x9Decorator

void __62___TVImage16x9Decorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  _QWORD v22[3];
  _QWORD v23[4];
  CGRect v24;
  CGRect v25;

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _TVBlurredImageWithOptionsAndOverlayColorForImage(*(void **)(a1 + 40), 13, v3, *(double *)(a1 + 72), *(double *)(a1 + 80), 150.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  v5 = *(id *)(a1 + 40);
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageFixedForRotation:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v7 = *(double *)(a1 + 80) + -20.0 + -20.0;
  v8 = ceil(v7 * (*(double *)(a1 + 88) / *(double *)(a1 + 96)));
  objc_msgSend(v5, "drawInRect:", 20.0, 20.0, v8, v7);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "length"))
  {
    v24.origin.x = 20.0;
    v24.origin.y = 20.0;
    v24.size.width = v8;
    v24.size.height = v7;
    v9 = CGRectGetMaxX(v24) + 15.0;
    v10 = *(double *)(a1 + 72) + -15.0 + -15.0;
    v25.origin.x = 20.0;
    v25.origin.y = 20.0;
    v25.size.width = v8;
    v25.size.height = v7;
    v11 = v10 - CGRectGetMaxX(v25);
    v12 = *(double *)(a1 + 80) + -15.0 + -15.0;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setAlignment:", 0);
    v16 = *MEMORY[0x24BDF65F8];
    v23[0] = v13;
    v17 = *MEMORY[0x24BDF6600];
    v22[0] = v16;
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = *MEMORY[0x24BDF6628];
    v23[1] = v18;
    v23[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "boundingRectWithSize:options:attributes:context:", 33, v19, 0, v11, v12);
    if (v12 <= v20)
      v21 = 15.0;
    else
      v21 = (v12 - v20) * 0.5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "drawWithRect:options:attributes:context:", 33, v19, 0, v9, v21, v11, v12);

  }
}

@end
