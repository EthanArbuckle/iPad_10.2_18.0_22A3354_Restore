@implementation DOMNode(UITextInput_Internal)

- (id)textInputSuggestionDelegate
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EDE925C8))
  {
    objc_msgSend(v1, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)_textInputSource
{
  void *v0;
  void *v1;
  uint64_t v2;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v0)
    return __UIPlatformFallbackInputSource;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "lastEventSource");

  return v2;
}

- (void)set_textInputSource:()UITextInput_Internal
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "keyboardType") == 122;
    if (a3 == 3 && v6)
      v7 = 2;
    else
      v7 = 5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = a1;
    else
      v8 = 0;
    v9 = v8;
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateEventSource:options:responder:", a3, v7, v9);

  }
  else
  {
    __UIPlatformFallbackInputSource = a3;
  }
}

- (uint64_t)_selectedNSRange
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = objc_msgSend(a1, "_nsrangeForTextRange:", v4);
    else
      v5 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (uint64_t)_selectedRangeWithinMarkedText
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "selectedTextRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "markedTextRange");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4
        || (objc_msgSend(v4, "start"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "start"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v2, "offsetFromPosition:toPosition:", v6, v7),
            v7,
            v6,
            v8 < 0))
      {
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v3, "start");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "offsetFromPosition:toPosition:", v9, v10);

      }
    }
    else
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)_selectAll
{
  void *v1;
  id v2;

  objc_msgSend(a1, "_selectableText");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fullRange");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedTextRange:", v1);

}

- (uint64_t)_indexForTextPosition:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);

  return v7;
}

- (uint64_t)_nsrangeForTextRange:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(a1, "_indexForTextPosition:", v6);

  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "offsetFromPosition:toPosition:", v8, v9);
  return v7;
}

- (id)_textRangeFromNSRange:()UITextInput_Internal
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "_selectableText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:offset:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "endOfDocument");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v6, "positionFromPosition:offset:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v6, "endOfDocument");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v6, "textRangeFromPosition:toPosition:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (uint64_t)_characterAfterCaretSelection
{
  return objc_msgSend(a1, "_characterInRelationToCaretSelection:", 0);
}

- (uint64_t)_characterBeforeCaretSelection
{
  return objc_msgSend(a1, "_characterInRelationToCaretSelection:", 0xFFFFFFFFLL);
}

- (uint64_t)_characterInRelationToCaretSelection:()UITextInput_Internal
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "selectedTextRange"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEmpty"),
        v8,
        v7,
        v9))
  {
    v10 = objc_msgSend(a1, "_characterInRelationToRangedSelection:", a3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_characterInRelationToRangedSelection:()UITextInput_Internal
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;

  objc_msgSend(a1, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        objc_msgSend(v4, "positionFromPosition:offset:", v8, a3);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      if (!v8)
        goto LABEL_17;
LABEL_11:
      objc_msgSend(v4, "positionFromPosition:offset:", v8, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v4, "textRangeFromPosition:toPosition:", v8, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textInRange:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          if (objc_msgSend(v15, "length") == 2
            && (v16 = objc_msgSend(v15, "characterAtIndex:", 0),
                v17 = objc_msgSend(v15, "characterAtIndex:", 1),
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            v6 = (v17 + (v16 << 10) - 56613888);
          }
          else
          {
            v6 = objc_msgSend(v15, "characterAtIndex:", 0);
          }
        }
        else
        {
          v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    objc_msgSend(v4, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:offset:", v11, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_17;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
LABEL_4:
  v6 = 0;
LABEL_22:

  return v6;
}

- (uint64_t)_characterInRelationToPosition:()UITextInput_Internal amount:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;

  if (!a3)
    return 0;
  v6 = a3;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "positionFromPosition:offset:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInRange:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v11, "length") == 2
      && (v12 = objc_msgSend(v11, "characterAtIndex:", 0),
          v13 = objc_msgSend(v11, "characterAtIndex:", 1),
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      v14 = (v13 + (v12 << 10) - 56613888);
    }
    else
    {
      v14 = objc_msgSend(v11, "characterAtIndex:", 0);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEmpty");

    if (v5)
    {
      objc_msgSend(v2, "selectedTextRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_rangeOfEnclosingWord:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v2, "textInRange:", v8);
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

- (id)_fullText
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginningOfDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textRangeFromPosition:toPosition:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "textInRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setSelectionToPosition:()UITextInput_Internal
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "_selectableText");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "setSelectedTextRange:", v5);

  }
}

- (BOOL)_selectionAtWordStart
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;

  objc_msgSend(a1, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_rangeOfEnclosingWord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "comparePosition:toPosition:", v6, v8);

    v10 = v9 == 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_selectionAtDocumentStart
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "beginningOfDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v1, "comparePosition:toPosition:", v4, v3) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_selectionAtDocumentEnd
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "endOfDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v1, "comparePosition:toPosition:", v4, v3) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_selectionClipRect
{
  return *MEMORY[0x1E0C9D628];
}

- (BOOL)_isEmptySelection
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v1, "comparePosition:toPosition:", v3, v4) == 0;

  return v5;
}

- (uint64_t)_hasMarkedTextOrRangedSelection
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v1, "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "isEmpty") ^ 1;

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)_extendCurrentSelection:()UITextInput_Internal
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a3)
  {
    v15 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (v6)
    {
      objc_msgSend(v15, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)a3 < 1)
      {
        objc_msgSend(a1, "_clampedpositionFromPosition:offset:", v8, a3);
        v13 = objc_claimAutoreleasedReturnValue();
        v12 = v8;
        v8 = (void *)v13;
      }
      else
      {
        objc_msgSend(a1, "_clampedpositionFromPosition:offset:", v10, a3);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v10 = (void *)v11;
      }

      objc_msgSend(v15, "textRangeFromPosition:toPosition:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSelectedTextRange:", v14);

      v5 = v15;
    }
  }

}

