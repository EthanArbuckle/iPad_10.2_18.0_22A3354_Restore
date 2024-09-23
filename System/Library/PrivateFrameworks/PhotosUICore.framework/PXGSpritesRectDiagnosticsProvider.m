@implementation PXGSpritesRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v15 = a3;
  v5 = a4;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "anySpritesRectDiagnosticsEnabled"))
  {
    objc_msgSend(v15, "visibleRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__PXGSpritesRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v16[3] = &unk_1E51215D8;
    v17 = v6;
    v18 = v5;
    objc_msgSend(v15, "enumerateSpritesInRect:usingBlock:", v16, v8, v10, v12, v14);

  }
}

void __82__PXGSpritesRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a7;
  v12 = 0;
  switch(*(_BYTE *)(a6 + 1))
  {
    case 0:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForUndefinedSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 1:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForNamedImageSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 2:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForDisplayAssetSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 3:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForTextSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 4:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForTitleSubtitleSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 5:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForSolidColorSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 6:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForGradientSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 7:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForShadowSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "magentaColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 8:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForDecorationSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xA:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForViewSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xB:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForPathSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xC:
      if (!objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForPathSprites"))
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xD:
      if (objc_msgSend(*(id *)(a1 + 32), "enableRectDiagnosticsForPathSprites"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemMintColor");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v12 = (void *)v13;
      }
      else
      {
LABEL_29:
        v12 = 0;
      }
LABEL_30:
      PXRectWithCenterAndSize();
      if (v12)
      {
        v18 = v14;
        v19 = v15;
        v20 = v16;
        v21 = v17;
        PXGMediaKindDescription();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a6 + 34))
        {
          PXGSpriteInfoFlagsDescription();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAppendingFormat:", CFSTR(" %@"), v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v24;
        }
        v25 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sprite #%u (%@)"), a2, v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, uint64_t, double, double, double, double))(v25 + 16))(v25, v12, v26, a9, v18, v19, v20, v21);

      }
      return;
    default:
      goto LABEL_30;
  }
}

@end
