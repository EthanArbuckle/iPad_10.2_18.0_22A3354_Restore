@implementation ICLinkUIModel

- (id)labelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
}

- (id)noteGlyphTextAttachmentWithSurroundingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v13 = fmin(v10 * 0.6 + 1.0, 1.0);
  }
  else if (v12)
  {
    objc_msgSend(v12, "alphaComponent");
    v13 = v14;
  }
  else
  {
    v13 = 1.0;
  }
  v15 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v15, "ic_systemImageNamed:pointSize:", CFSTR("note.text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLinkUIModel labelColor](self, "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_colorBlendedWithColor:fraction:", v18, fabs(v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "alphaComponent");
  objc_msgSend(v19, "colorWithAlphaComponent:", v13 * v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "imageWithTintColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v23, "setImage:", v22);
  objc_msgSend(v6, "capHeight");
  v25 = v24;
  objc_msgSend(v22, "size");
  v27 = (v25 - v26) * 0.5;
  objc_msgSend(v22, "size");
  v29 = v28;
  objc_msgSend(v22, "size");
  objc_msgSend(v23, "setBounds:", 0.0, v27, v29, v30);

  return v23;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[ICLinkUIModel noteGlyphTextAttachmentWithSurroundingAttributes:](self, "noteGlyphTextAttachmentWithSurroundingAttributes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendAttributedString:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "style") != 4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "ic_thinSpaceCharacterString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithString:", v11);
    objc_msgSend(v6, "appendAttributedString:", v12);

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0DC1248];
  v29[0] = &unk_1E5C71F70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v15, v16);
  objc_msgSend(v6, "appendAttributedString:", v17);

  objc_msgSend((id)objc_opt_class(), "filteredStyleAttributes:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  -[ICLinkUIModel labelColor](self, "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1140]);

  -[ICLinkUIModel labelColor](self, "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D63D50]);

  -[ICLinkUIModel labelColor](self, "labelColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v22, "CGColor");
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D63920]);

  v24 = objc_msgSend(v6, "ic_range");
  objc_msgSend(v6, "addAttributes:range:", v19, v24, v25);
  v26 = (void *)objc_msgSend(v6, "copy");

  return v26;
}

- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICLinkUIModel;
  v6 = a4;
  -[ICInlineAttachmentUIModel highlightingAttributedString:withSurroundingAttributes:](&v13, sel_highlightingAttributedString_withSurroundingAttributes_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy", v13.receiver, v13.super_class);

  -[ICLinkUIModel noteGlyphTextAttachmentWithSurroundingAttributes:](self, "noteGlyphTextAttachmentWithSurroundingAttributes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", 0, 1, v10);

  v11 = (void *)objc_msgSend(v8, "copy");
  return v11;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  _NSRange result;

  length = a3.length;
  v4 = a3.location + 2;
  result.length = length;
  result.location = v4;
  return result;
}

@end