- (void)_moveCurrentSelection:()UITextInput_Internal
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a3)
  {
    v14 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (v6)
    {
      objc_msgSend(v14, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEmpty");

      if (v8)
      {
        objc_msgSend(v14, "selectedTextRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "selectedTextRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)a3 < 1)
          a3 = (a3 + 1);
        else
          a3 = (a3 - 1);
      }
      objc_msgSend(a1, "_clampedpositionFromPosition:offset:", v10, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "textRangeFromPosition:toPosition:", v12, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v14, "setSelectedTextRange:", v13);

      v5 = v14;
    }
  }

}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:()UITextInput_Internal
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;

  objc_msgSend(a1, "_selectableText");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v4 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v8 = &stru_1E16EDF20;
    if (v7)
      goto LABEL_4;
LABEL_18:
    v19 = 0;
    v10 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v24, "textInRange:", v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_18;
LABEL_4:
  v23 = a3;
  v9 = v7;
  v10 = v7;
  while (1)
  {
    v11 = v8;
    v12 = -[__CFString length](v11, "length");
    if (v12)
    {
      v13 = v12;
      -[__CFString _rangeOfBackwardDeletionClusterAtIndex:](v11, "_rangeOfBackwardDeletionClusterAtIndex:", -[__CFString length](v11, "length") - 1);
      v15 = v14;
      v16 = v13 - v14;

      if (v13 != v15)
      {
        v8 = v11;
        v19 = v9;
        goto LABEL_20;
      }
    }
    else
    {

      v16 = 0;
    }
    v19 = v10;

    objc_msgSend(v24, "positionFromPosition:offset:", v19, -1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v24, "textRangeFromPosition:toPosition:", v10, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v24, "textInRange:", v17);
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
      v17 = 0;
    }
    if (!objc_msgSend(v18, "length", v23))
      break;
    objc_msgSend(v18, "stringByAppendingString:", v11);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = v19;
    if (!v10)
      goto LABEL_20;
  }

  v10 = 0;
  v8 = v11;
LABEL_20:
  v20 = v24;
  if (v23 && v16 >= 1)
  {
    v21 = v10;

    -[__CFString substringToIndex:](v8, "substringToIndex:", v16);
    *v23 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    objc_msgSend(v20, "textRangeFromPosition:toPosition:", v19, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v24, "setSelectedTextRange:", v22);

  }
LABEL_29:

}

- (uint64_t)_expandSelectionToStartOfWordBeforeCaretSelection
{
  return objc_msgSend(a1, "_expandSelectionToStartOfWordsBeforeCaretSelection:", 1);
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:()UITextInput_Internal
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "_selectableText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && v4)
  {
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_positionAtStartOfWords:beforePosition:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelectedTextRange:", v9);

    }
  }

}

