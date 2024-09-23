@implementation PXStoryTVCellSpec

- (PXStoryTVCellSpec)initWithExtendedTraitCollection:(id)a3
{
  PXStoryTVCellSpec *v3;
  PXStoryTVCellSpec *v4;
  uint64_t v5;
  UIFont *titleFont;
  uint64_t v7;
  UIFont *subtitleFont;
  uint64_t v9;
  NSDictionary *titleSupportedCharactersAttributes;
  uint64_t v11;
  NSDictionary *titleUnsupportedCharactersAttributes;
  uint64_t v13;
  NSDictionary *subtitleSupportedCharactersAttributes;
  uint64_t v15;
  NSDictionary *subtitleUnsupportedCharactersAttributes;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXStoryTVCellSpec;
  v3 = -[PXFeatureSpec initWithExtendedTraitCollection:](&v18, sel_initWithExtendedTraitCollection_, a3);
  v4 = v3;
  if (v3)
  {
    -[PXStoryTVCellSpec _setupTitleFont](v3, "_setupTitleFont");
    v5 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    -[PXStoryTVCellSpec _setupSubtitleFont](v4, "_setupSubtitleFont");
    v7 = objc_claimAutoreleasedReturnValue();
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v7;

    -[PXStoryTVCellSpec _setupTitleAttributesWithAllCharactersSupported:](v4, "_setupTitleAttributesWithAllCharactersSupported:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    titleSupportedCharactersAttributes = v4->_titleSupportedCharactersAttributes;
    v4->_titleSupportedCharactersAttributes = (NSDictionary *)v9;

    -[PXStoryTVCellSpec _setupTitleAttributesWithAllCharactersSupported:](v4, "_setupTitleAttributesWithAllCharactersSupported:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    titleUnsupportedCharactersAttributes = v4->_titleUnsupportedCharactersAttributes;
    v4->_titleUnsupportedCharactersAttributes = (NSDictionary *)v11;

    -[PXStoryTVCellSpec _setupSubtitleAttributesWithAllCharactersSupported:](v4, "_setupSubtitleAttributesWithAllCharactersSupported:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    subtitleSupportedCharactersAttributes = v4->_subtitleSupportedCharactersAttributes;
    v4->_subtitleSupportedCharactersAttributes = (NSDictionary *)v13;

    -[PXStoryTVCellSpec _setupSubtitleAttributesWithAllCharactersSupported:](v4, "_setupSubtitleAttributesWithAllCharactersSupported:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    subtitleUnsupportedCharactersAttributes = v4->_subtitleUnsupportedCharactersAttributes;
    v4->_subtitleUnsupportedCharactersAttributes = (NSDictionary *)v15;

  }
  return v4;
}

- (id)_setupTitleFont
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = *MEMORY[0x1E0DC13C0];
  v13[0] = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8510]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1420]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x1E0DC1408];
  v5 = *MEMORY[0x1E0DC1398];
  v14[1] = v4;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v7);
  v9 = (void *)MEMORY[0x1E0DC1350];
  -[PXStoryTVCellSpec memoryTitleFont](self, "memoryTitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_setupSubtitleFont
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = *MEMORY[0x1E0DC13C0];
  v13[0] = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CA8530]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x1E0DC1408];
  v5 = *MEMORY[0x1E0DC1398];
  v14[1] = v4;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v7);
  v9 = (void *)MEMORY[0x1E0DC1350];
  -[PXStoryTVCellSpec memorySubtitleFont](self, "memorySubtitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_setupTitleAttributesWithAllCharactersSupported:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXStoryTVCellSpec memoryTitleFont](self, "memoryTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1138]);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[PXStoryTVCellSpec memoryTitleLeading](self, "memoryTitleLeading");
    objc_msgSend(v8, "setMaximumLineHeight:");
    objc_msgSend(v8, "setLineBreakMode:", 4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1178]);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PXStoryTVCellSpec memoryTitleTracking](self, "memoryTitleTracking");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1150]);

  }
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (id)_setupSubtitleAttributesWithAllCharactersSupported:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXStoryTVCellSpec memorySubtitleFont](self, "memorySubtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1138]);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[PXStoryTVCellSpec memorySubtitleLeading](self, "memorySubtitleLeading");
    objc_msgSend(v8, "setMaximumLineHeight:");
    objc_msgSend(v8, "setLineBreakMode:", 4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1178]);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PXStoryTVCellSpec memorySubtitleTracking](self, "memorySubtitleTracking");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1150]);

  }
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (UIFont)memoryTitleFont
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 85, CFSTR("concrete subclass must implement"));

  return 0;
}

- (double)memoryTitleLeading
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 90, CFSTR("concrete subclass must implement"));

  return 0.0;
}

- (double)memoryTitleTracking
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 95, CFSTR("concrete subclass must implement"));

  return 0.0;
}

- (UIFont)memorySubtitleFont
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 100, CFSTR("concrete subclass must implement"));

  return 0;
}

- (double)memorySubtitleLeading
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 105, CFSTR("concrete subclass must implement"));

  return 0.0;
}

- (double)memorySubtitleTracking
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVCellSpec.m"), 110, CFSTR("concrete subclass must implement"));

  return 0.0;
}

