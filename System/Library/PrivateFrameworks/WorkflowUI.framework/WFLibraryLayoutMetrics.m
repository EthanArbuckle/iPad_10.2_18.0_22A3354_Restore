@implementation WFLibraryLayoutMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowSubtitleFont, 0);
  objc_storeStrong((id *)&self->_workflowTitleFont, 0);
  objc_storeStrong((id *)&self->_floatingViewConfiguration, 0);
}

- (UIEdgeInsets)workflowContentEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  WFConvertEdgeInsetsToRTLIfNeeded();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WFConvertEdgeInsetsToRTLIfNeeded();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[WFLibraryLayoutMetrics scaledEdgeInsets:](self, "scaledEdgeInsets:", v4, v6, v8, v10);
  -[WFLibraryLayoutMetrics capEdgeInsets:min:max:](self, "capEdgeInsets:min:max:", v12, v14, v16, v18);
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (double)capEdgeInsets:(double)a3 min:(double)a4 max:(double)a5
{
  if (a9 < result)
    result = a9;
  if (a5 >= result)
    return a5;
  return result;
}

- (double)workflowIconToLabelMargin
{
  double v2;

  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", 4.0);
  return fmin(v2, 8.0);
}

void __56__WFLibraryLayoutMetrics_workflowTitleFontInDefaultSize__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE0B8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "workflowTitleFontCompatibleWithTraitCollection:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)workflowTitleFontInDefaultSize_font;
  workflowTitleFontInDefaultSize_font = v2;

}

+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6
{
  _BOOL8 v6;
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  void *v14;

  v6 = a6;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTraitCollection:viewWidth:layoutMargins:needsTopPadding:", v13, v6, a4, top, left, bottom, right);

  return v14;
}

- (WFLibraryLayoutMetrics)initWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  WFLibraryLayoutMetrics *v10;
  uint64_t v11;
  UIFont *workflowTitleFont;
  uint64_t v13;
  UIFont *workflowSubtitleFont;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  int v24;
  double v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  float64x2_t v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  double v38;
  WFFloatingViewConfiguration *floatingViewConfiguration;
  WFLibraryLayoutMetrics *v40;
  __int128 v42;
  objc_super v43;

  v6 = a6;
  v9 = a3;
  v43.receiver = self;
  v43.super_class = (Class)WFLibraryLayoutMetrics;
  v10 = -[WFLibraryLayoutMetrics init](&v43, sel_init);
  if (!v10)
    goto LABEL_44;
  objc_msgSend((id)objc_opt_class(), "workflowTitleFontCompatibleWithTraitCollection:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  workflowTitleFont = v10->_workflowTitleFont;
  v10->_workflowTitleFont = (UIFont *)v11;

  objc_msgSend((id)objc_opt_class(), "workflowSubtitleFontCompatibleWithTraitCollection:", v9);
  v13 = objc_claimAutoreleasedReturnValue();
  workflowSubtitleFont = v10->_workflowSubtitleFont;
  v10->_workflowSubtitleFont = (UIFont *)v13;

  WFConvertEdgeInsetsToRTLIfNeeded();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21 + 15.0;
  v24 = objc_msgSend(v9, "verticalSizeClass") == 1 || v6;
  v25 = v16 + 15.0;
  if (!v24)
    v25 = v16;
  v10->_sectionInset.top = v25;
  v10->_sectionInset.left = v18;
  v10->_sectionInset.bottom = v22;
  v10->_sectionInset.right = v20;
  if (a4 <= 1500.0)
  {
    if (a4 > 1205.0)
    {
      *(_QWORD *)&v23 = 16.0;
      v42 = v23;
      v26 = 6;
      goto LABEL_16;
    }
    if (a4 > 972.0)
    {
      *(_QWORD *)&v23 = 16.0;
      v42 = v23;
      v26 = 5;
      goto LABEL_16;
    }
    if (a4 > 694.0)
    {
      *(_QWORD *)&v23 = 16.0;
      v42 = v23;
      v26 = 4;
      goto LABEL_16;
    }
    *(_QWORD *)&v23 = 16.0;
    if (a4 <= 440.0)
      v26 = 2;
    else
      v26 = 3;
    if (a4 <= 440.0)
      *(double *)&v23 = 10.0;
  }
  else
  {
    v26 = (unint64_t)(a4 / 215.0);
    *(_QWORD *)&v23 = 16.0;
  }
  v42 = v23;
LABEL_16:
  v10->_itemsPerBanner = 1;
  v27 = (id)*MEMORY[0x24BEBE0B8];
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "applicationOrNil");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "preferredContentSizeCategory");
    v30 = objc_claimAutoreleasedReturnValue();

    v27 = (id)v30;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v27))
  {
    --v26;
    v10->_itemsPerBanner = 1;
  }
  *(_QWORD *)&v31.f64[0] = v42;
  v31.f64[1] = *(double *)&v42 + 1.0;
  *(float64x2_t *)&v10->_interitemSpacing = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(v31)));
  v10->_itemsPerRow = v26;
  v32 = 132.0;
  if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE068], v42) & 1) == 0
    && (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) == 0)
  {
    if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0)
    {
      v32 = 140.0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE078]) & 1) != 0)
    {
      v32 = 148.0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE0C0]) & 1) != 0)
    {
      v32 = 125.0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE0D0]) & 1) != 0)
    {
      v32 = 126.0;
    }
    else if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BEBE0A8]))
    {
      v32 = 137.0;
    }
    else
    {
      v32 = 122.0;
    }
  }
  v33 = floor((a4 - v18 - v20 - (double)(v26 - 1) * v10->_interitemSpacing) / (double)v26);
  if (v33 >= 0.0)
    v34 = v33;
  else
    v34 = 0.0;
  -[WFLibraryLayoutMetrics scaledValueForValue:](v10, "scaledValueForValue:", v32);
  v10->_workflowSize.width = v34;
  v10->_workflowSize.height = v35;
  objc_msgSend(MEMORY[0x24BEC54A8], "materialWorkflowConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "cornerRadius");
  -[WFLibraryLayoutMetrics scaledValueForValue:](v10, "scaledValueForValue:");
  if (v37 > 33.0)
    v37 = 33.0;
  objc_msgSend(v36, "setCornerRadius:", v37);
  objc_msgSend(v36, "cornerRadius");
  v10->_cornerRadius = v38;
  floatingViewConfiguration = v10->_floatingViewConfiguration;
  v10->_floatingViewConfiguration = (WFFloatingViewConfiguration *)v36;

  v40 = v10;
LABEL_44:

  return v10;
}

+ (id)workflowTitleFontCompatibleWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE200], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)workflowSubtitleFontCompatibleWithTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE1E0], a3);
}

- (double)workflowGlyphDimension
{
  double v2;
  double result;

  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", 29.0);
  result = fmax(v2, 29.0);
  if (result > 40.0)
    return 40.0;
  return result;
}

- (UIEdgeInsets)scaledEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", a3.top);
  v8 = v7;
  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", left);
  v10 = v9;
  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", bottom);
  v12 = v11;
  -[WFLibraryLayoutMetrics scaledValueForValue:](self, "scaledValueForValue:", right);
  v14 = v13;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)scaledValueForValue:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[WFLibraryLayoutMetrics workflowTitleFont](self, "workflowTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "workflowTitleFontInDefaultSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_scaledValueForValue:baseFont:", v5, a3);
  v7 = v6;

  return v7;
}

- (UIFont)workflowTitleFont
{
  return self->_workflowTitleFont;
}

+ (id)workflowTitleFontInDefaultSize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WFLibraryLayoutMetrics_workflowTitleFontInDefaultSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (workflowTitleFontInDefaultSize_onceToken != -1)
    dispatch_once(&workflowTitleFontInDefaultSize_onceToken, block);
  return (id)workflowTitleFontInDefaultSize_font;
}

- (WFFloatingViewConfiguration)floatingViewConfiguration
{
  return self->_floatingViewConfiguration;
}

- (unint64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (CGSize)workflowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_workflowSize.width;
  height = self->_workflowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (CGSize)workflowGlyphSize
{
  double v2;
  double v3;
  CGSize result;

  -[WFLibraryLayoutMetrics workflowGlyphDimension](self, "workflowGlyphDimension");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)appIconFormat
{
  return 0;
}

- (UIFont)workflowSubtitleFont
{
  return self->_workflowSubtitleFont;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)itemsPerBanner
{
  return self->_itemsPerBanner;
}

+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5
{
  return (id)objc_msgSend(a1, "metricsCompatibleWithTraitCollection:viewWidth:layoutMargins:needsTopPadding:", a3, 0, a4, a5.top, a5.left, a5.bottom, a5.right);
}

@end
