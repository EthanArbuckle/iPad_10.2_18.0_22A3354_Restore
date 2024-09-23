@implementation PXCuratedLibraryOverlayButton

- (PXCuratedLibraryOverlayButtonConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

+ (UIColor)defaultTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double (**v15)(_QWORD, double, double, double, double);
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  _QWORD aBlock[8];
  __int128 v42;
  BOOL v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;

  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    v51.receiver = self;
    v51.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton layoutSubviews](&v51, sel_layoutSubviews);
  }
  else
  {
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0uLL;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_getSize:titleFrame:captionFrame:iconFrame:forConfiguration:title:", &v50, &v48, &v46, &v44, v3, v5);

    -[PXCuratedLibraryOverlayButton bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[PXCuratedLibraryOverlayButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PXCuratedLibraryOverlayButton_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_81_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = v7;
    *(double *)&aBlock[5] = v9;
    *(double *)&aBlock[6] = v11;
    *(double *)&aBlock[7] = v13;
    v42 = v50;
    v43 = v14;
    v15 = (double (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    -[PXCuratedLibraryOverlayButton contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);

    v17 = v15[2](v15, *(double *)&v48, *((double *)&v48 + 1), *(double *)&v49, *((double *)&v49 + 1));
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[PXCuratedLibraryOverlayButton customTitleLabel](self, "customTitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = v15[2](v15, *(double *)&v46, *((double *)&v46 + 1), *(double *)&v47, *((double *)&v47 + 1));
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[PXCuratedLibraryOverlayButton customCaptionLabel](self, "customCaptionLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    v33 = v15[2](v15, *(double *)&v44, *((double *)&v44 + 1), *(double *)&v45, *((double *)&v45 + 1));
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[PXCuratedLibraryOverlayButton customIconImageView](self, "customIconImageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  }
}

id __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  id *v17;
  id v18;
  uint64_t v19;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(*(id *)(a1 + 32), "style");
  if (_PXFontForComponent_onceToken != -1)
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
  v6 = v5 - 2;
  v7 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", CFSTR("_PXOverlayButtonComponentTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (unint64_t)(v5 - 2) < 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithObjects:", v11);

  objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v6 < 4)
    {
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      if (v13)
      {
        objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v13, v12);
        goto LABEL_19;
      }
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXCuratedLibraryOverlayButton.m"), 186, CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategory");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

    v17 = (id *)MEMORY[0x1E0DC48F0];
    if (!IsAccessibilityCategory)
      v17 = (id *)MEMORY[0x1E0DC4900];
    v18 = *v17;
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
    {
      v19 = 2;
    }
    else
    {
      if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        v13 = 0;
        goto LABEL_16;
      }
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DC1138]);
  return v4;
}

- (void)_updateButtonSystemWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  float v11;
  unint64_t v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __objc2_meth_list **p_inst_meths;
  void *v36;
  unint64_t v37;
  id *v38;
  id v39;
  void *v40;
  char v41;
  id *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSString *v68;
  _BOOL4 v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL8 v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 IsAccessibilityCategory;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesButtonSystem") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1224, CFSTR("Shouldn't be called if button system is not used."));

  }
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    v8 = objc_msgSend(v7, "segment");
    objc_msgSend(v7, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonHeight");
    v11 = v10 * 0.5;

    v12 = objc_msgSend(v7, "style");
    v13 = 0.0;
    if (v12 <= 0xC)
    {
      if (((1 << v12) & 0x3C) != 0)
      {
        v11 = 0.0;
      }
      else if (((1 << v12) & 0x1C00) != 0)
      {
        v11 = 4.0;
      }
      else if (((1 << v12) & 0xC0) != 0)
      {
        v13 = 5.0;
      }
    }
    if (v8 == 2)
      v14 = v13;
    else
      v14 = v11;
    if (v8 == 1)
      v11 = v13;
    objc_msgSend(v7, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "layoutDirection");
    if (v16 == 2)
      v17 = v11;
    else
      v17 = v14;
    if (v16 == 2)
      v18 = v14;
    else
      v18 = v11;
    v19 = fmaxf(v17, v18);
    objc_msgSend(v6, "setCornerStyle:", 4);
    if (v19 == 0.0)
      objc_msgSend(v6, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  }
  objc_msgSend(v5, "iconImageWithoutConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v5, "iconImageWithoutConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v21);

  }
  v22 = v5;
  if (_PXIconImageSymbolConfiguration_onceToken != -1)
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_609);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredContentSizeCategory");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v24);

  objc_msgSend(v22, "systemImageName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "style"));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v25)
  {
    v91 = v27;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "preferredContentSizeCategory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v30;
    v93 = v25;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = 3;
  }
  else
  {
    v91 = v27;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "preferredContentSizeCategory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = 2;
  }
  objc_msgSend(v31, "arrayWithObjects:count:", &v91, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v26, "initWithObjects:", v33);

  p_inst_meths = &OBJC_PROTOCOL___PXStoryResourcesPreloadingCoordinatable.inst_meths;
  objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "objectForKey:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0x1E0DC3000uLL;
  if (!v36)
  {
    switch(objc_msgSend(v22, "style"))
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
      case 15:
        v38 = (id *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v38 = (id *)MEMORY[0x1E0DC4918];
        v39 = *v38;
        objc_msgSend(v22, "spec");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "options");

        v42 = (id *)MEMORY[0x1E0DC4A88];
        if ((v41 & 4) == 0)
          v42 = (id *)MEMORY[0x1E0DC4B08];
        v43 = *v42;
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v43, v39, 32770);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v41 & 4) != 0
          || (objc_msgSend(v25, "isEqualToString:", CFSTR("person.fill")) & 1) != 0
          || objc_msgSend(v25, "isEqualToString:", CFSTR("person.2.fill")))
        {
          v45 = 1;
        }
        else
        {
          v45 = 2;
        }
        v46 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v44, "pointSize");
        objc_msgSend(v46, "configurationWithPointSize:weight:scale:", 6, v45);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0x1E0DC3000;
        p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___PXStoryResourcesPreloadingCoordinatable + 24);
        goto LABEL_51;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v47 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v39, "pointSize");
        v48 = v47;
        v49 = 4;
        goto LABEL_50;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v39, "pointSize");
        goto LABEL_49;
      case 12:
        v51 = (_QWORD *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v51 = (_QWORD *)MEMORY[0x1E0DC4918];
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *v51, 32770);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v39, "pointSize");
LABEL_49:
        v48 = v50;
        v49 = 6;
