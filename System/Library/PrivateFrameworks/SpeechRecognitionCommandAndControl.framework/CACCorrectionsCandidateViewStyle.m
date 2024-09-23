@implementation CACCorrectionsCandidateViewStyle

+ (id)cacLightStyle
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  uint64_t v19;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v21;
  UIColor *candidateNumberColor;
  uint64_t v23;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v25;
  UIColor *backgroundColor;
  uint64_t v27;
  UIColor *cellBackgroundColor;
  uint64_t v29;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v31;
  UIColor *gridBackgroundColor;
  uint64_t v33;
  UIColor *highlightedBackgroundColor;
  uint64_t v35;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v37;
  UIColor *lineColor;
  uint64_t v39;
  UIColor *sortControlColor;
  uint64_t v41;
  UIColor *sortControlBackgroundColor;
  void *v43;
  double v44;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[CACCorrectionsCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v21 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v27 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v31 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v31;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v33 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v33;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v35 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v35;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v37 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v37;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v39 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v39;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v41 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v41;

  v2->_gridLineOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FC0;
  v2->_singleSlottedCellMargin = 10.0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "scaledValueForValue:", 32.0);
  v2->_rowHeight = v44;

  v2->_cellTextAlignment = 0;
  v2->_maxNumberOfProactiveCells = 3;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)cacDarkStyle
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  uint64_t v19;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v21;
  UIColor *candidateNumberColor;
  uint64_t v23;
  UIColor *highlightedCandidateNumberColor;
  UIColor *backgroundColor;
  uint64_t v26;
  UIColor *cellBackgroundColor;
  uint64_t v28;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v30;
  UIColor *gridBackgroundColor;
  uint64_t v32;
  UIColor *highlightedBackgroundColor;
  uint64_t v34;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v36;
  UIColor *lineColor;
  uint64_t v38;
  UIColor *sortControlColor;
  uint64_t v40;
  UIColor *sortControlBackgroundColor;
  void *v42;
  double v43;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 2.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[CACCorrectionsCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v21 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = 0;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v26 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v26;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v28 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v28;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v30 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v30;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v32 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v32;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v34 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v34;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v36 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v36;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v38 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v38;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v40 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v40;

  v2->_gridLineOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FC0;
  v2->_singleSlottedCellMargin = 50.0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scaledValueForValue:", 32.0);
  v2->_rowHeight = v43;

  v2->_cellTextAlignment = 0;
  v2->_maxNumberOfProactiveCells = 3;
  v2->_darkBackdrop = 1;
  return v2;
}

