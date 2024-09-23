@implementation TIRevisionHistory

- (void)enumerateSentenceStemUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  uint64_t v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v10 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TIRevisionHistory_enumerateSentenceStemUsingBlock___block_invoke;
  v6[3] = &unk_1EA1001D0;
  v7 = v4;
  v8 = v9;
  v6[4] = self;
  v5 = v4;
  -[TIRevisionHistory enumerateSentenceStemUsingIteratorBlock:](self, "enumerateSentenceStemUsingIteratorBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateSentenceStemUsingIteratorBlock:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD, char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  char v14;

  v4 = (void (**)(id, uint64_t, _QWORD, char *))a3;
  v14 = 0;
  v5 = -[TIRevisionHistory iteratorUpperBoundForSelectionStart](self, "iteratorUpperBoundForSelectionStart");
  if (v5)
  {
    v7 = v5;
    v8 = v6;
    v9 = 0;
    do
    {
      v7 = -[TIRevisionHistory previousTokenIterator:](self, "previousTokenIterator:", v7, v8);
      v8 = v10;
      -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7, v8, &v14);
      if ((unint64_t)objc_msgSend(v11, "tokenID") >> 32 == 1)
      {
        ++v9;
        if (v14)
          v12 = 1;
        else
          v12 = v9 > 2;
        v13 = v12;
        v14 = v13;
      }

    }
    while (!v14 && v7);
  }

}

- (_TIRevisionHistoryTokenIterator)iteratorUpperBoundForSelectionStart
{
  uint64_t i;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _TIRevisionHistoryTokenIterator result;

  for (i = -[TIRevisionHistory currentTokenIterator](self, "currentTokenIterator");
        ;
        i = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v5, v6))
  {
    v5 = i;
    v6 = v4;
    -[TIRevisionHistory tokenization](self, "tokenization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v7, "count"))
      break;
    v8 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", v5, v6);
    v9 = -[TIRevisionHistory selectedRange](self, "selectedRange");

    if (v8 > v9)
      goto LABEL_6;
  }

LABEL_6:
  v10 = v5;
  v11 = v6;
  result.documentLocation = v11;
  result.tokenIndex = v10;
  return result;
}

- (NSMutableArray)tokenization
{
  return self->_tokenization;
}

- (_TIRevisionHistoryTokenIterator)currentTokenIterator
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  _TIRevisionHistoryTokenIterator result;

  documentLocation = self->_currentTokenIterator.documentLocation;
  tokenIndex = self->_currentTokenIterator.tokenIndex;
  result.documentLocation = documentLocation;
  result.tokenIndex = tokenIndex;
  return result;
}

- (void)syncToDocumentState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (!-[TIRevisionHistory matchesDocumentState:](self, "matchesDocumentState:"))
  {
    if (!-[TIRevisionHistory isDeletingBackwards](self, "isDeletingBackwards")
      || (v4 = -[TIRevisionHistory deletionRangeToObtainDocumentState:](self, "deletionRangeToObtainDocumentState:", v8),
          v4 == 0x7FFFFFFFFFFFFFFFLL)
      || !v5
      || (-[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v4, v5),
          -[TIRevisionHistory replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:](self, "replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:", &stru_1EA1081D0, 0, 2, 0), -[TIRevisionHistory selectedRange](self, "selectedRange") == 0)&& (objc_msgSend(v8, "contextBeforeInput"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "length"), v6, v7))
    {
      -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 0);
      -[TIRevisionHistory acceptCurrentSentence](self, "acceptCurrentSentence");
      -[TIRevisionHistory resetToDocumentState:](self, "resetToDocumentState:", v8);
    }
  }

}