LABEL_50:
        objc_msgSend(v48, "configurationWithPointSize:weight:scale:", v49, 3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

        break;
      default:
        v36 = 0;
        break;
    }
    -[__objc2_meth_list setObject:forKey:](p_inst_meths[301], "setObject:forKey:", v36, v34);
  }

  objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v36);
  objc_msgSend(v22, "title");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = MEMORY[0x1E0C809B0];
  if (v52)
  {
    objc_msgSend(v22, "title");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v54);

    v89[0] = v53;
    v89[1] = 3221225472;
    v89[2] = __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke;
    v89[3] = &unk_1E5138A20;
    v90 = v22;
    objc_msgSend(v6, "setTitleTextAttributesTransformer:", v89);

  }
  objc_msgSend(v22, "caption");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v22, "caption");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v56);

    v87[0] = v53;
    v87[1] = 3221225472;
    v87[2] = __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke_2;
    v87[3] = &unk_1E5138A20;
    v88 = v22;
    objc_msgSend(v6, "setSubtitleTextAttributesTransformer:", v87);

  }
  v57 = 0;
  v58 = 0;
  v59 = 0;
  switch(objc_msgSend(v22, "style"))
  {
    case 0:
    case 6:
    case 10:
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      goto LABEL_64;
    case 1:
    case 7:
    case 9:
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      v57 = CFSTR("UIBlurEffectStyleSystemUltraThinMaterialDark");
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      goto LABEL_62;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:
      v57 = CFSTR("UIBlurEffectStyleSystemUltraThinMaterial");
      break;
    case 13:
    case 14:
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:
      v57 = CFSTR("UIBlurEffectStyleSystemThinMaterial");
      break;
    case 15:
      objc_msgSend(v22, "backgroundColor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0;
      v59 = 0;
      break;
    default:
      v58 = 0;
      v59 = 0;
      break;
  }
  objc_msgSend(v6, "setTitleLineBreakMode:", 2);
  objc_msgSend(v6, "setSubtitleLineBreakMode:", 2);
  if (v59)
  {
    -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setEffect:", v59);
    }
    else
    {
      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v59);
      -[PXCuratedLibraryOverlayButton setEffectView:](self, "setEffectView:", v61);
    }

    -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setBackgroundColor:", v58);

    objc_msgSend(v62, "_setGroupName:", v57);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "background");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setBackgroundColor:", v64);

    objc_msgSend(v6, "background");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setCustomView:", v62);

  }
  else
  {
    if (!v58)
      goto LABEL_75;
    objc_msgSend(v6, "background");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setBackgroundColor:", v58);
  }

