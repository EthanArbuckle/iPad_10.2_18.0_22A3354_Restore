@implementation SFShareSheetRendering

+ (CGImage)createCGImageForRenderingCommand:(id)a3
{
  id v3;
  CGColorSpace *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  double v7;
  double v8;
  double v9;
  CGContext *v10;
  void (**v11)(_QWORD);
  double v12;
  void (**v13)(void);
  CGImage *Image;
  _QWORD v16[5];
  _QWORD aBlock[5];

  v3 = a3;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v4;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v3, "contextSize");
  v8 = v7;
  objc_msgSend(v3, "contextSize");
  v10 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v9, 8uLL, 0, v4, 1u);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke_2;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v10;
  v11 = (void (**)(_QWORD))_Block_copy(v16);
  CGContextScaleCTM(v10, 1.0, -1.0);
  objc_msgSend(v3, "contextSize");
  CGContextTranslateCTM(v10, 0.0, -v12);
  UIGraphicsPushContext(v10);
  objc_msgSend(v3, "commandBlock");
  v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v13[2]();

  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v10);
  v11[2](v11);

  v6[2](v6);
  return Image;
}

void __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke(uint64_t a1)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 32));
}

void __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke_2(uint64_t a1)
{
  CGContextRelease(*(CGContextRef *)(a1 + 32));
}

+ (id)badgeNumberFormatterFromConfig:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v3, "hostLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setNumberStyle:", 1);
  }
  else
  {
    sharingXPCHelperLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering badgeNumberFormatterFromConfig:].cold.1();

    v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  }

  return v4;
}

+ (id)cappedOrthoLabelFontFromConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  +[SFUIShareSheetActivityCellSpec titleLabelFontTextStyleForIdiom:](SFUIShareSheetActivityCellSpec, "titleLabelFontTextStyleForIdiom:", +[SFShareSheetRendering _hostIdiomFromConfig:](SFShareSheetRendering, "_hostIdiomFromConfig:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sharingXPCHelperLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:].cold.1();

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (int64_t)hostNaturalTextAlignmentFromConfig:(id)a3
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v7;

  if (a3)
  {
    objc_msgSend(a3, "hostTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "layoutDirection");

    v5 = 4;
    if (v4 == 1)
      v5 = 2;
    if (v4)
      return v5;
    else
      return 0;
  }
  else
  {
    sharingXPCHelperLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:].cold.1();

    return 4;
  }
}

+ (BOOL)isAXFromConfig:(id)a3
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  NSObject *v7;

  if (a3)
  {
    objc_msgSend(a3, "hostTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    return IsAccessibilityCategory;
  }
  else
  {
    sharingXPCHelperLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering isAXFromConfig:].cold.1();

    return 0;
  }
}

+ (double)morePlatterMaxWidthFromConfig:(id)a3 activityCategory:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a3;
  if (+[SFShareSheetRendering _hostIdiomFromConfig:](SFShareSheetRendering, "_hostIdiomFromConfig:", v5) == 6)
  {
    objc_msgSend(v5, "hostLayoutMargins");
    v7 = v6;
    objc_msgSend(v5, "hostLayoutMargins");
    v9 = v7 + v8 + v7 + v8;
    if (a4 == 1)
      v10 = 45.0;
    else
      v10 = 0.0;
    objc_msgSend(v5, "preferredWidth");
    v12 = v11 - v9 + -26.0 - v10 + -42.0;
    v13 = -30.0;
  }
  else
  {
    +[SFShareSheetRendering platterMaxWidthFromConfig:](SFShareSheetRendering, "platterMaxWidthFromConfig:", v5);
    v13 = -100.0;
  }
  v14 = v12 + v13;

  return v14;
}

+ (double)_normalCellWidthForIdiom:(int64_t)a3
{
  double result;

  result = 78.0;
  if (a3 == 6)
    return 80.0;
  return result;
}

+ (int64_t)_hostIdiomFromConfig:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "hostIdiom");
  else
    v4 = -1;

  return v4;
}