- (BOOL)matchesDocumentState:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIRevisionHistory matchesContextBeforeSelection:](self, "matchesContextBeforeSelection:", v5);

  if (v6
    && (objc_msgSend(v4, "selectedText"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[TIRevisionHistory matchesSelectedText:](self, "matchesSelectedText:", v7),
        v7,
        v8))
  {
    objc_msgSend(v4, "contextAfterInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TIRevisionHistory matchesContextAfterSelection:](self, "matchesContextAfterSelection:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)matchesSelectedText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    -[TIRevisionHistory selectedRange](self, "selectedRange");
    if (v6 == v7)
    {
      -[TIRevisionHistory documentText](self, "documentText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[TIRevisionHistory selectedRange](self, "selectedRange");
      v11 = objc_msgSend(v8, "compare:options:range:", v5, 2, v9, v10) == 0;

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[TIRevisionHistory selectedRange](self, "selectedRange");
    v11 = v12 == 0;
  }

  return v11;
}

- (BOOL)matchesContextBeforeSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    if (v6 == -[TIRevisionHistory selectedRange](self, "selectedRange"))
    {
      -[TIRevisionHistory documentText](self, "documentText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "compare:options:range:", v5, 2, 0, -[TIRevisionHistory selectedRange](self, "selectedRange")) == 0;

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = -[TIRevisionHistory selectedRange](self, "selectedRange") == 0;
  }

  return v8;
}

- (_NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRange.length;
  location = self->_selectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)matchesContextAfterSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    -[TIRevisionHistory documentText](self, "documentText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    v9 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v11 = v8 - (v10 + v9);

    if (v6 != v11)
    {
      v19 = 0;
      goto LABEL_10;
    }
    -[TIRevisionHistory documentText](self, "documentText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v15 = objc_msgSend(v12, "compare:options:range:", v5, 2, v13 + v14, objc_msgSend(v5, "length")) == 0;
  }
  else
  {
    v16 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v18 = v16 + v17;
    -[TIRevisionHistory documentText](self, "documentText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18 == objc_msgSend(v12, "length");
  }
  v19 = v15;

LABEL_10:
  return v19;
}

- (NSString)documentText
{
  return self->_documentText;
}

- (void)setIsDeletingBackwards:(BOOL)a3
{
  self->_isDeletingBackwards = a3;
}

- (void)acceptTokensInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  _BOOL4 v46;
  id v47;
  id v48;
  unsigned __int8 v49;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    -[TIRevisionHistory contextForTokenAtIndex:](self, "contextForTokenAtIndex:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x1E0DBE8C0];
    v42 = *MEMORY[0x1E0DBE8B8];
    v43 = v6;
    do
    {
      -[TIRevisionHistory tokenization](self, "tokenization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v8, "tokenID") >> 32
        || (objc_msgSend(v8, "tokenInputString"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "length"),
            v9,
            !v10))
      {
        v19 = 0;
      }
      else
      {
        v49 = 0;
        -[TIRevisionHistory delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tokenInputString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        v13 = objc_msgSend(v11, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", v12, v6, 22, &v48, &v49);
        v14 = v48;

        v15 = v49 == 0;
        if (HIDWORD(v13) || (objc_msgSend(v8, "isAccepted") & 1) != 0)
        {
          objc_msgSend(v8, "setTokenID:", v13);
        }
        else
        {
          -[TIRevisionHistory delegate](self, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "tokenInputString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v14;
          v32 = objc_msgSend(v30, "addWord:contextTokens:surfaceFormPtr:", v31, v43, &v47);
          v45 = v47;

          objc_msgSend(v8, "setTokenID:", v32);
          -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
          v33 = objc_claimAutoreleasedReturnValue();
          if (!v33)
            goto LABEL_25;
          v34 = (void *)v33;
          -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "tokenInputString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "tokenInputString");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v36, "isEqualToString:", v37);
          v38 = v49;

          if ((v41 & 1) != 0)
          {
LABEL_25:
            v14 = v45;
          }
          else
          {
            if (!v38)
            {
              -[TIRevisionHistory delegate](self, "delegate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "incrementUsageTrackingKey:", v40);

            }
            v14 = v45;
          }
        }
        v46 = v15;
        if (v14
          && (objc_msgSend(v8, "tokenDictionaryString"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v14, "isEqualToString:", v16),
              v16,
              (v17 & 1) == 0))
        {
          objc_msgSend(v8, "setTokenDictionaryString:", v14);
        }
        else
        {
          objc_msgSend(v8, "tokenInputString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTokenDictionaryString:", v18);

        }
        -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "tokenInputString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "tokenInputString");
          v44 = v14;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToString:", v24);
          v26 = v49;

          v14 = v44;
          if ((v25 & 1) == 0 && !v26)
          {
            -[TIRevisionHistory delegate](self, "delegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "incrementUsageTrackingKey:", v42);

            v14 = v44;
          }
        }

        v6 = v43;
        v19 = v46;
      }
      -[TIRevisionHistory collectPFLTelemetryForTokenAtIndex:](self, "collectPFLTelemetryForTokenAtIndex:", location);
      -[TIRevisionHistory acceptToken:contextTokens:saveToDifferentialPrivacy:](self, "acceptToken:contextTokens:saveToDifferentialPrivacy:", v8, v6, v19);
      v28 = objc_msgSend(v8, "tokenID");
      objc_msgSend(v8, "tokenInputString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendToken:string:", v28, v29);

      ++location;
      --length;
    }
    while (length);

  }
}

- (void)acceptCurrentSentence
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 0);
  v3 = -[TIRevisionHistory currentTokenIterator](self, "currentTokenIterator");
  v5 = v4;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v8 = v3;
LABEL_7:

    v13 = (id)v10;
  }
  else
  {
    v7 = 0;
    v8 = v3;
    while (1)
    {
      v13 = v7;
      v9 = objc_msgSend(v7, "tokenID");

      if (HIDWORD(v9) == 2)
        break;
      -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", v8, v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v8, v5);
      v5 = v11;
      -[TIRevisionHistory tokenization](self, "tokenization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "count");
      v7 = (void *)v10;
      if (v8 >= v12)
        goto LABEL_7;
    }
  }
  -[TIRevisionHistory acceptTokensInRange:](self, "acceptTokensInRange:", v3, v8 - v3);

}

- (void)dealloc
{
  objc_super v3;

  if (self->_tokenizer)
    LMStreamTokenizerRelease();
  v3.receiver = self;
  v3.super_class = (Class)TIRevisionHistory;
  -[TIRevisionHistory dealloc](&v3, sel_dealloc);
}

- (TIRevisionHistory)init
{
  void *v3;
  TIRevisionHistory *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIRevisionHistory initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (TIRevisionHistory)initWithLocale:(id)a3
{
  id v4;
  TIRevisionHistory *v5;
  NSString *v6;
  NSString *documentText;
  NSMutableArray *v8;
  NSMutableArray *tokenization;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIRevisionHistory;
  v5 = -[TIRevisionHistory init](&v12, sel_init);
  if (v5)
  {
    v6 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    documentText = v5->_documentText;
    v5->_documentText = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tokenization = v5->_tokenization;
    v5->_tokenization = v8;

    v10 = LMStreamTokenizerCreate();
    v5->_tokenizer = (void *)v10;
    v5->_shouldReportRevisionToDP = 1;
    if (!v10)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)acceptToken:(id)a3 contextTokens:(id)a4 saveToDifferentialPrivacy:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isAccepted") & 1) != 0)
    goto LABEL_37;
  objc_msgSend(v8, "setAccepted:", 1);
  if ((((unint64_t)objc_msgSend(v8, "tokenID") >> 32) - 500) <= 0xFFFFFE0C)
  {
    if ((objc_msgSend(v8, "usageLearningMask") & 4) != 0)
      objc_msgSend(v8, "userTyping");
    else
      objc_msgSend(v8, "tokenInputString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokenInputString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "softLearningRegisterAccepted:typed:", v12, v10);

  }
  -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v8, "tokenID");

    if (HIDWORD(v15) != 1)
    {
      objc_msgSend(v8, "tokenInputString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userTyping");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqualToString:", v18);

      if (v19)
      {
        -[TIRevisionHistory delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x1E0DBE550];
        -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", v21, objc_msgSend(v22, "usageTrackingMask"));
      }
      else
      {
        if ((objc_msgSend(v8, "usageLearningMask") & 4) != 0)
        {
LABEL_14:
          if (-[TIRevisionHistory shouldReportRevisionToDP](self, "shouldReportRevisionToDP"))
          {
            objc_msgSend(v8, "tokenInputString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "_containsSymbolsAndPunctuationOnly"))
            {

            }
            else
            {
              objc_msgSend(v8, "tokenInputString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "userTyping");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "localizedCaseInsensitiveCompare:", v28))
              {
                -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (objc_msgSend(v29, "usageTrackingMask") & 0x80000) == 0;

              }
              else
              {
                v30 = 0;
              }

              if (v30)
                v5 = v5 | 2;
              else
                v5 = v5;
            }
          }
          -[TIRevisionHistory setLastRejectedToken:](self, "setLastRejectedToken:", 0);
          -[TIRevisionHistory setShouldReportRevisionToDP:](self, "setShouldReportRevisionToDP:", 1);
          goto LABEL_24;
        }
        -[TIRevisionHistory delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "tokenInputString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tokenInputString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "registerRevisionFrom:to:contextTokens:", v23, v24, v9);

      }
      goto LABEL_14;
    }
  }
LABEL_24:
  if ((unint64_t)objc_msgSend(v8, "tokenID") >> 32 != 2
    && (unint64_t)objc_msgSend(v8, "tokenID") >> 32 != 1)
  {
    -[TIRevisionHistory delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "incrementUsageTrackingKeyForAppWithIsSentence:", 0);

  }
  -[TIRevisionHistory delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isStringBasedModel") & 1) != 0)
    objc_msgSend(v8, "tokenInputString");
  else
    objc_msgSend(v8, "tokenDictionaryString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tokenLatinInputString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v8, "tokenLatinInputString");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = &stru_1EA1081D0;
  }

  -[TIRevisionHistory delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "incrementLanguageModelCount:latinInputString:tokenID:contextTokens:saveToDifferentialPrivacy:", v33, v35, objc_msgSend(v8, "tokenID"), v9, v5);

  if (!((unint64_t)objc_msgSend(v8, "tokenID") >> 32))
  {
    -[TIRevisionHistory delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isStringBasedModel");

    if (v38)
    {
      v42 = 0;
      -[TIRevisionHistory delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokenInputString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      objc_msgSend(v8, "setTokenID:", objc_msgSend(v39, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", v40, v9, 22, &v41, &v42));

    }
  }

LABEL_37:
}

- (void)rejectToken:(id)a3 contextTokens:(id)a4 negativeLearningHint:(int)a5 withRevisedToken:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(v27, "isAccepted") & 1) != 0)
  {
    objc_msgSend(v27, "tokenInputString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tokenInputString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", v13))
    {
      objc_msgSend(v27, "tokenInputString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(v27, "tokenInputString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_containsSymbolsAndPunctuationOnly");

        if ((v16 & 1) != 0)
        {
LABEL_13:
          -[TIRevisionHistory delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isStringBasedModel") & 1) != 0)
            objc_msgSend(v27, "tokenInputString");
          else
            objc_msgSend(v27, "tokenDictionaryString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "tokenLatinInputString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v27, "tokenLatinInputString");
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = &stru_1EA1081D0;
          }

          -[TIRevisionHistory delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "decrementLanguageModelCount:latinInputString:tokenID:contextTokens:", v19, v20, objc_msgSend(v27, "tokenID"), v10);

          if (a5 && (((unint64_t)objc_msgSend(v27, "tokenID") >> 32) - 500) <= 0xFFFFFE0C)
          {
            -[TIRevisionHistory delegate](self, "delegate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "tokenInputString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "softLearningRegisterDeleted:", v25);

          }
          objc_msgSend(v27, "setAccepted:", 0);
          if ((unint64_t)objc_msgSend(v27, "tokenID") >> 32 == 1)
          {
            -[TIRevisionHistory setShouldReportRevisionToDP:](self, "setShouldReportRevisionToDP:", 0);
          }
          else
          {
            -[TIRevisionHistory lastRejectedToken](self, "lastRejectedToken");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
              -[TIRevisionHistory setShouldReportRevisionToDP:](self, "setShouldReportRevisionToDP:", 0);
            if ((((unint64_t)objc_msgSend(v27, "tokenID") >> 32) - 500) <= 0xFFFFFE0C)
              -[TIRevisionHistory setLastRejectedToken:](self, "setLastRejectedToken:", v27);
          }
          goto LABEL_28;
        }
        -[TIRevisionHistory delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "incrementUsageTrackingKey:", *MEMORY[0x1E0DBE8C8]);

        -[TIRevisionHistory delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", *MEMORY[0x1E0DBE588], objc_msgSend(v27, "usageTrackingMask"));
LABEL_12:

        goto LABEL_13;
      }

    }
    goto LABEL_12;
  }
  v18 = objc_msgSend(v27, "usageLearningMask");
  if (a5
    && (v18 & 4) != 0
    && (((unint64_t)objc_msgSend(v27, "tokenID") >> 32) - 500) <= 0xFFFFFE0C)
  {
    -[TIRevisionHistory delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tokenInputString");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "softLearningRegisterDeleted:", v20);
LABEL_28:

  }
}

- (id)contextForTokenAtIndex:(unint64_t)a3
{
  TIContextTokens *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init(TIContextTokens);
  if (a3)
  {
    v6 = 0;
    v7 = a3 - 1;
    while (1)
    {
      -[TIRevisionHistory tokenization](self, "tokenization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v9, "tokenID") >> 32 == 1 && (unint64_t)++v6 >= 3)
        break;

      if (--v7 == -1)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    v7 = 0;
  }
  if (v7 < a3)
  {
    do
    {
      -[TIRevisionHistory tokenization](self, "tokenization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "tokenID");
      objc_msgSend(v11, "tokenInputString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIContextTokens appendToken:string:](v5, "appendToken:string:", v12, v13);

      ++v7;
    }
    while (a3 != v7);
  }
  -[TIRevisionHistory delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fillReversedConversationHistoryInContext:", v5);

  return v5;
}

- (void)rejectTokensInRange:(_NSRange)a3 negativeLearningHint:(int)a4 newRevision:(id)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = *(_QWORD *)&a4;
  length = a3.length;
  location = a3.location;
  v9 = a5;
  if (length)
  {
    v20 = v9;
    v10 = 0;
    v11 = location - 1;
    do
    {
      v12 = objc_msgSend(v20, "branchedTokenIndex");
      if (!v10 || !objc_msgSend(v10, "size"))
      {
        -[TIRevisionHistory contextForTokenAtIndex:](self, "contextForTokenAtIndex:", v11 + length);
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
      v14 = v11 + length - v12;
      -[TIRevisionHistory tokenization](self, "tokenization");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v11 + length);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "branchTokens");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 >= objc_msgSend(v17, "count"))
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v20, "branchTokens");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[TIRevisionHistory rejectToken:contextTokens:negativeLearningHint:withRevisedToken:](self, "rejectToken:contextTokens:negativeLearningHint:withRevisedToken:", v16, v10, v5, v19);
      if (objc_msgSend(v10, "size"))
        objc_msgSend(v10, "popBack");

      --length;
    }
    while (length);

    v9 = v20;
  }

}

- (void)migrateUserTypingFromDeletedTokens:(id)a3 toInsertedTokens:(id)a4 withUsageLearningMask:(unsigned int)a5 usageTrackingMask:(unsigned int)a6
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  int v33;
  id v35;

  v6 = *(_QWORD *)&a5;
  v35 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = v6 & 5;
    v33 = v10;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= objc_msgSend(v35, "count"))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v35, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "userTyping");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (const __CFString *)v13;
      else
        v15 = &stru_1EA1081D0;
      objc_msgSend(v11, "setUserTyping:", v15);

      objc_msgSend(v8, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v16)
        goto LABEL_18;
      v17 = objc_msgSend(v8, "count");
      v18 = objc_msgSend(v35, "count");

      if (v17 < v18)
        break;
LABEL_19:
      objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v12, "usageLearningMask"));
      objc_msgSend(v11, "setUsageTrackingMask:", objc_msgSend(v12, "usageTrackingMask"));
      objc_msgSend(v11, "tokenInputString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userTyping");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if ((v29 & 1) == 0)
        objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v11, "usageLearningMask") | v10);
      if (!v9)
      {
        if ((v6 & 2) != 0)
          objc_msgSend(v11, "setUsageLearningMask:", objc_msgSend(v11, "usageLearningMask") | 2);
        objc_msgSend(v11, "tokenInputString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "tokenInputString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        if ((v32 & 1) == 0)
          objc_msgSend(v11, "setUsageTrackingMask:", a6);
      }

      if (++v9 >= objc_msgSend(v8, "count"))
        goto LABEL_27;
    }
    v19 = v6;
    v20 = objc_alloc(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v12, "userTyping");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1EA1081D0;
    v16 = (void *)objc_msgSend(v20, "initWithString:", v23);

    for (i = v9 + 1; i < objc_msgSend(v35, "count"); ++i)
    {
      objc_msgSend(v35, "objectAtIndex:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userTyping");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendFormat:", CFSTR(" %@"), v26);

    }
    objc_msgSend(v11, "setUserTyping:", v16);
    v6 = v19;
    v10 = v33;
LABEL_18:

    goto LABEL_19;
  }
LABEL_27:

}

- (void)collectPFLTelemetryForTokenAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  -[TIRevisionHistory tokenization](self, "tokenization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v16, "tokenID");
  v7 = v16;
  if (HIDWORD(v6) == 2)
  {
    v8 = objc_msgSend(v16, "isAccepted");
    v7 = v16;
    if ((v8 & 1) == 0)
    {
      -[TIRevisionHistory tokenization](self, "tokenization");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      v11 = 0;
      do
      {
        if (a3 >= v10)
          break;
        ++v11;
        -[TIRevisionHistory tokenization](self, "tokenization");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "tokenID");
        --a3;

      }
      while (HIDWORD(v14) != 1);
      v7 = v16;
      if (v11 >= 5)
      {
        -[TIRevisionHistory delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "incrementUsageTrackingKeyForAppWithIsSentence:", 1);

        v7 = v16;
      }
    }
  }

}

- (id)tokenAtIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t tokenIndex;
  void *v4;
  void *v5;

  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization", a3.tokenIndex, a3.documentLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", tokenIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_NSRange)documentRangeOfTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  void *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", tokenIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "offset") + documentLocation;
  objc_msgSend(v6, "tokenInputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_TIRevisionHistoryTokenIterator)nextTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _TIRevisionHistoryTokenIterator result;

  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", tokenIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "offset");
  objc_msgSend(v6, "tokenInputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + documentLocation + objc_msgSend(v8, "length");

  v10 = tokenIndex + 1;
  v11 = v9;
  result.documentLocation = v11;
  result.tokenIndex = v10;
  return result;
}

- (_TIRevisionHistoryTokenIterator)previousTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _TIRevisionHistoryTokenIterator result;

  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", --tokenIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "offset");
  objc_msgSend(v6, "tokenInputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = documentLocation - v7 - objc_msgSend(v8, "length");

  v10 = tokenIndex;
  v11 = v9;
  result.documentLocation = v11;
  result.tokenIndex = v10;
  return result;
}

- (_NSRange)selectedTokenRangeWithIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (tokenIndex >= objc_msgSend(v6, "count"))
  {
    v7 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

    v8 = v15;
  }
  else
  {
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v9 = -[TIRevisionHistory selectedRange](self, "selectedRange");
      v11 = v9 + v10;

      if (documentLocation >= v11)
        break;
      v12 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", tokenIndex, documentLocation);
      v14 = v12;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL
        || (v15 = 0x7FFFFFFFFFFFFFFFLL,
            v12 + v13 > (unint64_t)-[TIRevisionHistory selectedRange](self, "selectedRange"))
        && (v8 = tokenIndex, tokenIndex != 0x7FFFFFFFFFFFFFFFLL))
      {
        v16 = -[TIRevisionHistory selectedRange](self, "selectedRange");
        if (v14 < v16 + v17)
          ++v7;
        v15 = v8;
      }
      tokenIndex = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", tokenIndex, documentLocation);
      documentLocation = v18;
      -[TIRevisionHistory tokenization](self, "tokenization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      if (tokenIndex >= objc_msgSend(v6, "count"))
        goto LABEL_13;
    }
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v19 = tokenIndex;
  else
    v19 = v8;
  v20 = v7;
  result.length = v20;
  result.location = v19;
  return result;
}

- (id)nonEmptyTokensInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3.length); length; --length)
  {
    -[TIRevisionHistory tokenization](self, "tokenization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", location);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "tokenInputString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      objc_msgSend(i, "addObject:", v8);

    ++location;
  }
  return i;
}

