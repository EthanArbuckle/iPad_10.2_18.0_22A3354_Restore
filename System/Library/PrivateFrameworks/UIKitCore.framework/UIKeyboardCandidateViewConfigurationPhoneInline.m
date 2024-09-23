@implementation UIKeyboardCandidateViewConfigurationPhoneInline

- (id)initialState
{
  UIKeyboardCandidateViewState *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CTFont *v8;
  CTFontRef CopyWithSymbolicTraits;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v80;

  v3 = objc_alloc_init(UIKeyboardCandidateViewState);
  +[UIKeyboardCandidateViewStyle styleForDarkKeyboard:](UIKeyboardCandidateViewStyle, "styleForDarkKeyboard:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState setStyle:](v3, "setStyle:", v4);

  -[UIKeyboardCandidateViewState setPrimaryGridRowType:](v3, "setPrimaryGridRowType:", 1);
  -[UIKeyboardCandidateViewState setHasBackdrop:](v3, "setHasBackdrop:", 0);
  -[UIKeyboardCandidateViewConfiguration candidateDefaultFontSize](self, "candidateDefaultFontSize");
  -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:](self, "candidateFontWithSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCandidateFont:", v5);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidateFont");
  v8 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v8, 0.0, 0, 2u, 2u);
  -[UIKeyboardCandidateViewState style](v3, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupplementalLexiconCandidateFont:", CopyWithSymbolicTraits);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaxNumberOfProactiveCells:", 2);

  if (_os_feature_enabled_impl())
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHighlightedBackgroundColor:", v12);

    -[UIKeyboardCandidateViewState style](v3, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHasShadow:", 1);

    -[UIKeyboardCandidateViewState style](v3, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRoundsArrowButtonEdge:", 1);
  }
  else
  {
    -[UIKeyboardCandidateViewState style](v3, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHighlightedBackgroundColor:", 0);
  }

  -[UIKeyboardCandidateViewState style](v3, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColumnsCount:", 9);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRowHeight:", 41.0);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setGridPadding:", 0.0, 0.0, 0.0, 42.0);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGridLinePadding:", 0.0, 0.0, 0.0, 0.0);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScrollDisabled:", 1);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShowExtraLineBeforeFirstRow:", 1);

  v22 = _os_feature_enabled_impl();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "setCornerRadius:", 10.0);

    -[UIKeyboardCandidateViewState style](v3, "style");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setArrowButtonImageName:", CFSTR("chevron.up"));

    +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 1.0, 1.0, 42.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setArrowButtonSeparatorImage:", v27);

  }
  else
  {
    objc_msgSend(v23, "setCornerRadius:", 8.0);

    -[UIKeyboardCandidateViewState style](v3, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setArrowButtonImageName:", CFSTR("kb-extend-arrow"));
  }

  -[UIKeyboardCandidateViewState setSortControlPosition:](v3, "setSortControlPosition:", 5);
  -[UIKeyboardCandidateViewState setArrowButtonPosition:](v3, "setArrowButtonPosition:", 7);
  -[UIKeyboardCandidateViewState setArrowButtonDirection:](v3, "setArrowButtonDirection:", 1);
  -[UIKeyboardCandidateViewState setBorders:](v3, "setBorders:", 15);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState setCandidateNumberEnabled:](v3, "setCandidateNumberEnabled:", objc_msgSend(v29, "supportsNumberKeySelection"));

  if (!_os_feature_enabled_impl())
  {
    +[UIColor separatorColor](UIColor, "separatorColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLineColor:", v30);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundColor:", v32);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setArrowButtonBackgroundColor:", v34);

LABEL_19:
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor separatorColor](UIColor, "separatorColor");
  else
    +[UIColor lineSeparatorColor](UIColor, "lineSeparatorColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLineColor:", v36);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  else
    +[UIColor candidateRowBackgroundColor](UIColor, "candidateRowBackgroundColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBackgroundColor:", v38);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  else
    +[UIColor candidateRowHighlightedColor](UIColor, "candidateRowHighlightedColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setArrowButtonBackgroundColor:", v40);

  if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
    goto LABEL_19;
  +[UIColor candidateRowHighlightedColor](UIColor, "candidateRowHighlightedColor");
  v42 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v43 = (void *)v42;
  -[UIKeyboardCandidateViewState style](v3, "style");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHighlightedRowBackgroundColor:", v43);

  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSortControlBackgroundColor:", v45);

  +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setGroupHeaderBackgroundColor:", v47);

  v80 = 0.0;
  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "getRed:green:blue:alpha:", 0, 0, 0, &v80);

  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "colorWithAlphaComponent:", v80 * 0.5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setGridBackgroundColor:", v51);

  +[UIColor labelColor](UIColor, "labelColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setTextColor:", v53);

  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setCandidateNumberColor:", v55);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 14.0, *(double *)off_1E167DC50);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCandidateNumberFont:", v57);

  }
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setAlternativeTextColor:", v59);

  -[UIKeyboardCandidateViewState style](v3, "style");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSortControlColor:", 0);

  if (_os_feature_enabled_impl())
  {
    -[UIKeyboardCandidateViewState style](v3, "style");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "candidateNumberColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setArrowButtonColor:", v63);

    +[UIColor candidateRowHighlightedColor](UIColor, "candidateRowHighlightedColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setHighlightedTextColor:", v65);

    +[UIColor candidateRowHighlightedColor](UIColor, "candidateRowHighlightedColor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setHighlightedCandidateNumberColor:", v67);

    +[UIColor candidateRowHighlightedColor](UIColor, "candidateRowHighlightedColor");
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setHighlightedTextColor:", v69);

    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setHighlightedCandidateNumberColor:", v71);

    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewState style](v3, "style");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHighlightedAlternativeTextColor:", v73);

  if (_os_feature_enabled_impl())
  {
    -[UIKeyboardCandidateViewState style](v3, "style");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setHighlightedCellBackgroundImage:", 0);
  }
  else
  {
    +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "highlightedBarCellBackgroundImageWithColor:insets:", v76, 3.0, 3.0, 3.0, 3.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCandidateViewState style](v3, "style");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setHighlightedCellBackgroundImage:", v77);

  }
  return v3;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  -[UIKeyboardCandidateViewConfigurationPhoneInline initialState](self, "initialState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrimaryGridRowType:", 1);
  objc_msgSend(v2, "setArrowButtonDirection:", 0);
  objc_msgSend(v2, "setArrowButtonPosition:", 0);
  objc_msgSend(v2, "setSortControlPosition:", 2);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowHeight");
  objc_msgSend(v2, "setAdditionalHeight:", v4 * 4.0 + -1.0);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollDisabled:", 0);

  return v2;
}

- (unint64_t)rowsToExtend
{
  return 4;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 2;
}

@end
