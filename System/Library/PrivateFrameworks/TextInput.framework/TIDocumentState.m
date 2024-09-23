@implementation TIDocumentState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;
  __int128 v29;

  length = a7.length;
  location = a7.location;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v29 = xmmword_18C5E7790;
  if ((unint64_t)objc_msgSend(v15, "length") >= 0x41)
  {
    +[TIDocumentState _selectedTextByDeletingInteriorSentences:outTruncatedRange:](TIDocumentState, "_selectedTextByDeletingInteriorSentences:outTruncatedRange:", v15, &v29);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v17;
  }
  v28.receiver = self;
  v28.super_class = (Class)TIDocumentState;
  v18 = -[TIDocumentState init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    v20 = (void *)*((_QWORD *)v18 + 1);
    *((_QWORD *)v18 + 1) = v19;

    v21 = objc_msgSend(v14, "copy");
    v22 = (void *)*((_QWORD *)v18 + 2);
    *((_QWORD *)v18 + 2) = v21;

    v23 = objc_msgSend(v15, "copy");
    v24 = (void *)*((_QWORD *)v18 + 3);
    *((_QWORD *)v18 + 3) = v23;

    v25 = objc_msgSend(v16, "copy");
    v26 = (void *)*((_QWORD *)v18 + 4);
    *((_QWORD *)v18 + 4) = v25;

    *((_QWORD *)v18 + 5) = location;
    *((_QWORD *)v18 + 6) = length;
    *(_OWORD *)(v18 + 56) = v29;
  }

  return (TIDocumentState *)v18;
}

