@implementation TITypologyStatisticBasicCounts

- (void)visitRecordSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  __CFString *v22;

  v4 = a3;
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextBeforeInput");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") || !-[__CFString length](v22, "length"))
    goto LABEL_2;
  -[TITypologyStatisticBasicCounts recentText](self, "recentText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  v15 = -[__CFString length](v22, "length");
  v16 = v14 >= v15 ? v15 : v14;
  -[TITypologyStatisticBasicCounts recentText](self, "recentText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v16
    || (-[TITypologyStatisticBasicCounts recentText](self, "recentText"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "substringWithRange:", v18 - v16, v16),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = -[__CFString hasSuffix:](v22, "hasSuffix:", v20),
        v20,
        v19,
        (v21 & 1) == 0))
  {
LABEL_2:
    -[TITypologyStatisticBasicCounts recentText](self, "recentText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v11 = v22;
    else
      v11 = &stru_1E243B990;
    objc_msgSend(v10, "setString:", v11);

    -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
}

- (NSMutableString)recentText
{
  return self->_recentText;
}

- (NSMutableArray)recentAutocorrectionLocations
{
  return self->_recentAutocorrectionLocations;
}

- (id)aggregateReport
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TITypologyStatisticBasicCounts characterCount](self, "characterCount");
  if (v4 >= 1)
  {
    *(float *)&v5 = (float)v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("characterCount"));

  }
  v7 = -[TITypologyStatisticBasicCounts touchCount](self, "touchCount");
  v8 = -[TITypologyStatisticBasicCounts predictiveSelectionCount](self, "predictiveSelectionCount") + v7;
  if (v8 >= 1)
  {
    *(float *)&v9 = (float)v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("keysTappedCount"));

  }
  v11 = -[TITypologyStatisticBasicCounts falseBackspaceCount](self, "falseBackspaceCount");
  if (v11 >= 1)
  {
    *(float *)&v12 = (float)v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("falseBackspaceTotalCount"));

  }
  v14 = -[TITypologyStatisticBasicCounts falseBackspaceIntoAutocorrectionCount](self, "falseBackspaceIntoAutocorrectionCount");
  if (v14 >= 1)
  {
    *(float *)&v15 = (float)v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("falseBackspaceIntoAutocorrection"));

  }
  return v3;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (int64_t)touchCount
{
  return self->_touchCount;
}

- (int64_t)predictiveSelectionCount
{
  return self->_predictiveSelectionCount;
}

- (int64_t)falseBackspaceIntoAutocorrectionCount
{
  return self->_falseBackspaceIntoAutocorrectionCount;
}

- (int64_t)falseBackspaceCount
{
  return self->_falseBackspaceCount;
}

- (TITypologyStatisticBasicCounts)init
{
  TITypologyStatisticBasicCounts *v2;
  NSMutableString *v3;
  NSMutableString *recentText;
  NSMutableArray *v5;
  NSMutableArray *recentAutocorrectionLocations;
  NSMutableString *v7;
  NSMutableString *recentTextAfterBackspace;
  NSMutableString *v9;
  NSMutableString *recentTextBeforeBackspace;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TITypologyStatisticBasicCounts;
  v2 = -[TITypologyStatisticBasicCounts init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    recentText = v2->_recentText;
    v2->_recentText = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recentAutocorrectionLocations = v2->_recentAutocorrectionLocations;
    v2->_recentAutocorrectionLocations = v5;

    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    recentTextAfterBackspace = v2->_recentTextAfterBackspace;
    v2->_recentTextAfterBackspace = v7;

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    recentTextBeforeBackspace = v2->_recentTextBeforeBackspace;
    v2->_recentTextBeforeBackspace = v9;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTextAfterBackspace, 0);
  objc_storeStrong((id *)&self->_recentTextBeforeBackspace, 0);
  objc_storeStrong((id *)&self->_recentAutocorrectionLocations, 0);
  objc_storeStrong((id *)&self->_recentText, 0);
}

