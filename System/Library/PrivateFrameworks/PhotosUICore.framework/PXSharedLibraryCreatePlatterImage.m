@implementation PXSharedLibraryCreatePlatterImage

void __PXSharedLibraryCreatePlatterImage_block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  _QWORD v30[2];
  CGRect v31;
  CGRect v32;

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 28.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", *(_QWORD *)(a1 + 32), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alignmentRectInsets");
  objc_msgSend(v12, "size");
  PXRectWithCenterAndSize();
  objc_msgSend(v12, "drawInRect:");
  if (*(_QWORD *)(a1 + 40))
  {
    v13 = objc_msgSend(*(id *)(a1 + 48), "layoutDirection");
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMulticolor");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "configurationByApplyingConfiguration:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationByApplyingConfiguration:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", *(_QWORD *)(a1 + 40), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "size");
    if (v13 == 1)
      v20 = -0.5;
    else
      v20 = 0.5;
    PXRectWithSizeAlignedToRectEdges();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fillWithBlendMode:alpha:", 16, 1.0);

    v31.origin.x = v22;
    v31.origin.y = v24;
    v31.size.width = v26;
    v31.size.height = v28;
    v32 = CGRectOffset(v31, v20, 0.0);
    objc_msgSend(v19, "drawInRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v12 = v19;
    v11 = (void *)v18;
    v9 = (void *)v16;
    v5 = (void *)v15;
    v4 = v14;
  }

}

@end