+ (id)defaultLightKeyboardStyle
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  uint64_t v17;
  UIColor *alternativeTextColor;
  uint64_t v19;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v21;
  UIColor *candidateNumberColor;
  uint64_t v23;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v25;
  UIColor *backgroundColor;
  uint64_t v27;
  UIColor *cellBackgroundColor;
  uint64_t v29;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v31;
  UIColor *gridBackgroundColor;
  uint64_t v33;
  UIColor *highlightedBackgroundColor;
  uint64_t v35;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v37;
  UIColor *lineColor;
  uint64_t v39;
  UIColor *sortControlColor;
  uint64_t v41;
  UIColor *sortControlBackgroundColor;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 17.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[CACCorrectionsCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v17 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v17;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v19;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v21 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v21;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v23 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v23;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v25 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v25;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v27 = objc_claimAutoreleasedReturnValue();
  cellBackgroundColor = v2->_cellBackgroundColor;
  v2->_cellBackgroundColor = (UIColor *)v27;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v29 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v2->_arrowButtonBackgroundColor;
  v2->_arrowButtonBackgroundColor = (UIColor *)v29;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v31 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v31;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v33 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v33;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v35 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v35;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v37 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v37;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v39 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v39;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v41 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v2->_sortControlBackgroundColor;
  v2->_sortControlBackgroundColor = (UIColor *)v41;

  v2->_rowHeight = 44.0;
  v2->_maskedCorners = 15;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FD0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_singleSlottedCellMargin = 50.0;
  v2->_cellTextAlignment = 1;
  v2->_columnsCount = 3;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)defaultDarkKeyboardStyle
{
  CACCorrectionsCandidateViewStyle *v3;
  uint64_t v4;
  UIFont *candidateFont;
  uint64_t v6;
  UIFont *alternativeTextFont;
  uint64_t v8;
  UIFont *annotationTextFont;
  uint64_t v10;
  UIFont *candidateNumberFont;
  uint64_t v12;
  UIFont *sortControlFont;
  uint64_t v14;
  UIColor *textColor;
  uint64_t v16;
  UIColor *highlightedTextColor;
  uint64_t v18;
  UIColor *alternativeTextColor;
  uint64_t v20;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v22;
  UIColor *candidateNumberColor;
  uint64_t v24;
  UIColor *highlightedCandidateNumberColor;
  UIColor *backgroundColor;
  uint64_t v27;
  UIColor *arrowButtonBackgroundColor;
  uint64_t v29;
  UIColor *gridBackgroundColor;
  uint64_t v31;
  UIColor *highlightedBackgroundColor;
  uint64_t v33;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v35;
  UIColor *lineColor;
  uint64_t v37;
  UIColor *sortControlColor;
  uint64_t v39;
  UIColor *sortControlBackgroundColor;
  uint64_t v41;
  UIImage *slottedCellSeparatorImage;

  v3 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 20.0);
  v4 = objc_claimAutoreleasedReturnValue();
  candidateFont = v3->_candidateFont;
  v3->_candidateFont = (UIFont *)v4;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v6 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v3->_alternativeTextFont;
  v3->_alternativeTextFont = (UIFont *)v6;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 10.0);
  v8 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v3->_annotationTextFont;
  v3->_annotationTextFont = (UIFont *)v8;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v10 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v3->_candidateNumberFont;
  v3->_candidateNumberFont = (UIFont *)v10;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v12 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v3->_sortControlFont;
  v3->_sortControlFont = (UIFont *)v12;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v14 = objc_claimAutoreleasedReturnValue();
  textColor = v3->_textColor;
  v3->_textColor = (UIColor *)v14;

  -[CACCorrectionsCandidateViewStyle textColor](v3, "textColor");
  v16 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v3->_highlightedTextColor;
  v3->_highlightedTextColor = (UIColor *)v16;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v18 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v3->_alternativeTextColor;
  v3->_alternativeTextColor = (UIColor *)v18;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v3, "alternativeTextColor");
  v20 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v3->_highlightedAlternativeTextColor;
  v3->_highlightedAlternativeTextColor = (UIColor *)v20;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v22 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v3->_candidateNumberColor;
  v3->_candidateNumberColor = (UIColor *)v22;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v3, "candidateNumberColor");
  v24 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v3->_highlightedCandidateNumberColor;
  v3->_highlightedCandidateNumberColor = (UIColor *)v24;

  backgroundColor = v3->_backgroundColor;
  v3->_backgroundColor = 0;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v27 = objc_claimAutoreleasedReturnValue();
  arrowButtonBackgroundColor = v3->_arrowButtonBackgroundColor;
  v3->_arrowButtonBackgroundColor = (UIColor *)v27;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v29 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v3->_gridBackgroundColor;
  v3->_gridBackgroundColor = (UIColor *)v29;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v31 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v3->_highlightedBackgroundColor;
  v3->_highlightedBackgroundColor = (UIColor *)v31;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v33 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v3->_groupHeaderBackgroundColor;
  v3->_groupHeaderBackgroundColor = (UIColor *)v33;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v35 = objc_claimAutoreleasedReturnValue();
  lineColor = v3->_lineColor;
  v3->_lineColor = (UIColor *)v35;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v37 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v3->_sortControlColor;
  v3->_sortControlColor = (UIColor *)v37;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v39 = objc_claimAutoreleasedReturnValue();
  sortControlBackgroundColor = v3->_sortControlBackgroundColor;
  v3->_sortControlBackgroundColor = (UIColor *)v39;

  objc_msgSend(a1, "onePixelImageWithColor:", v3->_lineColor);
  v41 = objc_claimAutoreleasedReturnValue();
  slottedCellSeparatorImage = v3->_slottedCellSeparatorImage;
  v3->_slottedCellSeparatorImage = (UIImage *)v41;

  *(_OWORD *)&v3->_columnsCount = xmmword_229AD3FE0;
  *(_OWORD *)&v3->_minimumCellPadding = xmmword_229AD3FD0;
  v3->_singleSlottedCellMargin = 30.0;
  v3->_foregroundOpacity = 1.0;
  v3->_backgroundOpacity = 1.0;
  v3->_rowHeight = 41.0;
  v3->_darkBackdrop = 1;
  return v3;
}