- (id)_positionWithinRange:()UITextInput_Internal farthestInDirection:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1)
  {
    objc_msgSend(v6, "start");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v7, "positionWithinRange:farthestInDirection:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "end");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

- (unint64_t)_opposingDirectionFromDirection:()UITextInput_Internal
{
  unint64_t result;

  result = a3;
  if (a3 <= 5)
    return qword_1866818E8[a3];
  return result;
}

- (id)_positionFromPosition:()UITextInput_Internal pastTextUnit:inDirection:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v8 = a3;
  objc_msgSend(a1, "_selectableText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = -3;
    while (!__CFADD__(v10++, 1))
    {
      objc_msgSend(v9, "tokenizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v8, a4, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v17 = 0;
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v13, a4, a5))
      {

LABEL_11:
        v17 = v13;
        v8 = v17;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, objc_msgSend(a1, "_opposingDirectionFromDirection:", a5));

      v8 = v13;
      if (v16)
        goto LABEL_11;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)_positionAtStartOfWords:()UITextInput_Internal beforePosition:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 && v6)
  {
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeEnclosingPosition:withGranularity:inDirection:", v6, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "tokenizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:toBoundary:inDirection:", v6, 1, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v10 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v8, "tokenizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rangeEnclosingPosition:withGranularity:inDirection:", v19, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_13;
    }
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 >= 2)
    {
      v12 = a3 - 1;
      while (1)
      {
        objc_msgSend(v8, "tokenizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v11, 1, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          break;
        objc_msgSend(v8, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          break;

        v11 = v16;
        if (!--v12)
          goto LABEL_12;
      }
    }
    v16 = v11;
LABEL_12:
    v6 = v16;

    v10 = v6;
  }
  else
  {
    v6 = v6;
    v10 = v6;
  }
LABEL_13:

  return v10;
}

- (void)_setCaretSelectionAtEndOfSelection
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_selectableText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTextRange");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "end");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTextRange:", v5);

  }
}

- (void)_deleteByWord
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_selectableText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v9);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v2, "start");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_positionAtStartOfWords:beforePosition:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v2, "end");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v7;
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v9, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textDidChange:", v9);

}

- (void)_deleteForwardByWord
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a1, "_selectableText");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v17);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(a1, "_selectableText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v2)
    {
      objc_msgSend(v4, "tokenizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v7, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_4;
      objc_msgSend(v5, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v5, "tokenizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rangeEnclosingPosition:withGranularity:inDirection:", v15, 1, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
LABEL_4:
          objc_msgSend(v2, "start");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "end");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "textRangeFromPosition:toPosition:", v9, v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v2 = (void *)v11;
        }
      }
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v17, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v17);

}

- (void)_deleteToStartOfLine
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_selectableText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v12);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v12, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "comparePosition:toPosition:", v7, v6);

      if (v8 == 1)
      {
        objc_msgSend(v2, "start");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textRangeFromPosition:toPosition:", v6, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
      }
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v12, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textDidChange:", v12);

}

- (void)_deleteToEndOfLine
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_selectableText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v12);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v12, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "comparePosition:toPosition:", v6, v7);

      if (v8 == 1)
      {
        objc_msgSend(v2, "end");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textRangeFromPosition:toPosition:", v9, v6);
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
      }
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v12, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textDidChange:", v12);

}

- (void)_deleteToEndOfParagraph
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_selectableText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v12);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v12, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "comparePosition:toPosition:", v6, v7);

      if (v8 == 1)
      {
        objc_msgSend(v2, "end");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textRangeFromPosition:toPosition:", v9, v6);
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
      }
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v12, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textDidChange:", v12);

}

- (void)_deleteTextRange:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedTextRange:", v4);

  objc_msgSend(v9, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = v9;
      if (objc_msgSend(v8, "keyboardInputShouldDelete:", v8))
        objc_msgSend(v8, "deleteBackward");
      else
        objc_msgSend(v8, "setSelectedTextRange:", v5);

    }
    else
    {
      objc_msgSend(v9, "deleteBackward");
    }
  }

}

- (void)_deleteBackwardAndNotify:()UITextInput_Internal
{
  id v1;

  objc_msgSend(a1, "_keyInput");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteBackward");

}

- (void)_deleteForwardAndNotify:()UITextInput_Internal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_selectableText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWillChange:", v12);

  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v12, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "comparePosition:toPosition:", v6, v7);

      if (v8 == 1)
      {
        objc_msgSend(v2, "end");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textRangeFromPosition:toPosition:", v9, v6);
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
      }
    }

  }
  objc_msgSend(a1, "_deleteTextRange:", v2);
  objc_msgSend(v12, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textDidChange:", v12);

}

- (void)_transpose
{
  void *v1;
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(a1, "_selectableText");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedTextRange");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEmpty"))
  {
    objc_msgSend(v18, "inputDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textWillChange:", v18);

    objc_msgSend(v18, "tokenizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "start");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "positionFromPosition:toBoundary:inDirection:", v4, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "tokenizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "positionFromPosition:toBoundary:inDirection:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v8)
    {
      objc_msgSend(v1, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textRangeFromPosition:toPosition:", v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1, "end");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textRangeFromPosition:toPosition:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && v12)
      {
        objc_msgSend(v18, "textInRange:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "textInRange:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingString:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "textRangeFromPosition:toPosition:", v5, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v18, "replaceRange:withText:", v16, v15);

      }
    }
    objc_msgSend(v18, "inputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textDidChange:", v18);

  }
}

- (void)_replaceCurrentWordWithText:()UITextInput_Internal
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_rangeOfEnclosingWord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "replaceRange:withText:", v7, v8);

}