+ (CGSize)nameLabelSizeFromConfig:(id)a3
{
  id v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  CGSize result;

  v3 = a3;
  +[SFShareSheetRendering _normalCellWidthForIdiom:](SFShareSheetRendering, "_normalCellWidthForIdiom:", +[SFShareSheetRendering _hostIdiomFromConfig:](SFShareSheetRendering, "_hostIdiomFromConfig:", v3));
  v5 = v4;
  v6 = v3;
  if (v6)
  {
    if (+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v6))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "userInterfaceIdiom");

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        objc_msgSend(v6, "preferredWidth");
        v10 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_referenceBounds");
        v10 = v13;

      }
      if (v10 >= 414.0)
      {
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        v14 = 62.0;
        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 0)
          v14 = 66.0;
      }
      else
      {
        v14 = 62.0;
      }
      v5 = v10 * 0.666666667 + -20.0 - v14 + -13.0;
    }
  }
  else
  {
    sharingXPCHelperLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering nameLabelSizeFromConfig:].cold.1();

  }
  v17 = 1.79769313e308;
  v18 = v5;
  result.height = v17;
  result.width = v18;
  return result;
}

+ (double)platterMaxWidthFromConfig:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hostLayoutMargins");
    v6 = v5;
    objc_msgSend(v4, "hostLayoutMargins");
    v8 = v7;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      objc_msgSend(v4, "preferredWidth");
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_referenceBounds");
      v12 = v16;

    }
    v17 = v6 + v8;
    v18 = (void *)MEMORY[0x24BEBB520];
    v19 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 0x8000, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fontWithDescriptor:size:", v20, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "hostTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredContentSizeCategory");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE8F640], "imageWidthForContentSizeCategory:", v23);
    v25 = v24;
    if (UIContentSizeCategoryIsAccessibilityCategory(v23))
    {
      v26 = (void *)MEMORY[0x24BEBB528];
      objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE078]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v19, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "fontDescriptorWithSymbolicTraits:", 0x8000);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v29, 0.0);
      v30 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v30;
    }
    objc_msgSend(v21, "lineHeight");
    v14 = v12 + v17 * -2.0 - v31 - v25;

  }
  else
  {
    sharingXPCHelperLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:].cold.1();

    v14 = 4.0;
  }

  return v14;
}

+ (id)drawingCommandsForActionPlatterWithTitle:(id)a3 tintColor:(id)a4 hostConfig:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  objc_class *v23;
  __CFString *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (__CFString *)a3;
  +[SFShareSheetRendering platterMaxWidthFromConfig:](SFShareSheetRendering, "platterMaxWidthFromConfig:", v8);
  v11 = v10;
  v12 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 0x8000, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontWithDescriptor:size:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v17, "setLineBreakStrategy:", 0xFFFFLL);
  v18 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:](SFShareSheetRendering, "hostNaturalTextAlignmentFromConfig:", v8);

  objc_msgSend(v17, "setAlignment:", v18);
  v19 = *MEMORY[0x24BEBB360];
  v43[0] = *MEMORY[0x24BEBB368];
  v43[1] = v19;
  v44[0] = v16;
  v44[1] = v14;
  v43[2] = *MEMORY[0x24BEBB3A8];
  v20 = (void *)objc_msgSend(v17, "copy");
  v44[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = &stru_24CE12D78;
  if (v9)
    v22 = v9;
  v23 = (objc_class *)MEMORY[0x24BDD1458];
  v24 = v22;
  v25 = (void *)objc_msgSend([v23 alloc], "initWithString:attributes:", v24, v21);

  v26 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  objc_msgSend(v26, "setWantsBaselineOffset:", 1);
  objc_msgSend(v25, "boundingRectWithSize:options:context:", 35, v26, v11, 1.79769313e308);
  v28 = fmax(v27, 250.0);
  v30 = fmax(v29, 22.0);
  v31 = (void *)objc_opt_new();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __87__SFShareSheetRendering_drawingCommandsForActionPlatterWithTitle_tintColor_hostConfig___block_invoke;
  v35[3] = &unk_24CE0F328;
  v38 = 0;
  v39 = 0;
  v40 = v28;
  v41 = v30;
  v42 = 35;
  v36 = v25;
  v37 = v26;
  v32 = v26;
  v33 = v25;
  objc_msgSend(v31, "setCommandBlock:", v35);
  objc_msgSend(v31, "setContextSize:", v28, v30);

  return v31;
}