- (TIDocumentState)initWithContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 contextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  objc_super v35;
  __int128 v36;

  length = a7.length;
  location = a7.location;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_msgSend(a3, "copy");
  if ((unint64_t)objc_msgSend(v16, "length") >= 0x3E9)
  {
    +[TIDocumentState _string:byTrimmingWordsBeforeIndex:](TIDocumentState, "_string:byTrimmingWordsBeforeIndex:", v16, objc_msgSend(v16, "length") - 500);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  v18 = v15;
  v19 = objc_msgSend(v18, "length");
  *(_QWORD *)&v36 = v19;
  if (v19)
  {
    objc_msgSend(v18, "getLineStart:end:contentsEnd:forRange:", 0, 0, &v36, 0, 0);
    v20 = v36;
  }
  else
  {
    v20 = 0;
  }
  if (v20 >= v19)
  {
    v21 = objc_msgSend(v18, "copy");
  }
  else
  {
    objc_msgSend(v18, "substringToIndex:");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

  if ((unint64_t)objc_msgSend(v22, "length") >= 0x3E9)
  {
    +[TIDocumentState _string:byTrimmingWordsAfterIndex:](TIDocumentState, "_string:byTrimmingWordsAfterIndex:", v22, 500);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  v36 = xmmword_18C5E7790;
  if ((unint64_t)objc_msgSend(v14, "length") >= 0x41)
  {
    +[TIDocumentState _selectedTextByDeletingInteriorSentences:outTruncatedRange:](TIDocumentState, "_selectedTextByDeletingInteriorSentences:outTruncatedRange:", v14, &v36);
    v24 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v24;
  }
  v35.receiver = self;
  v35.super_class = (Class)TIDocumentState;
  v25 = -[TIDocumentState init](&v35, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v16, "copy");
    v27 = (void *)*((_QWORD *)v25 + 1);
    *((_QWORD *)v25 + 1) = v26;

    v28 = objc_msgSend(v13, "copy");
    v29 = (void *)*((_QWORD *)v25 + 2);
    *((_QWORD *)v25 + 2) = v28;

    v30 = objc_msgSend(v14, "copy");
    v31 = (void *)*((_QWORD *)v25 + 3);
    *((_QWORD *)v25 + 3) = v30;

    v32 = objc_msgSend(v22, "copy");
    v33 = (void *)*((_QWORD *)v25 + 4);
    *((_QWORD *)v25 + 4) = v32;

    *((_QWORD *)v25 + 5) = location;
    *((_QWORD *)v25 + 6) = length;
    *(_OWORD *)(v25 + 56) = v36;
  }

  return (TIDocumentState *)v25;
}

- (TIDocumentState)initWithCoder:(id)a3
{
  id v4;
  TIDocumentState *v5;
  void *v6;
  uint64_t v7;
  NSString *contextBeforeInput;
  void *v9;
  uint64_t v10;
  NSString *markedText;
  void *v12;
  uint64_t v13;
  NSString *selectedText;
  void *v15;
  uint64_t v16;
  NSString *contextAfterInput;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUInteger v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIDocumentState;
  v5 = -[TIDocumentState init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextBeforeInput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contextBeforeInput = v5->_contextBeforeInput;
    v5->_contextBeforeInput = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("markedText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextAfterInput"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    contextAfterInput = v5->_contextAfterInput;
    v5->_contextAfterInput = (NSString *)v16;

    if (v5->_markedText)
    {
      v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationOfSelectionInMarkedText"));
      v19 = -[NSString length](v5->_selectedText, "length");
    }
    else
    {
      v19 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_selectedRangeInMarkedText.location = v18;
    v5->_selectedRangeInMarkedText.length = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationOfSelectionInMarkedText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = objc_msgSend(v20, "rangeValue");
    }
    else
    {
      v23 = 0;
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_truncatedRangeInSelectedText.location = v22;
    v5->_truncatedRangeInSelectedText.length = v23;

  }
  return v5;
}

- (BOOL)isEqualIgnoringMarkedText:(id)a3
{
  TIDocumentState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (TIDocumentState *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState contextBeforeInput](v4, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "_ti_string:matchesStringIgnoringNullity:", v6, v7);

    if (!(_DWORD)v5)
      goto LABEL_5;
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[TIDocumentState selectedText](self, "selectedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState selectedText](v4, "selectedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "_ti_string:matchesStringIgnoringNullity:", v9, v10);

    if ((_DWORD)v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[TIDocumentState contextAfterInput](self, "contextAfterInput");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDocumentState contextAfterInput](v4, "contextAfterInput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "_ti_string:matchesStringIgnoringNullity:", v12, v13);

    }
    else
    {
LABEL_5:
      v14 = 0;
    }
  }

  return v14;
}

- (id)inputStringWithTerminatorPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TIDocumentState selectedText](self, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState wordPrefixOfString:withTerminatorPredicate:reverse:](self, "wordPrefixOfString:withTerminatorPredicate:reverse:", v7, v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState wordPrefixOfString:withTerminatorPredicate:reverse:](self, "wordPrefixOfString:withTerminatorPredicate:reverse:", v9, v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingString:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)wordPrefixOfString:(id)a3 withTerminatorPredicate:(id)a4 reverse:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3010000000;
  v28 = &unk_18C601D3B;
  v29 = xmmword_18C5E7790;
  if (v5)
    v9 = 258;
  else
    v9 = 2;
  v10 = objc_msgSend(v7, "length");
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__TIDocumentState_InputStringSupport__wordPrefixOfString_withTerminatorPredicate_reverse___block_invoke;
  v22 = &unk_1E24391D8;
  v11 = v8;
  v23 = v11;
  v24 = &v25;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, v9, &v19);
  v12 = (__CFString *)v7;
  v13 = v12;
  v14 = v26[4];
  v15 = v12;
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
      -[__CFString substringFromIndex:](v12, "substringFromIndex:", v26[5] + v14, v19, v20, v21, v22);
    else
      -[__CFString substringToIndex:](v12, "substringToIndex:", v19, v20, v21, v22);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v16 = &stru_1E243B990;
  if (v15)
    v16 = v15;
  v17 = v16;

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TIDocumentState *v4;
  TIDocumentState *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = (TIDocumentState *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDocumentState contextBeforeInput](v5, "contextBeforeInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "_ti_string:matchesStringIgnoringNullity:", v7, v8);

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        -[TIDocumentState selectedText](self, "selectedText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDocumentState selectedText](v5, "selectedText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "_ti_string:matchesStringIgnoringNullity:", v11, v12);

        if (v9)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          -[TIDocumentState contextAfterInput](self, "contextAfterInput");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDocumentState contextAfterInput](v5, "contextAfterInput");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v13, "_ti_string:matchesStringIgnoringNullity:", v14, v15);

          if (v9)
          {
            v16 = (void *)MEMORY[0x1E0CB3940];
            -[TIDocumentState markedText](self, "markedText");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIDocumentState markedText](v5, "markedText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v16, "_ti_string:matchesStringIgnoringNullity:", v17, v18);

            if (v9)
            {
              v19 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
              v21 = v20;
              LOBYTE(v9) = 0;
              if (v19 == -[TIDocumentState selectedRangeInMarkedText](v5, "selectedRangeInMarkedText") && v21 == v22)
              {
                v23 = -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText");
                v25 = v24;
                LOBYTE(v9) = v23 == -[TIDocumentState truncatedRangeInSelectedText](v5, "truncatedRangeInSelectedText")
                          && v25 == v26;
              }
            }
          }
        }
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (NSString)contextBeforeInput
{
  return self->_contextBeforeInput;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (NSString)contextAfterInput
{
  return self->_contextAfterInput;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRangeInMarkedText.length;
  location = self->_selectedRangeInMarkedText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextAfterInput, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_contextBeforeInput, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *contextBeforeInput;
  NSString *markedText;
  NSString *selectedText;
  NSString *contextAfterInput;
  NSUInteger location;
  NSUInteger v10;
  void *v11;
  id v12;

  v4 = a3;
  contextBeforeInput = self->_contextBeforeInput;
  v12 = v4;
  if (contextBeforeInput)
  {
    objc_msgSend(v4, "encodeObject:forKey:", contextBeforeInput, CFSTR("contextBeforeInput"));
    v4 = v12;
  }
  markedText = self->_markedText;
  if (markedText)
  {
    objc_msgSend(v12, "encodeObject:forKey:", markedText, CFSTR("markedText"));
    v4 = v12;
  }
  selectedText = self->_selectedText;
  if (selectedText)
  {
    objc_msgSend(v12, "encodeObject:forKey:", selectedText, CFSTR("selectedText"));
    v4 = v12;
  }
  contextAfterInput = self->_contextAfterInput;
  if (contextAfterInput)
  {
    objc_msgSend(v12, "encodeObject:forKey:", contextAfterInput, CFSTR("contextAfterInput"));
    v4 = v12;
  }
  if (self->_markedText)
  {
    location = self->_selectedRangeInMarkedText.location;
    if (location)
    {
      objc_msgSend(v12, "encodeInteger:forKey:", location, CFSTR("locationOfSelectionInMarkedText"));
      v4 = v12;
    }
  }
  if (self->_selectedText)
  {
    v10 = self->_truncatedRangeInSelectedText.location;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, self->_truncatedRangeInSelectedText.length);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("truncatedRangeInSelectedText"));

      v4 = v12;
    }
  }

}