+ (id)lightKeyboardStyleForDisambiguation
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIColor *textColor;
  uint64_t v7;
  UIColor *alternativeTextColor;
  uint64_t v9;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v11;
  UIColor *candidateNumberColor;
  uint64_t v13;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v15;
  UIColor *backgroundColor;
  uint64_t v17;
  UIColor *gridBackgroundColor;
  uint64_t v19;
  UIColor *highlightedBackgroundColor;
  UIColor *lineColor;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 16.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v5 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  objc_storeStrong((id *)&v2->_highlightedTextColor, v2->_textColor);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v7 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v7;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v9 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v9;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v11 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v11;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v13 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v13;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v15 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v15;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v17 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v17;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v19;

  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_rowHeight = 32.0;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FD0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_cellTextAlignment = 0;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)darkKeyboardStyleForDisambiguation
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIColor *textColor;
  uint64_t v7;
  UIColor *highlightedTextColor;
  uint64_t v9;
  UIColor *alternativeTextColor;
  uint64_t v11;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v13;
  UIColor *candidateNumberColor;
  uint64_t v15;
  UIColor *highlightedCandidateNumberColor;
  UIColor *backgroundColor;
  uint64_t v18;
  UIColor *gridBackgroundColor;
  UIColor *lineColor;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 16.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v5 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v7 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v7;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v9 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v9;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v11 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v13 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v13;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v15;

  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = 0;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", UIKBGetNamedColor());
  v18 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v18;

  objc_storeStrong((id *)&v2->_highlightedBackgroundColor, v2->_backgroundColor);
  lineColor = v2->_lineColor;
  v2->_lineColor = 0;

  v2->_columnsCount = 6;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FD0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_rowHeight = 32.0;
  v2->_darkBackdrop = 1;
  return v2;
}

