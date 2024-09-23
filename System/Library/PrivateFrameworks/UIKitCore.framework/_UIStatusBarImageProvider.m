@implementation _UIStatusBarImageProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___UIStatusBarImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1219 != -1)
    dispatch_once(&_MergedGlobals_1219, block);
  return (id)qword_1ECD80380;
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
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v6, "imageNamePrefixes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  v10 = v7;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    v10 = v7;
    while (2)
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "stringByAppendingString:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIStatusBarImage _kitImageNamed:withTrait:](_UIStatusBarImage, "_kitImageNamed:withTrait:", v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {

          goto LABEL_12;
        }
        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = v7;
  objc_msgSend(v6, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarImage _kitImageNamed:withTrait:](_UIStatusBarImage, "_kitImageNamed:withTrait:", v17, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (v16)
  {
LABEL_12:
    -[_UIStatusBarImageProvider _alignmentInsetsForImageNamed:styleAttributes:](self, "_alignmentInsetsForImageNamed:styleAttributes:", v10, v6);
    if (v22 == 0.0 && v19 == 0.0 && v21 == 0.0 && v20 == 0.0
      || (objc_msgSend(v16, "imageWithAlignmentRectInsets:"),
          v23 = objc_claimAutoreleasedReturnValue(),
          v16,
          (v16 = (void *)v23) != 0))
    {
      if (!-[_UIStatusBarImageProvider _suppressHairlineThickeningForImageName:styleAttributes:](self, "_suppressHairlineThickeningForImageName:styleAttributes:", v10, v6))goto LABEL_24;
      objc_msgSend(v16, "_imageThatSuppressesAccessibilityHairlineThickening");
      v24 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v24;
      if (v24)
        goto LABEL_24;
    }
  }
  v25 = imageNamed_styleAttributes____s_category;
  if (!imageNamed_styleAttributes____s_category)
  {
    v25 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v25, (unint64_t *)&imageNamed_styleAttributes____s_category);
  }
  v26 = *(NSObject **)(v25 + 8);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "No image for name %@", buf, 0xCu);
  }
  v16 = 0;
LABEL_24:

  return v16;
}

- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Large_Bolt")))
  {
    v7 = objc_msgSend(v6, "effectiveLayoutDirection");
    v8 = -1.33333333;
    v9 = 0.0;
    if (v7 == 1)
      v10 = -1.33333333;
    else
      v10 = 0.0;
    if (v7 == 1)
      v8 = 0.0;
    v11 = v8 + 0.0;
    v12 = 1.66666667;
    v13 = v10 + 0.0;
  }
  else
  {
    v13 = 0.0;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Split_SOS")))
      v12 = -0.666666667;
    else
      v12 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
  }
  objc_msgSend(v6, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;

  if (v16 != 3.0)
  {
    UIRoundToScale(0.0, v16);
    v9 = v17;
    UIRoundToScale(v11, v16);
    v11 = v18;
    UIRoundToScale(v12, v16);
    v12 = v19;
    UIRoundToScale(v13, v16);
    v13 = v20;
  }

  v21 = v9;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4
{
  return 1;
}

@end