- (_TIRevisionHistoryTokenIterator)popSelectedTextFromTokenizer
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _TIRevisionHistoryTokenIterator result;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v17 = 0;
  v18 = 0;
  v16 = "";
  v17 = -[TIRevisionHistory currentTokenIterator](self, "currentTokenIterator");
  v18 = v3;
  if (-[TIRevisionHistory selectedRange](self, "selectedRange"))
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v7 = objc_msgSend(v4, "_UTF8SizeOfRange:", v5, v6);

    if (v7)
    {
      -[TIRevisionHistory tokenizer](self, "tokenizer");
      LMStreamTokenizerPopBytes();
    }
  }
  else
  {
    -[TIRevisionHistory tokenizer](self, "tokenizer");
    LMStreamTokenizerReset();
    v8 = v14;
    v14[4] = 0;
    v8[5] = 0;
  }
  v9 = v14[4];
  v10 = v14[5];
  _Block_object_dispose(&v13, 8);
  v11 = v9;
  v12 = v10;
  result.documentLocation = v12;
  result.tokenIndex = v11;
  return result;
}

- (unint64_t)tokenizeDocumentTextInRange:(_NSRange)a3 withTokenHandler:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[TIRevisionHistory documentText](self, "documentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke;
  v12[3] = &unk_1EA1000C8;
  v12[4] = self;
  v13 = v7;
  v14 = &v15;
  v9 = v7;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", location, length, 514, v12);

  v10 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)adjustTokenOffsetAfterDeletedTokenRange:(_NSRange)a3 withDeletedCharacterCount:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  void *v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  length = a3.length;
  location = a3.location;
  v8 = a3.location + a3.length;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    for (i = 0; length; --length)
    {
      -[TIRevisionHistory tokenization](self, "tokenization");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", location);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "offset");
      objc_msgSend(v13, "tokenInputString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      i += v14 + objc_msgSend(v15, "length");

      ++location;
    }
    -[TIRevisionHistory tokenization](self, "tokenization");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v8);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v19, "offset");
    -[TIRevisionHistory selectedRange](self, "selectedRange");
    objc_msgSend(v19, "setOffset:", i - a4 + v17 + v18);

  }
}

