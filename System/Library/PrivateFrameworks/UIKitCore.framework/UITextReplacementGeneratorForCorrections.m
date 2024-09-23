@implementation UITextReplacementGeneratorForCorrections

- (UITextReplacementGeneratorForCorrections)init
{
  UITextReplacementGeneratorForCorrections *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextReplacementGeneratorForCorrections;
  result = -[UITextReplacementGeneratorForCorrections init](&v3, sel_init);
  if (result)
    result->_maxEditDistance = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

+ (id)generatorForTextInput:(id)a3 range:(id)a4 options:(unint64_t)a5
{
  unsigned int v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UITextReplacementGeneratorForCorrections *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  int v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "autocorrectSpellingEnabled") && v8)
  {
    v10 = objc_msgSend(v8, "isEmpty");
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "rangeForTextReplacement:textInput:", v8, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "end");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

        if (v14 == -1)
        {
          v15 = 0;
          v16 = v11;
          goto LABEL_40;
        }
      }

    }
    else
    {
      v11 = v8;
    }
    objc_msgSend(v7, "textInRange:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
    {
      v15 = 0;
LABEL_39:
      v8 = v11;
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v9, "autocorrectionRecordForWord:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isAutocorrection");
    +[UITextChecker grammarAutocorrectionForWord:](UITextChecker, "grammarAutocorrectionForWord:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;

      v18 = 1;
      v17 = v21;
    }
    v22 = v10 ^ 1;
    if (!v17)
      v22 = 1;
    v42 = v20;
    v41 = v18;
    if ((v22 & 1) != 0)
      goto LABEL_30;
    objc_msgSend(v11, "end");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "baseWritingDirectionForPosition:inDirection:", v23, 0) == 1)
      v24 = 2;
    else
      v24 = 3;
    objc_msgSend(v17, "candidate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v23, v24, objc_msgSend(v25, "length"));
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v26;
    objc_msgSend(v7, "tokenizer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v27;
    if ((objc_msgSend(v28, "isPosition:atBoundary:inDirection:", v27, 1, 1) & 1) != 0)
    {
      objc_msgSend(v7, "textRangeFromPosition:toPosition:", v27, v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29;
      if (v30)
      {
        objc_msgSend(v7, "textInRange:", v30);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v17, "candidate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v39, "isEqual:", v31);

          if (v38)
          {
            v30 = v30;

            v31 = v31;
            v16 = v31;
            v11 = v30;
            goto LABEL_28;
          }
        }
LABEL_26:
        if ((objc_msgSend(v17, "isToucanInlineCompletionCandidate") & 1) != 0)
        {
          v32 = 0;
          goto LABEL_29;
        }
LABEL_28:
        v32 = 1;
LABEL_29:

        if (!v32)
        {
          v15 = 0;
LABEL_38:

          goto LABEL_39;
        }
LABEL_30:
        UIKeyboardGetCurrentInputMode();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = UIKeyboardCheckSpellingForInputMode(v33);

        v15 = objc_alloc_init(UITextReplacementGeneratorForCorrections);
        -[UITextReplacementGenerator setReplacementRange:](v15, "setReplacementRange:", v11);
        -[UITextReplacementGenerator setStringToReplace:](v15, "setStringToReplace:", v16);
        -[UITextReplacementGeneratorForCorrections setAutocorrectionRecord:](v15, "setAutocorrectionRecord:", v17);
        -[UITextReplacementGeneratorForCorrections setMaxEditDistance:](v15, "setMaxEditDistance:", 2);
        -[UITextReplacementGeneratorForCorrections setMaxCountAfterAutocorrectionGuesses:](v15, "setMaxCountAfterAutocorrectionGuesses:", 1);
        if (v34)
          v35 = 3;
        else
          v35 = 0;
        -[UITextReplacementGeneratorForCorrections setMaxCountAfterSpellingGuesses:](v15, "setMaxCountAfterSpellingGuesses:", v35);
        -[UITextReplacementGeneratorForCorrections setForceHistoryReplacement:](v15, "setForceHistoryReplacement:", (v5 & 4) == 0);
        if ((v5 & 2) != 0)
          v36 = v41 & (v5 >> 5);
        else
          v36 = 1;
        -[UITextReplacementGeneratorForCorrections setForceAutocorrectionGuesses:](v15, "setForceAutocorrectionGuesses:", v36);
        -[UITextReplacementGeneratorForCorrections setForceSpellingGuesses:](v15, "setForceSpellingGuesses:", (v5 & 1) == 0);
        goto LABEL_38;
      }
    }
    else
    {

      v30 = 0;
    }
    v31 = 0;
    goto LABEL_26;
  }
  v15 = 0;
LABEL_41:

  return v15;
}

