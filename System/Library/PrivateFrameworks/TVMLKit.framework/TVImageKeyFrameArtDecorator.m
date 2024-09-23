@implementation TVImageKeyFrameArtDecorator

void __69___TVImageKeyFrameArtDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  id v7;
  CGImage *v8;
  CGImage *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];
  CGRect v24;

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = *(id *)(a1 + 40);
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageFixedForRotation:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_msgSend(v3, "drawInRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), ceil(*(double *)(a1 + 80) * (*(double *)(a1 + 88) / *(double *)(a1 + 96))));
  v5 = *(double *)(a1 + 72);
  v6 = *(double *)(a1 + 80) + -75.0;
  v7 = objc_retainAutorelease(v3);
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");
  v24.origin.x = 0.0;
  v24.origin.y = v6;
  v24.size.width = v5;
  v24.size.height = 75.0;
  v9 = CGImageCreateWithImageInRect(v8, v24);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v9);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _TVBlurredImageWithOptionsAndOverlayColorForImage(v10, 13, v11, v5, 75.0, 40.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "drawInRect:", 0.0, v6, v5, 75.0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "length"))
  {
    v13 = *(double *)(a1 + 80) + -75.0 + 15.0;
    v14 = *(double *)(a1 + 72) + -15.0 + -15.0;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setAlignment:", 0);
    v18 = *MEMORY[0x24BDF65F8];
    v23[0] = v15;
    v19 = *MEMORY[0x24BDF6600];
    v22[0] = v18;
    v22[1] = v19;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = *MEMORY[0x24BDF6628];
    v23[1] = v20;
    v23[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "drawWithRect:options:attributes:context:", 33, v21, 0, 15.0, v13, v14, 45.0);
  }

}

@end