- (id)attributedStringForTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;

  objc_msgSend(a3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3470, "defaultHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayableTextForTitle:intent:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryTVCellSpec titleFont](self, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "fontDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    v11 = v10;
    -[PXStoryTVCellSpec titleSupportedCharactersAttributes](self, "titleSupportedCharactersAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVCellSpec memoryTitleLeading](self, "memoryTitleLeading");
    v14 = -[PXStoryTVCellSpec _isSupportedCharacterSetForFontDescriptor:fontSize:string:supportedCharacterAttributes:leading:](self, "_isSupportedCharacterSetForFontDescriptor:fontSize:string:supportedCharacterAttributes:leading:", v9, v6, v12, v11, v13);

    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v14)
      -[PXStoryTVCellSpec titleSupportedCharactersAttributes](self, "titleSupportedCharactersAttributes");
    else
      -[PXStoryTVCellSpec titleUnsupportedCharactersAttributes](self, "titleUnsupportedCharactersAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "initWithString:attributes:", v6, v17);

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  }

  return v16;
}

- (id)attributedStringForSubtitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  id v13;
  id v14;
  void *v15;

  objc_msgSend(a3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTVCellSpec subtitleFont](self, "subtitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointSize");
    v9 = v8;
    -[PXStoryTVCellSpec subtitleSupportedCharactersAttributes](self, "subtitleSupportedCharactersAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVCellSpec memorySubtitleLeading](self, "memorySubtitleLeading");
    v12 = -[PXStoryTVCellSpec _isSupportedCharacterSetForFontDescriptor:fontSize:string:supportedCharacterAttributes:leading:](self, "_isSupportedCharacterSetForFontDescriptor:fontSize:string:supportedCharacterAttributes:leading:", v7, v4, v10, v9, v11);

    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v12)
      -[PXStoryTVCellSpec subtitleSupportedCharactersAttributes](self, "subtitleSupportedCharactersAttributes");
    else
      -[PXStoryTVCellSpec subtitleUnsupportedCharactersAttributes](self, "subtitleUnsupportedCharactersAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "initWithString:attributes:", v4, v15);

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  }

  return v14;
}

- (BOOL)_isSupportedCharacterSetForFontDescriptor:(id)a3 fontSize:(double)a4 string:(id)a5 supportedCharacterAttributes:(id)a6 leading:(double)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  const __CFAttributedString *v26;
  const __CTLine *v27;
  double y;
  double height;
  uint64_t v30;
  BOOL v32;
  _QWORD v34[4];
  id v35;
  double v36;
  uint64_t v37;
  _QWORD v38[2];
  CGRect BoundsWithOptions;

  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v37 = *MEMORY[0x1E0DC1390];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = a6;
  v15 = a5;
  objc_msgSend(v13, "numberWithDouble:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__onceToken != -1)
    dispatch_once(&_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__onceToken, &__block_literal_global_163589);
  v19 = (void *)_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor;
  objc_msgSend(v18, "fontAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke_2;
  v34[3] = &unk_1E5130808;
  v35 = v12;
  v36 = a4;
  v21 = v12;
  objc_msgSend(v19, "px_objectForKey:usingPromise:", v20, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v21, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTVCellSpec _languageAwareOutsetsForFont:](self, "_languageAwareOutsetsForFont:", v23);
  v25 = v24;
  v26 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v14);

  v27 = CTLineCreateWithAttributedString(v26);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v27, 8uLL);
  y = BoundsWithOptions.origin.y;
  height = BoundsWithOptions.size.height;
  CFRelease(v27);
  v30 = objc_msgSend(v15, "rangeOfCharacterFromSet:", v22);

  v32 = v25 * 0.5 + height - y < a7 && v30 == 0x7FFFFFFFFFFFFFFFLL;
  return v32;
}

- (UIEdgeInsets)_languageAwareOutsetsForFont:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  UIEdgeInsets result;

  v7 = *(_OWORD *)off_1E50B8020;
  v8 = *((_OWORD *)off_1E50B8020 + 1);
  CTFontGetLanguageAwareOutsets();
  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (NSDictionary)titleSupportedCharactersAttributes
{
  return self->_titleSupportedCharactersAttributes;
}

- (NSDictionary)titleUnsupportedCharactersAttributes
{
  return self->_titleUnsupportedCharactersAttributes;
}

- (NSDictionary)subtitleSupportedCharactersAttributes
{
  return self->_subtitleSupportedCharactersAttributes;
}

- (NSDictionary)subtitleUnsupportedCharactersAttributes
{
  return self->_subtitleUnsupportedCharactersAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleUnsupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleSupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_titleUnsupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_titleSupportedCharactersAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

id __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CTFont *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "fontAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1368]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
    v4 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
    v3 = CTFontCopyCharacterSet(v4);

  }
  objc_msgSend(v3, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __116__PXStoryTVCellSpec__isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor;
  _isSupportedCharacterSetForFontDescriptor_fontSize_string_supportedCharacterAttributes_leading__cachedInvertedCharacterSetByFontDescriptor = (uint64_t)v0;

}

@end