- (void)_replaceDocumentWithText:()UITextInput_Internal
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fullRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
      objc_msgSend(v4, "replaceRange:withText:", v6, &stru_1E16EDF20);
    objc_msgSend(v4, "insertText:", v7);
  }

}

- (void)_scrollRectToVisible:()UITextInput_Internal animated:
{
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "_selectableText");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textInputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "performSelector:", sel__enclosingScrollerIncludingSelf);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromView:", v12, a2, a3, a4, a5);
    objc_msgSend(v13, "scrollRectToVisible:animated:", a7);

  }
}

- (id)_normalizedStringForRangeComparison:()UITextInput_Internal
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_stringByReplacingCharacter:withCharacter:", 160, 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringByReplacingCharacter:withCharacter:", 8217, 39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_stringByReplacingCharacter:withCharacter:", 8216, 39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_rangeOfText:()UITextInput_Internal endingAtPosition:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_selectableText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v8, "_rangeOfEnclosingWord:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "textInRange:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v10, "isEqualToString:", v6))
    {
      v12 = v9;
      v11 = v12;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v8, "beginningOfDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "textInRange:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "length");
      if (v16 <= objc_msgSend(v6, "length"))
      {
        v12 = v14;
        v10 = v15;
LABEL_25:
        objc_msgSend(a1, "_normalizedStringForRangeComparison:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_normalizedStringForRangeComparison:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v22))
          v11 = v12;
        else
          v11 = 0;

        goto LABEL_29;
      }
      v17 = 0;
      while (1)
      {
        v18 = v13;
        objc_msgSend(v8, "positionFromPosition:offset:", v13, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        if (objc_msgSend(v8, "comparePosition:toPosition:", v13, v7) != -1)
        {

          break;
        }
        objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_24;
        objc_msgSend(v8, "textInRange:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v10, "length");
        if (v19 > objc_msgSend(v6, "length"))
        {
          v14 = v12;
          v15 = v10;
          if (v17++ < 9)
            continue;
        }
        goto LABEL_25;
      }

      v13 = 0;
    }
    else
    {
      v15 = v10;
    }
LABEL_24:

    v12 = 0;
    v10 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v11;
}

- (id)_rangeOfTextUnit:()UITextInput_Internal enclosingPosition:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a1, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v7, "tokenizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)_rangeOfEnclosingWord:()UITextInput_Internal
{
  return objc_msgSend(a1, "_rangeOfTextUnit:enclosingPosition:", 1, a3);
}

- (uint64_t)_rangeOfLineEnclosingPosition:()UITextInput_Internal
{
  return objc_msgSend(a1, "_rangeOfTextUnit:enclosingPosition:", 4, a3);
}

- (uint64_t)_rangeOfSentenceEnclosingPosition:()UITextInput_Internal
{
  return objc_msgSend(a1, "_rangeOfTextUnit:enclosingPosition:", 2, a3);
}

- (uint64_t)_rangeOfParagraphEnclosingPosition:()UITextInput_Internal
{
  return objc_msgSend(a1, "_rangeOfTextUnit:enclosingPosition:", 3, a3);
}

- (id)_fullRange
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginningOfDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textRangeFromPosition:toPosition:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rangeSpanningTextUnit:()UITextInput_Internal andPosition:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a1, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_rangeOfTextUnit:enclosingPosition:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v6, a3, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v11;
    if (!v11)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v6, a3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v15 = 0;
        goto LABEL_11;
      }
      v10 = 0;
    }
    objc_msgSend(v7, "tokenizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rangeEnclosingPosition:withGranularity:inDirection:", v12, a3, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v15, "start");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v7;
        v18 = v16;
        v19 = v6;
