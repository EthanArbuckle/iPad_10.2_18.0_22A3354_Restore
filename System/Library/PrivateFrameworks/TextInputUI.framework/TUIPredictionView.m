@implementation TUIPredictionView

- (void)_reloadCellsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  TUIPredictionViewStackView *v32;
  void *v33;
  void *v34;
  TUIPredictionViewStackView *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;

  v3 = a3;
  -[TUIPredictionView setSelectedIndex:](self, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[TUIPredictionView _candidatesToDisplayForAutocorrectionList:](self, "_candidatesToDisplayForAutocorrectionList:", self->_autocorrectionList);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "customInfoType");

  v7 = objc_msgSend(v47, "indexOfObjectPassingTest:", &__block_literal_global_14);
  v8 = -[TUIPredictionView _numberOfEmojisToDisplayForAutocorrectionList:withCandidatesShown:](self, "_numberOfEmojisToDisplayForAutocorrectionList:withCandidatesShown:", self->_autocorrectionList, v47);
  v45 = v6;
  if (!v8)
    goto LABEL_9;
  if (v6 != 0x8000 && v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    objc_msgSend(v47, "subarrayWithRange:", 0, objc_msgSend(v47, "count", v6) - 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v47;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v47, "count") < 2)
  {
    if (v6 == 0x8000)
    {
LABEL_9:
      v15 = v47;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_msgSend(v47, "lastObject");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "subarrayWithRange:", 0, objc_msgSend(v47, "count") - 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObject:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)v10;
LABEL_11:

  v15 = (void *)v13;
LABEL_12:
  v48 = v15;
  v16 = objc_msgSend(v15, "count", v45);
  -[TUIPredictionView cellStackView](self, "cellStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionView _ensureVisibleCellCount:forCellStackView:](self, "_ensureVisibleCellCount:forCellStackView:", v16, v17);

  v18 = -[TUIPredictionView shouldAnimateCells](self, "shouldAnimateCells");
  if (objc_msgSend(v48, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v48, "objectAtIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionView cellStackView](self, "cellStackView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "visibleCells");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIPredictionView configurePredictionCell:forCandidate:animated:](self, "configurePredictionCell:forCandidate:animated:", v23, v20, v18);
      ++v19;
    }
    while (v19 < objc_msgSend(v48, "count"));
  }
  -[TIAutocorrectionList emojiList](self->_autocorrectionList, "emojiList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v8)
  {
    if (objc_msgSend(v24, "count") > v8)
    {
      objc_msgSend(v25, "subarrayWithRange:", 0, v8);
      v26 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v26;
    }
    -[TUIPredictionView cellStackView](self, "cellStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subStackViews");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      -[TUIPredictionView cellStackView](self, "cellStackView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "subStackViews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (TUIPredictionViewStackView *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = [TUIPredictionViewStackView alloc];
      v32 = -[TUIPredictionViewStackView initWithFrame:](v35, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    -[TUIPredictionViewStackView setLayoutDirection:](v32, "setLayoutDirection:", -[TUIPredictionView layoutDirection](self, "layoutDirection"));
    -[TUIPredictionView _ensureVisibleCellCount:forCellStackView:](self, "_ensureVisibleCellCount:forCellStackView:", objc_msgSend(v25, "count"), v32);
    if (objc_msgSend(v25, "count"))
    {
      v36 = 0;
      do
      {
        objc_msgSend(v25, "objectAtIndex:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIPredictionViewStackView visibleCells](v32, "visibleCells");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndex:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUIPredictionView configurePredictionCell:forCandidate:animated:](self, "configurePredictionCell:forCandidate:animated:", v39, v37, v3);
        ++v36;
      }
      while (v36 < objc_msgSend(v25, "count"));
    }
    -[TUIPredictionView cellStackView](self, "cellStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addArrangedSubview:beforeLastSubview:", v32, v46 == 0x8000);
  }
  else
  {
    -[TUIPredictionView cellStackView](self, "cellStackView");
    v32 = (TUIPredictionViewStackView *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewStackView subStackViews](v32, "subStackViews");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeFromSuperview");

  }
  -[TUIPredictionView _updateVisibleCellAppearance](self, "_updateVisibleCellAppearance");
  -[TUIPredictionView visibleCells](self, "visibleCells");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41 == 1)
    v42 = 30.0;
  else
    v42 = 0.0;
  -[TUIPredictionView cellStackView](self, "cellStackView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setContentMargin:", 0.0, v42, 0.0, v42);

  -[TUIPredictionView cellStackView](self, "cellStackView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setNeedsLayout");

}

- (id)allVisibleCells
{
  void *v2;
  void *v3;

  -[TUIPredictionView cellStackView](self, "cellStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allVisibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TUIPredictionViewStackView)cellStackView
{
  return self->_cellStackView;
}

void __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  char v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") - 1 <= a3)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3 + 1);

  if ((v6 & 1) != 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutDirection") == 1)
    v7 = 2;
  else
    v7 = 8;
LABEL_8:
  objc_msgSend(v12, "setVisibleSeparatorEdges:", v7);
  if (objc_msgSend(*(id *)(a1 + 32), "drawsBackdropView"))
  {
    if (a3)
    {
      if (*(_QWORD *)(a1 + 48) - 1 != a3)
      {
        v11 = 0;
        goto LABEL_18;
      }
      v8 = objc_msgSend(*(id *)(a1 + 32), "layoutDirection") == 1;
      v9 = 8;
      v10 = 2;
    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "layoutDirection") == 1;
      v9 = 2;
      v10 = 8;
    }
    if (v8)
      v11 = v10;
    else
      v11 = v9;
  }
  else
  {
    v11 = 10;
  }
LABEL_18:
  objc_msgSend(v12, "setRoundedHighlightEdges:", v11);

}

- (BOOL)drawsBackdropView
{
  return self->_drawsBackdropView;
}

- (int64_t)layoutDirection
{
  void *v2;
  void *v3;
  int64_t IsDefaultRightToLeft;

  -[TUIPredictionView currentLocale](self, "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft();

  return IsDefaultRightToLeft;
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void)_updateVisibleCellAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setVisibleSeparatorEdges:", 10);
    objc_msgSend(v9, "setRoundedHighlightEdges:", 10);
  }
  else
  {
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke_2;
    v10[3] = &unk_1E24FB260;
    v10[4] = self;
    v11 = v7;
    v12 = v4;
    v9 = v7;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

- (id)visibleCells
{
  void *v2;
  void *v3;

  -[TUIPredictionView cellStackView](self, "cellStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldAnimateCells
{
  return self->_shouldAnimateCells;
}

- (void)setSelectedIndex:(int64_t)a3
{
  unint64_t v3;
  int64_t selectedIndex;
  int64_t v6;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;

  v3 = a3;
  selectedIndex = self->_selectedIndex;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL && selectedIndex != a3)
  {
    -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", self->_selectedIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setHighlighted:", 0);
    objc_msgSend(v9, "setShouldShowScalingAnimation:", 0);

  }
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > v3)
    {
      -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "candidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v13, "setShouldShowScalingAnimation:", 1);
        objc_msgSend(v13, "setHighlighted:", 1);
      }

    }
    v6 = v3;
  }
  self->_selectedIndex = v6;
  -[TUIPredictionView _updateVisibleCellAppearance](self, "_updateVisibleCellAppearance");
}

- (int64_t)_numberOfEmojisToDisplayForAutocorrectionList:(id)a3 withCandidatesShown:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v5 = -[TUIPredictionView maximumEmojiCells](self, "maximumEmojiCells", a3, a4);
  -[TUIPredictionView autocorrectionList](self, "autocorrectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emojiList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
    return v8;
  else
    return v5;
}

- (unint64_t)maximumEmojiCells
{
  return self->_maximumEmojiCells;
}

- (BOOL)_ensureVisibleCellCount:(unint64_t)a3 forCellStackView:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  TUIPredictionViewCell *v18;
  void *v19;
  unint64_t v20;

  v5 = a4;
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 != a3)
  {
    while (1)
    {
      objc_msgSend(v5, "visibleCells");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 <= a3)
        break;
      objc_msgSend(v5, "arrangedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

    }
    objc_msgSend(v5, "visibleCells");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 < a3)
    {
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        v18 = -[TUIPredictionViewCell initWithFrame:]([TUIPredictionViewCell alloc], "initWithFrame:", v14, v15, v16, v17);
        objc_msgSend(v5, "addArrangedSubview:beforeLastSubview:", v18, 0);

        objc_msgSend(v5, "visibleCells");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v20 < a3);
    }
  }

  return v7 != a3;
}

- (id)_candidatesToDisplayForAutocorrectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  TUIPredictionView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "corrections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autocorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v4;
  objc_msgSend(v4, "predictions");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {

  }
  else
  {
    objc_msgSend(v7, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      v12 = self;

      v7 = 0;
      goto LABEL_11;
    }
  }
  if (!v7)
  {
    v12 = self;
    goto LABEL_11;
  }
  if (objc_msgSend(v7, "isContinuousPathConversion"))
  {
    v12 = self;
    objc_msgSend(v5, "addObject:", v7);
LABEL_11:
    v19 = 0;
    v64 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v7, "input");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rawInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "smartPunctuationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)v8;
  v63 = v14;
  if (v16)
  {
    objc_msgSend(v16, "smartPunctuationedStringForString:", v13);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "smartPunctuationedStringForString:", v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v13;
    v18 = v14;
  }
  v20 = v18;
  -[TUIPredictionView currentLocale](self, "currentLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v17;
  v60 = v20;
  +[TUITypedStringCandidate typedStringCandidateWithLocale:candidateString:inputString:rawInputString:](TUITypedStringCandidate, "typedStringCandidateWithLocale:candidateString:inputString:rawInputString:", v21, v17, v17, v20);
  v22 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v22;
  objc_msgSend(v5, "addObject:", v22);
  objc_msgSend(v7, "candidate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isEqualToString:", v13))
  {

LABEL_16:
    if (objc_msgSend(v7, "candidateProperty") != 4 && !objc_msgSend(v7, "isSupplementalItemCandidate"))
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v7, "candidate");
  v24 = v13;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", v63);

  v13 = v24;
  if (v26)
    goto LABEL_16;
