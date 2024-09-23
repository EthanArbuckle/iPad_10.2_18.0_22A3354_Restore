@implementation STUIStatusBarBackgroundActivityItem

+ (STUIStatusBarIdentifier)backgroundDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("backgroundDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)secondaryIconDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("secondaryIconDisplayIdentifier"));
}

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0C98];
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarBackgroundActivityItem;
  -[STUIStatusBarItem createDisplayItemForIdentifier:](&v7, sel_createDisplayItemForIdentifier_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(v3, "setBackground:", 1);
  return v3;
}

- (id)_backgroundActivityViewForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)_identifierContainsItemImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "defaultDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

+ (BOOL)_identifierContainsSecondaryItemImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "secondaryIconDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "secondaryIconDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)STUIStatusBarBackgroundActivityItem;
    v10 = -[STUIStatusBarItem canEnableDisplayItem:fromData:](&v12, sel_canEnableDisplayItem_fromData_, v6, v7);
  }

  return v10;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[4];
  id v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)STUIStatusBarBackgroundActivityItem;
  -[STUIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v52, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivityEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "backgroundActivityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    _STUIStatusBar_BackgroundActivity_Log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v11;
      _os_log_impl(&dword_1CFE2E000, v12, OS_LOG_TYPE_DEFAULT, "Updating background activity item to type: %@", buf, 0xCu);
    }

    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBackgroundActivityItem _backgroundActivityViewForIdentifier:](self, "_backgroundActivityViewForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v46 = v10;
      -[STUIStatusBarBackgroundActivityItem _backgroundColorForActivityWithIdentifier:](self, "_backgroundColorForActivityWithIdentifier:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[STUIStatusBarBackgroundActivityItem crossfadeForUpdate:](self, "crossfadeForUpdate:", v6))
      {
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __65__STUIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke;
        v49[3] = &unk_1E8D633E0;
        v50 = v14;
        v51 = v15;
        +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v49);
        v16 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = (uint64_t)v8;
        objc_msgSend(v14, "setPillColor:", v15);
      }
      objc_msgSend(v6, "styleAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarBackgroundActivityItem _visualEffectForActivityWithIdentifier:traitCollection:](self, "_visualEffectForActivityWithIdentifier:traitCollection:", v11, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVisualEffect:", v19);

      objc_msgSend(v6, "styleAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPulsing:", -[STUIStatusBarBackgroundActivityItem _shouldPulseBackgroundForActivityWithIdentifier:traitCollection:](self, "_shouldPulseBackgroundForActivityWithIdentifier:traitCollection:", v11, v21));

      v8 = (void *)v16;
      v10 = v46;
    }
    -[STUIStatusBarBackgroundActivityItem iconView](self, "iconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSymbolPulsing:forUpdate:", -[STUIStatusBarBackgroundActivityItem _shouldPulseSymbolForActivityWithIdentifier:traitCollection:](self, "_shouldPulseSymbolForActivityWithIdentifier:traitCollection:", v11, v24), v6);

    -[STUIStatusBarBackgroundActivityItem iconView](self, "iconView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRinging:forUpdate:", -[STUIStatusBarBackgroundActivityItem _shouldRingForActivityWithIdentifier:traitCollection:](self, "_shouldRingForActivityWithIdentifier:traitCollection:", v11, v27), v6);

  }
  v28 = (void *)objc_opt_class();
  objc_msgSend(v7, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "_identifierContainsItemImage:", v29)
    || !objc_msgSend(v7, "isEnabled"))
  {
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "styleAttributesChanged") & 1) != 0)
  {

LABEL_15:
    objc_msgSend(v6, "styleAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v31, "copy");

    objc_msgSend((id)objc_opt_class(), "_fontSizeAdjustmentForActivityWithIdentifier:", v11);
    if (v32 != 0.0)
    {
      v33 = v32;
      v34 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v29, "font");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fontDescriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "font");
      v47 = v10;
      v37 = v8;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pointSize");
      objc_msgSend(v34, "fontWithDescriptor:size:", v36, v33 + v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFont:", v40);

      v8 = v37;
      v10 = v47;

    }
    objc_msgSend((id)objc_opt_class(), "_verticalOffsetForActivityWithIdentifier:", v11);
    objc_msgSend(v7, "setCenterOffset:");
    v48.receiver = self;
    v48.super_class = (Class)STUIStatusBarBackgroundActivityItem;
    -[STUIStatusBarItem applyStyleAttributes:toDisplayItem:](&v48, sel_applyStyleAttributes_toDisplayItem_, v29, v7);
LABEL_18:

    goto LABEL_19;
  }
  v30 = objc_msgSend(v6, "dataChanged");

  if ((v30 & 1) != 0)
    goto LABEL_15;
