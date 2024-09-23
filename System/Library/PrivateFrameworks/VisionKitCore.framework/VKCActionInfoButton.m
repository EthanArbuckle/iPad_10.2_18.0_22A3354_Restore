@implementation VKCActionInfoButton

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VKCActionInfoButton representedElement](self, "representedElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> element: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tearDown
{
  -[VKCActionInfoButton setMenu:](self, "setMenu:", 0);
}

+ (id)buttonWithImage:(id)a3 text:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(v7, "setText:", v5);
  objc_msgSend(v7, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(v7, "translucentButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v8);

  objc_msgSend(v7, "setMaximumContentSizeCategory:", *MEMORY[0x1E0CEB3E0]);
  objc_msgSend(v7, "setShowsLargeContentViewer:", 1);
  v9 = objc_alloc_init(MEMORY[0x1E0CEA708]);
  objc_msgSend(v7, "addInteraction:", v9);

  objc_msgSend(v7, "setPointerInteractionEnabled:", 1);
  return v7;
}

- (void)vk_addTarget:(id)a3 action:(SEL)a4
{
  -[VKCActionInfoButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)_vk_performAction
{
  -[VKCActionInfoButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (BOOL)hasAction:(SEL)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VKCActionInfoButton allTargets](self, "allTargets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        -[VKCActionInfoButton actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 64);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if (NSSelectorFromString(*(NSString **)(*((_QWORD *)&v18 + 1) + 8 * j)) == a3)
              {
                v7 = 1;
                goto LABEL_16;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)performDefaultElementAction
{
  void *v3;
  NSObject *v4;
  id DDContextMenuActionClass_1;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[VKCActionInfoButton representedElement](self, "representedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_DEFAULT, "Performing default element action: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v3, "isTextDataDetector"))
  {
    DDContextMenuActionClass_1 = getDDContextMenuActionClass_1();
    objc_msgSend(v3, "scannerResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "coreResult");
    -[VKCActionInfoButton dataDetectorContext](self, "dataDetectorContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = (id)objc_msgSend(DDContextMenuActionClass_1, "buttonActionsForURL:result:contact:icsString:context:view:identifier:suggestedActions:defaultAction:", 0, v7, 0, 0, v8, self, 0, 0, &v16);
    v10 = v16;

    if (v10)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v11 = (void *)getDDUIActionClass_softClass_0;
      v20 = getDDUIActionClass_softClass_0;
      if (!getDDUIActionClass_softClass_0)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v22 = __getDDUIActionClass_block_invoke_0;
        v23 = &unk_1E9462330;
        v24 = &v17;
        __getDDUIActionClass_block_invoke_0((uint64_t)&buf);
        v11 = (void *)v18[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v17, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "dd_performAction");
    }
    -[VKCActionInfoButton delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[VKCActionInfoButton delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "actionInfoButtonDidActivatePrimaryAction:", self);

    }
  }

}

- (id)dataDetectorContext
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id DDContextMenuActionClass_1;
  void *v20;
  _Unwind_Exception *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  -[VKCActionInfoButton representedElement](self, "representedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scannerResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VKCActionInfoButton allUnfilteredElements](self, "allUnfilteredElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vk_compactMap:", &__block_literal_global_38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v8 = (_QWORD *)getkDataDetectorsAllResultsKeySymbolLoc_ptr_1;
  v26 = getkDataDetectorsAllResultsKeySymbolLoc_ptr_1;
  if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr_1)
  {
    v9 = (void *)DataDetectorsUILibrary_4();
    v8 = dlsym(v9, "kDataDetectorsAllResultsKey");
    v24[3] = (uint64_t)v8;
    getkDataDetectorsAllResultsKeySymbolLoc_ptr_1 = (uint64_t)v8;
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
  {
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v5, "vk_setNonNilObject:forKey:", v7, *v8, v23);
  -[VKCActionInfoButton representedElement](self, "representedElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupedElementData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_addEntriesFromNonNilDictionary:", v11);

  -[VKCActionInfoButton representedElement](self, "representedElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scannerResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    objc_msgSend(v4, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v17 = (_QWORD *)getkDataDetectorsMiddleTextSymbolLoc_ptr_0;
    v26 = getkDataDetectorsMiddleTextSymbolLoc_ptr_0;
    if (!getkDataDetectorsMiddleTextSymbolLoc_ptr_0)
    {
      v18 = (void *)DataDetectorsUILibrary_4();
      v17 = dlsym(v18, "kDataDetectorsMiddleText");
      v24[3] = (uint64_t)v17;
      getkDataDetectorsMiddleTextSymbolLoc_ptr_0 = (uint64_t)v17;
    }
    _Block_object_dispose(&v23, 8);
    if (v17)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *v17, v23);

      goto LABEL_9;
    }
LABEL_11:
    v22 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v22);
  }
LABEL_9:
  DDContextMenuActionClass_1 = getDDContextMenuActionClass_1();
  -[VKCActionInfoButton bounds](self, "bounds");
  objc_msgSend(DDContextMenuActionClass_1, "updateContext:withSourceRect:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __42__VKCActionInfoButton_dataDetectorContext__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "scannerResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buttonConfigurationTextAttributesTransformer
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__VKCActionInfoButton_buttonConfigurationTextAttributesTransformer__block_invoke;
  v4[3] = &unk_1E94659F0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1D8249E20](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

id __67__VKCActionInfoButton_buttonConfigurationTextAttributesTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = (void *)MEMORY[0x1E0CEA5E8];
    v7 = *MEMORY[0x1E0CEB590];
    objc_msgSend(WeakRetained, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (vk_isSeedBuild())
    {
      objc_msgSend(WeakRetained, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "vk_isOptimizedForMac");

      v12 = (void *)MEMORY[0x1E0CEA5E8];
      if (v11)
      {
        v13 = 13.0;
      }
      else
      {
        objc_msgSend(v9, "pointSize");
        v13 = v14 * 1.2987013;
      }
      objc_msgSend(v12, "systemFontOfSize:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CEA098]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)filledButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  -[VKCActionInfoButton text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[VKCActionInfoButton setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 1);
  -[VKCActionInfoButton buttonConfigurationTextAttributesTransformer](self, "buttonConfigurationTextAttributesTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v6);

  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  objc_msgSend(v3, "setImagePadding:", 5.0);
  objc_msgSend(v3, "setCornerStyle:", 4);
  -[VKCActionInfoButton defaultSymbolConfigurationForImage](self, "defaultSymbolConfigurationForImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v7);

  return v3;
}

- (id)translucentButtonConfiguration
{
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

  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  -[VKCActionInfoButton text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[VKCActionInfoButton setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 1);
  -[VKCActionInfoButton buttonConfigurationTextAttributesTransformer](self, "buttonConfigurationTextAttributesTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v6);

  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  objc_msgSend(v3, "setImagePadding:", 5.0);
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisualEffect:", v8);

  objc_msgSend(v3, "setBackground:", v7);
  -[VKCActionInfoButton defaultSymbolConfigurationForImage](self, "defaultSymbolConfigurationForImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v9);

  if ((-[VKCActionInfoButton isHighlighted](self, "isHighlighted") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedColorWithTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v12);

  return v3;
}

- (id)defaultSymbolConfigurationForImage
{
  uint64_t v2;

  if (vk_isSeedBuild())
    v2 = 3;
  else
    v2 = 1;
  return (id)objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB590], v2);
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (id)translucentSelectedButtonConfiguration
{
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
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoButton image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  -[VKCActionInfoButton text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[VKCActionInfoButton setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 1);
  -[VKCActionInfoButton buttonConfigurationTextAttributesTransformer](self, "buttonConfigurationTextAttributesTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v6);

  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  objc_msgSend(v3, "setImagePadding:", 5.0);
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisualEffect:", v8);

  -[VKCActionInfoButton tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.85);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  if ((-[VKCActionInfoButton isHighlighted](self, "isHighlighted") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolvedColorWithTraitCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v13);

  -[VKCActionInfoButton defaultSymbolConfigurationForImage](self, "defaultSymbolConfigurationForImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v14);

  objc_msgSend(v3, "setBackground:", v7);
  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
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
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  v6 = (void *)MEMORY[0x1E0CEA390];
  -[VKCActionInfoButton bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[VKCActionInfoButton layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cornerRadius");
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  VKCActionInfoButton *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "Displaying menu for quick action: %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)VKCActionInfoButton;
  -[VKCActionInfoButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v15, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v10, v9, v8);

  -[VKCActionInfoButton delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[VKCActionInfoButton delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willDisplayMenuForActionInfoButton:", self);

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  VKCActionInfoButton *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "Hiding menu for quick action: %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)VKCActionInfoButton;
  -[VKCActionInfoButton contextMenuInteraction:willEndForConfiguration:animator:](&v15, sel_contextMenuInteraction_willEndForConfiguration_animator_, v10, v9, v8);

  -[VKCActionInfoButton delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[VKCActionInfoButton delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willHideMenuForActionInfoButton:", self);

  }
}

- (VKCBaseDataDetectorElement)representedElement
{
  return self->_representedElement;
}

- (void)setRepresentedElement:(id)a3
{
  objc_storeStrong((id *)&self->_representedElement, a3);
}

- (NSArray)allUnfilteredElements
{
  return self->_allUnfilteredElements;
}

- (void)setAllUnfilteredElements:(id)a3
{
  objc_storeStrong((id *)&self->_allUnfilteredElements, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImage)menuImage
{
  return self->_menuImage;
}

- (void)setMenuImage:(id)a3
{
  objc_storeStrong((id *)&self->_menuImage, a3);
}

- (VKCActionInfoButtonDelegate)delegate
{
  return (VKCActionInfoButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DDUIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (BOOL)isMoreButton
{
  return self->_isMoreButton;
}

- (void)setIsMoreButton:(BOOL)a3
{
  self->_isMoreButton = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_allUnfilteredElements, 0);
  objc_storeStrong((id *)&self->_representedElement, 0);
}

@end