LABEL_18:
  objc_msgSend(v5, "addObject:", v7);
LABEL_19:
  v8 = (uint64_t)v61;
  if (v61)
  {
    v59 = v13;
    v27 = objc_msgSend(v61, "indexOfObjectWithOptions:passingTest:", 0, &__block_literal_global_2228);
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
    }
    else
    {
      v28 = v27;
      objc_msgSend(v61, "objectAtIndex:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "candidate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "smartPunctuationedStringForString:", v30);
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = v30;
      }
      v32 = v31;
      -[TUIPredictionView currentLocale](self, "currentLocale");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[TUITypedStringCandidate typedStringCandidateWithLocale:candidateString:inputString:rawInputString:](TUITypedStringCandidate, "typedStringCandidateWithLocale:candidateString:inputString:rawInputString:", v33, v32, v62, v60);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)objc_msgSend(v61, "mutableCopy");
      objc_msgSend(v34, "removeObjectAtIndex:", v28);
      v8 = objc_msgSend(v34, "copy");

    }
    v13 = v59;
  }
  else
  {
    v19 = 0;
  }
  v12 = self;

LABEL_29:
  v35 = (void *)v8;
  objc_msgSend(v5, "addObjectsFromArray:", v8);
  objc_msgSend(v5, "lastObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "customInfoType");

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v38 = v5;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v69;
    while (2)
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v69 != v41)
          objc_enumerationMutation(v38);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "candidateProperty") == 8)
        {

          goto LABEL_40;
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v40)
        continue;
      break;
    }
  }

  if (v37 == 0x8000)
  {
LABEL_40:
    v43 = 1;
    v45 = 4;
    v44 = 1;
  }
  else
  {
    v43 = 0;
    v44 = 0;
    v45 = 3;
  }
  if (objc_msgSend(v38, "count") > v45)
  {
    objc_msgSend(v38, "lastObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "customInfoType");

    if (v47 == 32)
      v48 = 1;
    else
      v48 = v44;
    objc_msgSend(v38, "removeObjectsInRange:", v45 - v48, objc_msgSend(v38, "count") - v45);
  }
  v49 = objc_msgSend(v38, "count");
  if (-[TUIPredictionView _shouldPadWithEmptyCellsForAutocorrectionList:](v12, "_shouldPadWithEmptyCellsForAutocorrectionList:", v65))
  {
    v50 = -[TUIPredictionView minimumNumberOfCells](v12, "minimumNumberOfCells") + v43;
    while (objc_msgSend(v38, "count") < v50)
    {
      +[TUIPlaceholderCandidate placeholderCandidate](TUIPlaceholderCandidate, "placeholderCandidate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        objc_msgSend(v38, "insertObject:atIndex:", v51, objc_msgSend(v38, "count") - 1);
      else
        objc_msgSend(v38, "addObject:", v51);

    }
  }
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_2;
  v66[3] = &unk_1E24FB190;
  v52 = v7;
  v67 = v52;
  v53 = objc_msgSend(v38, "indexOfObjectWithOptions:passingTest:", 0, v66);
  if (v53 == 0x7FFFFFFFFFFFFFFFLL && v49 == 1)
    v53 = objc_msgSend(v38, "indexOfObjectWithOptions:passingTest:", 0, &__block_literal_global_13);
  if (v53 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v38, "exchangeObjectAtIndex:withObjectAtIndex:", 1);
  if (v19)
  {
    v54 = objc_msgSend(v38, "count");
    objc_msgSend(v38, "lastObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "customInfoType");

    v57 = -2;
    if (v56 != 0x8000)
      v57 = -1;
    if (__CFADD__(v57, v54))
      objc_msgSend(v38, "replaceObjectAtIndex:withObject:", v57 + v54, v19);
  }

  return v38;
}

- (unint64_t)minimumNumberOfCells
{
  return self->_minimumNumberOfCells;
}

- (BOOL)_shouldPadWithEmptyCellsForAutocorrectionList:(id)a3
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "predictions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v5 = 1;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_msgSend((id)objc_opt_class(), "type");
        v11 = objc_msgSend(v9, "candidateProperty");
        if (v10 > 8 || ((1 << v10) & 0x124) == 0)
        {
          v13 = v11;
          if (objc_msgSend(v9, "customInfoType") != 0x8000
            && (objc_msgSend(v9, "isAlternativeInput") & 1) == 0
            && v13 != 8)
          {
            v5 = 0;
            goto LABEL_18;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 = v14;
    }
    while (v14);
    v5 = 1;
  }
LABEL_18:

  return v5;
}

uint64_t __49__TUIPredictionView__updateVisibleCellAppearance__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highlighted");
}