+ (id)lightTVStyle
{
  CACCorrectionsCandidateViewStyle *v2;
  uint64_t v3;
  UIFont *candidateFont;
  uint64_t v5;
  UIFont *alternativeTextFont;
  uint64_t v7;
  UIFont *annotationTextFont;
  uint64_t v9;
  UIFont *candidateNumberFont;
  uint64_t v11;
  UIFont *sortControlFont;
  uint64_t v13;
  UIColor *textColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  void *v17;
  uint64_t v18;
  UIColor *alternativeTextColor;
  uint64_t v20;
  UIColor *highlightedAlternativeTextColor;
  uint64_t v22;
  UIColor *candidateNumberColor;
  uint64_t v24;
  UIColor *highlightedCandidateNumberColor;
  uint64_t v26;
  UIColor *backgroundColor;
  uint64_t v28;
  UIColor *gridBackgroundColor;
  uint64_t v30;
  UIColor *highlightedBackgroundColor;
  uint64_t v32;
  UIColor *groupHeaderBackgroundColor;
  uint64_t v34;
  UIColor *lineColor;
  uint64_t v36;
  UIColor *sortControlColor;

  v2 = objc_alloc_init(CACCorrectionsCandidateViewStyle);
  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 36.0);
  v3 = objc_claimAutoreleasedReturnValue();
  candidateFont = v2->_candidateFont;
  v2->_candidateFont = (UIFont *)v3;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 10.0);
  v5 = objc_claimAutoreleasedReturnValue();
  alternativeTextFont = v2->_alternativeTextFont;
  v2->_alternativeTextFont = (UIFont *)v5;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 10.0);
  v7 = objc_claimAutoreleasedReturnValue();
  annotationTextFont = v2->_annotationTextFont;
  v2->_annotationTextFont = (UIFont *)v7;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v9 = objc_claimAutoreleasedReturnValue();
  candidateNumberFont = v2->_candidateNumberFont;
  v2->_candidateNumberFont = (UIFont *)v9;

  objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:", 14.0);
  v11 = objc_claimAutoreleasedReturnValue();
  sortControlFont = v2->_sortControlFont;
  v2->_sortControlFont = (UIFont *)v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
  v13 = objc_claimAutoreleasedReturnValue();
  textColor = v2->_textColor;
  v2->_textColor = (UIColor *)v13;

  -[CACCorrectionsCandidateViewStyle textColor](v2, "textColor");
  v15 = objc_claimAutoreleasedReturnValue();
  highlightedTextColor = v2->_highlightedTextColor;
  v2->_highlightedTextColor = (UIColor *)v15;

  -[CACCorrectionsCandidateViewStyle textColor](v2, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.4);
  v18 = objc_claimAutoreleasedReturnValue();
  alternativeTextColor = v2->_alternativeTextColor;
  v2->_alternativeTextColor = (UIColor *)v18;

  -[CACCorrectionsCandidateViewStyle alternativeTextColor](v2, "alternativeTextColor");
  v20 = objc_claimAutoreleasedReturnValue();
  highlightedAlternativeTextColor = v2->_highlightedAlternativeTextColor;
  v2->_highlightedAlternativeTextColor = (UIColor *)v20;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v22 = objc_claimAutoreleasedReturnValue();
  candidateNumberColor = v2->_candidateNumberColor;
  v2->_candidateNumberColor = (UIColor *)v22;

  -[CACCorrectionsCandidateViewStyle candidateNumberColor](v2, "candidateNumberColor");
  v24 = objc_claimAutoreleasedReturnValue();
  highlightedCandidateNumberColor = v2->_highlightedCandidateNumberColor;
  v2->_highlightedCandidateNumberColor = (UIColor *)v24;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v26 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v2->_backgroundColor;
  v2->_backgroundColor = (UIColor *)v26;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v28 = objc_claimAutoreleasedReturnValue();
  gridBackgroundColor = v2->_gridBackgroundColor;
  v2->_gridBackgroundColor = (UIColor *)v28;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v30 = objc_claimAutoreleasedReturnValue();
  highlightedBackgroundColor = v2->_highlightedBackgroundColor;
  v2->_highlightedBackgroundColor = (UIColor *)v30;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v32 = objc_claimAutoreleasedReturnValue();
  groupHeaderBackgroundColor = v2->_groupHeaderBackgroundColor;
  v2->_groupHeaderBackgroundColor = (UIColor *)v32;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v34 = objc_claimAutoreleasedReturnValue();
  lineColor = v2->_lineColor;
  v2->_lineColor = (UIColor *)v34;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v36 = objc_claimAutoreleasedReturnValue();
  sortControlColor = v2->_sortControlColor;
  v2->_sortControlColor = (UIColor *)v36;

  v2->_columnsCount = 6;
  *(_OWORD *)&v2->_minimumCellPadding = xmmword_229AD3FF0;
  v2->_foregroundOpacity = 1.0;
  v2->_backgroundOpacity = 1.0;
  v2->_rowHeight = 75.0;
  v2->_darkBackdrop = 0;
  return v2;
}

+ (id)onePixelImageWithColor:(id)a3
{
  CGContext *CurrentContext;
  void *v4;
  CGSize v6;
  CGRect v7;

  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 1.0);
  UIGraphicsGetCurrentContext();
  CGContextClear();
  CurrentContext = UIGraphicsGetCurrentContext();
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  CGContextFillRect(CurrentContext, v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v4;
}

- (int64_t)lineBreakMode
{
  return self->lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->lineBreakMode = a3;
}

- (double)cellCornerRadius
{
  return self->cellCornerRadius;
}

- (BOOL)dragGestureDisabled
{
  return self->dragGestureDisabled;
}

- (double)minimumInterItemSpacing
{
  return self->minimumInterItemSpacing;
}

- (UIFont)candidateFont
{
  return self->_candidateFont;
}

- (void)setCandidateFont:(id)a3
{
  objc_storeStrong((id *)&self->_candidateFont, a3);
}

- (UIFont)supplementalLexiconCandidateFont
{
  return self->_supplementalLexiconCandidateFont;
}

- (void)setSupplementalLexiconCandidateFont:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalLexiconCandidateFont, a3);
}