- (BOOL)documentIsEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    -[TIDocumentState selectedText](self, "selectedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 0;
    }
    else
    {
      -[TIDocumentState markedText](self, "markedText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        v4 = 0;
      }
      else
      {
        -[TIDocumentState contextAfterInput](self, "contextAfterInput");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "length") == 0;

      }
    }

  }
  return v4;
}

- (TIDocumentState)initWithUnboundedContextBefore:(id)a3 markedText:(id)a4 selectedText:(id)a5 unboundedContextAfter:(id)a6 selectedRangeInMarkedText:(_NSRange)a7 truncatedRangeInSelectedText:(_NSRange)a8
{
  TIDocumentState *result;

  result = -[TIDocumentState initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:](self, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", a3, a4, a5, a6, a7.location, a7.length);
  result->_truncatedRangeInSelectedText = a8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TIDocumentState initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:truncatedRangeInSelectedText:]([TIDocumentState alloc], "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:truncatedRangeInSelectedText:", self->_contextBeforeInput, self->_markedText, self->_selectedText, self->_contextAfterInput, self->_selectedRangeInMarkedText.location, self->_selectedRangeInMarkedText.length, self->_truncatedRangeInSelectedText.location, self->_truncatedRangeInSelectedText.length);
}

- (unint64_t)hashString:(id)a3 intoHashValue:(unint64_t)a4
{
  return objc_msgSend(a3, "hash") + 257 * a4;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIDocumentState hashString:intoHashValue:](self, "hashString:intoHashValue:", v3, 0);

  -[TIDocumentState markedText](self, "markedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIDocumentState hashString:intoHashValue:](self, "hashString:intoHashValue:", v5, v4);

  -[TIDocumentState selectedText](self, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIDocumentState hashString:intoHashValue:](self, "hashString:intoHashValue:", v7, v6);

  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TIDocumentState hashString:intoHashValue:](self, "hashString:intoHashValue:", v9, v8);

  v11 = 257 * (-[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText") + 257 * v10);
  v12 = 257 * (v11 + -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"));
  -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText");
  return v12 + v13;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("; text = \"%@"), v7);

  -[TIDocumentState markedText](self, "markedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TIDocumentState markedText](self, "markedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringToIndex:", -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("{%@"), v11);

  }
  -[TIDocumentState selectedText](self, "selectedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (-[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText") == 0x7FFFFFFFFFFFFFFFLL
      || (-[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"), !v13))
    {
      -[TIDocumentState selectedText](self, "selectedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v15);
    }
    else
    {
      -[TIDocumentState selectedText](self, "selectedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringToIndex:", -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText");
      v18 = v17;
      -[TIDocumentState selectedText](self, "selectedText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "substringFromIndex:", -[TIDocumentState truncatedRangeInSelectedText](self, "truncatedRangeInSelectedText"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("[%@{...%lu...}%@]"), v16, v18, v21);

    }
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("|"));
  }
  -[TIDocumentState markedText](self, "markedText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[TIDocumentState markedText](self, "markedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
    objc_msgSend(v23, "substringFromIndex:", v24 + v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@}"), v27);

  }
  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = &stru_1E243B990;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\"), v31);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)string
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1E243B990;
  v6 = v5;

  -[TIDocumentState selectedText](self, "selectedText");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1E243B990;
  v10 = v9;

  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E243B990;
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v6, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (_NSRange)truncatedRangeInSelectedText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_truncatedRangeInSelectedText.length;
  location = self->_truncatedRangeInSelectedText.location;
  result.length = length;
  result.location = location;
  return result;
}

+ (TIDocumentState)documentStateWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v7;
  id v8;
  id v9;
  TIDocumentState *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:]([TIDocumentState alloc], "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v8, v7, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v10;
}

+ (TIDocumentState)documentStateWithContextBefore:(id)a3 markedText:(id)a4 selectedRange:(_NSRange)a5 contextAfter:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  void *v13;
  TIDocumentState *v14;

  length = a5.length;
  location = a5.location;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  if (objc_msgSend(v10, "length"))
  {
    if (length)
    {
      objc_msgSend(v10, "substringWithRange:", location, length);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {

    v10 = 0;
    v13 = 0;
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:]([TIDocumentState alloc], "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v12, v10, v13, v11, location, length);

  return v14;
}

+ (id)_string:(id)a3 byTrimmingWordsBeforeIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = (void *)objc_msgSend(a3, "copy");
  v6 = v5;
  if (a4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v7 = objc_msgSend(v5, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__TIDocumentState__string_byTrimmingWordsBeforeIndex___block_invoke;
    v14[3] = &unk_1E2439188;
    v14[4] = &v15;
    v14[5] = a4;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 259, v14);
    v8 = v16[3];
    if (!v8)
    {
      v9 = objc_msgSend(v6, "rangeOfComposedCharacterSequenceAtIndex:", a4 - 1);
      v8 = v9 + v10;
    }
    objc_msgSend(v6, "substringFromIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = v5;
  }

  return v12;
}

+ (id)_string:(id)a3 byTrimmingWordsAfterIndex:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(v5, "length") <= a4)
  {
    v9 = v5;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v16 = objc_msgSend(v5, "length");
    v6 = objc_msgSend(v5, "length");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__TIDocumentState__string_byTrimmingWordsAfterIndex___block_invoke;
    v12[3] = &unk_1E2439188;
    v12[4] = &v13;
    v12[5] = a4;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v12);
    v7 = v14[3];
    if (v7 >= objc_msgSend(v5, "length"))
      v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", a4);
    else
      v8 = v14[3];
    objc_msgSend(v5, "substringToIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v10;
    _Block_object_dispose(&v13, 8);
  }

  return v9;
}

+ (id)_selectedTextByDeletingInteriorSentences:(id)a3 outTruncatedRange:(_NSRange *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v35 = 0;
  v36 = 0;
  v34 = &unk_18C601D3B;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3010000000;
  v28 = &unk_18C601D3B;
  v29 = v7;
  v30 = 0;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke;
    v24[3] = &unk_1E24391B0;
    v24[4] = &v31;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 516, v24);
    v9 = v32[5] + v32[4];
  }
  else
  {
    v9 = 0;
  }
  if (v9 >= objc_msgSend(v6, "length"))
  {
    v11 = v26;
    v10 = v32;
    *((_OWORD *)v26 + 2) = *((_OWORD *)v32 + 2);
  }
  else
  {
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke_2;
    v23[3] = &unk_1E24391B0;
    v23[4] = &v25;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 772, v23);
    v10 = v32;
    v11 = v26;
  }
  if (v10[5] + v10[4] <= (unint64_t)v11[4])
  {
    objc_msgSend(v6, "substringWithRange:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringWithRange:", v26[4], v26[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "length");
    if ((unint64_t)(objc_msgSend(v15, "length") + v17) < 0x3E9)
      goto LABEL_19;
    if ((unint64_t)objc_msgSend(v13, "length") < 0x1F5)
    {
      if ((unint64_t)objc_msgSend(v15, "length") < 0x1F5)
        goto LABEL_19;
      objc_msgSend(a1, "_string:byTrimmingWordsAfterIndex:", v15, 250);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_string:byTrimmingWordsAfterIndex:", v13, 249);
      v18 = objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v15, "length") < 0x3E9)
      {
        v13 = (void *)v18;
LABEL_19:
        objc_msgSend(v13, "stringByAppendingString:", v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a4)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        a4->location = objc_msgSend(v13, "length");
        v21 = objc_msgSend(v6, "length");
        a4->length = v21 - objc_msgSend(v12, "length");
        goto LABEL_21;
      }
      objc_msgSend(a1, "_string:byTrimmingWordsBeforeIndex:", v15, objc_msgSend(v15, "length") - 249);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("  "), "stringByAppendingString:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
      v13 = (void *)v18;
    }

    v15 = (void *)v20;
    goto LABEL_19;
  }
  v12 = (void *)objc_msgSend(v6, "copy");
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x3E9)
  {
    objc_msgSend(a1, "_string:byTrimmingWordsAfterIndex:", v12, 249);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_string:byTrimmingWordsBeforeIndex:", v12, objc_msgSend(v12, "length") - 249);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("  "), "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_22:
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v12;
}