uint64_t __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAlternativeInput");
}

- (void)_setRenderConfig:(id)a3
{
  UIKBRenderConfig *v4;
  objc_super v5;

  v4 = (UIKBRenderConfig *)a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionView;
  -[TUIPredictionView _setRenderConfig:](&v5, sel__setRenderConfig_, v4);
  if (self->_renderConfig != v4)
    -[TUIPredictionView setRenderConfig:](self, "setRenderConfig:", v4);

}

- (void)setRenderConfig:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_renderConfig, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allVisibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setRenderConfig:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  id v41;
  TUIPredictionView *v42;
  id v43;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[TUIPredictionView renderConfig](self, "renderConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRenderConfig:", v10);

  -[TUIPredictionView separatorColor](self, "separatorColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSeparatorColor:", v11);

  -[TUIPredictionView separatorMargin](self, "separatorMargin");
  objc_msgSend(v8, "setSeparatorMargin:");
  -[TUIPredictionView highlightColor](self, "highlightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightColor:", v12);

  -[TUIPredictionView highlightMargin](self, "highlightMargin");
  objc_msgSend(v8, "setHighlightMargin:");
  -[TUIPredictionView highlightCornerRadius](self, "highlightCornerRadius");
  objc_msgSend(v8, "setHighlightCornerRadius:");
  objc_msgSend(v8, "setUseContinuousCornerInHighlight:", -[TUIPredictionView useContinuousCornerInHighlight](self, "useContinuousCornerInHighlight"));
  -[TUIPredictionView labelFontForCandidate:](self, "labelFontForCandidate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabelFont:", v13);

  -[TUIPredictionView autocorrectionList](self, "autocorrectionList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "corrections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "autocorrection");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v17 = -[TUIPredictionView disablesHighlight](self, "disablesHighlight");
  v18 = 0;
  if (!v17 && v16 == v9)
  {
    if ((objc_msgSend(v9, "candidateProperty", 0) & 4) != 0)
    {
      v18 = 1;
    }
    else
    {
      objc_msgSend(v9, "candidate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "input");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      v18 = v21 ^ 1u;
    }
  }
  objc_msgSend(v8, "setHighlighted:", v18);
  v37 = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke;
  v40 = &unk_1E24FB1F8;
  v22 = v9;
  v41 = v22;
  v42 = self;
  v36 = v8;
  v43 = v36;
  __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke((uint64_t)&v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v36, "setImage:", v23);
    -[TUIPredictionView autocorrectionList](self, "autocorrectionList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predictions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 == 1)
      v28 = 1132068864;
    else
      v28 = 1148846080;
    LODWORD(v27) = v28;
    objc_msgSend(v36, "setContentHuggingPriority:forAxis:", 0, v27, v36, v37, v38, v39, v40, v41, v42);
  }
  else
  {
    objc_msgSend(v36, "setImage:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "customView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCustomView:", v29);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "textSuggestion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "foregroundColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPreferredForegroundColor:", v31);

    }
    else
    {
      objc_msgSend(v36, "setPreferredForegroundColor:", 0);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "backgroundColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[TUIPredictionView cellStackView](self, "cellStackView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setCellsHaveBackgroundColor:", 1);

        objc_msgSend(v30, "backgroundColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPreferredBackgroundColor:", v34);

      }
    }
    else
    {
      -[TUIPredictionView cellStackView](self, "cellStackView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCellsHaveBackgroundColor:", 0);

      objc_msgSend(v36, "setPreferredBackgroundColor:", 0);
    }
  }
  else
  {
    objc_msgSend(v36, "setPreferredForegroundColor:", 0);
    objc_msgSend(v36, "setPreferredBackgroundColor:", 0);
    -[TUIPredictionView cellStackView](self, "cellStackView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCellsHaveBackgroundColor:", 0);
  }

  objc_msgSend(v36, "setCandidate:animated:", v22, v5);
}