LABEL_75:
  objc_msgSend(*(id *)(v37 + 1136), "sharedApplication");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "preferredContentSizeCategory");
  v68 = (NSString *)objc_claimAutoreleasedReturnValue();
  v69 = UIContentSizeCategoryIsAccessibilityCategory(v68);

  if (v69)
  {
    -[PXCuratedLibraryOverlayButton setShowsLargeContentViewer:](self, "setShowsLargeContentViewer:", 1);
    v70 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PXCuratedLibraryOverlayButton addInteraction:](self, "addInteraction:", v70);

    objc_msgSend(v22, "accessibilityTitle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      -[PXCuratedLibraryOverlayButton setLargeContentTitle:](self, "setLargeContentTitle:", v71);
    }
    else
    {
      objc_msgSend(v22, "title");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButton setLargeContentTitle:](self, "setLargeContentTitle:", v72);

    }
    objc_msgSend(v22, "largeContentViewerImage");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton setLargeContentImage:](self, "setLargeContentImage:", v73);

    -[PXCuratedLibraryOverlayButton setScalesLargeContentImage:](self, "setScalesLargeContentImage:", 1);
  }
  objc_msgSend(v22, "accessibilityTitle");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v74);

  objc_msgSend(v22, "contentColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButton setTintColor:](self, "setTintColor:", v75);

  objc_msgSend(v22, "accessibilityTitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v76);

  objc_msgSend(v22, "hitTestOutsets");
  sub_1A7AE3F38();
  -[PXCuratedLibraryOverlayButton setHitTestInsets:](self, "setHitTestInsets:");
  -[PXCuratedLibraryOverlayButton setConfiguration:](self, "setConfiguration:", v6);
  objc_msgSend(v22, "actionPerformer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v77, "presentsMenu") & 1) != 0)
  {
    v78 = 1;
  }
  else
  {
    objc_msgSend(v22, "menuActionHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v79 != 0;

  }
  -[PXCuratedLibraryOverlayButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v78);
  -[PXCuratedLibraryOverlayButton menu](self, "menu");
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)v80;
  if (!v78)
  {
    v82 = 0;
    goto LABEL_87;
  }
  v82 = v80;
  if (v80)
  {
LABEL_87:
    -[PXCuratedLibraryOverlayButton setMenu:](self, "setMenu:", v82);
    goto LABEL_88;
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", MEMORY[0x1E0C9AA60]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButton setMenu:](self, "setMenu:", v83);

LABEL_88:
  -[PXCuratedLibraryOverlayButton pointerInteraction](self, "pointerInteraction");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "invalidate");

}

+ (BOOL)usesButtonSystem
{
  return _os_feature_enabled_impl();
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

+ (void)_getSize:(CGSize *)a3 titleFrame:(CGRect *)a4 captionFrame:(CGRect *)a5 iconFrame:(CGRect *)a6 forConfiguration:(id)a7 title:(id)a8
{
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  CGSize v22;
  CGSize v23;
  CGSize v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  float v29;
  unint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  void *v36;
  uint64_t v37;
  float v38;
  float v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  CGRect *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  _BOOL4 v53;
  id *v54;
  id v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  unint64_t v61;
  _BOOL8 v62;
  id v63;
  void *v64;
  CGRect *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSString *v71;
  _BOOL4 IsAccessibilityCategory;
  id *v73;
  id v74;
  uint64_t v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  double v92;
  int v93;
  double v95;
  double v96;
  double v97;
  _BOOL4 v98;
  _BOOL4 v99;
  BOOL v100;
  double v101;
  double v102;
  double v103;
  double (**v104)(_QWORD, double, double);
  void (**v105)(_QWORD, double);
  void (**v106)(_QWORD, double);
  double v107;
  void (*v108)(_QWORD, double);
  double *p_x;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  CGFloat v129;
  double v130;
  double v131;
  double v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  double MaxX;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  CGSize *v144;
  CGRect *v145;
  float v146;
  CGFloat v147;
  float v148;
  CGFloat v149;
  CGFloat v151;
  double v152;
  CGFloat v153;
  int v154;
  uint64_t v155;
  void *v156;
  double v157;
  double v158;
  CGFloat v159;
  id v160;
  double v161;
  double v162;
  _QWORD v163[4];
  id v164;
  _QWORD aBlock[5];
  const __CFString *v166;
  CGRect *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  double v171;
  uint64_t v172;
  double v173;
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = a8;
  if (v13)
  {
    v15 = objc_msgSend(v13, "style");
    if (v15 > 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _PXNeedsEffectViewForStyle(PXCuratedLibraryOverlayButtonStyle)");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "handleFailureInFunction:file:lineNumber:description:", v143, CFSTR("PXCuratedLibraryOverlayButton.m"), 102, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v16 = v15;
    v160 = v14;
    v145 = a6;
    v144 = a3;
    if (((1 << v15) & 0xFFC3) != 0)
    {
      v18 = *MEMORY[0x1E0C9D820];
      v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v19 = objc_msgSend(v14, "length");
      v20 = 12.0;
      v161 = v18;
      if (!v19)
        v20 = v18;
      v152 = v20;
      v154 = 1;
      v157 = v17;
    }
    else
    {
      v154 = 0;
      v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v157 = 3.0;
      v152 = *MEMORY[0x1E0C9D820];
      v161 = *MEMORY[0x1E0C9D820];
    }
    v25 = v13;
    v26 = objc_msgSend(v25, "segment");
    objc_msgSend(v25, "spec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "buttonHeight");
    v29 = v28 * 0.5;

    v30 = objc_msgSend(v25, "style");
    v31 = 0.0;
    v32 = 4.0;
    v33 = 5.0;
    if (((1 << v30) & 0xC0) == 0)
      v33 = 0.0;
    if (((1 << v30) & 0x1C00) != 0)
      v33 = 0.0;
    else
      v32 = v29;
    if (((1 << v30) & 0x3C) != 0)
    {
      v33 = 0.0;
      v32 = 0.0;
    }
    if (v30 > 0xC)
      v32 = v29;
    else
      v31 = v33;
    if (v26 == 2)
      v34 = v31;
    else
      v34 = v32;
    if (v26 == 1)
      v35 = v31;
    else
      v35 = v32;
    objc_msgSend(v25, "spec");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v36, "layoutDirection");
    if (v37 == 2)
      v38 = v35;
    else
      v38 = v34;
    v148 = v38;
    if (v37 == 2)
      v39 = v34;
    else
      v39 = v35;
    v146 = v39;
    objc_msgSend(v25, "spec");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "buttonHeight");
    v42 = v41;

    v43 = v17;
    v158 = v161;
    if (!v160)
    {
LABEL_58:
      objc_msgSend(v25, "caption");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v17;
      v60 = v161;
      if (!v156)
      {
LABEL_78:
        objc_msgSend(v25, "iconImage");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        if (v78)
        {
          objc_msgSend(v78, "size");
          v161 = v80;
          v17 = v81;
        }
        if (v42 + v157 * -2.0 >= v43)
          v82 = v42 + v157 * -2.0;
        else
          v82 = v43;
        objc_msgSend(v25, "imageEdgeInsets");
        v84 = v83;
        v86 = v85;
        v88 = v87;
        v90 = v89;
        v91 = objc_msgSend(v25, "buttonType");
        v92 = v82 - (v84 + v88);
        if (v91 == 4)
          v92 = 6.0;
        v93 = v154;
        if (v17 <= 0.0)
          v93 = 1;
        if (!v93)
          v92 = v17;
        if (v92 <= 0.0 || v17 <= v92)
        {
          if (v82 < v17)
            v82 = v17;
        }
        else
        {
          PXSizeScale();
          v161 = v95;
          v17 = v96;
        }
        v97 = (float)(v148 + v146);
        v98 = v158 > 0.0;
        v99 = v161 > 0.0;
        v100 = v98 && v99;
        v101 = 0.0;
        if (v98 && v99)
          v101 = 4.0;
        v102 = v90 + v161 + v86 + v158 + v152 * 2.0 + v60 + v101;
        v168 = 0x4010000000;
        v166 = 0;
        v167 = (CGRect *)&v166;
        if (v102 >= v97)
          v103 = -0.0;
        else
          v103 = (v97 - v102) * 0.5;
        v169 = &unk_1A7E74EE7;
        v170 = 0;
        v171 = v157;
        v172 = 0;
        v173 = v82;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke;
        aBlock[3] = &unk_1E5130CE8;
        aBlock[4] = &v166;
        v163[0] = MEMORY[0x1E0C809B0];
        v163[1] = 3221225472;
        v163[2] = __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke_2;
        v163[3] = &unk_1E5130D10;
        v104 = _Block_copy(aBlock);
        v164 = v104;
        v105 = (void (**)(_QWORD, double))_Block_copy(v163);
        v106 = v105;
        v107 = v152 + v103;
        v108 = v105[2];
        if (v154)
        {
          v108(v105, v152 + v103);
          p_x = &v145->origin.x;
          v110 = v104[2](v104, v60, v59);
          v147 = v112;
          v149 = v111;
          v151 = v113;
          v153 = v110;
          if (v60 > 0.0)
            v167[1].origin.x = v167[1].origin.x + 2.0;
          v114 = v104[2](v104, v158, v82);
          v159 = v115;
          v117 = v116;
          v119 = v118;
          v120 = v114;
          if (v100)
            v106[2](v106, 4.0);
          v106[2](v106, v86);
          v162 = v104[2](v104, v161, v17);
          v155 = v121;
          v123 = v122;
          v125 = v124;
          v106[2](v106, v90);
          v106[2](v106, v107);
        }
        else
        {
          v108(v105, v152 + v103);
          p_x = &v145->origin.x;
          v106[2](v106, v86);
          v162 = v104[2](v104, v161, v17);
          v155 = v126;
          v123 = v127;
          v125 = v128;
          v106[2](v106, v90);
          if (v100)
            v106[2](v106, 4.0);
          v129 = v104[2](v104, v60, v59);
          v147 = v131;
          v149 = v130;
          v151 = v132;
          v153 = v129;
          if (v60 > 0.0)
            v167[1].origin.x = v167[1].origin.x + 2.0;
          v133 = v104[2](v104, v158, v82);
          v159 = v134;
          v120 = v133;
          v119 = v135;
          v117 = v136;
          v106[2](v106, v107);
        }
        MaxX = CGRectGetMaxX(v167[1]);
        if (v144)
        {
          v144->width = MaxX;
          v144->height = v82 + v157 * 2.0;
        }
        if (a4)
        {
          a4->origin.x = v120;
          a4->origin.y = v119;
          a4->size.width = v117;
          a4->size.height = v159;
        }
        if (a5)
        {
          a5->origin.x = v153;
          a5->origin.y = v151;
          a5->size.width = v149;
          a5->size.height = v147;
        }
        if (p_x)
        {
          *p_x = v162;
          *((_QWORD *)p_x + 1) = v155;
          *((_QWORD *)p_x + 2) = v123;
          *((_QWORD *)p_x + 3) = v125;
        }

        _Block_object_dispose(&v166, 8);
        v14 = v160;
        goto LABEL_121;
      }
      if (_PXFontForComponent_onceToken != -1)
        dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
      v61 = v16 - 2;
      v62 = v16 - 2 < 4;
      v63 = objc_alloc((Class)off_1E50B5CD8);
      v166 = CFSTR("_PXOverlayButtonComponentCaption");
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "preferredContentSizeCategory");
      v65 = (CGRect *)objc_claimAutoreleasedReturnValue();
      v167 = v65;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v62);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = (uint64_t)v66;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 3);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v63, "initWithObjects:", v67);

      objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
LABEL_77:

        objc_msgSend(a1, "_sizeOfTitle:withFont:", v156, v69);
        v60 = v76;
        v59 = v77;

        goto LABEL_78;
      }
      if (v61 < 4)
      {
        if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
        {
          goto LABEL_123;
        }
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:
        if (v69)
        {
          objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v69, v68);
          goto LABEL_77;
        }
LABEL_123:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "handleFailureInFunction:file:lineNumber:description:", v141, CFSTR("PXCuratedLibraryOverlayButton.m"), 186, CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"));

        abort();
      }
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "preferredContentSizeCategory");
      v71 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v71);

      v73 = (id *)MEMORY[0x1E0DC48F0];
      if (!IsAccessibilityCategory)
        v73 = (id *)MEMORY[0x1E0DC4900];
      v74 = *v73;
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
      {
        v75 = 2;
      }
      else
      {
        if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
        {
          v69 = 0;
          goto LABEL_74;
        }
        v75 = 0;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v74, v75);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:

      goto LABEL_75;
    }
    if (_PXFontForComponent_onceToken != -1)
      dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
    v44 = objc_alloc((Class)off_1E50B5CD8);
    v166 = CFSTR("_PXOverlayButtonComponentTitle");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "preferredContentSizeCategory");
    v46 = (CGRect *)objc_claimAutoreleasedReturnValue();
    v167 = v46;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16 - 2 < 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = (uint64_t)v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v44, "initWithObjects:", v48);

    objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
LABEL_57:

      objc_msgSend(a1, "_sizeOfTitle:withFont:", v160, v50);
      v158 = v57;
      v43 = v58;

      goto LABEL_58;
    }
    if (v16 - 2 < 4)
    {
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        goto LABEL_122;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
      if (v50)
      {
        objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v50, v49);
        goto LABEL_57;
      }
LABEL_122:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "handleFailureInFunction:file:lineNumber:description:", v139, CFSTR("PXCuratedLibraryOverlayButton.m"), 186, CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "preferredContentSizeCategory");
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
    v53 = UIContentSizeCategoryIsAccessibilityCategory(v52);

    v54 = (id *)MEMORY[0x1E0DC48F0];
    if (!v53)
      v54 = (id *)MEMORY[0x1E0DC4900];
    v55 = *v54;
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
    {
      v56 = 2;
    }
    else
    {
      if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        v50 = 0;
        goto LABEL_54;
      }
      v56 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v55, v56);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:

    goto LABEL_55;
  }
  if (a3)
    *a3 = *(CGSize *)MEMORY[0x1E0C9D820];
  v21 = MEMORY[0x1E0C9D648];
  if (a4)
  {
    v22 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    a4->size = v22;
  }
  if (a5)
  {
    v23 = *(CGSize *)(v21 + 16);
    a5->origin = *(CGPoint *)v21;
    a5->size = v23;
  }
  if (a6)
  {
    v24 = *(CGSize *)(v21 + 16);
    a6->origin = *(CGPoint *)v21;
    a6->size = v24;
  }