uint64_t __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v7 + 32) = a5;
  *(_QWORD *)(v7 + 40) = a6;
  *a7 = 1;
  return result;
}

uint64_t __78__TIDocumentState__selectedTextByDeletingInteriorSentences_outTruncatedRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v7 + 32) = a5;
  *(_QWORD *)(v7 + 40) = a6;
  *a7 = 1;
  return result;
}

uint64_t __53__TIDocumentState__string_byTrimmingWordsAfterIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(a3 + a4) <= *(_QWORD *)(result + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 + a4;
  else
    *a7 = 1;
  return result;
}

uint64_t __54__TIDocumentState__string_byTrimmingWordsBeforeIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (a3 >= *(_QWORD *)(result + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  else
    *a7 = 1;
  return result;
}

- (TIDocumentState)initWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  TIDocumentState *v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  if (location)
  {
    objc_msgSend(v7, "substringToIndex:", location);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (length)
    {
LABEL_3:
      objc_msgSend(v8, "substringWithRange:", location, length);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
    if (length)
      goto LABEL_3;
  }
  v10 = 0;
LABEL_6:
  v11 = location + length;
  if (v11 >= objc_msgSend(v8, "length"))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "substringFromIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:](self, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v10, v12, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v13;
}

- (BOOL)deletingBackwardsWillRemoveText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;

  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {

    return 1;
  }
  -[TIDocumentState selectedText](self, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    return 1;
  -[TIDocumentState markedText](self, "markedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");

    if (v8)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (id)documentStateAfterInsertingText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  TIDocumentState *v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v9, 0, v10);
    v11 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)documentStateAfterInsertingTextAfterSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)documentStateAfterDeletingBackward
{
  void *v3;
  void *v4;
  TIDocumentState *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;

  -[TIDocumentState markedText](self, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDocumentState documentStateAfterUnmarkingText](self, "documentStateAfterUnmarkingText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentStateAfterDeletingBackward");
    v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIDocumentState selectedText](self, "selectedText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[TIDocumentState selectedText](self, "selectedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDocumentState contextAfterInput](self, "contextAfterInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v11, 0, v12);
        v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

        return v5;
      }
    }
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      v5 = self;
      return v5;
    }
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_rangeOfBackwardDeletionClusterAtIndex:", v16 - 1);
    v20 = v19;

    if (v20 >= v16)
    {
      v4 = 0;
    }
    else
    {
      -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "substringToIndex:", v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v4, 0, v22);
    v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)documentStateAfterDeletingForward
{
  void *v3;
  void *v4;
  TIDocumentState *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;

  -[TIDocumentState markedText](self, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDocumentState documentStateAfterUnmarkingText](self, "documentStateAfterUnmarkingText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentStateAfterDeletingForward");
    v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIDocumentState selectedText](self, "selectedText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[TIDocumentState selectedText](self, "selectedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDocumentState contextAfterInput](self, "contextAfterInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v11, 0, v12);
        v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

        return v5;
      }
    }
    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      v5 = self;
      return v5;
    }
    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v20 = v19;

    v4 = 0;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL && v20 < v16)
    {
      -[TIDocumentState contextAfterInput](self, "contextAfterInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "substringFromIndex:", v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v22, 0, v4);
    v5 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)documentStateAfterSettingMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TIDocumentState *v14;
  void *v15;
  void *v16;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[TIDocumentState markedText](self, "markedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_4;
  }
  if (objc_msgSend(v7, "length"))
  {
LABEL_4:
    -[TIDocumentState markedText](self, "markedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      -[TIDocumentState markedText](self, "markedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v10) & 1) != 0)
      {
        v11 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
        v13 = v12;

        if (location == v11 && length == v13)
          goto LABEL_8;
LABEL_11:
        -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDocumentState contextAfterInput](self, "contextAfterInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDocumentState documentStateWithContextBefore:markedText:selectedRange:contextAfter:](TIDocumentState, "documentStateWithContextBefore:markedText:selectedRange:contextAfter:", v15, v7, location, length, v16);
        v14 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }

    }
    goto LABEL_11;
  }