LABEL_19:
  v41 = (void *)objc_opt_class();
  objc_msgSend(v7, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v41, "_identifierContainsSecondaryItemImage:", v42)
    || !objc_msgSend(v7, "isEnabled"))
  {
    goto LABEL_23;
  }
  v43 = objc_msgSend(v6, "dataChanged");

  if (v43)
  {
    -[STUIStatusBarBackgroundActivityItem secondaryImageForUpdate:](self, "secondaryImageForUpdate:", v6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setImage:", v42);

LABEL_23:
  }

  return v8;
}

void __65__STUIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__STUIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke_2;
  v7[3] = &unk_1E8D62C88;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v7, a4, 0.333, 0.0);

}

uint64_t __65__STUIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPillColor:", *(_QWORD *)(a1 + 40));
}

- (void)updatedDisplayItemsWithData:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *previousBackgroundActivityIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarBackgroundActivityItem;
  v4 = a3;
  -[STUIStatusBarItem updatedDisplayItemsWithData:](&v8, sel_updatedDisplayItemsWithData_, v4);
  objc_msgSend(v4, "backgroundActivityEntry", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "backgroundActivityIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    previousBackgroundActivityIdentifier = self->_previousBackgroundActivityIdentifier;
    self->_previousBackgroundActivityIdentifier = v6;

  }
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "_identifierContainsItemImage:", v9);

  if ((v8 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)STUIStatusBarBackgroundActivityItem;
    -[STUIStatusBarItem applyStyleAttributes:toDisplayItem:](&v10, sel_applyStyleAttributes_toDisplayItem_, v6, v7);
  }

}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBackgroundActivityItem _systemImageNameForActivityWithIdentifier:](self, "_systemImageNameForActivityWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageNameForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBackgroundActivityItem _imageNameForActivityWithIdentifier:](self, "_imageNameForActivityWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_systemImageNameForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_imageNameForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_textLabelForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundActivityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarBackgroundActivityItem _textLabelForActivityWithIdentifier:](self, "_textLabelForActivityWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    v23[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(v4, "styleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "smallFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v23[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v13);

    v15 = objc_alloc(MEMORY[0x1E0DC3828]);
    objc_msgSend(v14, "size");
    v16 = (void *)objc_msgSend(v15, "initWithSize:");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__STUIStatusBarBackgroundActivityItem_imageForUpdate___block_invoke;
    v21[3] = &unk_1E8D63858;
    v22 = v14;
    v17 = v14;
    objc_msgSend(v16, "imageWithActions:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STUIStatusBarBackgroundActivityItem;
    -[STUIStatusBarIndicatorItem imageForUpdate:](&v20, sel_imageForUpdate_, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

uint64_t __54__STUIStatusBarBackgroundActivityItem_imageForUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)_secondarySystemImageNameForActivityWithIdentifier:(id)a3
{
  return 0;
}

- (id)secondaryImageForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBackgroundActivityItem _secondarySystemImageNameForActivityWithIdentifier:](self, "_secondarySystemImageNameForActivityWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (double)_verticalOffsetForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "verticalOffset");
  v8 = v7;

  return v8;
}

+ (double)_fontSizeAdjustmentForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fontSizeAdjustment");
  v8 = v7;

  return v8;
}