- (BOOL)originalIterator:(_TIRevisionHistoryTokenIterator)a3 matchesRevisedDocumentRange:(_NSRange)a4 andTokenID:(TITokenID)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t documentLocation;
  unint64_t tokenIndex;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  length = a4.length;
  location = a4.location;
  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (tokenIndex >= v12)
    return 0;
  -[TIRevisionHistory tokenization](self, "tokenization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", tokenIndex);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!HIDWORD(*(unint64_t *)&a5) || objc_msgSend(v14, "tokenID") == a5)
    && objc_msgSend(v14, "offset") + documentLocation == location)
  {
    objc_msgSend(v14, "tokenInputString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length") == length;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)shouldValidateOriginalIterator:(_TIRevisionHistoryTokenIterator)a3 withRevisedDocumentRange:(_NSRange)a4 forRevision:(id)a5
{
  NSUInteger location;
  unint64_t documentLocation;
  unint64_t tokenIndex;
  id v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  location = a4.location;
  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  v9 = a5;
  v10 = objc_msgSend(v9, "originalSelectedTokenRange");
  if (tokenIndex >= v10 && tokenIndex - v10 < v11)
  {
    v13 = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "branchedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (documentLocation > location)
    {
      v13 = 0;
      goto LABEL_12;
    }
LABEL_11:
    -[TIRevisionHistory tokenization](self, "tokenization");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = tokenIndex < objc_msgSend(v16, "count");

    goto LABEL_12;
  }
  v14 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  v13 = 0;
  if (location >= v14 + v15 && documentLocation <= location)
    goto LABEL_11;
LABEL_12:

  return v13;
}

- (_TIRevisionHistoryTokenIterator)resetTokenAtIterator:(_TIRevisionHistoryTokenIterator)a3 withRange:(_NSRange)a4 fromDocumentLocation:(unint64_t)a5
{
  NSUInteger location;
  unint64_t tokenIndex;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _TIRevisionHistoryTokenIterator result;

  location = a4.location;
  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenAtIterator:](self, "tokenAtIterator:", a3.tokenIndex, a3.documentLocation, a4.location, a4.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOffset:", location - a5);

  v9 = tokenIndex;
  v10 = a5;
  result.documentLocation = v10;
  result.tokenIndex = v9;
  return result;
}