LABEL_121:

}

double __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3)
{
  double MinX;
  CGFloat v7;
  CGRect v9;

  MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v7 = CGRectGetMidY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)) + a3 * -0.5;
  v9.origin.x = MinX;
  v9.origin.y = v7;
  v9.size.width = a2;
  v9.size.height = a3;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectGetMaxX(v9);
  return MinX;
}

uint64_t __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke_2(uint64_t a1, __n128 a2)
{
  return (*(uint64_t (**)(__n128, double))(*(_QWORD *)(a1 + 32) + 16))(a2, 0.0);
}

+ (CGSize)_sizeOfTitle:(id)a3 withFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  _QWORD v25[3];
  CGSize result;

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "titleSizeCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc((Class)off_1E50B5CD8);
  v25[0] = v6;
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10);

  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "CGSizeValue");
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v23 = *MEMORY[0x1E0DC1138];
    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeWithAttributes:", v18);
    v15 = v19;
    v17 = v20;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v15, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, v11);
  }

  v21 = v15;
  v22 = v17;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (NSCache)titleSizeCache
{
  if (titleSizeCache_onceToken != -1)
    dispatch_once(&titleSizeCache_onceToken, &__block_literal_global_393);
  return (NSCache *)(id)titleSizeCache_titleSizeCache;
}

- (PXCuratedLibraryOverlayButton)initWithFrame:(CGRect)a3
{
  PXCuratedLibraryOverlayButton *v3;
  PXCuratedLibraryOverlayButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryOverlayButton;
  v3 = -[PXCuratedLibraryOverlayButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXCuratedLibraryOverlayButton _setupViews](v3, "_setupViews");
    -[PXCuratedLibraryOverlayButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__performAction_, 64);
    -[PXCuratedLibraryOverlayButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__performMenuAction_, 0x4000);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__accessibilitySettingsChanged_, *MEMORY[0x1E0DC44E0], 0);

  }
  return v4;
}

- (void)_setupViews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *v12;
  UIImageView *customIconImageView;
  UIImageView *v14;
  void *v15;
  void (**v16)(void);
  UILabel *v17;
  UILabel *customTitleLabel;
  UILabel *v19;
  UILabel *customCaptionLabel;
  void *v21;
  _QWORD aBlock[9];

  if ((objc_msgSend((id)objc_opt_class(), "usesButtonSystem") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton setBackgroundColor:](self, "setBackgroundColor:", v3);

    -[PXCuratedLibraryOverlayButton _updateBackgroundView](self, "_updateBackgroundView");
    -[PXCuratedLibraryOverlayButton bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v6, v8, v10);
    -[UIImageView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    customIconImageView = self->_customIconImageView;
    self->_customIconImageView = v12;
    v14 = v12;

    -[PXCuratedLibraryOverlayButton contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v14);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PXCuratedLibraryOverlayButton__setupViews__block_invoke;
    aBlock[3] = &unk_1E5130D58;
    *(double *)&aBlock[5] = v5;
    *(double *)&aBlock[6] = v7;
    *(double *)&aBlock[7] = v9;
    *(double *)&aBlock[8] = v11;
    aBlock[4] = self;
    v16 = (void (**)(void))_Block_copy(aBlock);
    v16[2]();
    v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
    customTitleLabel = self->_customTitleLabel;
    self->_customTitleLabel = v17;

    ((void (*)(void (**)(void)))v16[2])(v16);
    v19 = (UILabel *)objc_claimAutoreleasedReturnValue();
    customCaptionLabel = self->_customCaptionLabel;
    self->_customCaptionLabel = v19;

  }
  -[PXCuratedLibraryOverlayButton layer](self, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

  -[PXCuratedLibraryOverlayButton _platformSpecificViewSetup](self, "_platformSpecificViewSetup");
}

- (void)_platformSpecificViewSetup
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
  -[PXCuratedLibraryOverlayButton addInteraction:](self, "addInteraction:", v3);
  -[PXCuratedLibraryOverlayButton setPointerInteraction:](self, "setPointerInteraction:", v3);

}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

+ (CGSize)sizeWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXCuratedLibraryOverlayButton *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PXCuratedLibraryOverlayButton *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize result;

  v4 = a3;
  v35 = 0.0;
  v36 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buttonSizeCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extendedTraitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == 5 && objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
    {
      v14 = objc_alloc_init(PXCuratedLibraryOverlayButton);
      -[PXCuratedLibraryOverlayButton setIsSizeCalculationButton:](v14, "setIsSizeCalculationButton:", 1);
      -[PXCuratedLibraryOverlayButton setUserData:](v14, "setUserData:", v4);
      -[PXCuratedLibraryOverlayButton sizeThatFits:](v14, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v16 = v15;
      v18 = v17;
      v35 = v15;
      v36 = v17;

LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v16, v18, *(_QWORD *)&v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, v5);

      goto LABEL_18;
    }
    objc_msgSend(v4, "possibleTitles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = v22;

    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v25);

    }
    objc_msgSend(v23, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_402_166078);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_getSize:titleFrame:captionFrame:iconFrame:forConfiguration:title:", &v35, 0, 0, 0, v4, v28);
    if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
    {
      objc_msgSend(v4, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

LABEL_15:
        v31 = objc_alloc_init(PXCuratedLibraryOverlayButton);
        -[PXCuratedLibraryOverlayButton setIsSizeCalculationButton:](v31, "setIsSizeCalculationButton:", 1);
        -[PXCuratedLibraryOverlayButton setUserData:](v31, "setUserData:", v4);
        -[PXCuratedLibraryOverlayButton sizeThatFits:](v31, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v35 = v32;

        goto LABEL_16;
      }
      objc_msgSend(v4, "caption");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_15;
    }
LABEL_16:

    v16 = v35;
    v18 = v36;
    goto LABEL_17;
  }
  v8 = v7;
  objc_msgSend(v7, "CGSizeValue");
  v35 = v9;
  v36 = v10;
LABEL_18:

  v33 = v35;
  v34 = v36;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)setUserData:(id)a3
{
  PXCuratedLibraryOverlayButtonConfiguration *v5;
  PXCuratedLibraryOverlayButtonConfiguration *v6;
  BOOL v7;
  PXCuratedLibraryOverlayButtonConfiguration *v8;
  PXCuratedLibraryOverlayButtonConfiguration *v9;

  v9 = (PXCuratedLibraryOverlayButtonConfiguration *)a3;
  v5 = self->_userData;
  if (v5 == v9)
  {

LABEL_9:
    v8 = v9;
    goto LABEL_10;
  }
  v6 = v5;
  v7 = -[PXCuratedLibraryOverlayButtonConfiguration isEqual:](v5, "isEqual:", v9);

  v8 = v9;
  if (!v7)
  {
    objc_storeStrong((id *)&self->_userData, a3);
    if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
    {
      -[PXCuratedLibraryOverlayButton _updateButtonSystemWithConfiguration:](self, "_updateButtonSystemWithConfiguration:", v9);
    }
    else
    {
      if (v9)
        -[PXCuratedLibraryOverlayButton _updateButtonWithConfiguration:](self, "_updateButtonWithConfiguration:", v9);
      -[PXCuratedLibraryOverlayButton setNeedsLayout](self, "setNeedsLayout");
    }
    goto LABEL_9;
  }
LABEL_10:

}

