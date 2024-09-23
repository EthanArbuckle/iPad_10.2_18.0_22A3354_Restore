@implementation TIKeyboardInputManagerShapeBased

- (NSMutableString)searchString
{
  NSMutableString *searchString;
  NSMutableString *v4;
  NSMutableString *v5;

  searchString = self->_searchString;
  if (!searchString)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    v5 = self->_searchString;
    self->_searchString = v4;

    searchString = self->_searchString;
  }
  return searchString;
}

- (id)rawInputString
{
  void *v3;
  objc_super v5;

  if (-[TIKeyboardInputManagerShapeBased shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManagerShapeBased;
    -[TIKeyboardInputManagerShapeBased rawInputString](&v5, sel_rawInputString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unsigned)inputIndex
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)inputCount
{
  unsigned int v3;
  void *v4;
  objc_super v6;

  if (-[TIKeyboardInputManagerShapeBased shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerShapeBased;
    return -[TIKeyboardInputManagerShapeBased inputCount](&v6, sel_inputCount);
  }
  else
  {
    -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length");

  }
  return v3;
}

- (unint64_t)initialSelectedIndex
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    -[TIKeyboardInputManagerShapeBased inputString](self, "inputString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerShapeBased;
  v7 = -[TIKeyboardInputManagerChinese initialSelectedIndex](&v9, sel_initialSelectedIndex);
  if (v6)
    goto LABEL_5;
LABEL_6:

  return (unint64_t)v7;
}

- (BOOL)hasCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1)
  {
    -[TIKeyboardInputManagerShapeBased inputString](self, "inputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BEB5480];
  v7 = a3;
  v8 = [v6 alloc];
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerShapeBased keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v10, "hardwareKeyboardMode");
  v11 = (void *)objc_msgSend(v8, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:hardwareKeyboardMode:logger:", v9, v7, 0, 0x7FFFFFFFFFFFFFFFLL, v4, 0, 0, self, sel_notifyUpdateCandidates_forOperation_, 0, v15, 0);

  objc_msgSend(v11, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v13);
  }
  else
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performOperationAsync:", v11);
  }

  return v12 != 0;
}

- (id)candidateResultSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  if ((-[TIKeyboardInputManagerShapeBased shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
    goto LABEL_2;
  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    if (!-[TIKeyboardInputManagerChinese updateCompletionCandidatesIfAppropriate](self, "updateCompletionCandidatesIfAppropriate"))goto LABEL_6;
    goto LABEL_8;
  }
  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TIKeyboardInputManagerShapeBased updateCandidatesWithTIWordSearch:predictionEnabled:](self, "updateCandidatesWithTIWordSearch:predictionEnabled:", v8, 0);

    if (!v9)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_8:
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
LABEL_2:
  v3 = 0;
  return v3;
}

- (void)cancelCandidatesThread
{
  id v2;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  objc_super v23;

  -[TIKeyboardInputManagerShapeBased cancelCandidatesThread](self, "cancelCandidatesThread");
  if (-[TIKeyboardInputManagerShapeBased previousActionWasAutoConfirmation](self, "previousActionWasAutoConfirmation"))
  {
    -[TIKeyboardInputManagerShapeBased keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticGetKeyForCandidateAccepted();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarDecrement();

    -[TIKeyboardInputManagerShapeBased setPreviousActionWasAutoConfirmation:](self, "setPreviousActionWasAutoConfirmation:", 0);
  }
  if (-[TIKeyboardInputManagerShapeBased shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    -[TIKeyboardInputManagerChinese deleteFromInput:](&v23, sel_deleteFromInput_, a3, v22.receiver, v22.super_class, self, TIKeyboardInputManagerShapeBased);
  }
  else
  {
    -[TIKeyboardInputManagerShapeBased inputString](self, "inputString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSuffix:", *MEMORY[0x24BEB5A98]);

    if (v9)
    {
      -[TIKeyboardInputManagerShapeBased clearInput](self, "clearInput");
      return 0;
    }
    v11 = -[TIKeyboardInputManagerShapeBased inputIndex](self, "inputIndex");
    if (a3 && v11)
    {
      if (!*a3)
      {
        -[TIKeyboardInputManagerShapeBased keyboardState](self, "keyboardState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "documentState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "selectedRangeInMarkedText");
        v15 = v14;

        if (v15 <= 1)
          v16 = 1;
        else
          v16 = v15;
        *a3 = v16;
      }
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") >= *a3)
      {
        -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v19, "length") - *a3;

      }
      else
      {
        v18 = 0;
      }

      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deleteCharactersInRange:", v18, objc_msgSend(v21, "length") - v18);

    }
    if (!-[TIKeyboardInputManagerShapeBased inputCount](self, "inputCount"))
      -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
    -[TIKeyboardInputManagerChinese deleteFromInput:](&v22, sel_deleteFromInput_, a3, self, TIKeyboardInputManagerShapeBased, v23.receiver, v23.super_class);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clearInput
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerShapeBased searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteCharactersInRange:", 0, objc_msgSend(v4, "length"));

  if (!self->_keepRemainingInput)
    -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
  -[TIKeyboardInputManagerShapeBased cancelCandidatesThread](self, "cancelCandidatesThread");
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetPreviousWord");

  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  -[TIKeyboardInputManagerShapeBased setPreviousActionWasAutoConfirmation:](self, "setPreviousActionWasAutoConfirmation:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerShapeBased;
  -[TIKeyboardInputManagerChinese clearInput](&v6, sel_clearInput);
}

- (id)keyboardConfigurationLayoutTag
{
  if (-[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForCurrentInputContext](self, "shouldEnableHalfWidthPunctuationForCurrentInputContext"))
  {
    return CFSTR("HalfWidthPunctuation");
  }
  else
  {
    return CFSTR("Default");
  }
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DD8]);
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  return 0;
}

- (void)acceptInput
{
  objc_super v3;

  -[TIKeyboardInputManagerShapeBased clearInput](self, "clearInput");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerShapeBased;
  -[TIKeyboardInputManagerShapeBased acceptInput](&v3, sel_acceptInput);
}

- (void)inputLocationChanged
{
  objc_super v3;

  -[TIKeyboardInputManagerShapeBased clearInput](self, "clearInput");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerShapeBased;
  -[TIKeyboardInputManagerChinese inputLocationChanged](&v3, sel_inputLocationChanged);
}

- (BOOL)shouldLookForCompletionCandidates
{
  if (-[TIKeyboardInputManagerShapeBased inputCount](self, "inputCount"))
    return 0;
  else
    return !-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates");
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)sortingMethods
{
  if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
    return &unk_251987668;
  if (!-[TIKeyboardInputManagerChinese hasIdeographicCandidates](self, "hasIdeographicCandidates"))
    return &unk_251987680;
  if (+[CIMCandidateData shouldShowZhuyinSortingMethod](CIMCandidateData, "shouldShowZhuyinSortingMethod"))
  {
    return &unk_251987698;
  }
  return &unk_2519876B0;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManagerShapeBased;
  -[TIKeyboardInputManagerChinese didAcceptCandidate:](&v26, sel_didAcceptCandidate_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "autoconvertedCandidatePointerValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = -[TIKeyboardInputManagerChinese mecabraCandidateRefFromPointerValue:](self, "mecabraCandidateRefFromPointerValue:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10));
          -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
          {
            objc_msgSend(v12, "performAccept:isPartial:", v11, 0);
          }
          else
          {
            objc_msgSend(v4, "candidate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "commitSurface:", v14);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

  }
  v15 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v4);
  objc_msgSend(v4, "proactiveTrigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "candidate");
    v17 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v17;
  }
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15)
  {
    objc_msgSend(v18, "performAccept:isPartial:", v15, 0);
  }
  else
  {
    objc_msgSend(v4, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "commitSurface:", v20);

  }
  return v5;
}

- (id)markedTextWithAutoconvertedCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  -[TIKeyboardInputManagerShapeBased formattedSearchString](self, "formattedSearchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoconvertedCandidateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autoconvertedInputString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    if (v8 >= objc_msgSend(v3, "length"))
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "autoconvertedCandidates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v9, "count");
      if (!v12)
        goto LABEL_13;
      v13 = v12;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "input");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        v19 = v18 + v15;
        v20 = objc_msgSend(v3, "length");

        if (v19 >= v20)
          break;
        ++v14;
        v15 = v19;
        if (v13 == v14)
        {
          v15 = v19;
          v14 = v13;
          break;
        }
      }
      if (!v15)
      {
LABEL_13:
        v25 = v3;
        goto LABEL_14;
      }
      objc_msgSend(v9, "subarrayWithRange:", 0, v14 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "valueForKey:", CFSTR("candidate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", &stru_251980880);
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "substringFromIndex:", v15);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
      v5 = (void *)v23;
    }
    else
    {
      objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "stringByAppendingString:", v9);
    v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v10 = v25;

    goto LABEL_15;
  }
  v10 = v3;
LABEL_15:

  return v10;
}

- (id)searchStringForMarkedText
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoconvertedCandidateString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)previousActionWasAutoConfirmation
{
  return self->_previousActionWasAutoConfirmation;
}

- (void)setPreviousActionWasAutoConfirmation:(BOOL)a3
{
  self->_previousActionWasAutoConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