uint64_t __87__SFShareSheetRendering_drawingCommandsForActionPlatterWithTitle_tintColor_hostConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)drawingCommandsForMoreListEntryTitle:(id)a3 labelColor:(id)a4 hostConfig:(id)a5 activityCategory:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  int64_t v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  int64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double width;
  double v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[4];
  CGRect v43;
  CGRect v44;

  v42[3] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = +[SFShareSheetRendering _hostIdiomFromConfig:](SFShareSheetRendering, "_hostIdiomFromConfig:", v10);
  +[SFShareSheetRendering morePlatterMaxWidthFromConfig:activityCategory:](SFShareSheetRendering, "morePlatterMaxWidthFromConfig:activityCategory:", v10, a6);
  v14 = v13;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v16, "setLineBreakStrategy:", 0xFFFFLL);
  v17 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:](SFShareSheetRendering, "hostNaturalTextAlignmentFromConfig:", v10);

  objc_msgSend(v16, "setAlignment:", v17);
  if (v12 == 6)
  {
    objc_msgSend(v16, "setLineBreakMode:", 4);
    v18 = 70.0;
  }
  else
  {
    v18 = 100.0;
  }
  v19 = *MEMORY[0x24BEBB360];
  v41[0] = *MEMORY[0x24BEBB368];
  v41[1] = v19;
  v42[0] = v9;
  v42[1] = v15;
  v41[2] = *MEMORY[0x24BEBB3A8];
  v20 = (void *)objc_msgSend(v16, "copy");
  v42[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v21);
  v23 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  objc_msgSend(v23, "setWantsBaselineOffset:", 1);
  objc_msgSend(v22, "boundingRectWithSize:options:context:", 35, v23, v14, 1.79769313e308);
  v44 = CGRectIntegral(v43);
  if (v18 >= v44.size.width)
    width = v18;
  else
    width = v44.size.width;
  v25 = fmax(v44.size.height, 22.0);
  v26 = (void *)objc_opt_new();
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __101__SFShareSheetRendering_drawingCommandsForMoreListEntryTitle_labelColor_hostConfig_activityCategory___block_invoke;
  v33 = &unk_24CE0F328;
  v36 = 0;
  v37 = 0;
  v38 = width;
  v39 = v25;
  v40 = 35;
  v34 = v22;
  v35 = v23;
  v27 = v23;
  v28 = v22;
  objc_msgSend(v26, "setCommandBlock:", &v30);
  objc_msgSend(v26, "setContextSize:", width, v25, v30, v31, v32, v33);

  return v26;
}