+ (NSCache)buttonSizeCache
{
  if (buttonSizeCache_onceToken != -1)
    dispatch_once(&buttonSizeCache_onceToken, &__block_literal_global_394);
  return (NSCache *)(id)buttonSizeCache_buttonSizeCache;
}

- (void)setIsSizeCalculationButton:(BOOL)a3
{
  self->_isSizeCalculationButton = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[PXCuratedLibraryOverlayButton isSizeCalculationButton](self, "isSizeCalculationButton"))
  {
    v14.receiver = self;
    v14.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  }
  else
  {
    v8 = (void *)objc_opt_class();
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeWithConfiguration:", v9);
    v11 = v10;
    v13 = v12;

    v6 = v11;
    v7 = v13;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)isSizeCalculationButton
{
  return self->_isSizeCalculationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_customCaptionLabel, 0);
  objc_storeStrong((id *)&self->_customTitleLabel, 0);
  objc_storeStrong((id *)&self->_customIconImageView, 0);
  objc_storeStrong((id *)&self->_customSolidBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

void __48__PXCuratedLibraryOverlayButton_buttonSizeCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)buttonSizeCache_buttonSizeCache;
  buttonSizeCache_buttonSizeCache = (uint64_t)v0;

}

void __47__PXCuratedLibraryOverlayButton_titleSizeCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)titleSizeCache_titleSizeCache;
  titleSizeCache_titleSizeCache = (uint64_t)v0;

}

- (NSString)description
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton description](&v12, sel_description);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v11.receiver = self;
    v11.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton description](&v11, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton customIconImageView](self, "customIconImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton customTitleLabel](self, "customTitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ icon:%@ title:%@>"), v5, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton setHighlighted:](&v9, sel_setHighlighted_, v3);
  }
  else if (-[PXCuratedLibraryOverlayButton isHighlighted](self, "isHighlighted") != v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton setHighlighted:](&v8, sel_setHighlighted_, v3);
    -[PXCuratedLibraryOverlayButton customIconImageView](self, "customIconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

    -[PXCuratedLibraryOverlayButton customTitleLabel](self, "customTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", v3);

    -[PXCuratedLibraryOverlayButton customCaptionLabel](self, "customCaptionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:", v3);

  }
}

- (void)updateHitTestInsets
{
  PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets();
}

- (void)_updateButtonWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  id v27;
  void *v28;
  char v29;
  id *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSString *v53;
  _BOOL4 v54;
  id *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  _BOOL8 v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSString *v73;
  _BOOL4 v74;
  id *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  NSString *v81;
  _BOOL4 v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  PXCuratedLibraryOverlayButton *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1373, CFSTR("Shouldn't be called if button system is used."));

  }
  -[PXCuratedLibraryOverlayButton _updateBackgroundView](self, "_updateBackgroundView");
  -[PXCuratedLibraryOverlayButton _updateEffectView](self, "_updateEffectView");
  -[PXCuratedLibraryOverlayButton customIconImageView](self, "customIconImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintedIconImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  objc_msgSend(v5, "highlightedIconImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedImage:", v8);

  objc_msgSend(v5, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v6;
  objc_msgSend(v6, "setTintColor:", v9);

  -[PXCuratedLibraryOverlayButton pointerInteraction](self, "pointerInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  v11 = v5;
  v100 = self;
  if (_PXIconImageSymbolConfiguration_onceToken != -1)
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_609);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  objc_msgSend(v11, "systemImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "style"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v15)
  {
    v102 = (const __CFString *)v17;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredContentSizeCategory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v20;
    v104 = v15;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = 3;
  }
  else
  {
    v102 = (const __CFString *)v17;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredContentSizeCategory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v20;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = 2;
  }
  objc_msgSend(v21, "arrayWithObjects:count:", &v102, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v16, "initWithObjects:", v23);

  objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "objectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    switch(objc_msgSend(v11, "style"))
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
      case 15:
        v26 = (id *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v26 = (id *)MEMORY[0x1E0DC4918];
        v27 = *v26;
        objc_msgSend(v11, "spec");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "options");

        v30 = (id *)MEMORY[0x1E0DC4A88];
        if ((v29 & 4) == 0)
          v30 = (id *)MEMORY[0x1E0DC4B08];
        v31 = *v30;
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v31, v27, 32770);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v29 & 4) != 0
          || (objc_msgSend(v15, "isEqualToString:", CFSTR("person.fill")) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", CFSTR("person.2.fill")))
        {
          v33 = 1;
        }
        else
        {
          v33 = 2;
        }
        v34 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v32, "pointSize");
        objc_msgSend(v34, "configurationWithPointSize:weight:scale:", 6, v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v27, "pointSize");
        v36 = v35;
        v37 = 4;
        goto LABEL_27;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v27, "pointSize");
        goto LABEL_26;
      case 12:
        v39 = (_QWORD *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v39 = (_QWORD *)MEMORY[0x1E0DC4918];
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *v39, 32770);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v27, "pointSize");
LABEL_26:
        v36 = v38;
        v37 = 6;
LABEL_27:
        objc_msgSend(v36, "configurationWithPointSize:weight:scale:", v37, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

        break;
      default:
        v25 = 0;
        break;
    }
    objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "setObject:forKey:", v25, v24);
  }

  objc_msgSend(v6, "setPreferredSymbolConfiguration:", v25);
  objc_msgSend(v11, "hitTestOutsets");
  sub_1A7AE3F38();
  -[PXCuratedLibraryOverlayButton setHitTestInsets:](self, "setHitTestInsets:");
  objc_msgSend(v11, "systemImageName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v40 == 0);

  -[PXCuratedLibraryOverlayButton customTitleLabel](self, "customTitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHidden:", v42 == 0);
  v99 = (void *)v42;
  objc_msgSend(v41, "setText:", v42);
  v43 = objc_msgSend(v11, "style");
  if (_PXFontForComponent_onceToken != -1)
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
  v44 = v43 - 2;
  v45 = objc_alloc((Class)off_1E50B5CD8);
  v102 = CFSTR("_PXOverlayButtonComponentTitle");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "preferredContentSizeCategory");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v47;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (unint64_t)(v43 - 2) < 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v45, "initWithObjects:", v49);

  objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    goto LABEL_48;
  if (v44 < 4)
  {
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
    {
      goto LABEL_76;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "preferredContentSizeCategory");
  v53 = (NSString *)objc_claimAutoreleasedReturnValue();
  v54 = UIContentSizeCategoryIsAccessibilityCategory(v53);

  v55 = (id *)MEMORY[0x1E0DC48F0];
  if (!v54)
    v55 = (id *)MEMORY[0x1E0DC4900];
  v56 = *v55;
  if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
  {
    v57 = 2;
  }
  else
  {
    if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
    {
      v51 = 0;
      goto LABEL_45;
    }
    v57 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v56, v57);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:

LABEL_46:
  if (!v51)
    goto LABEL_76;
  objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v51, v50);
LABEL_48:

  objc_msgSend(v41, "setFont:", v51);
  objc_msgSend(v11, "contentColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTextColor:", v58);

  objc_msgSend(v11, "highlightedContentColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHighlightedTextColor:", v59);

  objc_msgSend(v41, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", UIAccessibilityButtonShapesEnabled());
  -[PXCuratedLibraryOverlayButton customCaptionLabel](self, "customCaptionLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "caption");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHidden:", v61 == 0);
  objc_msgSend(v60, "setText:", v61);
  v62 = objc_msgSend(v11, "style");
  if (_PXFontForComponent_onceToken != -1)
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
  v63 = v62 - 2;
  v64 = (unint64_t)(v62 - 2) < 4;
  v65 = objc_alloc((Class)off_1E50B5CD8);
  v102 = CFSTR("_PXOverlayButtonComponentCaption");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "preferredContentSizeCategory");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v67;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v64);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v65, "initWithObjects:", v69);

  objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71)
  {
    if (v63 < 4)
    {
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "preferredContentSizeCategory");
    v73 = (NSString *)objc_claimAutoreleasedReturnValue();
    v74 = UIContentSizeCategoryIsAccessibilityCategory(v73);

    v75 = (id *)MEMORY[0x1E0DC48F0];
    if (!v74)
      v75 = (id *)MEMORY[0x1E0DC4900];
    v76 = *v75;
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
    {
      v77 = 2;
    }
    else
    {
      if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        v71 = 0;
        goto LABEL_63;
      }
      v77 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v76, v77);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:

LABEL_64:
    if (v71)
    {
      objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v71, v70);
      goto LABEL_66;
    }
LABEL_76:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!");
    v96 = v93;
    v97 = v94;
    v98 = 186;
    goto LABEL_77;
  }
LABEL_66:

  objc_msgSend(v60, "setFont:", v71);
  objc_msgSend(v11, "contentColor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTextColor:", v78);

  objc_msgSend(v11, "highlightedContentColor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHighlightedTextColor:", v79);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "preferredContentSizeCategory");
  v81 = (NSString *)objc_claimAutoreleasedReturnValue();
  v82 = UIContentSizeCategoryIsAccessibilityCategory(v81);

  if (v82)
  {
    -[PXCuratedLibraryOverlayButton setShowsLargeContentViewer:](v100, "setShowsLargeContentViewer:", 1);
    v83 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PXCuratedLibraryOverlayButton addInteraction:](v100, "addInteraction:", v83);

    objc_msgSend(v11, "accessibilityTitle");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      -[PXCuratedLibraryOverlayButton setLargeContentTitle:](v100, "setLargeContentTitle:", v84);
    }
    else
    {
      objc_msgSend(v11, "title");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButton setLargeContentTitle:](v100, "setLargeContentTitle:", v85);

    }
    objc_msgSend(v11, "largeContentViewerImage");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton setLargeContentImage:](v100, "setLargeContentImage:", v86);

    -[PXCuratedLibraryOverlayButton setScalesLargeContentImage:](v100, "setScalesLargeContentImage:", 1);
  }
  objc_msgSend(v11, "accessibilityTitle");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryOverlayButton setAccessibilityLabel:](v100, "setAccessibilityLabel:", v87);

  v88 = v11;
  v89 = objc_msgSend(v88, "style");
  if (v89 - 4 >= 0xC)
  {
    if (v89 <= 3)
    {
      PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryOverlayButtonAXLabel"), CFSTR("PhotosUICore"));
      v90 = objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AXLabelForConfiguration(PXCuratedLibraryOverlayButtonConfiguration *__strong)");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = CFSTR("Code which should be unreachable has been reached");
    v96 = v93;
    v97 = v94;
    v98 = 126;
LABEL_77:
    objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("PXCuratedLibraryOverlayButton.m"), v98, v95);

    abort();
  }
  objc_msgSend(v88, "title");
  v90 = objc_claimAutoreleasedReturnValue();
LABEL_75:
  v91 = (void *)v90;

  -[PXCuratedLibraryOverlayButton setAxLabel:](v100, "setAxLabel:", v91);
}

- (void)_performAction:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v10 = a3;
  -[PXCuratedLibraryOverlayButton userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void (**)(_QWORD))v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PX_NAND(actionPerformer, actionHandler)"));

  }
  objc_msgSend(v6, "setSender:", v10);
  objc_msgSend(v6, "performActionWithCompletionHandler:", 0);
  if (v8)
    v8[2](v8);

}

- (void)_performMenuAction:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v10 = a3;
  -[PXCuratedLibraryOverlayButton userData](self, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuActionHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void (**)(_QWORD))v7;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PX_NAND(actionPerformer, actionHandler)"));

  }
  objc_msgSend(v6, "setSender:", v10);
  objc_msgSend(v6, "performActionWithCompletionHandler:", 0);
  if (v8)
    v8[2](v8);

}

- (void)setContentView:(id)a3
{
  UIView *v6;
  UIView *contentView;
  UIView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (UIView *)a3;
  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1468, CFSTR("Shouldn't be called if button system is used."));

  }
  contentView = self->_contentView;
  if (contentView != v6)
  {
    v8 = contentView;
    objc_storeStrong((id *)&self->_contentView, a3);
    if (v6 && v8)
    {
      -[UIView frame](v8, "frame");
      -[UIView setFrame:](v6, "setFrame:");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[UIView subviews](v8, "subviews", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            -[UIView addSubview:](v6, "addSubview:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

      -[PXCuratedLibraryOverlayButton insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v8);
    }

  }
}

- (void)_accessibilitySettingsChanged:(id)a3
{
  id v3;

  -[PXCuratedLibraryOverlayButton customTitleLabel](self, "customTitleLabel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", UIAccessibilityButtonShapesEnabled());

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryOverlayButton;
  -[PXCuratedLibraryOverlayButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v11, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  -[PXCuratedLibraryOverlayButton userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willDisplayMenuActionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willDisplayMenuActionHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  -[PXCuratedLibraryOverlayButton menu](self, "menu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willOpen");

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryOverlayButton;
  -[PXCuratedLibraryOverlayButton contextMenuInteraction:willEndForConfiguration:animator:](&v11, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  -[PXCuratedLibraryOverlayButton userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willDismissMenuActionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willDismissMenuActionHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  -[PXCuratedLibraryOverlayButton menu](self, "menu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didClose");

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[PXCuratedLibraryOverlayButton userData](self, "userData", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFloating");

  if ((v8 & 1) != 0 || objc_msgSend(v6, "forcePointerInteractionEnabled"))
  {
    v9 = (void *)MEMORY[0x1E0DC3B28];
    -[PXCuratedLibraryOverlayButton bounds](self, "bounds");
    objc_msgSend(v9, "regionWithRect:identifier:", CFSTR("curatedLibraryOverylayButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  float v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  uint64_t v17;
  float v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  -[PXCuratedLibraryOverlayButton userData](self, "userData", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "segment");
  objc_msgSend(v5, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonHeight");
  v9 = v8 * 0.5;

  v10 = objc_msgSend(v5, "style");
  v11 = 0.0;
  v12 = 4.0;
  v13 = 5.0;
  if (((1 << v10) & 0xC0) == 0)
    v13 = 0.0;
  if (((1 << v10) & 0x1C00) != 0)
    v13 = 0.0;
  else
    v12 = v9;
  if (((1 << v10) & 0x3C) != 0)
  {
    v13 = 0.0;
    v12 = 0.0;
  }
  if (v10 > 0xC)
    v12 = v9;
  else
    v11 = v13;
  if (v6 == 2)
    v14 = v11;
  else
    v14 = v12;
  if (v6 == 1)
    v15 = v11;
  else
    v15 = v12;
  objc_msgSend(v5, "spec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "layoutDirection");

  if (v17 == 2)
    v18 = v15;
  else
    v18 = v14;
  if (v17 != 2)
    v14 = v15;
  objc_msgSend((id)objc_opt_class(), "sizeWithConfiguration:", v5);
  objc_msgSend(MEMORY[0x1E0DC3508], "px_bezierPathWithRoundedRect:topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:", 0.0, 0.0, v19, v20, v18, v14, v18, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(v22, "setVisiblePath:", v21);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v22);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)_updateBackgroundView
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1551, CFSTR("Shouldn't be called if button system is used."));

  }
  -[PXCuratedLibraryOverlayButton userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  if (v5 >= 0x10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _PXNeedsEffectViewForStyle(PXCuratedLibraryOverlayButtonStyle)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXCuratedLibraryOverlayButton.m"), 102, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v6 = 0xFFC3u >> v5;
  -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) != 0 && !v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[PXCuratedLibraryOverlayButton bounds](self, "bounds");
    v17 = (id)objc_msgSend(v8, "initWithFrame:");
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);
    objc_msgSend(v17, "setAutoresizingMask:", 18);
    -[PXCuratedLibraryOverlayButton setEffectView:](self, "setEffectView:", v17);
    -[PXCuratedLibraryOverlayButton contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton setContentView:](self, "setContentView:", v10);

    -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton addSubview:](self, "addSubview:", v11);

    objc_msgSend(v9, "removeFromSuperview");
LABEL_10:

    return;
  }
  if ((v6 & 1) == 0 && v7)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PXCuratedLibraryOverlayButton bounds](self, "bounds");
    v17 = (id)objc_msgSend(v12, "initWithFrame:");
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);
    objc_msgSend(v17, "setAutoresizingMask:", 18);
    -[PXCuratedLibraryOverlayButton setContentView:](self, "setContentView:", v17);
    -[PXCuratedLibraryOverlayButton addSubview:](self, "addSubview:", v17);
    -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[PXCuratedLibraryOverlayButton setEffectView:](self, "setEffectView:", 0);
    goto LABEL_10;
  }
}

- (void)_updateEffectViewBackgroundStyle
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1586, CFSTR("Shouldn't be called if button system is used."));

  }
  -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "style");

    switch(v7)
    {
      case 0:
      case 6:
      case 10:
        v8 = 1;
        v9 = CFSTR("UIBlurEffectStyleSystemUltraThinMaterial");
        v10 = 6;
        break;
      case 1:
      case 7:
      case 9:
      case 11:
        v8 = 1;
        v9 = CFSTR("UIBlurEffectStyleSystemUltraThinMaterialDark");
        v10 = 16;
        break;
      case 2:
      case 3:
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1641, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 8:
        v8 = 1;
        v9 = CFSTR("UIBlurEffectStyleSystemThinMaterial");
        v10 = 7;
        break;
      case 12:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
        v12 = objc_claimAutoreleasedReturnValue();

        v8 = 1;
        v10 = 6;
        v5 = (void *)v12;
        v9 = CFSTR("UIBlurEffectStyleSystemUltraThinMaterial");
        break;
      case 13:
      case 14:
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = 1;
        v10 = 7;
        v5 = (void *)v11;
        v9 = CFSTR("UIBlurEffectStyleSystemThinMaterial");
        break;
      case 15:
        -[PXCuratedLibraryOverlayButton userData](self, "userData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "backgroundColor");
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v8 = 0;
        v10 = 0;
        v5 = (void *)v14;
        break;
      default:
        v9 = 0;
        v10 = 0;
        v8 = 1;
        break;
    }
    -[PXCuratedLibraryOverlayButton contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v5);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEffect:", v16);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXCuratedLibraryOverlayButton-%@"), v9);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setGroupName:", v9);
    }
    else
    {
      objc_msgSend(v19, "setEffect:", 0);
    }

    v4 = v19;
  }

}