- (BOOL)validateTokenizationForRevisedDocumentRange:(_NSRange)a3 andTokenID:(TITokenID)a4 forRevision:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  v10 = objc_msgSend(v9, "originalIterator");
  v12 = v11;
  if (!-[TIRevisionHistory shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:](self, "shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:", v10, v11, location, length, v9))
  {
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  while (1)
  {
    v13 = objc_msgSend(v9, "originalSelectedTokenRange");
    v15 = v10 < v13 || v10 - v13 >= v14;
    v16 = !v15;
    if (v15
      && -[TIRevisionHistory originalIterator:matchesRevisedDocumentRange:andTokenID:](self, "originalIterator:matchesRevisedDocumentRange:andTokenID:", v10, v12, location, length, a4))
    {
      break;
    }
    objc_msgSend(v9, "setMergedTokenIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (objc_msgSend(v9, "branchedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v9, "setBranchedTokenIndex:", v10);
    if (v16)
    {
      ++v10;
LABEL_16:
      objc_msgSend(v9, "setOriginalIterator:", v10, v12);
      goto LABEL_17;
    }
    v17 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", v10, v12);
    v10 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v10, v12);
    v12 = v18;
    if (v17 < location + length)
      goto LABEL_16;
LABEL_17:
    if (!-[TIRevisionHistory shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:](self, "shouldValidateOriginalIterator:withRevisedDocumentRange:forRevision:", v10, v12, location, length, v9))goto LABEL_18;
  }
  v21 = -[TIRevisionHistory resetTokenAtIterator:withRange:fromDocumentLocation:](self, "resetTokenAtIterator:withRange:fromDocumentLocation:", v10, v12, location, length, objc_msgSend(v9, "revisedDocumentLocation"));
  v23 = v22;
  if (objc_msgSend(v9, "mergedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = objc_msgSend(v9, "originalSelectedTokenRange");
    if (v21 >= v24 + v25)
    {
      if (length)
      {
        objc_msgSend(v9, "setMergedTokenIndex:", v21);
        if (objc_msgSend(v9, "branchedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "setBranchedTokenIndex:", objc_msgSend(v9, "mergedTokenIndex"));
      }
    }
  }
  v26 = -[TIRevisionHistory nextTokenIterator:](self, "nextTokenIterator:", v21, v23);
  objc_msgSend(v9, "setOriginalIterator:", v26, v27);
  v19 = 1;
LABEL_19:

  return v19;
}

- (void)addRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 inDocumentRange:(_NSRange)a5 toRevision:(id)a6
{
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  TIRevisionHistoryToken *v12;

  location = a5.location;
  v9 = a6;
  v10 = a3;
  v12 = objc_alloc_init(TIRevisionHistoryToken);
  -[TIRevisionHistoryToken setTokenInputString:](v12, "setTokenInputString:", v10);
  -[TIRevisionHistoryToken setTokenID:](v12, "setTokenID:", a4);
  -[TIRevisionHistoryToken setOffset:](v12, "setOffset:", location - objc_msgSend(v9, "revisedDocumentLocation"));
  -[TIRevisionHistoryToken setUserTyping:](v12, "setUserTyping:", v10);

  objc_msgSend(v9, "branchTokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObject:", v12);
}

- (void)handleRevisedTokenString:(id)a3 withTokenID:(TITokenID)a4 forRevision:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[TIRevisionHistory documentText](self, "documentText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_rangeOfString:fromLocation:", v8, objc_msgSend(v9, "revisedDocumentLocation"));
  v13 = v12;

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_msgSend(v9, "revisedDocumentLocation");
      -[TIRevisionHistory documentText](self, "documentText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TIRevisionHistory selectedRange](self, "selectedRange");
      -[TIRevisionHistory selectedRange](self, "selectedRange");
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%s ERROR: Unexpected token %@ for location %lu in %@, with selected range (%lu,%lu)"), "-[TIRevisionHistory handleRevisedTokenString:withTokenID:forRevision:]", v8, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if (!-[TIRevisionHistory validateTokenizationForRevisedDocumentRange:andTokenID:forRevision:](self, "validateTokenizationForRevisedDocumentRange:andTokenID:forRevision:", v11, v13, a4, v9))-[TIRevisionHistory addRevisedTokenString:withTokenID:inDocumentRange:toRevision:](self, "addRevisedTokenString:withTokenID:inDocumentRange:toRevision:", v8, a4, v11, v13, v9);
  objc_msgSend(v9, "setRevisedDocumentLocation:", v11 + v13);

}

- (void)pushSelectedTextToTokenizerForRevision:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  TIRevisionHistory *v17;
  id v18;

  v4 = a3;
  v5 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  v7 = v6;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__TIRevisionHistory_pushSelectedTextToTokenizerForRevision___block_invoke;
  v16 = &unk_1EA1000F0;
  v17 = self;
  v8 = v4;
  v18 = v8;
  -[TIRevisionHistory tokenizeDocumentTextInRange:withTokenHandler:](self, "tokenizeDocumentTextInRange:withTokenHandler:", v5, v7, &v13);
  if (objc_msgSend(v8, "branchedTokenIndex", v13, v14, v15, v16, v17) == 0x7FFFFFFFFFFFFFFFLL)
    v9 = objc_msgSend(v8, "originalIterator");
  else
    v9 = objc_msgSend(v8, "branchedTokenIndex");
  v10 = v9;
  objc_msgSend(v8, "branchTokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") + v10;

  -[TIRevisionHistory setCurrentTokenIterator:](self, "setCurrentTokenIterator:", v12, objc_msgSend(v8, "revisedDocumentLocation"));
}

- (void)mergeTokenizationsForRevision:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  TIRevisionHistory *v22;
  id v23;

  v4 = a3;
  -[TIRevisionHistory documentText](self, "documentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v7);

  v8 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  v10 = v8 + v9;
  -[TIRevisionHistory documentText](self, "documentText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  v15 = v12 - (v14 + v13);

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __51__TIRevisionHistory_mergeTokenizationsForRevision___block_invoke;
  v21 = &unk_1EA1000F0;
  v22 = self;
  v16 = v4;
  v23 = v16;
  -[TIRevisionHistory tokenizeDocumentTextInRange:withTokenHandler:](self, "tokenizeDocumentTextInRange:withTokenHandler:", v10, v15, &v18);
  if (objc_msgSend(v16, "branchedTokenIndex", v18, v19, v20, v21, v22) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v16, "setBranchedTokenIndex:", objc_msgSend(v16, "originalIterator"));
  if (objc_msgSend(v16, "mergedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIRevisionHistory tokenization](self, "tokenization");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMergedTokenIndex:", objc_msgSend(v17, "count"));

  }
  -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v6);
  -[TIRevisionHistory tokenizer](self, "tokenizer");
  LMStreamTokenizerPopBytes();

}

- (void)replaceSelectionWithText:(id)a3 latinInputString:(id)a4 negativeLearningHint:(int)a5 selectedTokenReplacementHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TITokenizationRevision *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[TIRevisionHistory popSelectedTextFromTokenizer](self, "popSelectedTextFromTokenizer");
  v14 = v13;
  v15 = -[TITokenizationRevision initWithTokenIterator:]([TITokenizationRevision alloc], "initWithTokenIterator:", v12, v13);
  v43 = v14;
  v16 = -[TIRevisionHistory selectedTokenRangeWithIterator:](self, "selectedTokenRangeWithIterator:", v12, v14);
  -[TITokenizationRevision setOriginalSelectedTokenRange:](v15, "setOriginalSelectedTokenRange:", v16, v17);
  -[TIRevisionHistory selectedRange](self, "selectedRange");
  v19 = v18;
  -[TIRevisionHistory documentText](self, "documentText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v21, v22, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v23);

  v47 = v9;
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", -[TIRevisionHistory selectedRange](self, "selectedRange"), objc_msgSend(v9, "length"));
  v24 = -[TITokenizationRevision originalSelectedTokenRange](v15, "originalSelectedTokenRange");
  -[TIRevisionHistory adjustTokenOffsetAfterDeletedTokenRange:withDeletedCharacterCount:](self, "adjustTokenOffsetAfterDeletedTokenRange:withDeletedCharacterCount:", v24, v25, v19);
  -[TIRevisionHistory pushSelectedTextToTokenizerForRevision:](self, "pushSelectedTextToTokenizerForRevision:", v15);
  -[TIRevisionHistory mergeTokenizationsForRevision:](self, "mergeTokenizationsForRevision:", v15);
  v26 = -[TITokenizationRevision branchedTokenIndex](v15, "branchedTokenIndex");
  v27 = -[TITokenizationRevision mergedTokenIndex](v15, "mergedTokenIndex");
  v28 = v27 - -[TITokenizationRevision branchedTokenIndex](v15, "branchedTokenIndex");
  -[TIRevisionHistory rejectTokensInRange:negativeLearningHint:newRevision:](self, "rejectTokensInRange:negativeLearningHint:newRevision:", v26, v28, a5, v15);
  v46 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v11)
  {
    v29 = -[TITokenizationRevision originalSelectedTokenRange](v15, "originalSelectedTokenRange");
    -[TIRevisionHistory nonEmptyTokensInRange:](self, "nonEmptyTokensInRange:", v29, v30);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[TITokenizationRevision branchTokens](v15, "branchTokens");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v49 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "setTokenLatinInputString:", v10);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v33);
  }

  -[TIRevisionHistory tokenization](self, "tokenization");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITokenizationRevision branchTokens](v15, "branchTokens");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "replaceObjectsInRange:withObjectsFromArray:", v26, v28, v37);

  if (v46)
  {
    v38 = -[TIRevisionHistory selectedTokenRangeWithIterator:](self, "selectedTokenRangeWithIterator:", v12, v43);
    -[TIRevisionHistory nonEmptyTokensInRange:](self, "nonEmptyTokensInRange:", v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v46)[2](v46, v44, v40);

  }
  -[TIRevisionHistory acceptTokensInRange:](self, "acceptTokensInRange:", v12, -[TIRevisionHistory currentTokenIterator](self, "currentTokenIterator") - v12);
  v41 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v41 + v42, 0);

}

