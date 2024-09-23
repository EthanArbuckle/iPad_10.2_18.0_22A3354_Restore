@implementation SBUISystemApertureTextContentProvider

- (SBUISystemApertureTextContentProvider)initWithText:(id)a3 style:(int64_t)a4
{
  return (SBUISystemApertureTextContentProvider *)-[SBUISystemApertureTextContentProvider _initWithText:attributedText:style:](self, "_initWithText:attributedText:style:", a3, 0, a4);
}

- (SBUISystemApertureTextContentProvider)initWithAttributedText:(id)a3 style:(int64_t)a4
{
  return (SBUISystemApertureTextContentProvider *)-[SBUISystemApertureTextContentProvider _initWithText:attributedText:style:](self, "_initWithText:attributedText:style:", 0, a3, a4);
}

- (id)_initWithText:(id)a3 attributedText:(id)a4 style:(int64_t)a5
{
  id v8;
  id v9;
  SBUISystemApertureTextContentProvider *v10;
  SBUISystemApertureLabel *v11;
  SBUISystemApertureLabel *v12;
  SBUISystemApertureLabel *v13;
  void *v14;
  void *v15;
  id *v16;
  SBUISystemApertureLabel *label;
  SBUISystemApertureLabel *v18;
  UIView *providedView;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBUISystemApertureTextContentProvider;
  v10 = -[SBUISystemApertureTextContentProvider init](&v21, sel_init);
  if (v10)
  {
    v11 = [SBUISystemApertureLabel alloc];
    v12 = -[SBUISystemApertureLabel initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = v12;
    if (v8)
      -[SBUISystemApertureLabel setText:](v12, "setText:", v8);
    if (v9)
      -[SBUISystemApertureLabel setAttributedText:](v13, "setAttributedText:", v9);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureLabel setFont:](v13, "setFont:", v14);

    -[SBUISystemApertureLabel setAdjustsFontForContentSizeCategory:](v13, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend((id)objc_opt_class(), "_textColorForTextStyle:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureLabel setTextColor:](v13, "setTextColor:", v15);

    v16 = -[_SBUISystemApertureTextContainerView initWithContentLabel:]((id *)[_SBUISystemApertureTextContainerView alloc], v13);
    label = v10->_label;
    v10->_label = v13;
    v18 = v13;

    providedView = v10->_providedView;
    v10->_providedView = (UIView *)v16;

  }
  return v10;
}

- (NSString)text
{
  return (NSString *)-[SBUISystemApertureLabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  uint64_t v4;
  double v5;
  void *v7;
  id v8;

  -[SBUISystemApertureLabel setText:](self->_label, "setText:", a3);
  -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v4;
  if (v4)
  {
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*(double *)(v4 + 424) != *MEMORY[0x1E0C9D820] || *(double *)(v4 + 432) != v5)
    {
      *(_QWORD *)(v4 + 424) = *MEMORY[0x1E0C9D820];
      *(double *)(v4 + 432) = v5;
      objc_msgSend((id)v4, "setNeedsLayout");
      v4 = (uint64_t)v8;
    }
  }
  objc_msgSend((id)v4, "setNeedsLayout");
  -[SBUISystemApertureTextContentProvider contentContainer](self, "contentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeDidInvalidateForContentViewProvider:", self);

}

- (id)_providedView
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[SBUISystemApertureLabel attributedText](self->_label, "attributedText");
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  id v5;

  -[SBUISystemApertureLabel setAttributedText:](self->_label, "setAttributedText:", a3);
  -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[SBUISystemApertureTextContentProvider contentContainer](self, "contentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeDidInvalidateForContentViewProvider:", self);

}

- (int64_t)textAlignment
{
  return -[SBUISystemApertureLabel textAlignment](self->_label, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  int64_t v3;
  _BOOL4 v5;

  v3 = a3;
  if ((a3 | 2) == 2)
  {
    v5 = a3 == 0;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v3 = 2 * v5;
  }
  -[SBUISystemApertureLabel setTextAlignment:](self->_label, "setTextAlignment:", v3);
}

- (int64_t)numberOfLines
{
  return -[SBUISystemApertureLabel numberOfLines](self->_label, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[SBUISystemApertureLabel setNumberOfLines:](self->_label, "setNumberOfLines:", a3);
}

- (void)setFontWeight:(double)a3
{
  SBUISystemApertureLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = self->_label;
  -[SBUISystemApertureLabel font](v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fontAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CEB510];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB510]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x1E0CEB608]);

  v15 = v8;
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISystemApertureLabel setFont:](v4, "setFont:", v14);

}

- (void)swapInText:(id)a3 textColor:(id)a4
{
  -[SBUISystemApertureTextContentProvider swapInText:textColor:fittingSize:](self, "swapInText:textColor:fittingSize:", a3, a4, 1.79769313e308, 1.79769313e308);
}

- (void)swapInText:(id)a3 textColor:(id)a4 fittingSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  SBUISystemApertureLabel *label;
  uint64_t v13;
  id v14;
  SBUISystemApertureLabel *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SBUISystemApertureTextContentProvider *v20;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = a3;
  -[SBUISystemApertureTextContentProvider _providedView]((id *)&self->super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  label = self->_label;
  ++self->_textSwapTransitionCount;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke;
  v18[3] = &unk_1E4C3E588;
  v19 = v11;
  v20 = self;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke_2;
  v16[3] = &unk_1E4C3E5B0;
  v16[4] = self;
  v17 = v19;
  v14 = v19;
  v15 = label;
  -[SBUISystemApertureLabel performTextSwapAnimationWithText:textColor:fittingSize:sizeWillChangeBlock:didSetPropertiesBlock:](v15, "performTextSwapAnimationWithText:textColor:fittingSize:sizeWillChangeBlock:didSetPropertiesBlock:", v10, v9, v18, v16, width, height);

}

void __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke(uint64_t a1, double a2, double a3)
{
  double *v4;
  id v6;

  v4 = *(double **)(a1 + 32);
  if (v4)
  {
    if (v4[53] != a2 || v4[54] != a3)
    {
      v4[53] = a2;
      v4[54] = a3;
      objc_msgSend(v4, "setNeedsLayout");
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "contentContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeDidInvalidateForContentViewProvider:", *(_QWORD *)(a1 + 40));

}

uint64_t __74__SBUISystemApertureTextContentProvider_swapInText_textColor_fittingSize___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2 || (*(_QWORD *)(v1 + 16) = v2 - 1, !*(_QWORD *)(*(_QWORD *)(result + 32) + 16)))
  {
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (*(double *)(result + 424) != *MEMORY[0x1E0C9D820] || *(double *)(result + 432) != v3)
      {
        *(_QWORD *)(result + 424) = *MEMORY[0x1E0C9D820];
        *(double *)(result + 432) = v3;
        return objc_msgSend((id)result, "setNeedsLayout");
      }
    }
  }
  return result;
}

- (UIColor)contentColor
{
  return (UIColor *)-[SBUISystemApertureLabel textColor](self->_label, "textColor");
}

- (void)setContentColor:(id)a3
{
  -[SBUISystemApertureLabel setTextColor:](self->_label, "setTextColor:", a3);
}

+ (id)_textColorForTextStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 6)
  {
    if (a3 == 3)
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor", v3, v4);
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor", v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  return (SBUISystemApertureContentViewContaining *)objc_loadWeakRetained((id *)&self->_contentContainer);
}

- (void)setContentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_contentContainer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
