@implementation STUIStatusBarImageProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__STUIStatusBarImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_44 != -1)
    dispatch_once(&_MergedGlobals_44, block);
  return (id)qword_1EDBEDF90;
}

void __44__STUIStatusBarImageProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EDBEDF90;
  qword_1EDBEDF90 = (uint64_t)v1;

}

- (id)imageNamed:(id)a3 styleAttributes:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "imageNamePrefixes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  v10 = v7;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v32;
    v10 = v7;
    while (2)
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v13), "stringByAppendingString:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[STUIStatusBarImage _kitImageNamed:withTrait:](STUIStatusBarImage, "_kitImageNamed:withTrait:", v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {

          goto LABEL_12;
        }
        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = v7;
  objc_msgSend(v6, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarImage _kitImageNamed:withTrait:](STUIStatusBarImage, "_kitImageNamed:withTrait:", v17, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (v16)
  {
LABEL_12:
    -[STUIStatusBarImageProvider _alignmentInsetsForImageNamed:styleAttributes:](self, "_alignmentInsetsForImageNamed:styleAttributes:", v10, v6);
    v25 = v22 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
       && v19 == *MEMORY[0x1E0DC49E8]
       && v21 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
       && v20 == *(double *)(MEMORY[0x1E0DC49E8] + 16);
    if (v25
      || (objc_msgSend(v16, "imageWithAlignmentRectInsets:"),
          v26 = objc_claimAutoreleasedReturnValue(),
          v16,
          (v16 = (void *)v26) != 0))
    {
      if (!-[STUIStatusBarImageProvider _suppressHairlineThickeningForImageName:styleAttributes:](self, "_suppressHairlineThickeningForImageName:styleAttributes:", v10, v6))goto LABEL_28;
      objc_msgSend(v16, "_imageThatSuppressesAccessibilityHairlineThickening");
      v27 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v27;
      if (v27)
        goto LABEL_28;
    }
  }
  _STUIStatusBar_Log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_1CFE2E000, v28, OS_LOG_TYPE_ERROR, "No image for name %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_28:

  return v16;
}

- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4
{
  id v5;
  id v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Large_Bolt")))
  {
    UIEdgeInsetsAdd();
    objc_msgSend(v6, "effectiveLayoutDirection");
  }
  else if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Split_SOS")))
  {
    goto LABEL_5;
  }
  UIEdgeInsetsAdd();
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
LABEL_5:
  objc_msgSend(v6, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = v16;

  if (v17 != 3.0)
  {
    UIRoundToScale();
    v7 = v18;
    UIRoundToScale();
    v8 = v19;
    UIRoundToScale();
    v9 = v20;
    UIRoundToScale();
    v10 = v21;
  }

  v22 = v7;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4
{
  return 1;
}

@end