LABEL_13:
        objc_msgSend(v17, "textRangeFromPosition:toPosition:", v18, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_11:
    objc_msgSend(v15, "end");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v7;
      v18 = v6;
      v19 = v16;
      goto LABEL_13;
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)_range:()UITextInput_Internal containsRange:
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  NSRange v17;
  NSRange v18;

  v6 = a4;
  v7 = objc_msgSend(a1, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = objc_msgSend(a1, "_nsrangeForTextRange:", v6);
  v12 = v11;

  if (!v12)
    return v10 >= v7 && v10 - v7 < v9;
  v17.location = v7;
  v17.length = v9;
  v18.location = v10;
  v18.length = v12;
  v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:()UITextInput_Internal intersectsRange:
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v14;
  NSRange v15;

  v6 = a4;
  v7 = objc_msgSend(a1, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = objc_msgSend(a1, "_nsrangeForTextRange:", v6);
  v12 = v11;

  v14.location = v7;
  v14.length = v9;
  v15.location = v10;
  v15.length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (id)_intersectionOfRange:()UITextInput_Internal andRange:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_msgSend(v6, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "comparePosition:toPosition:", v9, v10) == 1)
    v11 = v6;
  else
    v11 = v7;
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "comparePosition:toPosition:", v13, v14) == -1)
    v15 = v6;
  else
    v15 = v7;
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_range:()UITextInput_Internal isEqualToRange:
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      v10 = a1;
      objc_msgSend(v6, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "comparePosition:toPosition:", v11, v12);

      objc_msgSend(v6, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13 | objc_msgSend(v10, "comparePosition:toPosition:", v14, v15);

      v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:()UITextInput_Internal withGranularity:
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 5)
  {
    objc_msgSend(a1, "_findDocumentBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    objc_msgSend(a1, "_findPleasingWordBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v4, 4, 0))
    goto LABEL_2;
  v9 = objc_msgSend(v6, "isPosition:withinTextUnit:inDirection:", v4, 1, 0);
  objc_msgSend(v5, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v15 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v4, 1, 1);

    if (!v15)
    {
      objc_msgSend(v5, "tokenizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v4, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_12;
      objc_msgSend(v5, "endOfDocument");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_2:
    v7 = v4;
LABEL_3:
    v8 = v7;
    goto LABEL_12;
  }
  objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v13, v4);

  if (v14 > 1)
    objc_msgSend(v12, "end");
  else
    objc_msgSend(v12, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)_findDocumentBoundaryFromPosition:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);
  v9 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v4, v7);

  if (v8 <= v9)
    v10 = v6;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || !v10
    || (objc_msgSend(v8, "isEmpty") & 1) != 0
    || (objc_msgSend(v10, "isEmpty") & 1) != 0
    || (objc_msgSend(v8, "isEqual:", v10) & 1) != 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v8, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {

LABEL_9:
    objc_msgSend(v5, "selectionRectsForRange:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v8, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v13, "isEqual:", v14);

  if (v28)
    goto LABEL_9;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v4, "start");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v19;
  objc_msgSend(a1, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v19, v5);
  objc_msgSend(v8, "end");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 4, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    while ((objc_msgSend(v21, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v21, "end");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v22, 4, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "isEqual:", v21))
      {

        break;
      }
      objc_msgSend(v5, "selectionRectsForRange:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v24);

      v21 = v23;
      if (!v23)
        break;
    }

  }
  objc_msgSend(v10, "start");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(a1, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v27, v5);

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:()UITextInput_Internal byTrimmingWhitespaceInRange:inDocument:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "textInRange:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v7, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v13, objc_msgSend(v12, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v9, "selectionRectsForRange:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v17);

      }
    }

  }
}

- (id)_rangeOfSmartSelectionIncludingRange:()UITextInput_Internal
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_selectableText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v5, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v60 = v4;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v5, "beginningOfDocument");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v6, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v12, v13);

    if (v14 >= 65)
    {
      objc_msgSend(v6, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v15, -64);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v16, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v6, "start");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v17, -64);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v18, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "start");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v5, "comparePosition:toPosition:", v12, v19);

      if (v20 == 1)
      {
        objc_msgSend(v6, "start");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v21, 0, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(v6, "start");
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        v12 = v25;
      }
    }
    objc_msgSend(v6, "end");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v26, 2, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(v5, "endOfDocument");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    objc_msgSend(v6, "end");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v31, v30);

    if (v32 >= 65)
    {
      objc_msgSend(v6, "end");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v33, 64);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v34, 1, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend(v6, "end");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v35, 64);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v36, 0, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "end");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v5, "comparePosition:toPosition:", v37, v30);

      if (v38 == 1)
      {
        objc_msgSend(v6, "end");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v39, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          v42 = v40;
        }
        else
        {
          objc_msgSend(v6, "end");
          v42 = (id)objc_claimAutoreleasedReturnValue();
        }
        v43 = v42;

        v30 = v43;
      }
    }
    v59 = v7;
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v12, v30);
    v44 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v45 = objc_msgSend(v5, "keyboardType"), v46 = 420, v45 != 3) && v45 != 10 && v45 != 120)
    {
      v46 = 428;
    }
    objc_msgSend(v5, "beginningOfDocument");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v12;
    v48 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v47, v12);

    v49 = objc_msgSend(a1, "_nsrangeForTextRange:", v6);
    v51 = v50;
    v57 = (void *)v44;
    objc_msgSend(v5, "textInRange:", v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = &v62;
    v64 = 0x3010000000;
    v65 = &unk_18685B0AF;
    v66 = xmmword_186679030;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __70__DOMNode_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v61[3] = &unk_1E16D8F88;
    v61[4] = &v62;
    objc_msgSend(v53, "smartSelectionForTextInDocument:inRange:options:completion:", v52, v49 - v48, v51, v46, v61);

    v54 = v63[4];
    if (v54 != 0x7FFFFFFFFFFFFFFFLL && v63[5])
    {
      v63[4] = v54 + v48;
      objc_msgSend(a1, "_textRangeFromNSRange:");
      v55 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v55;
    }
    _Block_object_dispose(&v62, 8);

    v4 = v60;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_clampedpositionFromPosition:()UITextInput_Internal offset:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1, "_selectableText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 < 1)
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "beginningOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "endOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = (id)v11;
      }
    }

    goto LABEL_10;
  }
  v10 = v6;