- (void)_updateEffectView
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  float v10;
  unint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  float v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;

  if (objc_msgSend((id)objc_opt_class(), "usesButtonSystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryOverlayButton.m"), 1662, CFSTR("Shouldn't be called if button system is used."));

  }
  -[PXCuratedLibraryOverlayButton effectView](self, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v32 = v4;
    -[PXCuratedLibraryOverlayButton userData](self, "userData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryOverlayButton _updateEffectViewBackgroundStyle](self, "_updateEffectViewBackgroundStyle");
    v6 = v5;
    v7 = objc_msgSend(v6, "segment");
    objc_msgSend(v6, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttonHeight");
    v10 = v9 * 0.5;

    v11 = objc_msgSend(v6, "style");
    v12 = 0.0;
    v13 = 4.0;
    v14 = 5.0;
    if (((1 << v11) & 0xC0) == 0)
      v14 = 0.0;
    if (((1 << v11) & 0x1C00) != 0)
      v14 = 0.0;
    else
      v13 = v10;
    if (((1 << v11) & 0x3C) != 0)
    {
      v14 = 0.0;
      v13 = 0.0;
    }
    if (v11 > 0xC)
      v13 = v10;
    else
      v12 = v14;
    if (v7 == 2)
      v15 = v12;
    else
      v15 = v13;
    if (v7 == 1)
      v16 = v12;
    else
      v16 = v13;
    objc_msgSend(v6, "spec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "layoutDirection");
    if (v18 == 2)
      v19 = v16;
    else
      v19 = v15;
    if (v18 != 2)
      v15 = v16;
    if (PXFloatApproximatelyEqualToFloat())
    {
      v20 = v32;
      v21 = v19;
      v22 = 15;
    }
    else if (PXFloatApproximatelyEqualToFloat())
    {
      v20 = v32;
      v21 = v15;
      v22 = 10;
    }
    else
    {
      if (!PXFloatApproximatelyEqualToFloat())
      {
        objc_msgSend(v32, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 0.0);
        objc_msgSend((id)objc_opt_class(), "sizeWithConfiguration:", v6);
        v26 = v25;
        v28 = v27;
        *(float *)&v25 = v19;
        *(float *)&v27 = v15;
        *(float *)&v29 = v19;
        *(float *)&v30 = v15;
        +[PXCuratedLibraryOverlayButton roundedCornerMaskImage:size:](PXCuratedLibraryOverlayButton, "roundedCornerMaskImage:size:", v25, v27, v29, v30, v26, v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_setMaskImage:", v23);
        if (v23)
          goto LABEL_33;
        goto LABEL_32;
      }
      v20 = v32;
      v21 = v19;
      v22 = 5;
    }
    objc_msgSend(v20, "_setCornerRadius:continuous:maskedCorners:", 1, v22, v21);
    objc_msgSend(v32, "_setMaskImage:", 0);
LABEL_32:
    objc_msgSend(v32, "setMaskView:", 0);
    v23 = 0;
LABEL_33:
    objc_msgSend(v32, "setClipsToBounds:", 0);
    objc_msgSend(v32, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClipsToBounds:", 0);

    v4 = v32;
  }

}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)extendedHitTestInsetsEdges
{
  return self->_extendedHitTestInsetsEdges;
}

- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3
{
  self->_extendedHitTestInsetsEdges = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)customSolidBackgroundView
{
  return self->_customSolidBackgroundView;
}

- (void)setCustomSolidBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_customSolidBackgroundView, a3);
}

- (UIImageView)customIconImageView
{
  return self->_customIconImageView;
}

- (void)setCustomIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_customIconImageView, a3);
}

- (UILabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customTitleLabel, a3);
}

- (UILabel)customCaptionLabel
{
  return self->_customCaptionLabel;
}

- (void)setCustomCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customCaptionLabel, a3);
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setAxLabel:(id)a3
{
  objc_storeStrong((id *)&self->_axLabel, a3);
}

id __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  id *v17;
  id v18;
  uint64_t v19;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(*(id *)(a1 + 32), "style");
  if (_PXFontForComponent_onceToken != -1)
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
  v6 = v5 - 2;
  v7 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", CFSTR("_PXOverlayButtonComponentCaption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (unint64_t)(v5 - 2) < 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithObjects:", v11);

  objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v6 < 4)
    {
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) == 0&& !objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      if (v13)
      {
        objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v13, v12);
        goto LABEL_19;
      }
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXCuratedLibraryOverlayButton.m"), 186, CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredContentSizeCategory");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

    v17 = (id *)MEMORY[0x1E0DC48F0];
    if (!IsAccessibilityCategory)
      v17 = (id *)MEMORY[0x1E0DC4900];
    v18 = *v17;
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
    {
      v19 = 2;
    }
    else
    {
      if (!objc_msgSend(CFSTR("_PXOverlayButtonComponentCaption"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")))
      {
        v13 = 0;
        goto LABEL_16;
      }
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DC1138]);
  return v4;
}

id __44__PXCuratedLibraryOverlayButton__setupViews__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(v2, "setLineBreakMode:", 2);
  objc_msgSend(v2, "setTextAlignment:", 1);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v2);

  return v2;
}