+ (id)rangeForTextReplacement:(id)a3 textInput:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEmpty"))
  {
    objc_msgSend(v6, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "comparePosition:toPosition:", v10, v11);

      if (v12 == -1
        || (objc_msgSend(v9, "end"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v6, "comparePosition:toPosition:", v10, v13),
            v13,
            v14 == 1))
      {

        v9 = 0;
      }

      v5 = v9;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isStringMisspelled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  -[UITextReplacementGeneratorForCorrections textChecker](self, "textChecker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "length");
    -[UITextReplacementGeneratorForCorrections textChecker](self, "textChecker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v4, 0, v7, 0, 0, v6);
    v10 = v9;

    if (v10)
      LOBYTE(v10) = v10 == objc_msgSend(v4, "length");

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isStringToReplaceMisspelled
{
  UITextReplacementGeneratorForCorrections *v2;
  void *v3;

  v2 = self;
  -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[UITextReplacementGeneratorForCorrections isStringMisspelled:](v2, "isStringMisspelled:", v3);

  return (char)v2;
}

- (id)addReplacementRevertingAutocorrectionToReplacements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11
      && -[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v7, v4))
    {
      -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUsageTrackingMask:", objc_msgSend(v13, "usageTrackingMask"));

      objc_msgSend(v4, "addObject:", v12);
      v14 = v7;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addPreviouslySuggestedAutocorrectionToReplacements:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (v8)
    {
      -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v10, v15);

      if (v11)
      {
        -[UITextReplacementGeneratorForCorrections autocorrectionRecord](self, "autocorrectionRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "candidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v14);

      }
    }
  }

}

- (void)addAutocorrectionGuessesToReplacements:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 < -[UITextReplacementGeneratorForCorrections maxCountAfterAutocorrectionGuesses](self, "maxCountAfterAutocorrectionGuesses"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    objc_msgSend(v6, "generateAutocorrectionReplacements:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_msgSend(v13, "candidate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v14, v4);

        if (v15)
        {
          -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "candidate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "_editDistanceFrom:", v17);
          v19 = -[UITextReplacementGeneratorForCorrections maxEditDistance](self, "maxEditDistance");

          if (v18 <= v19)
          {
            objc_msgSend(v13, "candidate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v21);

            v22 = objc_msgSend(v4, "count");
            if (v22 >= -[UITextReplacementGeneratorForCorrections maxCountAfterAutocorrectionGuesses](self, "maxCountAfterAutocorrectionGuesses"))break;
          }
        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)addSpellingGuessesForString:(id)a3 ToReplacements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UITextReplacementGeneratorForCorrections textChecker](self, "textChecker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v7, "count");
    if (v9 < -[UITextReplacementGeneratorForCorrections maxCountAfterSpellingGuesses](self, "maxCountAfterSpellingGuesses"))
    {
      v10 = objc_msgSend(v6, "length");
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentInputMode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "languageWithRegion");
      v13 = objc_claimAutoreleasedReturnValue();

      -[UITextReplacementGeneratorForCorrections textChecker](self, "textChecker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)v13;
      v39 = v6;
      objc_msgSend(v14, "grammarGuessesForRange:inString:language:", 0, v10, v6, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v45;
LABEL_5:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v20);
          if (-[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v21, v7))
          {
            -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v22);

            v23 = objc_msgSend(v7, "count");
            if (v23 >= -[UITextReplacementGeneratorForCorrections maxCountAfterSpellingGuesses](self, "maxCountAfterSpellingGuesses"))break;
          }
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
            if (v18)
              goto LABEL_5;
            break;
          }
        }
      }
      v37 = v16;

      -[UITextReplacementGeneratorForCorrections textChecker](self, "textChecker");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "guessesForWordRange:inString:language:", 0, v10, v39, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v41;
LABEL_14:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v30);
          v32 = objc_msgSend(v7, "count");
          if (v32 >= -[UITextReplacementGeneratorForCorrections maxCountAfterSpellingGuesses](self, "maxCountAfterSpellingGuesses"))break;
          if (-[UITextReplacementGenerator shouldAllowString:intoReplacements:](self, "shouldAllowString:intoReplacements:", v31, v7))
          {
            -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "_editDistanceFrom:", v31);
            v35 = -[UITextReplacementGeneratorForCorrections maxEditDistance](self, "maxEditDistance");

            if (v34 <= v35)
            {
              -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v31);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v36);

            }
          }
          if (v28 == ++v30)
          {
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v28)
              goto LABEL_14;
            break;
          }
        }
      }

      v6 = v39;
    }
  }

}