- (UIFont)annotationTextFont
{
  return self->_annotationTextFont;
}

- (void)setAnnotationTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_annotationTextFont, a3);
}

- (UIFont)alternativeTextFont
{
  return self->_alternativeTextFont;
}

- (void)setAlternativeTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTextFont, a3);
}

- (UIFont)candidateNumberFont
{
  return self->_candidateNumberFont;
}

- (void)setCandidateNumberFont:(id)a3
{
  objc_storeStrong((id *)&self->_candidateNumberFont, a3);
}

- (UIFont)sortControlFont
{
  return self->_sortControlFont;
}

- (void)setSortControlFont:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlFont, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTextColor, a3);
}

- (UIColor)alternativeTextColor
{
  return self->_alternativeTextColor;
}

- (void)setAlternativeTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTextColor, a3);
}

- (UIColor)highlightedAlternativeTextColor
{
  return self->_highlightedAlternativeTextColor;
}

- (void)setHighlightedAlternativeTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedAlternativeTextColor, a3);
}

- (UIColor)candidateNumberColor
{
  return self->_candidateNumberColor;
}

- (void)setCandidateNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_candidateNumberColor, a3);
}

- (UIColor)highlightedCandidateNumberColor
{
  return self->_highlightedCandidateNumberColor;
}

- (void)setHighlightedCandidateNumberColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedCandidateNumberColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (UIColor)arrowButtonBackgroundColor
{
  return self->_arrowButtonBackgroundColor;
}

- (void)setArrowButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonBackgroundColor, a3);
}

- (BOOL)arrowButtonBackgroundHidden
{
  return self->_arrowButtonBackgroundHidden;
}

- (void)setArrowButtonBackgroundHidden:(BOOL)a3
{
  self->_arrowButtonBackgroundHidden = a3;
}

- (UIColor)gridBackgroundColor
{
  return self->_gridBackgroundColor;
}

- (void)setGridBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_gridBackgroundColor, a3);
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (UIColor)highlightedRowBackgroundColor
{
  return self->_highlightedRowBackgroundColor;
}

- (void)setHighlightedRowBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, a3);
}

- (UIColor)transliterationCandidateBackgroundColor
{
  return self->_transliterationCandidateBackgroundColor;
}

- (void)setTransliterationCandidateBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, a3);
}

- (UIColor)groupHeaderBackgroundColor
{
  return self->_groupHeaderBackgroundColor;
}

- (void)setGroupHeaderBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, a3);
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (UIColor)sortControlColor
{
  return self->_sortControlColor;
}

- (void)setSortControlColor:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlColor, a3);
}

- (UIColor)sortControlBackgroundColor
{
  return self->_sortControlBackgroundColor;
}

- (void)setSortControlBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sortControlBackgroundColor, a3);
}

- (NSString)arrowButtonImageName
{
  return self->_arrowButtonImageName;
}

- (void)setArrowButtonImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (UIImage)cellSeparatorImage
{
  return self->_cellSeparatorImage;
}

- (void)setCellSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_cellSeparatorImage, a3);
}

- (UIImage)slottedCellSeparatorImage
{
  return self->_slottedCellSeparatorImage;
}

- (void)setSlottedCellSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_slottedCellSeparatorImage, a3);
}

- (UIImage)leftEdgeSeparatorImage
{
  return self->_leftEdgeSeparatorImage;
}

- (void)setLeftEdgeSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeSeparatorImage, a3);
}

- (UIImage)rightEdgeSeparatorImage
{
  return self->_rightEdgeSeparatorImage;
}

- (void)setRightEdgeSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeSeparatorImage, a3);
}

- (UIImage)arrowButtonSeparatorImage
{
  return self->_arrowButtonSeparatorImage;
}

- (void)setArrowButtonSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButtonSeparatorImage, a3);
}

- (UIImage)leftEdgeMaskImage
{
  return self->_leftEdgeMaskImage;
}

- (void)setLeftEdgeMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_leftEdgeMaskImage, a3);
}

- (UIImage)rightEdgeMaskImage
{
  return self->_rightEdgeMaskImage;
}

- (void)setRightEdgeMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightEdgeMaskImage, a3);
}