uint64_t __47__PXCuratedLibraryOverlayButton_layoutSubviews__block_invoke(uint64_t result, double a2, double a3, __n128 a4, __n128 a5)
{
  double v5;
  double v6;

  v5 = a2 + (*(double *)(result + 48) - *(double *)(result + 64)) * 0.5;
  v6 = a3 + (*(double *)(result + 56) - *(double *)(result + 72)) * 0.5;
  if (*(_BYTE *)(result + 80))
    return MEMORY[0x1A85CD2B8](v5, v6, a4, a5, *(double *)(result + 32), *(double *)(result + 40));
  return result;
}

+ (id)roundedCornerMaskImage:(id)a3 size:(CGSize)a4
{
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  BOOL v27;
  BOOL v28;
  double v30;
  double v31;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  PXCornerMaskCacheEntry *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  PXCornerMaskCacheEntry *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = *(float *)&a4.height;
  v13 = *(float *)&a4.width;
  v50 = *MEMORY[0x1E0C80C00];
  if ((PXSizeIsEmpty() & 1) != 0)
  {
    v14 = 0;
    return v14;
  }
  if (roundedCornerMaskImage_size__onceToken != -1)
    dispatch_once(&roundedCornerMaskImage_size__onceToken, &__block_literal_global_395);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = (id)roundedCornerMaskImage_size__cornerMaskCache;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v16)
  {
LABEL_27:

LABEL_34:
    *(float *)&v33 = v13;
    *(float *)&v34 = v12;
    *(float *)&v35 = v11;
    *(float *)&v36 = v10;
    objc_msgSend(MEMORY[0x1E0DC3870], "px_roundedCornerMaskImage:size:", v33, v34, v35, v36, v9, v8, (_QWORD)v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = [PXCornerMaskCacheEntry alloc];
    *(float *)&v39 = v13;
    *(float *)&v40 = v12;
    *(float *)&v41 = v11;
    *(float *)&v42 = v10;
    v43 = -[PXCornerMaskCacheEntry initWithCornerRadius:size:image:](v38, "initWithCornerRadius:size:image:", v14, v39, v40, v41, v42, v9, v8);
    objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "insertObject:atIndex:", v43, 0);
    if ((unint64_t)objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "count") >= 5)
      objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "removeLastObject");
LABEL_36:

    return v14;
  }
  v17 = v16;
  v18 = 0;
  v19 = *(_QWORD *)v46;
LABEL_7:
  v20 = 0;
  v21 = v18 + v17;
  while (1)
  {
    if (*(_QWORD *)v46 != v19)
      objc_enumerationMutation(v15);
    v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v20);
    objc_msgSend(v22, "cornerRadius", (_QWORD)v45);
    v27 = v13 == v26 && v12 == v23;
    v28 = v27 && v11 == v24;
    if (v28 && v10 == v25)
    {
      objc_msgSend(v22, "size");
      if (v9 == v31 && v8 == v30)
        break;
    }
    if (v17 == ++v20)
    {
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      v18 = v21;
      if (v17)
        goto LABEL_7;
      goto LABEL_27;
    }
  }
  objc_msgSend(v22, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v37 = v18 + v20 < 1;
  else
    v37 = 1;
  if (!v37)
  {
    objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "objectAtIndexedSubscript:", v18 + v20);
    v43 = (PXCornerMaskCacheEntry *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "removeObjectAtIndex:", v18 + v20);
    objc_msgSend((id)roundedCornerMaskImage_size__cornerMaskCache, "insertObject:atIndex:", v43, 0);
    goto LABEL_36;
  }
  if (!v14)
    goto LABEL_34;
  return v14;
}

+ (id)iconImageSymbolConfigurationFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  char v21;
  id *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_PXIconImageSymbolConfiguration_onceToken != -1)
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_609);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  objc_msgSend(v3, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "style"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    v35 = v7;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = 2;
  }
  objc_msgSend(v13, "arrayWithObjects:count:", &v33, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v8, "initWithObjects:", v15);

  objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    switch(objc_msgSend(v3, "style"))
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
      case 15:
        v18 = (id *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v18 = (id *)MEMORY[0x1E0DC4918];
        v19 = *v18;
        objc_msgSend(v3, "spec");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "options");

        v22 = (id *)MEMORY[0x1E0DC4A88];
        if ((v21 & 4) == 0)
          v22 = (id *)MEMORY[0x1E0DC4B08];
        v23 = *v22;
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v23, v19, 32770);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v21 & 4) != 0
          || (objc_msgSend(v7, "isEqualToString:", CFSTR("person.fill")) & 1) != 0
          || objc_msgSend(v7, "isEqualToString:", CFSTR("person.2.fill")))
        {
          v25 = 1;
        }
        else
        {
          v25 = 2;
        }
        v26 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v24, "pointSize");
        objc_msgSend(v26, "configurationWithPointSize:weight:scale:", 6, v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v19, "pointSize");
        v28 = v27;
        v29 = 4;
        goto LABEL_25;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F8], 4096);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v19, "pointSize");
        goto LABEL_24;
      case 12:
        v31 = (_QWORD *)MEMORY[0x1E0DC48F0];
        if (!IsAccessibilityCategory)
          v31 = (_QWORD *)MEMORY[0x1E0DC4918];
        objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4B08], *v31, 32770);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v19, "pointSize");
LABEL_24:
        v28 = v30;
        v29 = 6;
LABEL_25:
        objc_msgSend(v28, "configurationWithPointSize:weight:scale:", v29, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

        break;
      default:
        v17 = 0;
        break;
    }
    objc_msgSend((id)_PXIconImageSymbolConfiguration_configsCache, "setObject:forKey:", v17, v16);
  }

  return v17;
}

+ (UIFont)defaultTitleFont
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  id *v12;
  id v13;
  uint64_t v14;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (_PXFontForComponent_onceToken != -1)
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_624);
  v2 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", CFSTR("_PXOverlayButtonComponentTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjects:", v6);

  objc_msgSend((id)_PXFontForComponent_fontCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    v12 = (id *)MEMORY[0x1E0DC48F0];
    if (!IsAccessibilityCategory)
      v12 = (id *)MEMORY[0x1E0DC4900];
    v13 = *v12;
    if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentTitle")) & 1) != 0)
    {
      v14 = 2;
    }
    else
    {
      if ((objc_msgSend(CFSTR("_PXOverlayButtonComponentTitle"), "isEqualToString:", CFSTR("_PXOverlayButtonComponentCaption")) & 1) == 0)
      {

        goto LABEL_14;
      }
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend((id)_PXFontForComponent_fontCache, "setObject:forKey:", v8, v7);
      goto LABEL_12;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCuratedLibraryOverlayButton.m"), 186, CFSTR("Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"));

    abort();
  }
LABEL_12:

  return (UIFont *)v8;
}

uint64_t __55__PXCuratedLibraryOverlayButton_sizeWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "sizeWithAttributes:", 0);
  v6 = v5;
  objc_msgSend(v4, "sizeWithAttributes:", 0);
  v8 = v7;

  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

void __61__PXCuratedLibraryOverlayButton_roundedCornerMaskImage_size___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)roundedCornerMaskImage_size__cornerMaskCache;
  roundedCornerMaskImage_size__cornerMaskCache = (uint64_t)v0;

}

@end