- (void)annotateTokensCreatedFromDocumentState
{
  TIContextTokens *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  TIRevisionHistory *v26;
  TIContextTokens *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id obj;
  int v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(TIContextTokens);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[TIRevisionHistory tokenization](self, "tokenization");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v34)
  {
    v4 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v6, "setAccepted:", 1);
        if (!((unint64_t)objc_msgSend(v6, "tokenID") >> 32))
        {
          objc_msgSend(v6, "tokenInputString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "length");

          if (v8)
          {
            -[TIRevisionHistory delegate](self, "delegate");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "tokenInputString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setTokenID:", objc_msgSend(v9, "findTokenIDForWord:contextTokens:tokenLookupMode:", v10, v3, 37));

          }
        }
        objc_msgSend(v6, "tokenInputString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          -[TIRevisionHistory autocorrectionHistory](self, "autocorrectionHistory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "tokenInputString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = 0;
        }

        objc_msgSend(v14, "candidate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "tokenInputString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v17, "hasPrefix:", v18);

        if ((_DWORD)v16)
        {
          objc_msgSend(v14, "input");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setUserTyping:", v19);

          objc_msgSend(v6, "setUsageTrackingMask:", objc_msgSend(v14, "usageTrackingMask"));
          if (objc_msgSend(v14, "isContinuousPathConversion"))
            v20 = 0x80000;
          else
            v20 = 0;
          objc_msgSend(v6, "setUsageTrackingMask:", objc_msgSend(v6, "usageTrackingMask") | v20);
        }
        if (objc_msgSend(v14, "isAutocorrection"))
        {
          objc_msgSend(v6, "setUsageLearningMask:", 1);
          -[TIRevisionHistory recentAutocorrections](self, "recentAutocorrections");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "tokenInputString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = v14;
          v24 = i;
          v25 = v17;
          v26 = self;
          v27 = v3;
          v28 = v4;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v29, "isAutocorrection");

          v4 = v28;
          v3 = v27;
          self = v26;
          v17 = v25;
          i = v24;
          v14 = v23;

          if (v33)
            objc_msgSend(v6, "setUsageLearningMask:", objc_msgSend(v6, "usageLearningMask") | 4);
        }
        v30 = objc_msgSend(v6, "tokenID");
        objc_msgSend(v6, "tokenInputString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIContextTokens appendToken:string:](v3, "appendToken:string:", v30, v31);

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v34);
  }

}

- (void)resetToDocumentState:(id)a3
{
  void *v4;
  TITokenizationRevision *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", &stru_1EA1081D0);
  -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", 0, 0);
  -[TIRevisionHistory tokenization](self, "tokenization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TIRevisionHistory tokenizer](self, "tokenizer");
  LMStreamTokenizerReset();
  -[TIRevisionHistory setCurrentTokenIterator:](self, "setCurrentTokenIterator:", 0, 0);
  -[TIRevisionHistory setLastRejectedToken:](self, "setLastRejectedToken:", 0);
  v5 = -[TITokenizationRevision initWithTokenIterator:]([TITokenizationRevision alloc], "initWithTokenIterator:", 0, 0);
  objc_msgSend(v27, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contextBeforeInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v9);

    objc_msgSend(v27, "contextBeforeInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", 0, objc_msgSend(v10, "length"));

    -[TIRevisionHistory pushSelectedTextToTokenizerForRevision:](self, "pushSelectedTextToTokenizerForRevision:", v5);
  }
  objc_msgSend(v27, "selectedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v14);

    v15 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v17 = v15 + v16;
    objc_msgSend(v27, "selectedText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v17, objc_msgSend(v18, "length"));

    -[TIRevisionHistory pushSelectedTextToTokenizerForRevision:](self, "pushSelectedTextToTokenizerForRevision:", v5);
  }
  else
  {
    v19 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v19 + v20, 0);
  }
  objc_msgSend(v27, "contextAfterInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contextAfterInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionHistory setDocumentText:](self, "setDocumentText:", v24);

  }
  -[TIRevisionHistory mergeTokenizationsForRevision:](self, "mergeTokenizationsForRevision:", v5);
  -[TIRevisionHistory tokenization](self, "tokenization");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITokenizationRevision branchTokens](v5, "branchTokens");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setArray:", v26);

  -[TIRevisionHistory annotateTokensCreatedFromDocumentState](self, "annotateTokensCreatedFromDocumentState");
}

- (BOOL)isSelectionContainedByToken:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v4 = -[TIRevisionHistory documentRangeOfTokenAtIterator:](self, "documentRangeOfTokenAtIterator:", a3.tokenIndex, a3.documentLocation);
  v6 = v5;
  if (v4 > -[TIRevisionHistory selectedRange](self, "selectedRange"))
    return 0;
  v8 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  return v8 + v9 <= v4 + v6;
}

- (BOOL)isWordToken:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t tokenIndex;
  void *v4;
  void *v5;
  BOOL v6;

  tokenIndex = a3.tokenIndex;
  -[TIRevisionHistory tokenization](self, "tokenization", a3.tokenIndex, a3.documentLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", tokenIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "tokenID") >> 32)
    v6 = (((unint64_t)objc_msgSend(v5, "tokenID") >> 32) - 500) < 0xFFFFFE0D;
  else
    v6 = 1;

  return v6;
}