uint64_t __101__SFShareSheetRendering_drawingCommandsForMoreListEntryTitle_labelColor_hostConfig_activityCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)drawingCommandsForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 hostConfig:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  int64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double height;
  double v38;
  int v39;
  uint64_t v40;
  void *v41;
  double width;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  uint64_t v76;
  _QWORD v77[7];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  void *v83;
  _BYTE buf[22];
  _QWORD v85[3];
  _QWORD v86[6];
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v9 = a7;
  v10 = a6;
  v86[3] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v64 = a4;
  v14 = a8;
  +[SFShareSheetRendering nameLabelSizeFromConfig:](SFShareSheetRendering, "nameLabelSizeFromConfig:", v14);
  v16 = v15;
  v18 = v17;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v19 = objc_msgSend(v13, "length");
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke;
  v77[3] = &unk_24CE0FB00;
  v77[5] = 0;
  v77[6] = v19;
  v77[4] = &v78;
  objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v19, 3, v77);
  v20 = (a5 == 1) & ~v10 & v9;
  if (*((_BYTE *)v79 + 24))
    v21 = 1;
  else
    v21 = (a5 == 1) & ~v10 & v9;
  +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:](SFShareSheetRendering, "cappedOrthoLabelFontFromConfig:", v14);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BEBB490]);
  v23 = v22;
  if (v21)
    v24 = 4;
  else
    v24 = 0;
  objc_msgSend(v22, "setLineBreakMode:", v24);
  LODWORD(v25) = 0;
  objc_msgSend(v23, "setHyphenationFactor:", v25);
  objc_msgSend(v23, "setLineBreakStrategy:", 0xFFFFLL);
  if (+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v14))
    v26 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:](SFShareSheetRendering, "hostNaturalTextAlignmentFromConfig:", v14);
  else
    v26 = 1;
  objc_msgSend(v23, "setAlignment:", v26);
  v27 = *MEMORY[0x24BEBB360];
  v85[0] = *MEMORY[0x24BEBB368];
  v85[1] = v27;
  v63 = v27;
  v86[0] = v64;
  v86[1] = v67;
  v85[2] = *MEMORY[0x24BEBB3A8];
  v86[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  sharingXPCHelperLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_212728000, v28, OS_LOG_TYPE_DEFAULT, "maxLines %lu ignoreNameWrapping %lu", buf, 0x16u);
  }

  v29 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  if ((v21 & 1) != 0)
  {
    v30 = 1;
  }
  else if (+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v14))
  {
    v30 = 3;
  }
  else
  {
    v30 = 2;
  }
  objc_msgSend(v29, "setMaximumNumberOfLines:", v30);
  v31 = 35;
  if (v10)
    v31 = 3;
  v66 = v31;
  if ((v20 & 1) != 0)
    objc_msgSend(v29, "setMinimumScaleFactor:", 0.8);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v32);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v65, "count") == 2
    && !+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v14)
    && !v9)
  {
    objc_msgSend(v65, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      if (objc_msgSend(v34, "length"))
      {
        v35 = objc_msgSend(v33, "length");
        if ((unint64_t)(objc_msgSend(v34, "length") + v35) >= 8)
        {
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v33, v68);
          objc_msgSend(v36, "boundingRectWithSize:options:context:", v66, v29, v16, v18);
          v88 = CGRectIntegral(v87);
          height = v88.size.height;
          objc_msgSend(v67, "lineHeight", v88.origin.x, v88.origin.y, v88.size.width);
          *(float *)&v38 = v38;
          v39 = llroundf(*(float *)&v38);
          *(float *)&v38 = height;
          if ((int)llroundf(*(float *)&v38) / v39 == 1)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v33, v34);
            v40 = objc_claimAutoreleasedReturnValue();

            v13 = (id)v40;
          }

        }
      }
    }

    goto LABEL_32;
  }
  if (!+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v14))
  {
    SFNonBreakingStringFromDeviceName();
    v33 = v13;
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v13, v68);
  objc_msgSend(v41, "boundingRectWithSize:options:context:", v66, v29, v16, v18);
  v90 = CGRectIntegral(v89);
  width = v90.size.width;
  v43 = v90.size.height;
  if (v20)
  {
    objc_msgSend(v29, "actualScaleFactor", v90.origin.x, v90.origin.y);
    if (v44 < 1.0)
    {
      v82 = v63;
      v45 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v67, "fontDescriptor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "pointSize");
      v48 = v47;
      objc_msgSend(v29, "actualScaleFactor");
      objc_msgSend(v45, "fontWithDescriptor:size:", v46, v48 * v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v50;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addAttributes:range:", v51, 0, objc_msgSend(v41, "length"));

      objc_msgSend(v41, "boundingRectWithSize:options:context:", v66, v29, v16, v18);
      v92 = CGRectIntegral(v91);
      width = v92.size.width;
      v43 = v92.size.height;
    }
  }
  if (v10)
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB508]), "initWithString:attributes:", v13, v68);
    v53 = objc_alloc_init(MEMORY[0x24BEBB488]);
    objc_msgSend(v53, "setUsesFontLeading:", 1);
    v54 = objc_alloc_init(MEMORY[0x24BEBB4C0]);
    objc_msgSend(v54, "setMaximumNumberOfLines:", 2);
    objc_msgSend(v54, "setSize:", v16, v43);
    objc_msgSend(v53, "addTextContainer:", v54);
    objc_msgSend(v52, "addLayoutManager:", v53);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v53, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", 0, buf);
    v55 = objc_msgSend(v13, "length");
    if (v55 >= *(_QWORD *)&buf[8])
      v56 = *(_QWORD *)&buf[8];
    else
      v56 = v55;
    objc_msgSend(v13, "substringWithRange:", 0, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setLineBreakMode:", 4);
    objc_msgSend(v29, "setMaximumNumberOfLines:", 1);
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v57, v68);

    objc_msgSend(v58, "boundingRectWithSize:options:context:", 3, v29, v16, v18);
    v94 = CGRectIntegral(v93);
    width = v94.size.width;
    v43 = v94.size.height;

  }
  else
  {
    v58 = v41;
    v57 = v13;
  }
  v59 = (void *)objc_opt_new();
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke_127;
  v69[3] = &unk_24CE0F328;
  v60 = v58;
  v72 = 0;
  v73 = 0;
  v70 = v60;
  v74 = width;
  v75 = v43;
  v76 = v66;
  v61 = v29;
  v71 = v61;
  objc_msgSend(v59, "setCommandBlock:", v69);
  objc_msgSend(v59, "setContextSize:", width, v43);

  _Block_object_dispose(&v78, 8);
  return v59;
}

