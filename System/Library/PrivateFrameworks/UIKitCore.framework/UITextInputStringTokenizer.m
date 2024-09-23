@implementation UITextInputStringTokenizer

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v8 = a3;
  v9 = -[UITextInputStringTokenizer _isDownstreamForDirection:atPosition:](self, "_isDownstreamForDirection:atPosition:", a5, v8);
  -[UITextInputStringTokenizer _closestTokenSubrangeForPosition:granularity:downstream:](self, "_closestTokenSubrangeForPosition:granularity:downstream:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "relevantRange");
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    v14 = v11;
    v15 = v12;
    v16 = objc_msgSend(v10, "indexOfBase");
    v17 = v14 + v15;
    if (v16 <= v14 + v15)
      v17 = v14;
    if (v16 >= v14)
      v18 = v15;
    else
      v18 = 0;
    v19 = v18 + v14;
    if (!v9)
      v19 = v17;
    -[UITextInputStringTokenizer _positionFromPosition:offset:affinity:](self, "_positionFromPosition:offset:affinity:", v8, v19 - v16, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4
{
  return a3 == 0;
}

- (int64_t)_distanceForTokenizerWithGranularity:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return qword_186681918[a3];
}

- (UITextInputStringTokenizer)initWithTextInput:(UIResponder *)textInput
{
  UIResponder *v4;
  UITextInputStringTokenizer *v5;
  UITextInputStringTokenizer *v6;
  UITextInputStringTokenizer *v7;
  objc_super v9;

  v4 = textInput;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputStringTokenizer;
  v5 = -[UITextInputStringTokenizer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInput, v4);
    v7 = v6;
  }

  return v6;
}

- (int64_t)_indexForTextPosition:(id)a3
{
  UITextInput **p_textInput;
  id v4;
  id WeakRetained;
  int v6;

  p_textInput = &self->_textInput;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  v6 = objc_msgSend(WeakRetained, "_indexForTextPosition:", v4);

  return v6;
}

- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  __CFString *v20;
  id v21;
  int v22;
  id v23;
  void *v24;
  CFIndex v25;
  CFOptionFlags v26;
  CFIndex length;
  int v28;
  uint64_t v29;
  __CFStringTokenizer *v30;
  CFIndex location;
  CFRange CurrentTokenRange;
  uint64_t v33;
  CFRange v34;
  unint64_t v35;
  CFRange v37;

  v5 = a5;
  v8 = a3;
  v9 = -[UITextInputStringTokenizer _distanceForTokenizerWithGranularity:](self, "_distanceForTokenizerWithGranularity:", a4);
  if (v9 < 1)
    goto LABEL_14;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "positionFromPosition:offset:", v8, -v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(v13, "positionFromPosition:offset:", v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v14)
      goto LABEL_4;
  }
  else
  {
    v15 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v15, "beginningOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
LABEL_4:
      if (!v12)
        goto LABEL_11;
LABEL_8:
      if (v14)
      {
        v17 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v17, "textRangeFromPosition:toPosition:", v12, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_loadWeakRetained((id *)&self->_textInput);
          objc_msgSend(v19, "textInRange:", v18);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v21 = objc_loadWeakRetained((id *)&self->_textInput);
          v22 = objc_msgSend(v21, "offsetFromPosition:toPosition:", v12, v8);

        }
        else
        {
          v20 = 0;
          v22 = 0;
        }

        if (v20)
          goto LABEL_15;
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  v16 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(v16, "endOfDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_8;
LABEL_11:

LABEL_14:
  v23 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(v23, "_fullText");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
LABEL_15:
  +[_UITextInputStringTokenizerSubrange subrangeWithSubstring:basePosition:](_UITextInputStringTokenizerSubrange, "subrangeWithSubstring:basePosition:", v20, v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  objc_msgSend(v24, "setIndexOfBase:", v22);
  v26 = 0;
  switch(a4)
  {
    case 0:
      length = 0;
      v28 = v22 - 1;
      if (v5)
        v28 = v22 + 1;
      v29 = v28;
      goto LABEL_37;
    case 1:
      goto LABEL_23;
    case 2:
      v26 = 1;
      goto LABEL_23;
    case 3:
      v26 = 2;
      goto LABEL_23;
    case 4:
      v26 = 3;
LABEL_23:
      v37.length = -[__CFString length](v20, "length");
      v37.location = 0;
      v30 = CFStringTokenizerCreate(0, v20, v37, v26, 0);
      if (v5)
      {
        if (-[__CFString length](v20, "length") > (unint64_t)v22)
        {
          while (1)
          {
            CFStringTokenizerGoToTokenAtIndex(v30, v25);
            CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
            location = CurrentTokenRange.location;
            length = CurrentTokenRange.length;
            if (CurrentTokenRange.location != -1)
              goto LABEL_35;
            if (-[__CFString length](v20, "length") <= (unint64_t)++v25)
              goto LABEL_34;
          }
        }
LABEL_33:
        length = 0;
LABEL_34:
        v29 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_36;
      }
      if (v22 < 1)
        goto LABEL_33;
      v33 = v22 - 1;
      while (1)
      {
        CFStringTokenizerGoToTokenAtIndex(v30, v33);
        v34 = CFStringTokenizerGetCurrentTokenRange(v30);
        location = v34.location;
        length = v34.length;
        if (v34.location != -1)
          break;
        v35 = v33-- + 1;
        if (v35 < 2)
          goto LABEL_34;
      }
LABEL_35:
      v29 = location;
LABEL_36:
      CFRelease(v30);
LABEL_37:
      objc_msgSend(v24, "setRelevantRange:", v29, length);

      return v24;
    default:
      length = 0;
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
  }
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  void *v19;

  v8 = a3;
  v9 = -[UITextInputStringTokenizer _isDownstreamForDirection:atPosition:](self, "_isDownstreamForDirection:atPosition:", a5, v8);
  -[UITextInputStringTokenizer _closestTokenSubrangeForPosition:granularity:downstream:](self, "_closestTokenSubrangeForPosition:granularity:downstream:", v8, a4, !v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "relevantRange");
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4 == 5 || a4 == 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      v14 = WeakRetained;
      if (a5 == 1)
        objc_msgSend(WeakRetained, "beginningOfDocument");
      else
        objc_msgSend(WeakRetained, "endOfDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "isEqual:", v19);

    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v15 = v11;
    v16 = v12;
    v17 = objc_msgSend(v10, "indexOfBase");
    if (v9)
      v18 = v17 == v15 + v16;
    else
      v18 = v17 == v15;
  }

  return v18;
}

- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5
{
  UITextInput **p_textInput;
  id v7;
  id WeakRetained;
  void *v9;

  p_textInput = &self->_textInput;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  objc_msgSend(WeakRetained, "positionFromPosition:offset:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  int v15;

  v8 = a3;
  -[UITextInputStringTokenizer _closestTokenSubrangeForPosition:granularity:downstream:](self, "_closestTokenSubrangeForPosition:granularity:downstream:", v8, a4, -[UITextInputStringTokenizer _isDownstreamForDirection:atPosition:](self, "_isDownstreamForDirection:atPosition:", a5, v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "relevantRange");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    v13 = v10;
    v14 = v11;
    v15 = objc_msgSend(v9, "indexOfBase");
    v12 = v15 >= v13 && v15 <= v13 + v14;
  }

  return v12;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  int v18;
  int v19;
  UITextInput **p_textInput;
  id WeakRetained;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v8 = a3;
  -[UITextInputStringTokenizer _closestTokenSubrangeForPosition:granularity:downstream:](self, "_closestTokenSubrangeForPosition:granularity:downstream:", v8, a4, -[UITextInputStringTokenizer _isDownstreamForDirection:atPosition:](self, "_isDownstreamForDirection:atPosition:", a5, v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "relevantRange");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    || (v12 = v10, v13 = v11, v14 = objc_msgSend(v9, "indexOfBase"), v14 < v12)
    || (v15 = v12 + v13, v14 > v12 + v13))
  {
    v16 = 0;
  }
  else
  {
    v18 = v12 - v14;
    v19 = v15 - v14;
    p_textInput = &self->_textInput;
    WeakRetained = objc_loadWeakRetained((id *)p_textInput);
    objc_msgSend(WeakRetained, "positionFromPosition:offset:", v8, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_loadWeakRetained((id *)p_textInput);
    objc_msgSend(v23, "positionFromPosition:offset:", v8, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_loadWeakRetained((id *)p_textInput);
    objc_msgSend(v25, "textRangeFromPosition:toPosition:", v22, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textInput);
}

@end