- (id)wordTokenContainingSelection
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8990;
  v9 = __Block_byref_object_dispose__8991;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__TIRevisionHistory_wordTokenContainingSelection__block_invoke;
  v4[3] = &unk_1EA100158;
  v4[4] = self;
  v4[5] = &v5;
  -[TIRevisionHistory enumerateSentenceStemUsingIteratorBlock:](self, "enumerateSentenceStemUsingIteratorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)documentState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[TIRevisionHistory documentText](self, "documentText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", -[TIRevisionHistory selectedRange](self, "selectedRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIRevisionHistory selectedRange](self, "selectedRange");
  if (v5)
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[TIRevisionHistory documentText](self, "documentText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TIRevisionHistory selectedRange](self, "selectedRange");
  objc_msgSend(v10, "substringFromIndex:", v11 + v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB78]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v4, 0, v9, v13, 0x7FFFFFFFFFFFFFFFLL, 0);
  return v14;
}

- (_NSRange)deletionRangeToObtainDocumentState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  _NSRange result;

  v4 = a3;
  -[TIRevisionHistory documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIRevisionHistory documentStateTrimmedToSentenceForState:](TIRevisionHistory, "documentStateTrimmedToSentenceForState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIRevisionHistory documentStateTrimmedToSentenceForState:](TIRevisionHistory, "documentStateTrimmedToSentenceForState:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    goto LABEL_10;
  objc_msgSend(v7, "selectedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v6, "contextBeforeInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  objc_msgSend(v7, "contextBeforeInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 <= objc_msgSend(v12, "length"))
  {

    goto LABEL_9;
  }
  objc_msgSend(v6, "contextAfterInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v13, "length");
  if (v48
    || (objc_msgSend(v7, "contextAfterInput"),
        v41 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v41, "length")))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "contextAfterInput");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextAfterInput");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v15;
    if (!objc_msgSend(v14, "_string:matchesString:", v15))
    {
      v50 = 0;
      goto LABEL_35;
    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v7, "contextBeforeInput");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
  {
    v39 = v13;
    objc_msgSend(v6, "contextBeforeInput");
    LODWORD(v40) = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextBeforeInput");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v30, "hasPrefix:", v31);

    if ((v40 & 1) != 0)
    {
      v13 = v39;
      goto LABEL_35;
    }
    v13 = v39;
  }
  else
  {

    v50 = 1;
    if (v16)
    {
LABEL_35:
      v32 = v41;

      if (v48)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  v32 = v41;
  if (!v48)
LABEL_36:

LABEL_37:
  if (v50)
  {
    objc_msgSend(v6, "contextBeforeInput");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");
    objc_msgSend(v7, "contextBeforeInput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v34 - objc_msgSend(v35, "length");

    v25 = -[TIRevisionHistory selectedRange](self, "selectedRange") - v24;
    goto LABEL_24;
  }
LABEL_11:
  objc_msgSend(v7, "contextBeforeInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v6, "contextBeforeInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v18, "length") >= 0xC)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v6, "contextBeforeInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "length"))
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v7, "contextBeforeInput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextBeforeInput");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", v21) & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v6, "selectedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v7, "selectedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {

      goto LABEL_18;
    }
    objc_msgSend(v6, "contextAfterInput");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v49, "length");
    if (v44
      || (objc_msgSend(v7, "contextAfterInput"),
          v40 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v40, "length")))
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "contextAfterInput");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contextAfterInput");
      v42 = v23;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "_string:matchesString:", v51, v28);

      v23 = v42;
      if (v44)
        goto LABEL_44;
    }
    else
    {
      v47 = 1;
    }

LABEL_44:
    if (v47)
    {
      v36 = -[TIRevisionHistory selectedRange](self, "selectedRange");
      objc_msgSend(v6, "contextBeforeInput");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v36 - objc_msgSend(v37, "length");

      objc_msgSend(v6, "contextBeforeInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v38, "length");

      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_22:

LABEL_23:
  v24 = 0;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  v26 = v25;
  v27 = v24;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 0);
  if (TIAdaptationAutocorrectionRejectionV2Enabled())
    v4 = 4;
  else
    v4 = 0;
  -[TIRevisionHistory replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:](self, "replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:", v5, 0, v4, 0);

}

- (void)deleteBackward
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 1);
  -[TIRevisionHistory selectedRange](self, "selectedRange");
  if (!v3 && -[TIRevisionHistory selectedRange](self, "selectedRange"))
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_rangeOfBackwardDeletionClusterAtIndex:", -[TIRevisionHistory selectedRange](self, "selectedRange") - 1);
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v5, v6);

  }
  -[TIRevisionHistory replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:](self, "replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:", &stru_1EA1081D0, 0, 2, 0);
}