LABEL_8:
  v14 = self;
LABEL_12:

  return v14;
}

- (id)documentStateAfterUnmarkingText
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  TIDocumentState *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  -[TIDocumentState markedText](self, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v14 = self;
    return v14;
  }
  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
  -[TIDocumentState markedText](self, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v5 >= v7)
  {
    -[TIDocumentState markedText](self, "markedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[TIDocumentState markedText](self, "markedText");
      v16 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_13;
    }
    v13 = v15;
    v11 = v13;
LABEL_11:
    v16 = (uint64_t)v13;
LABEL_13:

    v4 = (void *)v16;
    goto LABEL_14;
  }
  if (-[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText"))
  {
    -[TIDocumentState markedText](self, "markedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringToIndex:", -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v9;
    v13 = v12;
    goto LABEL_11;
  }
LABEL_14:
  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[TIDocumentState selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
  v20 = v18 + v19;
  -[TIDocumentState markedText](self, "markedText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v20 < v22)
  {
    -[TIDocumentState markedText](self, "markedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringFromIndex:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v24, "stringByAppendingString:", v17);
      v25 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v25;
    }
    else
    {
      v17 = v24;
    }

  }
  -[TIDocumentState selectedText](self, "selectedText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v4, v26, v17);
  v14 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)documentStateAfterCollapsingSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  TIDocumentState *v9;
  void *v10;
  void *v11;

  -[TIDocumentState selectedText](self, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState selectedText](self, "selectedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[TIDocumentState selectedText](self, "selectedText");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

    -[TIDocumentState contextAfterInput](self, "contextAfterInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v10, 0, v11);
    v9 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self;
  }
  return v9;
}

- (id)documentStateAfterReplacingText:(id)a3 withText:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = (__CFString *)a4;
  -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = (__CFString *)v8;
  else
    v9 = &stru_1E243B990;
  -[TIDocumentState selectedText](self, "selectedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TIDocumentState selectedText](self, "selectedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[TIDocumentState selectedText](self, "selectedText");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v9 = v15;
  }
  v16 = objc_msgSend(v6, "length");
  if (v16)
  {
    v17 = v16;
    if (-[__CFString hasSuffix:](v9, "hasSuffix:", v6))
    {
      v18 = -[__CFString length](v9, "length") - v17;
      if (v7)
        v19 = v7;
      else
        v19 = &stru_1E243B990;
      -[__CFString stringByReplacingCharactersInRange:withString:](v9, "stringByReplacingCharactersInRange:withString:", v18, v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_18:
    v23 = 0;
    goto LABEL_19;
  }
  if (!v7)
    goto LABEL_18;
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v7);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v21 = (__CFString *)v20;

  -[TIDocumentState contextAfterInput](self, "contextAfterInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v21, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v21;
LABEL_19:

  return v23;
}

- (id)documentStateAfterCursorAdjustment:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TIDocumentState *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (a3)
  {
    -[TIDocumentState documentStateAfterCollapsingSelection](self, "documentStateAfterCollapsingSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextBeforeInput");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_1E243B990;
    v8 = v7;

    objc_msgSend(v4, "contextAfterInput");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E243B990;
    v12 = v11;

    if (a3 < 1)
    {
      v22 = -[__CFString _rangeOfCharacterClusterAtIndex:withClusterOffset:](v8, "_rangeOfCharacterClusterAtIndex:withClusterOffset:", -[__CFString length](v8, "length"), a3);
      -[__CFString substringWithRange:](v8, "substringWithRange:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString substringToIndex:](v8, "substringToIndex:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v18;
      v20 = v17;
    }
    else
    {
      v13 = -[__CFString _rangeOfCharacterClusterAtIndex:withClusterOffset:](v12, "_rangeOfCharacterClusterAtIndex:withClusterOffset:", 0, a3);
      v15 = v14;
      -[__CFString substringWithRange:](v12, "substringWithRange:", v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString substringFromIndex:](v12, "substringFromIndex:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v17;
      v20 = v18;
    }
    +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v19, 0, v20);
    v21 = (TIDocumentState *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = self;
  }
  return v21;
}

- (id)inputStemWithTerminatorPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIDocumentState selectedText](self, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[TIDocumentState contextBeforeInput](self, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDocumentState wordPrefixOfString:withTerminatorPredicate:reverse:](self, "wordPrefixOfString:withTerminatorPredicate:reverse:", v7, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)inputIndexWithTerminatorPredicate:(id)a3
{
  void *v3;
  unint64_t v4;

  -[TIDocumentState inputStemWithTerminatorPredicate:](self, "inputStemWithTerminatorPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

uint64_t __90__TIDocumentState_InputStringSupport__wordPrefixOfString_withTerminatorPredicate_reverse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v12;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    *a7 = 1;
  }
  return result;
}

+ (id)documentStateForTestingWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:selectedRange:", v7, location, length);

  return v8;
}

+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v10, 0, v9, v8, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v11;
}

+ (id)documentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  length = a7.length;
  location = a7.location;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v16, v13, v15, v14, location, length);

  return v17;
}

+ (id)unboundedDocumentStateForTestingWithContextBefore:(id)a3 selectedText:(id)a4 contextAfter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v10, 0, v9, v8, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v11;
}

@end