- (UIImage)cellBackgroundImage
{
  return self->_cellBackgroundImage;
}

- (void)setCellBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundImage, a3);
}

- (UIImage)highlightedCellBackgroundImage
{
  return self->_highlightedCellBackgroundImage;
}

- (void)setHighlightedCellBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedCellBackgroundImage, a3);
}

- (UIImage)transliterationCandidateBackgroundImage
{
  return self->_transliterationCandidateBackgroundImage;
}

- (void)setTransliterationCandidateBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundImage, a3);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)arrowButtonHeight
{
  return self->_arrowButtonHeight;
}

- (void)setArrowButtonHeight:(double)a3
{
  self->_arrowButtonHeight = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (unint64_t)gridMaskedCorners
{
  return self->_gridMaskedCorners;
}

- (void)setGridMaskedCorners:(unint64_t)a3
{
  self->_gridMaskedCorners = a3;
}

- (double)foregroundOpacity
{
  return self->_foregroundOpacity;
}

- (void)setForegroundOpacity:(double)a3
{
  self->_foregroundOpacity = a3;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (void)setBackgroundOpacity:(double)a3
{
  self->_backgroundOpacity = a3;
}

- (BOOL)doNotClipToBounds
{
  return self->_doNotClipToBounds;
}

- (void)setDoNotClipToBounds:(BOOL)a3
{
  self->_doNotClipToBounds = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (unint64_t)columnsCount
{
  return self->_columnsCount;
}

- (void)setColumnsCount:(unint64_t)a3
{
  self->_columnsCount = a3;
}

- (unint64_t)maxNumberOfProactiveCells
{
  return self->_maxNumberOfProactiveCells;
}

- (void)setMaxNumberOfProactiveCells:(unint64_t)a3
{
  self->_maxNumberOfProactiveCells = a3;
}

- (double)minimumCellPadding
{
  return self->_minimumCellPadding;
}

- (void)setMinimumCellPadding:(double)a3
{
  self->_minimumCellPadding = a3;
}

- (double)minimumCellWidth
{
  return self->_minimumCellWidth;
}

- (void)setMinimumCellWidth:(double)a3
{
  self->_minimumCellWidth = a3;
}

- (double)maximumIconWidth
{
  return self->_maximumIconWidth;
}

- (void)setMaximumIconWidth:(double)a3
{
  self->_maximumIconWidth = a3;
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (UIEdgeInsets)extraCellPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_extraCellPadding.top;
  left = self->_extraCellPadding.left;
  bottom = self->_extraCellPadding.bottom;
  right = self->_extraCellPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExtraCellPadding:(UIEdgeInsets)a3
{
  self->_extraCellPadding = a3;
}

- (UIEdgeInsets)arrowButtonPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_arrowButtonPadding.top;
  left = self->_arrowButtonPadding.left;
  bottom = self->_arrowButtonPadding.bottom;
  right = self->_arrowButtonPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setArrowButtonPadding:(UIEdgeInsets)a3
{
  self->_arrowButtonPadding = a3;
}

- (UIEdgeInsets)gridPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridPadding.top;
  left = self->_gridPadding.left;
  bottom = self->_gridPadding.bottom;
  right = self->_gridPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridPadding:(UIEdgeInsets)a3
{
  self->_gridPadding = a3;
}

- (UIEdgeInsets)gridLinePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridLinePadding.top;
  left = self->_gridLinePadding.left;
  bottom = self->_gridLinePadding.bottom;
  right = self->_gridLinePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridLinePadding:(UIEdgeInsets)a3
{
  self->_gridLinePadding = a3;
}

- (CGPoint)gridLineOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_gridLineOffset.x;
  y = self->_gridLineOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGridLineOffset:(CGPoint)a3
{
  self->_gridLineOffset = a3;
}

- (UIEdgeInsets)sortControlPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sortControlPadding.top;
  left = self->_sortControlPadding.left;
  bottom = self->_sortControlPadding.bottom;
  right = self->_sortControlPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSortControlPadding:(UIEdgeInsets)a3
{
  self->_sortControlPadding = a3;
}

- (int64_t)cellTextAlignment
{
  return self->_cellTextAlignment;
}

- (void)setCellTextAlignment:(int64_t)a3
{
  self->_cellTextAlignment = a3;
}

- (int64_t)alternativeTextAlignment
{
  return self->_alternativeTextAlignment;
}

- (void)setAlternativeTextAlignment:(int64_t)a3
{
  self->_alternativeTextAlignment = a3;
}

- (BOOL)darkBackdrop
{
  return self->_darkBackdrop;
}

- (void)setDarkBackdrop:(BOOL)a3
{
  self->_darkBackdrop = a3;
}

- (BOOL)scrollDisabled
{
  return self->_scrollDisabled;
}

- (void)setScrollDisabled:(BOOL)a3
{
  self->_scrollDisabled = a3;
}

- (BOOL)allowCandidateGridExpanding
{
  return self->_allowCandidateGridExpanding;
}

- (void)setAllowCandidateGridExpanding:(BOOL)a3
{
  self->_allowCandidateGridExpanding = a3;
}

- (BOOL)showsIndex
{
  return self->_showsIndex;
}

- (void)setShowsIndex:(BOOL)a3
{
  self->_showsIndex = a3;
}

- (BOOL)showExtraLineBeforeFirstRow
{
  return self->_showExtraLineBeforeFirstRow;
}

- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3
{
  self->_showExtraLineBeforeFirstRow = a3;
}

- (BOOL)fillGridWithLines
{
  return self->_fillGridWithLines;
}

- (void)setFillGridWithLines:(BOOL)a3
{
  self->_fillGridWithLines = a3;
}

- (BOOL)dontSelectLastItemByBackwardMoving
{
  return self->_dontSelectLastItemByBackwardMoving;
}

- (void)setDontSelectLastItemByBackwardMoving:(BOOL)a3
{
  self->_dontSelectLastItemByBackwardMoving = a3;
}

- (BOOL)showOneMoreCandidate
{
  return self->_showOneMoreCandidate;
}

- (void)setShowOneMoreCandidate:(BOOL)a3
{
  self->_showOneMoreCandidate = a3;
}

- (BOOL)disableSwitchingSortingMethodByTabKey
{
  return self->_disableSwitchingSortingMethodByTabKey;
}

- (void)setDisableSwitchingSortingMethodByTabKey:(BOOL)a3
{
  self->_disableSwitchingSortingMethodByTabKey = a3;
}

- (BOOL)skipInlineCandidate
{
  return self->_skipInlineCandidate;
}

- (void)setSkipInlineCandidate:(BOOL)a3
{
  self->_skipInlineCandidate = a3;
}

- (BOOL)hidesPartialCandidates
{
  return self->_hidesPartialCandidates;
}

- (void)setHidesPartialCandidates:(BOOL)a3
{
  self->_hidesPartialCandidates = a3;
}

- (int64_t)minimumNumberOfCandidates
{
  return self->_minimumNumberOfCandidates;
}

- (void)setMinimumNumberOfCandidates:(int64_t)a3
{
  self->_minimumNumberOfCandidates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundImage, 0);
  objc_storeStrong((id *)&self->_highlightedCellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_cellBackgroundImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeMaskImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonSeparatorImage, 0);
  objc_storeStrong((id *)&self->_rightEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_leftEdgeSeparatorImage, 0);
  objc_storeStrong((id *)&self->_slottedCellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_cellSeparatorImage, 0);
  objc_storeStrong((id *)&self->_arrowButtonImageName, 0);
  objc_storeStrong((id *)&self->_sortControlBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sortControlColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_groupHeaderBackgroundColor, 0);
  objc_storeStrong((id *)&self->_transliterationCandidateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedRowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightedCandidateNumberColor, 0);
  objc_storeStrong((id *)&self->_candidateNumberColor, 0);
  objc_storeStrong((id *)&self->_highlightedAlternativeTextColor, 0);
  objc_storeStrong((id *)&self->_alternativeTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_sortControlFont, 0);
  objc_storeStrong((id *)&self->_candidateNumberFont, 0);
  objc_storeStrong((id *)&self->_alternativeTextFont, 0);
  objc_storeStrong((id *)&self->_annotationTextFont, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconCandidateFont, 0);
  objc_storeStrong((id *)&self->_candidateFont, 0);
}

@end