- (id)_backgroundColorForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_shouldRingForActivityWithIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(a4, "userInterfaceIdiom") == 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualDescriptorForBackgroundActivityWithIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)*MEMORY[0x1E0DB0AC0];
    objc_msgSend(v8, "preferredContinuousAnimationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  return v6;
}

- (BOOL)_shouldPulseBackgroundForActivityWithIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(a4, "userInterfaceIdiom") == 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualDescriptorForBackgroundActivityWithIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)*MEMORY[0x1E0DB0AB0];
    objc_msgSend(v8, "preferredContinuousAnimationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  return v6;
}

- (BOOL)_shouldPulseSymbolForActivityWithIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(a4, "userInterfaceIdiom") == 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualDescriptorForBackgroundActivityWithIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)*MEMORY[0x1E0DB0AB8];
    objc_msgSend(v8, "preferredContinuousAnimationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  return v6;
}

- (id)_visualEffectForActivityWithIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(a4, "userInterfaceIdiom") == 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualDescriptorForBackgroundActivityWithIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "preferredVisualEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (STUIStatusBarPillView)backgroundView
{
  STUIStatusBarPillView *backgroundView;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    -[STUIStatusBarBackgroundActivityItem _create_backgroundView](self, "_create_backgroundView");
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (void)_create_backgroundView
{
  STUIStatusBarPillView *v3;
  STUIStatusBarPillView *v4;
  STUIStatusBarPillView *backgroundView;

  v3 = [STUIStatusBarPillView alloc];
  v4 = -[STUIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

}

- (STUIStatusBarActivityIconView)iconView
{
  STUIStatusBarActivityIconView *iconView;

  iconView = self->_iconView;
  if (!iconView)
  {
    -[STUIStatusBarBackgroundActivityItem _create_iconView](self, "_create_iconView");
    iconView = self->_iconView;
  }
  return iconView;
}

- (void)_create_iconView
{
  STUIStatusBarActivityIconView *v3;
  STUIStatusBarActivityIconView *v4;
  STUIStatusBarActivityIconView *iconView;

  v3 = [STUIStatusBarActivityIconView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

}

- (STUIStatusBarImageView)secondaryIconView
{
  STUIStatusBarImageView *secondaryIconView;

  secondaryIconView = self->_secondaryIconView;
  if (!secondaryIconView)
  {
    -[STUIStatusBarBackgroundActivityItem _create_secondaryIconView](self, "_create_secondaryIconView");
    secondaryIconView = self->_secondaryIconView;
  }
  return secondaryIconView;
}

- (void)_create_secondaryIconView
{
  STUIStatusBarImageView *v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *secondaryIconView;

  v3 = [STUIStatusBarImageView alloc];
  v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  secondaryIconView = self->_secondaryIconView;
  self->_secondaryIconView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "secondaryIconDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)STUIStatusBarBackgroundActivityItem;
      -[STUIStatusBarIndicatorItem viewForIdentifier:](&v10, sel_viewForIdentifier_, v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _STUIStatusBar_BackgroundActivity_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1CFE2E000, v5, OS_LOG_TYPE_DEFAULT, "Adding default background activity item view with identifier: %@", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarBackgroundActivityItem;
  -[STUIStatusBarItem additionAnimationForDisplayItemWithIdentifier:](&v8, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _STUIStatusBar_BackgroundActivity_Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1CFE2E000, v5, OS_LOG_TYPE_DEFAULT, "Removing default background activity item view with identifier: %@", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarBackgroundActivityItem;
  -[STUIStatusBarItem removalAnimationForDisplayItemWithIdentifier:](&v8, sel_removalAnimationForDisplayItemWithIdentifier_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundActivityEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_previousBackgroundActivityIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualDescriptorForBackgroundActivityWithIdentifier:", self->_previousBackgroundActivityIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "canCrossfadeToBackgroundActivityWithIdentifier:", v6);
  }

  return v10;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void)setSecondaryIconView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIconView, a3);
}

- (NSString)previousBackgroundActivityIdentifier
{
  return self->_previousBackgroundActivityIdentifier;
}

- (void)setPreviousBackgroundActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousBackgroundActivityIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