- (id)replacements
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  BOOL v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[UITextReplacementGenerator replacementRange](self, "replacementRange");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "autocorrectSpellingEnabled");

    if (v7)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", v9, 2);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL
        && -[UITextReplacementGeneratorForCorrections isStringMisspelled:](self, "isStringMisspelled:", v8))
      {
        v11 = 1;
        goto LABEL_35;
      }
      if (-[UITextReplacementGeneratorForCorrections forceSpellingGuesses](self, "forceSpellingGuesses"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "generateAutocorrectionListForSelectedText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "autocorrection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "candidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v16, "_containsEmoji") & 1) != 0)
        {
          +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currentInputMode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "primaryLanguage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "typingNameForEmoji:language:", v16, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "length"))
          {
            -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v22);

          }
          goto LABEL_14;
        }
        objc_msgSend(v14, "emojiList");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          v21 = v16;
LABEL_14:
          v44 = v21;
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v14, "predictions");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v50;
LABEL_16:
            v29 = 0;
            while (1)
            {
              if (*(_QWORD *)v50 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v29), "candidate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v31);

              if ((unint64_t)objc_msgSend(v5, "count") > 1)
                break;
              if (v27 == ++v29)
              {
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
                if (v27)
                  goto LABEL_16;
                break;
              }
            }
          }

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v14, "emojiList");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v46;
LABEL_24:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v46 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v36), "candidate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v38);

              if ((unint64_t)objc_msgSend(v5, "count") > 2)
                break;
              if (v34 == ++v36)
              {
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
                if (v34)
                  goto LABEL_24;
                break;
              }
            }
          }

          v39 = v5;
          goto LABEL_45;
        }

      }
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_44:
        v43 = v5;
LABEL_45:

        return v5;
      }
      if (!-[UITextReplacementGeneratorForCorrections forceHistoryReplacement](self, "forceHistoryReplacement"))
        goto LABEL_39;
      v11 = 0;
LABEL_35:
      -[UITextReplacementGeneratorForCorrections addReplacementRevertingAutocorrectionToReplacements:](self, "addReplacementRevertingAutocorrectionToReplacements:", v5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = v40;

        v42 = -[UITextReplacementGeneratorForCorrections isStringMisspelled:](self, "isStringMisspelled:", v41);
        v8 = v41;
        if (v42)
        {
LABEL_37:
          -[UITextReplacementGeneratorForCorrections addAutocorrectionGuessesToReplacements:](self, "addAutocorrectionGuessesToReplacements:", v5);
LABEL_42:
          -[UITextReplacementGeneratorForCorrections addSpellingGuessesForString:ToReplacements:](self, "addSpellingGuessesForString:ToReplacements:", v8, v5);
          if (!self->_showRevertingAutocorrectionInPredictionView)
            -[UITextReplacementGenerator addPlaceholderForEmptyReplacements:](self, "addPlaceholderForEmptyReplacements:", v5);
          goto LABEL_44;
        }
      }
      else
      {
        -[UITextReplacementGeneratorForCorrections addPreviouslySuggestedAutocorrectionToReplacements:](self, "addPreviouslySuggestedAutocorrectionToReplacements:", v5);
        if ((v11 & 1) != 0)
          goto LABEL_37;
      }
LABEL_39:
      if (-[UITextReplacementGeneratorForCorrections forceAutocorrectionGuesses](self, "forceAutocorrectionGuesses"))
        -[UITextReplacementGeneratorForCorrections addAutocorrectionGuessesToReplacements:](self, "addAutocorrectionGuessesToReplacements:", v5);
      if (!-[UITextReplacementGeneratorForCorrections forceSpellingGuesses](self, "forceSpellingGuesses"))
        goto LABEL_44;
      goto LABEL_42;
    }
    return 0;
  }
  return v5;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
  objc_storeStrong((id *)&self->_textChecker, a3);
}

- (TIKeyboardCandidate)autocorrectionRecord
{
  return self->_autocorrectionRecord;
}

- (void)setAutocorrectionRecord:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectionRecord, a3);
}

- (BOOL)forceHistoryReplacement
{
  return self->_forceHistoryReplacement;
}

- (void)setForceHistoryReplacement:(BOOL)a3
{
  self->_forceHistoryReplacement = a3;
}

- (unint64_t)maxEditDistance
{
  return self->_maxEditDistance;
}

- (void)setMaxEditDistance:(unint64_t)a3
{
  self->_maxEditDistance = a3;
}

- (unint64_t)maxCountAfterAutocorrectionGuesses
{
  return self->_maxCountAfterAutocorrectionGuesses;
}

- (void)setMaxCountAfterAutocorrectionGuesses:(unint64_t)a3
{
  self->_maxCountAfterAutocorrectionGuesses = a3;
}

- (BOOL)forceAutocorrectionGuesses
{
  return self->_forceAutocorrectionGuesses;
}

- (void)setForceAutocorrectionGuesses:(BOOL)a3
{
  self->_forceAutocorrectionGuesses = a3;
}

- (unint64_t)maxCountAfterSpellingGuesses
{
  return self->_maxCountAfterSpellingGuesses;
}

- (void)setMaxCountAfterSpellingGuesses:(unint64_t)a3
{
  self->_maxCountAfterSpellingGuesses = a3;
}

- (BOOL)forceSpellingGuesses
{
  return self->_forceSpellingGuesses;
}

- (void)setForceSpellingGuesses:(BOOL)a3
{
  self->_forceSpellingGuesses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocorrectionRecord, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
}

@end