- (id)structuredReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts touchCount](self, "touchCount", CFSTR("Touch Count")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("Character Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts characterCount](self, "characterCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("Predicted Character Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts predictedCharacterCount](self, "predictedCharacterCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("Backspace Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts backspaceCount](self, "backspaceCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("Autocorrections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts autocorrectionCount](self, "autocorrectionCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("Rejected Candidates");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts rejectedCandidateCount](self, "rejectedCandidateCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("Backspace Into Autocorrection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts backspaceIntoAutocorrectionCount](self, "backspaceIntoAutocorrectionCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("False Backspace Total Count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts falseBackspaceCount](self, "falseBackspaceCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("False Backspace Into Autocorrection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticBasicCounts falseBackspaceIntoAutocorrectionCount](self, "falseBackspaceIntoAutocorrectionCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)handleTouch:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = objc_msgSend(v4, "stage") == 2;
    v4 = v6;
    if (v5)
      ++self->_touchCount;
  }

}

- (void)updateTextWithAcceptedCandidate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "candidate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v27, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v27, "candidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      objc_msgSend(v27, "input");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10 - objc_msgSend(v11, "length");

      self->_characterCount += v12;
      self->_predictedCharacterCount += v12 & ~(v12 >> 63);
      -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_characterCount);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      objc_msgSend(v27, "input");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v27, "input");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "hasSuffix:", v18);

        -[TITypologyStatisticBasicCounts recentText](self, "recentText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v20;
        if (v19)
        {
          v21 = objc_msgSend(v20, "length");
          objc_msgSend(v27, "input");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v21 - objc_msgSend(v22, "length");
          objc_msgSend(v27, "input");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          -[TITypologyStatisticBasicCounts recentText](self, "recentText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "candidate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "replaceCharactersInRange:withString:", v23, v25, v26);
        }
        else
        {
          objc_msgSend(v27, "candidate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setString:", v26);
        }
      }
      else
      {
        objc_msgSend(v27, "candidate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendString:", v26);
      }

    }
  }

}

- (void)visitRecordKeyboardInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  int64_t characterCount;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  unint64_t v85;
  void *v86;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;

  v93 = a3;
  objc_msgSend(v93, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touchEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticBasicCounts handleTouch:](self, "handleTouch:", v5);

  objc_msgSend(v93, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acceptedCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v93, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSynthesizedByAcceptingCandidate");

  if ((v9 & 1) != 0)
  {
    v10 = &OBJC_IVAR___TITypologyStatisticBasicCounts__predictiveSelectionCount;
  }
  else
  {
    if (!objc_msgSend(v7, "isAutocorrection"))
      goto LABEL_6;
    v10 = &OBJC_IVAR___TITypologyStatisticBasicCounts__autocorrectionCount;
  }
  ++*(Class *)((char *)&self->super.super.super.isa + *v10);
LABEL_6:
  -[TITypologyStatisticBasicCounts updateTextWithAcceptedCandidate:](self, "updateTextWithAcceptedCandidate:", v7);
  objc_msgSend(v93, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBackspace");

  if (v12)
    ++self->_backspaceCount;
  objc_msgSend(v93, "output");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deletionCount");

  if (!v14)
    goto LABEL_26;
  -[TITypologyStatisticBasicCounts recentText](self, "recentText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hasSuffix:", CFSTR(" ")))
  {

LABEL_12:
    -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyStatisticBasicCounts recentText](self, "recentText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setString:", v19);
    goto LABEL_13;
  }
  -[TITypologyStatisticBasicCounts recentText](self, "recentText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasSuffix:", CFSTR("."));

  if (v17)
    goto LABEL_12;
  -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "length");

  if (v90)
    goto LABEL_14;
  -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticBasicCounts recentText](self, "recentText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendString:", v19);
LABEL_13:

LABEL_14:
  objc_msgSend(v93, "output");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (objc_msgSend(v20, "deletionCount"))
  {
    v22 = 0;
    while (1)
    {
      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (!v24)
        break;
      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "_rangeOfBackwardDeletionClusterAtIndex:", objc_msgSend(v26, "length") - 1);
      v29 = v28;

      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "deleteCharactersInRange:", v27, v29);

      v21 += v29;
      ++v22;
      objc_msgSend(v93, "output");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 >= objc_msgSend(v20, "deletionCount"))
        goto LABEL_18;
    }
  }
  else
  {
LABEL_18:

  }
  objc_msgSend(v93, "output");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "deletionCount");

  if (v21 <= v32)
    v33 = v32;
  else
    v33 = v21;
  self->_characterCount -= v33;
  -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    while (1)
    {
      characterCount = self->_characterCount;
      -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue");

      if (characterCount >= v38)
        break;
      ++self->_backspaceIntoAutocorrectionCount;
      -[TITypologyStatisticBasicCounts setBackspacedIntoAutocorrection:](self, "setBackspacedIntoAutocorrection:", 1);
      -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeLastObject");

      -[TITypologyStatisticBasicCounts recentAutocorrectionLocations](self, "recentAutocorrectionLocations");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "count"))
        goto LABEL_25;
    }
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  objc_msgSend(v93, "output");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "insertionText");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v93, "output");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "insertionText");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    self->_characterCount += objc_msgSend(v43, "length");

    -[TITypologyStatisticBasicCounts recentText](self, "recentText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "output");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "insertionText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "appendString:", v46);

  }
  objc_msgSend(v93, "output");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "insertionText");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "_isSpace");

  if (v49)
  {
    -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "length");

    if (v51)
    {
      -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypologyStatisticBasicCounts recentText](self, "recentText");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "appendString:", v53);

      -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "length");

      -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "length");

      if (v55 >= v57)
        v58 = v57;
      else
        v58 = v55;
      -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v59, "length") > 0x64)
        goto LABEL_51;
      -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "length");

      if (v61 <= 0x64)
      {
        v62 = 0;
        if (v58)
        {
          while (1)
          {
            -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "characterAtIndex:", v62);
            -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "characterAtIndex:", v62);

            if (v64 != v66)
              break;
            if (v58 == ++v62)
            {
              v62 = v58;
              break;
            }
          }
        }
        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "substringFromIndex:", v62);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setString:", v69);

        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "substringFromIndex:", v62);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setString:", v72);

        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (id)objc_msgSend(v73, "stringByTrimmingCharactersInSet:", v74);

        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (id)objc_msgSend(v76, "stringByTrimmingCharactersInSet:", v77);

        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v59, "length") > 0x18)
          goto LABEL_51;
        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "length");

        if (v80 > 0x18)
          goto LABEL_52;
        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v81, "_editDistanceFrom:", v82);

        -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "length");

        -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "length");

        v88 = v85 >= v87 ? v87 : v85;
        if (v83 < v88 >> 1)
          goto LABEL_52;
        if (-[TITypologyStatisticBasicCounts backspacedIntoAutocorrection](self, "backspacedIntoAutocorrection"))
        {
          ++self->_falseBackspaceIntoAutocorrectionCount;
LABEL_50:
          -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          self->_falseBackspaceCount += objc_msgSend(v59, "length");
LABEL_51:

          goto LABEL_52;
        }
        if (self->_backspaceCount >= 1)
          goto LABEL_50;
      }
LABEL_52:
      -[TITypologyStatisticBasicCounts recentTextBeforeBackspace](self, "recentTextBeforeBackspace");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setString:", &stru_1E243B990);

      -[TITypologyStatisticBasicCounts recentTextAfterBackspace](self, "recentTextAfterBackspace");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setString:", &stru_1E243B990);

      -[TITypologyStatisticBasicCounts setBackspacedIntoAutocorrection:](self, "setBackspacedIntoAutocorrection:", 0);
    }
  }

}

- (void)visitRecordHitTest:(id)a3
{
  id v4;

  objc_msgSend(a3, "touchEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticBasicCounts handleTouch:](self, "handleTouch:", v4);

}

- (void)visitRecordSkipHitTest:(id)a3
{
  id v4;

  objc_msgSend(a3, "touchEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticBasicCounts handleTouch:](self, "handleTouch:", v4);

}

- (void)visitRecordTextAccepted:(id)a3
{
  id v4;

  objc_msgSend(a3, "candidate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAutocorrection"))
    ++self->_autocorrectionCount;
  -[TITypologyStatisticBasicCounts updateTextWithAcceptedCandidate:](self, "updateTextWithAcceptedCandidate:", v4);

}

- (void)visitRecordCandidateRejected:(id)a3
{
  ++self->_rejectedCandidateCount;
}

- (int64_t)predictedCharacterCount
{
  return self->_predictedCharacterCount;
}

- (int64_t)backspaceCount
{
  return self->_backspaceCount;
}

- (int64_t)autocorrectionCount
{
  return self->_autocorrectionCount;
}

- (int64_t)rejectedCandidateCount
{
  return self->_rejectedCandidateCount;
}

- (int64_t)backspaceIntoAutocorrectionCount
{
  return self->_backspaceIntoAutocorrectionCount;
}

- (NSMutableString)recentTextBeforeBackspace
{
  return self->_recentTextBeforeBackspace;
}

- (NSMutableString)recentTextAfterBackspace
{
  return self->_recentTextAfterBackspace;
}

- (BOOL)backspacedIntoAutocorrection
{
  return self->_backspacedIntoAutocorrection;
}

- (void)setBackspacedIntoAutocorrection:(BOOL)a3
{
  self->_backspacedIntoAutocorrection = a3;
}

@end