_QWORD *__130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (result[5] == a3 && result[6] == a4)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  *a7 = 1;
  return result;
}

uint64_t __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke_127(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)_nearbyBadgeFontForIdiom:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3 == 6)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BEBB610]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D8], 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v4, 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (double)_nearbyBadgeNumberStringTopInsetForIdiom:(int64_t)a3
{
  double result;

  result = 17.0;
  if (a3 == 6)
    return 13.0;
  return result;
}

+ (id)drawingCommandsForNearbyBadgeWithCount:(int64_t)a3 hostConfig:(id)a4
{
  id v6;
  int64_t v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  double v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = +[SFShareSheetRendering _hostIdiomFromConfig:](SFShareSheetRendering, "_hostIdiomFromConfig:", v6);
  +[SFUIShareSheetActivityCellSpec nearbyAirDropBadgeSizeForIdiom:](SFUIShareSheetActivityCellSpec, "nearbyAirDropBadgeSizeForIdiom:", v7);
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v10, "setAlignment:", 1);
  objc_msgSend(v10, "setLineBreakStrategy:", 0xFFFFLL);
  v35[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  v35[1] = *MEMORY[0x24BEBB360];
  objc_msgSend(a1, "_nearbyBadgeFontForIdiom:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v12;
  v35[2] = *MEMORY[0x24BEBB3A8];
  v13 = (void *)objc_msgSend(v10, "copy");
  v36[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BDD1458]);
  +[SFShareSheetRendering badgeNumberFormatterFromConfig:](SFShareSheetRendering, "badgeNumberFormatterFromConfig:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithString:attributes:", v18, v14);

  v20 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  objc_msgSend(v20, "setMaximumNumberOfLines:", 1);
  v21 = (void *)objc_opt_new();
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __75__SFShareSheetRendering_drawingCommandsForNearbyBadgeWithCount_hostConfig___block_invoke;
  v28 = &unk_24CE0FB28;
  v31 = a1;
  v32 = v7;
  v33 = v9;
  v34 = 35;
  v29 = v19;
  v30 = v20;
  v22 = v20;
  v23 = v19;
  objc_msgSend(v21, "setCommandBlock:", &v25);
  objc_msgSend(v21, "setContextSize:", v9, v9, v25, v26, v27, v28);

  return v21;
}

