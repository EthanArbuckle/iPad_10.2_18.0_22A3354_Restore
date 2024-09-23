@implementation TIDocumentState(UITextInputAdditions)

+ (id)documentStateOfDocument:()UITextInputAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DBDB78];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDocument:", v4);

  return v5;
}

- (id)initWithDocument:()UITextInputAdditions contextBoundary:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;

  v6 = a3;
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markedTextRange");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;
  v12 = v11;
  v47 = a4;
  if (v11)
  {
    objc_msgSend(v11, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contextBeforePosition:inDocument:toBoundary:", v13, v6, a4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "end");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_contextAfterPosition:inDocument:toBoundary:", v14, v6, a4);
    v43 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = 0;
    v48 = 0;
  }
  objc_msgSend(v9, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textRangeFromPosition:toPosition:inDocument:", v15, v16, v6);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "end");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "end");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textRangeFromPosition:toPosition:inDocument:", v18, v19, v6);
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(a1, "copyTextInRange:fromDocument:", v17, v6);
  v22 = (void *)objc_msgSend(a1, "copyTextInRange:fromDocument:", v7, v6);
  v45 = (void *)v20;
  v23 = (void *)objc_msgSend(a1, "copyTextInRange:fromDocument:", v20, v6);
  v46 = (void *)v17;
  v44 = v21;
  if (v9)
  {
    v24 = v21;
    v25 = v24;
    v26 = v24;
    if (v22)
    {
      objc_msgSend(v24, "stringByAppendingString:", v22);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (void *)v27;
      else
        v29 = v22;
      v26 = v29;

    }
    v42 = v23;
    if (v23)
    {
      objc_msgSend(v26, "stringByAppendingString:", v23);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
        v32 = (void *)v30;
      else
        v32 = v23;
      v41 = v9;
      v33 = v7;
      v34 = v12;
      v35 = v32;

      v26 = v35;
      v12 = v34;
      v7 = v33;
    }
    if (v26)
    {
      objc_msgSend(v25, "length");
      objc_msgSend(v22, "length");
    }
    v23 = v42;
  }
  else
  {
    v26 = 0;
  }
  if (v47 == 3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v36 = a1;
    v37 = (void *)v43;
    v38 = (id)objc_msgSend(v36, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v48, v26, v22);
  }
  else
  {
    v37 = (void *)v43;
    v38 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v48, v26, v22, v41);
    v36 = v38;
  }
  v39 = v38;

  return v39;
}

- (uint64_t)copyTextInRange:()UITextInputAdditions fromDocument:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5 && (objc_msgSend(v5, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v6, "textInRange:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)textRangeFromPosition:()UITextInputAdditions toPosition:inDocument:
{
  void *v5;

  v5 = 0;
  if (a3 && a4)
  {
    objc_msgSend(a5, "textRangeFromPosition:toPosition:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)initWithDocument:()UITextInputAdditions
{
  return objc_msgSend(a1, "initWithDocument:contextBoundary:", a3, 2);
}

- (id)_contextBeforePosition:()UITextInputAdditions inDocument:toBoundary:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v7, a5, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 == 3 && v11)
    {
      objc_msgSend(v9, "positionFromPosition:offset:", v11, -2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v9, "positionFromPosition:offset:", v11, -1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v12)
        v13 = v12;
      else
        v13 = v11;
      v14 = v13;

      v11 = v14;
    }
    if (v11)
    {
      if ((unint64_t)objc_msgSend(v9, "offsetFromPosition:toPosition:", v11, v7) <= 0x63)
      {
        objc_msgSend(v9, "_positionAtStartOfWords:beforePosition:", 10, v7);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v9, "_positionFromPosition:pastTextUnit:inDirection:", v15, 2, 1);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17 && objc_msgSend(v9, "comparePosition:toPosition:", v17, v11) == -1)
          {
            v17 = v17;

            v11 = v17;
          }
        }
        else
        {
          v17 = 0;
        }

      }
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v11, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v9, "textInRange:", v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v11 = 0;
  }

  return v18;
}

- (id)_contextAfterPosition:()UITextInputAdditions inDocument:toBoundary:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v7, a5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 == 3 && v11)
    {
      objc_msgSend(v9, "positionFromPosition:offset:", v11, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v9, "positionFromPosition:offset:", v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v12)
        v13 = v12;
      else
        v13 = v11;
      v14 = v13;

      v11 = v14;
    }
    if (v11)
    {
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v7, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v9, "textInRange:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
  }
  else
  {
    v16 = 0;
    v15 = 0;
    v11 = 0;
  }

  return v16;
}

- (uint64_t)_selectedTextRange
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "contextBeforeInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  objc_msgSend(a1, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "length");

  return v3;
}

+ (id)documentStateOfDocumentWithParagraph:()UITextInputAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DBDB78];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDocumentWithParagraph:", v4);

  return v5;
}

+ (id)documentStateOfDocumentWithRecentInputIdentifier:()UITextInputAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DBDB78];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDocumentWithRecentInputIdentifier:", v4);

  return v5;
}

+ (id)documentStateOfSecureTextDocument:()UITextInputAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DBDB78];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSecureTextDocument:", v4);

  return v5;
}

- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordBoundaryInDocument:tokenAccumulator:
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 3;
  while (1)
  {
    objc_msgSend(v8, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v7, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      break;
    objc_msgSend(v8, "tokenizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v7, 3, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 || objc_msgSend(v8, "comparePosition:toPosition:", v14, v7) != -1)
    {
      v18 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInRange:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v9[2](v9, v12);
    objc_msgSend(v8, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isPosition:atBoundary:inDirection:", v7, 1, 0);

    if (v17)
    {
      v20 = v14;
      v14 = v20;
      goto LABEL_13;
    }

    v7 = v14;
    if (!--v10)
    {
      v18 = 0;
      v7 = v14;
      goto LABEL_17;
    }
  }
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v12, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInRange:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length") && objc_msgSend(v14, "rangeOfString:", CFSTR("\uFFFC")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9[2](v9, v14);
    v20 = v12;
LABEL_13:
    v18 = v20;
    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

LABEL_16:
LABEL_17:

  return v18;
}

- (id)_positionFromPosition:()UITextInputAdditions toPreviousWordStartInDocument:tokenAccumulator:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "_positionFromPosition:toPreviousWordBoundaryInDocument:tokenAccumulator:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v10, 1, 1);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(a1, "_positionFromPosition:toPreviousWordBoundaryInDocument:tokenAccumulator:", v10, v8, v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
  }

  return v10;
}

- (uint64_t)initWithDocumentWithParagraph:()UITextInputAdditions
{
  return objc_msgSend(a1, "initWithDocument:contextBoundary:", a3, 3);
}

- (uint64_t)initWithDocumentWithRecentInputIdentifier:()UITextInputAdditions
{
  return objc_msgSend(a1, "initWithDocument:contextBoundary:", a3, 5);
}

- (id)initWithSecureTextDocument:()UITextInputAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "beginningOfDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "textInRange:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v4, "textInRange:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "end");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEmpty") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v4, "textInRange:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v9, 0, v11, v15, 0x7FFFFFFFFFFFFFFFLL, 0);

  }
  else
  {
    v10 = (id)objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", 0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v10;
}

- (id)fullString
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  objc_msgSend(a1, "contextBeforeInput");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (__CFString *)v2;
  else
    v4 = &stru_1E16EDF20;
  v5 = v4;

  objc_msgSend(a1, "selectedText");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_1E16EDF20;
  v9 = v8;

  objc_msgSend(a1, "contextAfterInput");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_1E16EDF20;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