- (void)rejectCandidate:(id)a3 forInput:(id)a4 hint:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  char v22;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 0);
  if (TIAdaptationAutocorrectionRejectionV2Enabled())
  {
    -[TIRevisionHistory delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerNegativeEvidence:tokenID:contextTokens:intended:intendedTokenID:hint:", v8, 0, 0, v9, 0, v5);

  }
  else
  {
    v22 = 0;
    -[TIRevisionHistory delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v12 = objc_msgSend(v11, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", v8, 0, 5, &v21, &v22);
    v13 = v21;

    v14 = v8;
    if (v13)
    {
      v15 = v13;

      v14 = v15;
    }
    -[TIRevisionHistory delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", v9, 0, 5, &v20, &v22);
    v18 = v20;

    -[TIRevisionHistory delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerNegativeEvidence:tokenID:contextTokens:intended:intendedTokenID:hint:", v14, v12, 0, v9, v17, v5);

  }
}

- (_NSRange)inputRangeForReplacement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  v4 = a3;
  -[TIRevisionHistory selectedRange](self, "selectedRange");
  if (v5)
  {
    -[TIRevisionHistory documentText](self, "documentText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TIRevisionHistory selectedRange](self, "selectedRange");
    v10 = objc_msgSend(v6, "compare:options:range:", v7, 2, v8, v9);

    if (v10)
    {
      v11 = 0;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v12 = -[TIRevisionHistory selectedRange](self, "selectedRange");
      v11 = v15;
    }
  }
  else
  {
    objc_msgSend(v4, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 <= -[TIRevisionHistory selectedRange](self, "selectedRange"))
    {
      v16 = -[TIRevisionHistory selectedRange](self, "selectedRange") - v14;
      -[TIRevisionHistory documentText](self, "documentText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "input");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "compare:options:range:", v18, 2, v16, v14);

      if (v19)
        v11 = 0;
      else
        v11 = v14;
      if (!v19)
        v12 = v16;
    }
    else
    {
      v11 = 0;
    }
  }

  v20 = v12;
  v21 = v11;
  result.length = v21;
  result.location = v20;
  return result;
}

- (void)acceptText:(id)a3 isAutocorrection:(BOOL)a4 isAutoshifted:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  int v19;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[TIRevisionHistory setIsDeletingBackwards:](self, "setIsDeletingBackwards:", 0);
  v9 = -[TIRevisionHistory inputRangeForReplacement:](self, "inputRangeForReplacement:", v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIRevisionHistory setSelectedRange:](self, "setSelectedRange:", v9, v10);
    if (v5)
      v11 = 2;
    else
      v11 = 0;
    v12 = v11 | objc_msgSend(v8, "isAutocorrection");
    if (v6)
      v13 = v12 | 4;
    else
      v13 = v12;
    objc_msgSend(v8, "candidate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = (__CFString *)v14;
    else
      v15 = &stru_1EA1081D0;
    objc_msgSend(v8, "latinCandidate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__TIRevisionHistory_acceptText_isAutocorrection_isAutoshifted___block_invoke;
    v17[3] = &unk_1EA1001A8;
    v17[4] = self;
    v19 = v13;
    v18 = v8;
    -[TIRevisionHistory replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:](self, "replaceSelectionWithText:latinInputString:negativeLearningHint:selectedTokenReplacementHandler:", v15, v16, 0, v17);

  }
}

- (id)currentWord
{
  void *v2;
  void *v3;

  -[TIRevisionHistory wordTokenContainingSelection](self, "wordTokenContainingSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokenInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentUserTyping
{
  void *v2;
  void *v3;

  -[TIRevisionHistory wordTokenContainingSelection](self, "wordTokenContainingSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userTyping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TIRevisionHistoryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIRevisionHistoryDelegate *)a3;
}

- (TILRUDictionary)recentAutocorrections
{
  return self->_recentAutocorrections;
}

- (void)setRecentAutocorrections:(id)a3
{
  objc_storeStrong((id *)&self->_recentAutocorrections, a3);
}

- (TILRUDictionary)autocorrectionHistory
{
  return self->_autocorrectionHistory;
}

- (void)setAutocorrectionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectionHistory, a3);
}

- (void)setDocumentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (void)setCurrentTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  self->_currentTokenIterator = a3;
}

- (void)tokenizer
{
  return self->_tokenizer;
}

- (TIRevisionHistoryToken)lastRejectedToken
{
  return self->_lastRejectedToken;
}

- (void)setLastRejectedToken:(id)a3
{
  objc_storeStrong((id *)&self->_lastRejectedToken, a3);
}

- (BOOL)shouldReportRevisionToDP
{
  return self->_shouldReportRevisionToDP;
}

- (void)setShouldReportRevisionToDP:(BOOL)a3
{
  self->_shouldReportRevisionToDP = a3;
}

- (BOOL)isDeletingBackwards
{
  return self->_isDeletingBackwards;
}

- (BOOL)isRapidDeleteActive
{
  return self->_isRapidDeleteActive;
}

- (void)setIsRapidDeleteActive:(BOOL)a3
{
  self->_isRapidDeleteActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRejectedToken, 0);
  objc_storeStrong((id *)&self->_tokenization, 0);
  objc_storeStrong((id *)&self->_documentText, 0);
  objc_storeStrong((id *)&self->_autocorrectionHistory, 0);
  objc_storeStrong((id *)&self->_recentAutocorrections, 0);
}

void __53__TIRevisionHistory_enumerateSentenceStemUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "tokenAtIterator:", a2, a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "documentRangeOfTokenAtIterator:", a2, a3);
  v10 = v8;
  v11 = v9;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(_QWORD *)(v12 + 24);
  if (v13 <= v8 + v9)
    v14 = v9;
  else
    v14 = v13 - v8;
  *(_QWORD *)(v12 + 24) = v8;
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v17, "tokenInputString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v16, v10, v11, v10, v14, objc_msgSend(v17, "tokenID"), a4);

}

void __63__TIRevisionHistory_acceptText_isAutocorrection_isAutoshifted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = *(unsigned int *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "migrateUserTypingFromDeletedTokens:toInsertedTokens:withUsageLearningMask:usageTrackingMask:", v8, v7, v4, objc_msgSend(v6, "usageTrackingMask"));

}

void __49__TIRevisionHistory_wordTokenContainingSelection__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "isSelectionContainedByToken:", a2, a3)
    && objc_msgSend(*(id *)(a1 + 32), "isWordToken:", a2, a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "tokenAtIterator:", a2, a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || a3 < objc_msgSend(*(id *)(a1 + 32), "selectedRange"))
  {
    *a4 = 1;
  }
}

BOOL __51__TIRevisionHistory_mergeTokenizationsForRevision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "handleRevisedTokenString:withTokenID:forRevision:", a2, a3, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "mergedTokenIndex") == 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __60__TIRevisionHistory_pushSelectedTextToTokenizerForRevision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "handleRevisedTokenString:withTokenID:forRevision:", a2, a3, *(_QWORD *)(a1 + 40));
  return 1;
}

void __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = 4 * a4;
  v12 = (char *)v14 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = 0;
  objc_msgSend(*(id *)(a1 + 32), "documentText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v12, v11, v21, 4, 0, a3, a4, 0);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  objc_msgSend(*(id *)(a1 + 32), "tokenizer");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke_2;
  v14[3] = &unk_1EA1000A0;
  v16 = &v17;
  v15 = *(id *)(a1 + 40);
  LMStreamTokenizerPushBytes();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v21[0];
  if (!*((_BYTE *)v18 + 24))
    *a7 = 1;

  _Block_object_dispose(&v17, 8);
}

void __66__TIRevisionHistory_tokenizeDocumentTextInRange_withTokenHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
  if (objc_msgSend(v6, "hasDoubleZWJ"))
  {
    objc_msgSend(v6, "stringRemovingDoubleZWJ");
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __49__TIRevisionHistory_popSelectedTextFromTokenizer__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 >= 1)
  {
    v10 = v3;
    v11 = v2;
    v12 = v4;
    v13 = v5;
    v6 = a2;
    v7 = result;
    do
    {
      result = objc_msgSend(*(id *)(v7 + 32), "previousTokenIterator:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40), v10, v11, v12, v13);
      v8 = *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8);
      *(_QWORD *)(v8 + 32) = result;
      *(_QWORD *)(v8 + 40) = v9;
      --v6;
    }
    while (v6);
  }
  return result;
}

+ (id)documentStateTrimmedToSentenceForState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v3 = a3;
  objc_msgSend(v3, "contextBeforeInput");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1EA1081D0;
  objc_msgSend(v3, "selectedText");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1EA1081D0;
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextAfterInput");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1EA1081D0;
  objc_msgSend(v10, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contextBeforeInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  objc_msgSend(v3, "selectedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8990;
  v42 = __Block_byref_object_dispose__8991;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8990;
  v36 = __Block_byref_object_dispose__8991;
  v37 = 0;
  v19 = objc_msgSend(v14, "length");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60__TIRevisionHistory_documentStateTrimmedToSentenceForState___block_invoke;
  v26[3] = &unk_1EA100180;
  v30 = v16;
  v31 = v18;
  v27 = v14;
  v28 = &v38;
  v29 = &v32;
  v20 = v14;
  objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", 0, v19, 4, v26);
  v21 = (void *)MEMORY[0x1E0DBDB78];
  v22 = v39[5];
  objc_msgSend(v3, "selectedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "documentStateWithContextBefore:selectedText:contextAfter:", v22, v23, v33[5]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __60__TIRevisionHistory_documentStateTrimmedToSentenceForState___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v11 = a2;
  v12 = *(_QWORD *)(a1 + 56);
  v13 = a3 + a4;
  v14 = v12 > a3 && v13 >= v12;
  v23 = v11;
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, v12 - a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v11 = v23;
    v12 = *(_QWORD *)(a1 + 56);
  }
  v18 = *(_QWORD *)(a1 + 64) + v12;
  if (a3 <= v18 && v13 > v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v18, v13 - v18);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v11 = v23;
  }
  if (a7 && a3 > *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 56))
    *a7 = 1;

}

@end