LABEL_10:

  return v10;
}

- (id)_rangeFromCurrentRangeWithDelta:()UITextInput_Internal
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend(a1, "_selectableText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 | a4)
  {
    v10 = a4 + a3;
    objc_msgSend(v7, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "end");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(v6, "positionFromPosition:offset:", v11, a3);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
      if (!v13)
      {
        if (a3 < 0)
          objc_msgSend(v6, "beginningOfDocument");
        else
          objc_msgSend(v6, "endOfDocument");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v10)
    {
      objc_msgSend(v6, "positionFromPosition:offset:", v12, v10);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
      if (!v14)
      {
        if (v10 < 0)
        {
          v15 = v11;
        }
        else
        {
          objc_msgSend(v6, "endOfDocument");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v15;
      }
    }
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v8;
    v9 = v18;

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)_textColorForCaretSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "textColorForCaretSelection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_selectableText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "selectedTextRange");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v3, "endOfDocument");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 && objc_msgSend(v3, "comparePosition:toPosition:", v6, v5) == -1)
        {
          v7 = v6;

          v5 = v7;
        }
        objc_msgSend(v3, "textStylingAtPosition:inDirection:", v5, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v9 = *(const __CFString **)off_1E1678D98;
      else
        v9 = CFSTR("UITextInputTextColorKey");
      objc_msgSend(v8, "objectForKey:", v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)_fontForCaretSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "fontForCaretSelection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_selectableText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "selectedTextRange");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v3, "endOfDocument");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 && objc_msgSend(v3, "comparePosition:toPosition:", v6, v5) == -1)
        {
          v7 = v6;

          v5 = v7;
        }
        objc_msgSend(v3, "textStylingAtPosition:inDirection:", v5, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v9 = *(const __CFString **)off_1E1678D90;
      else
        v9 = CFSTR("UITextInputTextFontKey");
      objc_msgSend(v8, "objectForKey:", v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)_updateSelectionWithTextRange:()UITextInput_Internal withAffinityDownstream:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_selectableText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSelectedTextRange:withAffinityDownstream:", v6, a4);

}

- (id)_setSelectionRangeWithHistory:()UITextInput_Internal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend(a1, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  if (objc_msgSend(v4, "anchor") == 1)
  {
    objc_msgSend(v4, "cursor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(v4, "setEnd:", v7);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "anchor");
  objc_msgSend(v4, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStart:", v7);
  if (v8 != 2)
    goto LABEL_5;
LABEL_6:

  objc_msgSend(v4, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "comparePosition:toPosition:", v9, v10);

  if (v11 >= 1)
  {
    if (objc_msgSend(v4, "anchor") == 1)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v4, "setAnchor:", v12);
  }
  objc_msgSend(v4, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, objc_msgSend(v4, "affinityDownstream"));
  if (objc_msgSend(v4, "anchor"))
  {
    if (objc_msgSend(v4, "anchor") == 1)
      objc_msgSend(v5, "_lastRectForRange:", v15);
    else
      objc_msgSend(v5, "firstRectForRange:", v15);
    objc_msgSend(v5, "_scrollRectToVisible:animated:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DD9898];
    objc_msgSend(a1, "webView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", v17, v18);

  }
LABEL_19:

  return v4;
}

- (UITextInputArrowKeyHistory)_setHistory:()UITextInput_Internal withExtending:withAnchor:withAffinityDownstream:
{
  UITextInputArrowKeyHistory *v10;
  UITextInputArrowKeyHistory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a3;
  if (v10)
  {
    v11 = v10;
    if ((a4 & 1) == 0)
      -[UITextInputArrowKeyHistory setAnchor:](v10, "setAnchor:", 0);
  }
  else
  {
    v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  objc_msgSend(a1, "_selectableText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setStart:](v11, "setStart:", v14);

  objc_msgSend(v12, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setEnd:](v11, "setEnd:", v16);

  v17 = -[UITextInputArrowKeyHistory anchor](v11, "anchor");
  objc_msgSend(v12, "selectedTextRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((_DWORD)a5 == 2)
  {
    if (v17 == 1)
    {
LABEL_7:
      objc_msgSend(v18, "end");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_7;
  }
  objc_msgSend(v18, "start");
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v21 = (void *)v20;
  -[UITextInputArrowKeyHistory setCursor:](v11, "setCursor:", v20);

  -[UITextInputArrowKeyHistory startPosition](v11, "startPosition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[UITextInputArrowKeyHistory cursor](v11, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputArrowKeyHistory setStartPosition:](v11, "setStartPosition:", v23);

    if (a4)
      goto LABEL_12;
LABEL_16:
    a5 = 0;
LABEL_17:
    -[UITextInputArrowKeyHistory setAnchor:](v11, "setAnchor:", a5);
    goto LABEL_18;
  }
  if (!a4)
    goto LABEL_16;
LABEL_12:
  if (!-[UITextInputArrowKeyHistory anchor](v11, "anchor") || objc_msgSend(a1, "_isEmptySelection"))
    goto LABEL_17;
LABEL_18:
  -[UITextInputArrowKeyHistory setAffinityDownstream:](v11, "setAffinityDownstream:", a6);

  return v11;
}

- (id)_moveToStartOfWord:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v26 = 0;
    v9 = v6;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAmount:", 0);
  objc_msgSend(v7, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 1);

  if ((v12 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v7, "tokenizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_4:
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isPosition:withinTextUnit:inDirection:", v17, 1, 1);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "positionFromPosition:toBoundary:inDirection:", v20, 1, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v21);

    }
LABEL_7:
    objc_msgSend(v7, "tokenizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "positionFromPosition:toBoundary:inDirection:", v23, 1, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v24);

    objc_msgSend(v9, "cursor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v25);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "cursor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  while (1)
  {
    objc_msgSend(v7, "beginningOfDocument");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v7, "comparePosition:toPosition:", v29, v15);

    if (!v30)
      break;
    if (v28 && !objc_msgSend(v7, "comparePosition:toPosition:", v28, v15))
    {
      objc_msgSend(v7, "beginningOfDocument");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v35);

      objc_msgSend(v9, "cursor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartPosition:", v36);

      break;
    }
    v31 = v15;

    objc_msgSend(v7, "tokenizer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "positionFromPosition:toBoundary:inDirection:", v31, 3, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tokenizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isPosition:atBoundary:inDirection:", v15, 3, 1);

    v28 = v31;
    if ((v34 & 1) == 0)
    {
      objc_msgSend(v9, "setCursor:", v15);

      goto LABEL_4;
    }
  }
  objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v26;
}

- (id)_moveToEndOfWord:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
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

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 0);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v9, "setCursor:", v15);

    }
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v18);

    objc_msgSend(v9, "cursor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v7, "endOfDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v20);

    }
    objc_msgSend(v9, "cursor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v21);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
    v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 1) & 1) == 0)
    {
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7, "tokenizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v15, 4, 1);

        if ((v16 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

LABEL_10:
    objc_msgSend(v10, "cursor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartPosition:", v18);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v17 = 0;
  v10 = v6;
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:()UITextInput_Internal withHistory:
{
  id v6;
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
  char v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 0) & 1) == 0)
    {
      if (v9)
      {

      }
      else
      {
        objc_msgSend(v7, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v16, 4, 0);

        if ((v17 & 1) != 0)
        {
LABEL_9:
          objc_msgSend(v10, "cursor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setStartPosition:", v18);

          objc_msgSend(a1, "_setSelectionRangeWithHistory:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

    goto LABEL_9;
  }
  v14 = 0;
  v10 = v6;
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 1);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 0);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "beginningOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "endOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    objc_msgSend(v7, "tokenizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isPosition:atBoundary:inDirection:", v13, 4, 3);

    if (v14)
      objc_msgSend(v9, "setAffinityDownstream:", 1);
    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveUp:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = objc_msgSend(a1, "_selectionAffinity") == 0;
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginningOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "beginningOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveDown:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = objc_msgSend(a1, "_selectionAffinity") == 0;
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "endOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || (_DWORD)a3)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 3, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveRight:()UITextInput_Internal withHistory:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a1, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, a3, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || (_DWORD)a3)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 2, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    objc_msgSend(a1, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:()UITextInput_Internal inDirection:offset:withAffinityDownstream:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a1, "_selectableText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "positionFromPosition:inDirection:offset:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_setSelectedTextRange:()UITextInput_Internal withAffinityDownstream:
{
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "setSelectedTextRange:withAffinityDownstream:", v7, a4);
  }
  else
  {
    objc_msgSend(a1, "_selectableText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTextRange:", v7);

  }
}

- (uint64_t)_selectionAffinity
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v1, "tokenizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isPosition:atBoundary:inDirection:", v5, 3, 1))
    {

    }
    else
    {
      objc_msgSend(v1, "tokenizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v8, 4, 2);

      if ((v9 & 1) != 0)
      {
        v2 = 1;
        goto LABEL_8;
      }
    }
    v2 = 0;
    goto LABEL_8;
  }
  v2 = objc_msgSend(v1, "selectionAffinity");
LABEL_8:

  return v2;
}