uint64_t __75__SFShareSheetRendering_drawingCommandsForNearbyBadgeWithCount_hostConfig___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "_nearbyBadgeNumberStringTopInsetForIdiom:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(v2, "drawWithRect:options:context:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), 0.0, v3, *(double *)(a1 + 64), *(double *)(a1 + 64));
}

+ (id)drawingCommandsForUIActivityTitle:(id)a3 foregroundColor:(id)a4 hostConfig:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  double width;
  double height;
  void *v28;
  id v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[3];
  _QWORD v49[5];
  CGRect v50;
  CGRect v51;

  v49[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SFShareSheetRendering nameLabelSizeFromConfig:](SFShareSheetRendering, "nameLabelSizeFromConfig:", v9);
  v11 = v10;
  v13 = v12;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v14 = v7;
  v15 = objc_msgSend(v14, "length");
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke;
  v43[3] = &unk_24CE0FB00;
  v43[5] = 0;
  v43[6] = v15;
  v43[4] = &v44;
  objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 3, v43);
  +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:](SFShareSheetRendering, "cappedOrthoLabelFontFromConfig:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v17, "setLineBreakMode:", 4 * *((unsigned __int8 *)v45 + 24));
  LODWORD(v18) = 0;
  objc_msgSend(v17, "setHyphenationFactor:", v18);
  objc_msgSend(v17, "setLineBreakStrategy:", 0xFFFFLL);
  if (+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v9))
    v19 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:](SFShareSheetRendering, "hostNaturalTextAlignmentFromConfig:", v9);
  else
    v19 = 1;
  objc_msgSend(v17, "setAlignment:", v19);
  v20 = *MEMORY[0x24BEBB360];
  v48[0] = *MEMORY[0x24BEBB368];
  v48[1] = v20;
  v49[0] = v8;
  v49[1] = v16;
  v48[2] = *MEMORY[0x24BEBB3A8];
  v21 = (void *)objc_msgSend(v17, "copy");
  v49[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v14, v22);
  v24 = objc_alloc_init(MEMORY[0x24BEBB4A8]);
  if (*((_BYTE *)v45 + 24))
  {
    v25 = 1;
  }
  else if (+[SFShareSheetRendering isAXFromConfig:](SFShareSheetRendering, "isAXFromConfig:", v9))
  {
    v25 = 3;
  }
  else
  {
    v25 = 2;
  }
  objc_msgSend(v24, "setMaximumNumberOfLines:", v25);
  objc_msgSend(v23, "boundingRectWithSize:options:context:", 35, v24, v11, v13);
  v51 = CGRectIntegral(v50);
  width = v51.size.width;
  height = v51.size.height;
  v28 = (void *)objc_opt_new();
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke_2;
  v35 = &unk_24CE0F328;
  v29 = v23;
  v38 = 0;
  v39 = 0;
  v36 = v29;
  v40 = width;
  v41 = height;
  v42 = 35;
  v30 = v24;
  v37 = v30;
  objc_msgSend(v28, "setCommandBlock:", &v32);
  objc_msgSend(v28, "setContextSize:", width, height, v32, v33, v34, v35);

  _Block_object_dispose(&v44, 8);
  return v28;
}

_QWORD *__86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (result[5] == a3 && result[6] == a4)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  *a7 = 1;
  return result;
}

uint64_t __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)badgeNumberFormatterFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_212728000, v0, v1, "No _uiConfig for badgeNumberFormatter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)cappedOrthoLabelFontFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_212728000, v0, v1, "No _uiConfig for cappedOrthoLabelFont", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)hostNaturalTextAlignmentFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_212728000, v0, v1, "No _uiConfig for hostNaturalTextAlignment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)isAXFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_212728000, v0, v1, "No _uiConfig for actionsAX", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)nameLabelSizeFromConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_212728000, v0, v1, "No _uiConfig for nameLabelSize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
