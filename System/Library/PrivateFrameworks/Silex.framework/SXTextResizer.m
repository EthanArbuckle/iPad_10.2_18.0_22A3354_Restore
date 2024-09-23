@implementation SXTextResizer

- (id)initWithColumnLayout:(void *)a3 defaultTextStyle:(char)a4 fontScalingEnabled:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXTextResizer;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      *((_BYTE *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (uint64_t)resizeTextSize:(void *)a3 fontResizingThreshold:(void *)a4 fontSizeConstant:(double)a5 contentSizeCategory:(double)a6 fontTextStyle:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;
  double v19;
  double v20;
  float v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;

  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v13 = *(id *)(a1 + 24);
    if (v13)
    {
      v14 = *(id *)(a1 + 24);
      if (objc_msgSend(v14, "fontSize") == 0x7FFFFFFFFFFFFFFFLL)
        v15 = 18;
      else
        v15 = objc_msgSend(*(id *)(a1 + 24), "fontSize");

    }
    else
    {
      v15 = 18;
    }

    +[SXComponentClassification classificationForComponentWithRole:](SXComponentClassification, "classificationForComponentWithRole:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 8))
    {
      v17 = (double)a2;
      if ((double)v15 * a5 < (double)a2)
      {
        v18 = *(id *)(a1 + 16);
        objc_msgSend(v18, "constrainedViewportSize");
        v20 = v19 / (double)objc_msgSend(*(id *)(a1 + 16), "layoutWidth");

        v21 = (a6 + v20 * (1.0 - a6)) * v17;
        v22 = llroundf(v21);
        v23 = 0.0;
        if (a5 > 1.0)
        {
          objc_msgSend(v16, "textRules");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fontResizingTresholdFactor");
          v26 = v25;
          objc_msgSend(v16, "textRules");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fontSizeConstant");
          v29 = v28;
          objc_msgSend(v16, "textRules");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fontTextStyle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (double)-[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:](a1, v15, v11, v31, v26, v29);

        }
        v32 = v23 * a5;
        if (v23 * a5 <= (double)v22)
          v32 = (double)v22;
        a2 = (uint64_t)v32;
      }
    }
    v33 = -[SXTextResizer preferredFontSizeForUsage:contentSizeCategoryName:fontSize:](a1, v12, v11, a2);
    if (a5 > 1.0 && *(_BYTE *)(a1 + 8))
    {
      objc_msgSend(v16, "textRules");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fontResizingTresholdFactor");
      v36 = v35;
      objc_msgSend(v16, "textRules");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "fontSizeConstant");
      v39 = v38;
      objc_msgSend(v16, "textRules");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fontTextStyle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (double)-[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:](a1, v15, v11, v41, v36, v39);

      if (v42 * a5 >= v33)
        v43 = v33;
      else
        v43 = v42 * a5;
      v44 = (uint64_t)v43;
      if (v42 * a5 <= (double)a2)
        v44 = a2;
    }
    else
    {
      v44 = (uint64_t)v33;
    }
    v45 = (double)v44;
    objc_msgSend(*(id *)(a1 + 16), "contentScaleFactor");
    a1 = (uint64_t)(v46 * v45);

  }
  return a1;
}

- (double)preferredFontSizeForUsage:(void *)a3 contentSizeCategoryName:(uint64_t)a4 fontSize:
{
  id v7;
  NSString *v8;
  NSString *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v17;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    v10 = (double)a4;
    if (UIContentSizeCategoryCompareToCategory(v8, (UIContentSizeCategory)*MEMORY[0x24BDF76A0]))
    {
      v17 = (double)a4;
      CTFontDescriptorGetTextStyleSize();
      if (preferredFontSizeForUsage_contentSizeCategoryName_fontSize__onceToken != -1)
        dispatch_once(&preferredFontSizeForUsage_contentSizeCategoryName_fontSize__onceToken, &__block_literal_global_48);
      objc_msgSend((id)preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "doubleValue");
      }
      else
      {
        CTFontDescriptorGetTextStyleSize();
        v14 = (void *)preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v7);

        v13 = 0.0;
      }
      if (v13 > 0.0)
        v10 = v17 / v13 * v10;

    }
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

void __76__SXTextResizer_preferredFontSizeForUsage_contentSizeCategoryName_fontSize___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDF7050]);
  v1 = (void *)preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache;
  preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache = (uint64_t)v0;

}

- (uint64_t)resizeDropCapNumberOfLines:(uint64_t)result
{
  uint64_t v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 16);
    objc_msgSend(v4, "constrainedViewportSize");
    v6 = v5 / (double)objc_msgSend(*(id *)(v3 + 16), "layoutWidth");

    v7 = llround((v6 * 0.581 + 0.419) * (double)a2);
    if (v7 >= 10)
      v7 = 10;
    if (v7 <= 2)
      return 2;
    else
      return v7;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextStyle, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
}

@end