- (TIAutocorrectionList)autocorrectionList
{
  return self->_autocorrectionList;
}

id __67__TUIPredictionView_configurePredictionCell_forCandidate_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "icon"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "icon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "customInfoType") == 32)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("kb-autofill-key"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "textSuggestion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "image");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)useContinuousCornerInHighlight
{
  return self->_useContinuousCornerInHighlight;
}

- (double)separatorMargin
{
  return self->_separatorMargin;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (id)labelFontForCandidate:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "isSupplementalItemCandidate"))
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)highlightMargin
{
  return self->_highlightMargin;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)disablesHighlight
{
  return self->_disablesHighlight;
}

- (void)setShouldAnimateCells:(BOOL)a3
{
  self->_shouldAnimateCells = a3;
}

- (void)setSeparatorMargin:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_separatorMargin = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSeparatorMargin:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setUseContinuousCornerInHighlight:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_useContinuousCornerInHighlight = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setUseContinuousCornerInHighlight:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setSeparatorColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_separatorColor, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allVisibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setSeparatorColor:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setHighlightMargin:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_highlightMargin = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHighlightMargin:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setHighlightCornerRadius:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_highlightCornerRadius = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allVisibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHighlightCornerRadius:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setHighlightColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_highlightColor, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIPredictionView cellStackView](self, "cellStackView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allVisibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setHighlightColor:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setDrawsBackdropView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  self->_drawsBackdropView = a3;
  -[TUIPredictionView backdropView](self, "backdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  if (v3)
  {

    if (!v13)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TUIPredictionView setBackdropView:](self, "setBackdropView:", v7);

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionView backdropView](self, "backdropView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      -[TUIPredictionView backdropView](self, "backdropView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setContinuousCornerRadius:", 10.0);

      -[TUIPredictionView backdropView](self, "backdropView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIPredictionView insertSubview:atIndex:](self, "insertSubview:atIndex:", v11, 0);

      -[TUIPredictionView setNeedsLayout](self, "setNeedsLayout");
    }
    -[TUIPredictionView backdropView](self, "backdropView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  objc_msgSend(v5, "setHidden:", v12);

}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setDisablesHighlight:(BOOL)a3
{
  self->_disablesHighlight = a3;
}

- (TUIPredictionView)initWithFrame:(CGRect)a3
{
  TUIPredictionView *v3;
  TUIPredictionViewStackView *v4;
  TUIPredictionViewStackView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIPredictionView;
  v3 = -[TUIPredictionView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TUIPredictionViewStackView alloc];
    v5 = -[TUIPredictionViewStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIPredictionView setCellStackView:](v3, "setCellStackView:", v5);

    -[TUIPredictionView cellStackView](v3, "cellStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionView addSubview:](v3, "addSubview:", v6);

    v3->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__didRecognizeTapGesture_);
    -[TUIPredictionView setTapGestureRecognizer:](v3, "setTapGestureRecognizer:", v7);

    -[TUIPredictionView tapGestureRecognizer](v3, "tapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumPressDuration:", 0.0);

    -[TUIPredictionView tapGestureRecognizer](v3, "tapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCancelsTouchesInView:", 0);

    -[TUIPredictionView tapGestureRecognizer](v3, "tapGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v3);

    -[TUIPredictionView tapGestureRecognizer](v3, "tapGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionView addGestureRecognizer:](v3, "addGestureRecognizer:", v11);

    -[TUIPredictionView setMinimumNumberOfCells:](v3, "setMinimumNumberOfCells:", 3);
    -[TUIPredictionView setMaximumEmojiCells:](v3, "setMaximumEmojiCells:", 3);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionView setCurrentLocale:](v3, "setCurrentLocale:", v12);

    -[TUIPredictionView setSeparatorMargin:](v3, "setSeparatorMargin:", 10.0);
    -[TUIPredictionView setShouldAnimateCells:](v3, "setShouldAnimateCells:", 1);
    -[TUIPredictionView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHitTestsAsOpaque:", 1);

  }
  return v3;
}

- (UILongPressGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setMinimumNumberOfCells:(unint64_t)a3
{
  self->_minimumNumberOfCells = a3;
}

- (void)setMaximumEmojiCells:(unint64_t)a3
{
  self->_maximumEmojiCells = a3;
}

- (void)setCellStackView:(id)a3
{
  objc_storeStrong((id *)&self->_cellStackView, a3);
}

- (void)setCurrentLocale:(id)a3
{
  int64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSLocale isEqual:](self->_currentLocale, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentLocale, a3);
    v5 = -[TUIPredictionView layoutDirection](self, "layoutDirection");
    -[TUIPredictionView cellStackView](self, "cellStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutDirection:", v5);

  }
}

- (void)setAutocorrectionList:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_storeStrong((id *)&self->_autocorrectionList, a3);
  -[TUIPredictionView _reloadCellsAnimated:](self, "_reloadCellsAnimated:", v4);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TUIPredictionViewDelegate *)a3;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIPredictionView;
  -[TUIPredictionView layoutSubviews](&v13, sel_layoutSubviews);
  -[TUIPredictionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIPredictionView cellStackView](self, "cellStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (-[TUIPredictionView drawsBackdropView](self, "drawsBackdropView"))
  {
    -[TUIPredictionView backdropView](self, "backdropView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  }
}

- (double)maximumBackgroundWidth
{
  double v2;

  -[TUIPredictionView bounds](self, "bounds");
  return v2 * 0.84;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 45.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)displayedCandidates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUIPredictionView allVisibleCells](self, "allVisibleCells", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setAutocorrectionList:(id)a3
{
  -[TUIPredictionView setAutocorrectionList:animated:](self, "setAutocorrectionList:animated:", a3, 0);
}

- (void)cancelTapGestureRecognizer
{
  void *v3;
  id v4;

  -[TUIPredictionView tapGestureRecognizer](self, "tapGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[TUIPredictionView tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_didRecognizeTapGesture:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v5 = -[TUIPredictionView _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:");
  if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
  {
    -[TUIPredictionView setSelectedIndex:](self, "setSelectedIndex:", v5);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "maskingScrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v8, "isDragging");

      if ((_DWORD)v6)
      {
        objc_msgSend(v4, "setEnabled:", 0);
        objc_msgSend(v4, "setEnabled:", 1);
      }

    }
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    if (objc_msgSend(v4, "state") == 3 && self->_selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__2200;
      v27 = __Block_byref_object_dispose__2201;
      v28 = 0;
      objc_msgSend(v4, "_activeEvents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __45__TUIPredictionView__didRecognizeTapGesture___block_invoke;
      v22[3] = &unk_1E24FB288;
      v22[4] = &v23;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);

      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_attemptAuthenticationWithMessage:", v24[5]);

      -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", self->_selectedIndex);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIPredictionView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v12, "candidate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_alloc(MEMORY[0x1E0DBDBE8]);
          objc_msgSend(v15, "candidate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "input");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "rawInput");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v16, "initWithCandidate:forInput:rawInput:", v17, v18, v19);

          v15 = (void *)v20;
        }
        -[TUIPredictionView delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predictionView:didSelectCandidate:", self, v15);

      }
      _Block_object_dispose(&v23, 8);

    }
    -[TUIPredictionView setSelectedIndex:](self, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (unint64_t)_predictionCellIndexAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  unint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  -[TUIPredictionView allVisibleCells](self, "allVisibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__TUIPredictionView__predictionCellIndexAtLocation___block_invoke;
  v9[3] = &unk_1E24FB2B0;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)_updateHighlightedCellForTouch:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[TUIPredictionView setSelectedIndex:](self, "setSelectedIndex:", -[TUIPredictionView _predictionCellIndexAtLocation:](self, "_predictionCellIndexAtLocation:"));
}

- (TUIPredictionViewDelegate)delegate
{
  return self->_delegate;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cellStackView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
}

BOOL __52__TUIPredictionView__predictionCellIndexAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  _BOOL8 result;
  CGRect v27;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v27.origin.x = v19;
  v27.origin.y = v21;
  v27.size.width = v23;
  v27.size.height = v25;
  result = CGRectContainsPoint(v27, *(CGPoint *)(a1 + 48));
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __45__TUIPredictionView__didRecognizeTapGesture___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "_authenticationMessage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a3 = 1;
}

BOOL __42__TUIPredictionView__reloadCellsAnimated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidateProperty") == 8;
}

BOOL __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

uint64_t __63__TUIPredictionView__candidatesToDisplayForAutocorrectionList___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSupplementalItemCandidate");
}

- (id)test_cellForCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUIPredictionView allVisibleCells](self, "allVisibleCells", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