- (void)_setGestureRecognizers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITextPhraseBoundaryInteraction *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_setInternalGestureRecognizers");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "markedTextOverlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "interactions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(a1, "_selectableText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interactionAssistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setGestureRecognizers");
    }
    else if (objc_msgSend(v9, "_hasMarkedText"))
    {
      if (objc_msgSend(v2, "hasEditableMarkedText"))
      {
        objc_msgSend(v9, "markedTextRange");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstRectForRange:", v12);
        objc_msgSend(v3, "setFrame:");

        objc_msgSend(v9, "textInputView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v3);

        v14 = -[UITextPhraseBoundaryInteraction initWithTextInput:]([UITextPhraseBoundaryInteraction alloc], "initWithTextInput:", v9);
        objc_msgSend(v3, "addInteraction:", v14);

      }
    }

  }
}

- (uint64_t)_usesAsynchronousProtocol
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled");
  objc_msgSend(a1, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if ((objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EE0CE228) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(a1, "_selectableText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EE0CE288);

    }
  }
  else
  {
    v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE648);
  }

  return v5;
}

- (uint64_t)_hasMarkedText
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "_selectableText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "_usesAsynchronousProtocol")
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| objc_msgSend(v1, "conformsToProtocolCached:", &unk_1EE0CE288)|| objc_msgSend(v1, "conformsToProtocolCached:", &unk_1EE0CE228)))
  {
    v2 = objc_msgSend(v1, "hasMarkedText");
  }
  else
  {
    objc_msgSend(v1, "markedTextRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v3 != 0;

  }
  return v2;
}

