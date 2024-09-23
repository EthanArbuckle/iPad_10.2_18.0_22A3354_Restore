@implementation TLKEmbossedLabel

- (TLKEmbossedLabel)init
{
  TLKEmbossedLabel *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TLKEmbossedLabel;
  v2 = -[TLKView init](&v9, sel_init);
  if (v2)
  {
    +[TLKProminenceView viewWithProminence:](TLKProminenceView, "viewWithProminence:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKEmbossedLabel setBackgroundView:](v2, "setBackgroundView:", v3);

    -[TLKEmbossedLabel backgroundView](v2, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKEmbossedLabel addSubview:](v2, "addSubview:", v4);

    v5 = (void *)objc_opt_new();
    -[TLKEmbossedLabel setLabel:](v2, "setLabel:", v5);

    -[TLKEmbossedLabel label](v2, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 1);

    -[TLKEmbossedLabel label](v2, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKEmbossedLabel addSubview:](v2, "addSubview:", v7);

    v2->_shouldBadge = 1;
  }
  return v2;
}

- (void)setShouldBadge:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_shouldBadge != a3)
  {
    self->_shouldBadge = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setColor:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIColor *v10;

  v10 = (UIColor *)a3;
  if (self->_color != v10)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setFont:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIFont *v10;

  v10 = (UIFont *)a3;
  if (self->_font != v10)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setText:(id)a3
{
  id v5;
  TLKMultilineText **p_text;
  TLKMultilineText *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TLKMultilineText *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_text = &self->_text;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_text, "setObserver:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = *p_text;
      v8 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "setObserver:", 0);
            ++v11;
          }
          while (v9 != v11);
          v9 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_text, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_text, "setObserver:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = *p_text;
      v14 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "setObserver:", self);
            ++v17;
          }
          while (v15 != v17);
          v15 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v15);
      }

    }
  }
  -[TLKView observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKView observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKView observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)setText:(id)a3 font:(id)a4 customInsetSize:(CGSize)a5 badge:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  UIFont *v12;
  TLKMultilineText *text;
  _BOOL4 v14;
  TLKMultilineText *v15;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v15 = (TLKMultilineText *)a3;
  v12 = (UIFont *)a4;
  text = self->_text;
  v14 = text != v15;
  if (text != v15)
    objc_storeStrong((id *)&self->_text, a3);
  if (self->_font != v12)
  {
    objc_storeStrong((id *)&self->_font, a4);
    v14 = 1;
  }
  if (self->_shouldBadge != v6)
  {
    self->_shouldBadge = v6;
    v14 = 1;
  }
  if (self->_customInsetSize.width == width && self->_customInsetSize.height == height)
  {
    if (!v14)
      goto LABEL_11;
  }
  else
  {
    self->_customInsetSize.width = width;
    self->_customInsetSize.height = height;
  }
  -[TLKEmbossedLabel observedPropertiesChanged](self, "observedPropertiesChanged");
LABEL_11:

}

- (void)observedPropertiesChanged
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[5];

  -[TLKEmbossedLabel font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKEmbossedLabel setFont:](self, "setFont:", v4);

  }
  -[TLKEmbossedLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__TLKEmbossedLabel_observedPropertiesChanged__block_invoke;
  v11[3] = &unk_1E5C06E18;
  v11[4] = self;
  objc_msgSend(v5, "performBatchUpdates:", v11);

  v6 = -[TLKEmbossedLabel shouldBadge](self, "shouldBadge") ^ 1;
  -[TLKEmbossedLabel backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[TLKEmbossedLabel effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v9 = v8;
  -[TLKEmbossedLabel backgroundView](self, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, v9 * 0.5);
  objc_msgSend(v10, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E0CD2A60]);

  -[TLKEmbossedLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

void __45__TLKEmbossedLabel_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMultilineText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(*(id *)(a1 + 32), "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = objc_msgSend(*(id *)(a1 + 32), "shouldBadge") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "label");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProminence:", v8);

}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKEmbossedLabel label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", v3);

}

- (BOOL)adjustsFontSizeToFitWidth
{
  void *v2;
  char v3;

  -[TLKEmbossedLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontSizeToFitWidth");

  return v3;
}

- (double)effectiveBaselineOffsetFromBottom
{
  void *v3;
  double v4;
  double v5;

  -[TLKEmbossedLabel label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveBaselineOffsetFromBottom");
  v5 = v4 + self->_customInsetSize.height;

  return v5;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  void *v3;
  double v4;
  double v5;

  -[TLKEmbossedLabel label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveFirstBaselineOffsetFromTop");
  v5 = v4 + self->_customInsetSize.height;

  return v5;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TLKEmbossedLabel label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveLayoutSizeFittingSize:", width, height);
  v8 = v7;
  v10 = v9;

  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, self->_customInsetSize.width + self->_customInsetSize.width);
  v12 = v8 + v11;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, self->_customInsetSize.height + self->_customInsetSize.height);
  v14 = v10 + v13;
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  v33.receiver = self;
  v33.super_class = (Class)TLKEmbossedLabel;
  -[TLKView layoutSubviews](&v33, sel_layoutSubviews);
  -[TLKEmbossedLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKEmbossedLabel backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TLKEmbossedLabel label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKEmbossedLabel bounds](self, "bounds");
  objc_msgSend(v12, "effectiveLayoutSizeFittingSize:", v13, v14);
  v16 = v15;

  -[TLKEmbossedLabel textOffset](self, "textOffset");
  v18 = v17;
  -[TLKEmbossedLabel textOffset](self, "textOffset");
  v20 = v19;
  -[TLKEmbossedLabel bounds](self, "bounds");
  v21 = v20 + (CGRectGetHeight(v34) - v16) * 0.5;
  -[TLKEmbossedLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v35);
  -[TLKEmbossedLabel textOffset](self, "textOffset");
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, v18, v21, Width + v23 * -2.0, v16);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[TLKEmbossedLabel label](self, "label");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (TLKMultilineText)text
{
  return self->_text;
}

- (CGSize)textOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_textOffset.width;
  height = self->_textOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextOffset:(CGSize)a3
{
  self->_textOffset = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)customInsetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_customInsetSize.width;
  height = self->_customInsetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCustomInsetSize:(CGSize)a3
{
  self->_customInsetSize = a3;
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (TLKProminenceView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