- (void)_setMarkedText:()UITextInput_Internal selectedRange:
{
  objc_class *v8;
  id v9;
  id v10;

  v8 = (objc_class *)MEMORY[0x1E0CB3498];
  v9 = a3;
  v10 = (id)objc_msgSend([v8 alloc], "initWithString:", v9);

  objc_msgSend(a1, "_setAttributedMarkedText:selectedRange:", v10, a4, a5);
}

- (void)_setAttributedMarkedText:()UITextInput_Internal selectedRange:
{
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v8 = a3;
  objc_msgSend(a1, "_selectableText");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "_hasMarkedText");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v27, "setAttributedMarkedText:selectedRange:", v8, a4, a5);
  }
  else
  {
    objc_msgSend(v8, "string");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setMarkedText:selectedRange:", v10, a4, a5);
    v8 = (id)v10;
  }

  v11 = objc_msgSend(a1, "_hasMarkedText");
  if (v9 != v11)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v27, "_selectionDisplayInteraction");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v27;
      v14 = (void *)v12;
    }
    else
    {
      v14 = 0;
      v13 = v27;
    }
    objc_msgSend(v13, "_setGestureRecognizers");
    objc_msgSend(a1, "_textSelectingContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "interactionAssistant");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(a1, "_textSelectingContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "interactionAssistant");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "externalInteractions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(a1, "_textSelectingContainer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "interactionAssistant");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "deactivateSelection");

        objc_msgSend(v27, "_setSelectionDisplayInteraction:", v14);
      }
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (v11)
  {
    objc_msgSend(a1, "_textSelectingContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interactionAssistant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "markedTextOverlay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "markedTextRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstRectForRange:", v18);
      objc_msgSend(v14, "setFrame:");

LABEL_15:
    }
  }

}

- (void)_unmarkText
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "_selectableText");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1, "_hasMarkedText");
  objc_msgSend(v12, "unmarkText");
  if (v2)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v12, "_selectionDisplayInteraction");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(v12, "_setGestureRecognizers");
    objc_msgSend(a1, "_textSelectingContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionAssistant");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(a1, "_textSelectingContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interactionAssistant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "externalInteractions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(a1, "_textSelectingContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "interactionAssistant");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deactivateSelection");

        objc_msgSend(v12, "_setSelectionDisplayInteraction:", v3);
      }
    }
    else
    {

    }
  }

}

- (uint64_t)_shouldPerformUICalloutBarButtonReplaceAction:()UITextInput_Internal forText:checkAutocorrection:
{
  id v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a4;
  v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a5
    && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "autocorrectSpellingEnabled"),
        v10,
        !v11)
    || (objc_msgSend(v8, "_containsCJScriptsOnly") & 1) != 0)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (unint64_t)objc_msgSend(v13, "count") < 8;
LABEL_13:

  return v14;
}

- (id)_textInteraction
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textInputView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_textInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)inputAssistantItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textInputView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "inputAssistantItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_responderWindow
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textInputView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_responderWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_selectionDisplayInteraction
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textInputView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_selectionDisplayInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
