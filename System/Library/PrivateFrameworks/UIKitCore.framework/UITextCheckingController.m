@implementation UITextCheckingController

- (UITextCheckingController)initWithClient:(id)a3
{
  id v5;
  UITextCheckingController *v6;
  void *v7;
  double v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)UITextCheckingController;
    v6 = -[UITextCheckingController init](&v15, sel_init);
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_client, a3);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      self->_lastPauseTimer = v8;

      self->_selectedRangeFromPreviousUnchecked = (_NSRange)xmmword_186679030;
      self->_previousCheckedSentenceRange = (_NSRange)xmmword_186679030;
      self->_previousCheckedSelectedRange.length = 0;
      self->_prechangeCheckingSequenceNumber = 0;
      self->_previousCheckedSelectedRange.location = 0x7FFFFFFFFFFFFFFFLL;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 2;
      else
        v9 = 0;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xFD | v9;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 4;
      else
        v10 = 0;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xFB | v10;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 8;
      else
        v11 = 0;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xF7 | v11;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 16;
      else
        v12 = 0;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xEF | v12;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 32;
      else
        v13 = 0;
      *(_BYTE *)&self->_tccClientFlags = *(_BYTE *)&self->_tccClientFlags & 0xDF | v13;
    }
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextCheckingController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UITextCheckingController;
  -[UITextCheckingController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  UITextCheckingClient *client;
  UITextChecker *textChecker;

  -[UITextCheckingController invalidateTimers](self, "invalidateTimers");
  client = self->_client;
  self->_client = 0;

  textChecker = self->_textChecker;
  self->_textChecker = 0;

}

- (void)invalidateTimers
{
  NSTimer *pauseTimer;
  NSTimer *v4;

  pauseTimer = self->_pauseTimer;
  if (pauseTimer)
  {
    -[NSTimer invalidate](pauseTimer, "invalidate");
    v4 = self->_pauseTimer;
    self->_pauseTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (UITextCheckingClient)client
{
  return self->_client;
}

- (BOOL)continuousSpellCheckingEnabled
{
  UITextCheckingClient *client;

  client = self->_client;
  if (client && (*(_BYTE *)&self->_tccClientFlags & 0x20) != 0)
    return -[UITextCheckingClient continuousSpellCheckingEnabled](client, "continuousSpellCheckingEnabled");
  else
    return 0;
}

- (id)validAnnotations
{
  if (qword_1ECD7B360 != -1)
    dispatch_once(&qword_1ECD7B360, &__block_literal_global_298);
  return (id)qword_1ECD7B358;
}

void __44__UITextCheckingController_validAnnotations__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD v10[4];

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  BYTE5(v10[1]) = BYTE5(qword_1EE071DE0);
  HIWORD(v10[1]) = HIWORD(qword_1EE071DE0);
  v10[2] = 0;
  v9 = off_1EE071DE8;
  strcpy((char *)v10, "rflowScroll:");
  v7 = *(_QWORD *)off_1E16790E8;
  v8 = qword_1EE071DD0;
  v5 = sel_webViewDidPreventDefaultForEvent_;
  v6 = *(_QWORD *)off_1E16790E0;
  v4 = *(_QWORD *)off_1E1679050;
  qmemcpy(v3, "idPrevenForEvent", sizeof(v3));
  v1 = objc_msgSend(v0, "initWithObjects:", sel_webViewDidEndOverflowScroll_, CFSTR("NSDominantLanguageAttributeName"), CFSTR("NSDominantScriptAttributeName"), CFSTR("NSGrammarCorrections"), off_1EE071E18, sel_webViewDidStartOverflowScroll_, CFSTR("NSGrammarUserDescription"), CFSTR("NSGrammarConfidenceScore"), CFSTR("NSGrammarIssueType"), CFSTR("NSGrammarLanguage"), CFSTR("NSGrammarTargetPair"), CFSTR("NSGrammarAutocorrected"), qword_1EE071E10, v3[0], v3[1], v4, sel_webViewDidPreventDefaultForEvent_,
         v6,
         v7,
         qword_1EE071DD0,
         off_1EE071DE8,
         v10[0],
         v10[1],
         0);
  v2 = (void *)qword_1ECD7B358;
  qword_1ECD7B358 = v1;

}

- (id)textChecker
{
  UITextChecker *textChecker;
  UITextChecker *v4;
  UITextChecker *v5;
  UITextChecker *v6;

  textChecker = self->_textChecker;
  if (!textChecker)
  {
    v4 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
    v5 = self->_textChecker;
    self->_textChecker = v4;

    textChecker = self->_textChecker;
  }
  if (-[UITextChecker _doneLoading](textChecker, "_doneLoading"))
    v6 = self->_textChecker;
  else
    v6 = 0;
  return v6;
}

- (void)preheatTextChecker
{
  UITextChecker *v3;
  UITextChecker *textChecker;

  if (!self->_textChecker)
  {
    v3 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
    textChecker = self->_textChecker;
    self->_textChecker = v3;

  }
}

- (_NSRange)nsRangeForTextRange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  UITextCheckingClient *client;
  id v7;
  void *v8;
  void *v9;
  UITextCheckingClient *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v3 = 0;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    client = self->_client;
    if (client)
    {
      v7 = a3;
      -[UITextCheckingClient beginningOfDocument](client, "beginningOfDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[UITextCheckingClient offsetFromPosition:toPosition:](client, "offsetFromPosition:toPosition:", v8, v9);

      v10 = self->_client;
      objc_msgSend(v7, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = -[UITextCheckingClient offsetFromPosition:toPosition:](v10, "offsetFromPosition:toPosition:", v11, v12);
    }
  }
  v13 = v4;
  v14 = v3;
  result.length = v14;
  result.location = v13;
  return result;
}

- (_NSRange)selectedRange
{
  UITextCheckingClient *client;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  client = self->_client;
  if (client)
  {
    -[UITextCheckingClient selectedTextRange](client, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UITextCheckingController nsRangeForTextRange:](self, "nsRangeForTextRange:", v4);
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)annotatedStringWithValidAnnotationsForAnnotatedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[UITextCheckingController validAnnotations](self, "validAnnotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "length");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__UITextCheckingController_annotatedStringWithValidAnnotationsForAnnotatedString___block_invoke;
    v23[3] = &unk_1E16E67D8;
    v9 = v6;
    v24 = v9;
    v10 = v7;
    v25 = v10;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0x100000, v23);
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_msgSend(v5, "mutableCopy");
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v11, "removeAttribute:range:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++), 0, objc_msgSend(v11, "length", (_QWORD)v19));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v14);
      }

    }
    else
    {
      v11 = v5;
    }
    v17 = v11;

  }
  else
  {
    v17 = v5;
  }

  return v17;
}

void __82__UITextCheckingController_annotatedStringWithValidAnnotationsForAnnotatedString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0
          && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)annotatedSubstringForRange:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = 0;
  if (a3 && self->_client)
  {
    v5 = a3;
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextCheckingClient endOfDocument](self->_client, "endOfDocument");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v3 = 0;
    if (v6 && v7 && v8)
    {
      if (-[UITextCheckingClient comparePosition:toPosition:](self->_client, "comparePosition:toPosition:", v6, v8) == -1)
      {
        if (-[UITextCheckingClient comparePosition:toPosition:](self->_client, "comparePosition:toPosition:", v7, v9) == 1)
        {
          v10 = v9;

          v7 = v10;
        }
        -[UITextCheckingClient textRangeFromPosition:toPosition:](self->_client, "textRangeFromPosition:toPosition:", v6, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[UITextCheckingClient annotatedSubstringForRange:](self->_client, "annotatedSubstringForRange:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        -[UITextCheckingController annotatedStringWithValidAnnotationsForAnnotatedString:](self, "annotatedStringWithValidAnnotationsForAnnotatedString:", v12);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }
    }

  }
  return v3;
}

- (void)checkSpellingForWordInRange:(id)a3
{
  void *v4;
  UITextCheckingClient *client;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UITextCheckingController textChecker](self, "textChecker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    client = self->_client;
    if (client && v4 != 0)
    {
      -[UITextCheckingClient textInRange:](client, "textInRange:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v7, 0, v8, 0, 0, v9);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", *(_QWORD *)off_1E16790E8, v14);
      }
      else
      {
        -[UITextCheckingController annotatedSubstringForRange:](self, "annotatedSubstringForRange:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          v13 = (void *)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v13, "addAttribute:value:range:", *(_QWORD *)off_1E16790E8, &unk_1E1A9A9C8, 0, objc_msgSend(v13, "length"));
          -[UITextCheckingClient replaceRange:withAnnotatedString:relativeReplacementRange:](self->_client, "replaceRange:withAnnotatedString:relativeReplacementRange:", v14, v13, 0x7FFFFFFFFFFFFFFFLL, 0);

        }
      }

    }
  }

}

- (void)_addGrammarAttributesForRange:(_NSRange)a3 details:(id)a4 inAnnotatedString:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  NSUInteger location;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  location = a3.location;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  v31 = objc_msgSend(v7, "length");
  +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v10)
  {
    v11 = v10;
    v43 = 0;
    v39 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v45;
    v33 = *(_QWORD *)off_1E16790E0;
    v34 = *(_QWORD *)off_1E16790E8;
    v42 = *(_QWORD *)v45;
    v35 = v9;
    while (1)
    {
      v14 = 0;
      v37 = v11;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarCorrections"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = v16;
              v16 = 0;
              goto LABEL_52;
            }
            if (objc_msgSend(v16, "count"))
            {
              objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarUserDescription"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v17 = 0;
                }
              }
              objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarIssueType"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v18 = 0;
                }
              }
              v41 = v18;
              objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarTargetPair"));
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = (void *)v19;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v40 = v20;
LABEL_22:
                  objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarConfidenceScore"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      v21 = 0;
                    }
                  }
                  objc_msgSend(v15, "objectForKey:", CFSTR("NSGrammarRange"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                  {
                    v23 = v43;
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      v24 = objc_msgSend(v22, "rangeValue");
                      if (v31 < v24 + location)
                      {
                        v43 = 0;
                        v39 = 0x7FFFFFFFFFFFFFFFLL;
                        goto LABEL_51;
                      }
                      v39 = v24 + location;
                      if (v24 + location + v25 <= v31)
                        v23 = v25;
                      else
                        v23 = v31 - (v24 + location);
                      if (!v23)
                      {
LABEL_50:
                        v43 = 0;
                        goto LABEL_51;
                      }
LABEL_31:
                      v38 = v22;
                      v26 = objc_alloc((Class)off_1E1679D20);
                      objc_msgSend(v7, "string");
                      v27 = v7;
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "substringWithRange:", v39, v23);
                      v43 = v23;
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = (void *)objc_msgSend(v26, "initWithPrimaryString:alternativeStrings:", v29, v16);

                      v7 = v27;
                      objc_msgSend(v27, "addAttribute:value:range:", CFSTR("NSGrammarCorrections"), v16, v39, v43);
                      if (v17)
                        objc_msgSend(v27, "addAttribute:value:range:", CFSTR("NSGrammarUserDescription"), v17, v39, v43);
                      if (v41)
                        objc_msgSend(v27, "addAttribute:value:range:", CFSTR("NSGrammarIssueType"), v41, v39, v43);
                      v11 = v37;
                      v22 = v38;
                      if (v40)
                        objc_msgSend(v7, "addAttribute:value:range:", CFSTR("NSGrammarTargetPair"), v40, v39, v43);
                      if (v21)
                        objc_msgSend(v7, "addAttribute:value:range:", CFSTR("NSGrammarConfidenceScore"), v21, v39, v43);
                      if (v36)
                        objc_msgSend(v7, "addAttribute:value:range:", CFSTR("NSGrammarLanguage"), v36, v39, v43);
                      if (qword_1ECD7B3B8 != -1)
                        dispatch_once(&qword_1ECD7B3B8, &__block_literal_global_429);
                      if (byte_1ECD7B2FB)
                      {
                        objc_msgSend(v7, "addAttribute:value:range:", v34, &unk_1E1A9A9E0, v39, v43);
                        v22 = v38;
                        objc_msgSend(v7, "addAttribute:value:range:", v33, v30, v39, v43);
                      }

                      v9 = v35;
LABEL_51:

                      v12 = v22;
LABEL_52:

                      v13 = v42;
                      goto LABEL_53;
                    }
                  }
                  else
                  {
                    v23 = v43;
                  }
                  if (!v23)
                    goto LABEL_50;
                  goto LABEL_31;
                }

              }
              v40 = 0;
              goto LABEL_22;
            }
          }
LABEL_53:

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (!v11)
        goto LABEL_58;
    }
  }
  v12 = 0;
LABEL_58:

}

- (void)_addCorrectionUnderlinesForCandidates:(id)a3 ranges:(id)a4 inSentenceRange:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UITextCheckingClient *client;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;

  v37 = a3;
  v8 = a4;
  v9 = a5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_textChoicesAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_client
    && v11
    && +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    v34 = v11;
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    v32 = v8;
    if (objc_msgSend(v37, "count"))
    {
      v12 = 0;
      v35 = v9;
      do
      {
        if (v12 >= objc_msgSend(v8, "count"))
          break;
        objc_msgSend(v8, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "rangeValue");
        v16 = v15;

        client = self->_client;
        objc_msgSend(v9, "start");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextCheckingClient positionFromPosition:offset:](client, "positionFromPosition:offset:", v18, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[UITextCheckingClient positionFromPosition:offset:](self->_client, "positionFromPosition:offset:", v19, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[UITextCheckingClient textRangeFromPosition:toPosition:](self->_client, "textRangeFromPosition:toPosition:", v19, v20);
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)v21;
              objc_msgSend(v37, "objectAtIndex:", v12);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v23, "setConfidence:", 2);
              v24 = objc_alloc(MEMORY[0x1E0DBDB70]);
              v36 = (void *)objc_msgSend(v24, "initWithAutocorrection:alternateCorrections:", v23, MEMORY[0x1E0C9AA60]);
              objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "input");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "adjustRangesAfterPosition:byOffset:", v19, v16 - objc_msgSend(v26, "length"));

              objc_msgSend(v34, "addUnderlineForCandidate:range:", v23, v22);
              objc_msgSend(v34, "addList:forCandidate:", v25, v23);
              if (v33)
              {
                objc_msgSend(v23, "candidate");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "input");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKey:", v27, v28);

              }
              v8 = v32;
            }
            v9 = v35;
          }
        }
        else
        {
          v20 = 0;
        }

        ++v12;
      }
      while (v12 < objc_msgSend(v37, "count"));
    }
    if (objc_msgSend(v37, "count"))
    {
      v29 = objc_msgSend(v37, "copy");
      v30 = (void *)_recentGrammarCandidates;
      _recentGrammarCandidates = v29;

    }
    v11 = v34;
    if (v33 && objc_msgSend(v33, "count"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleGrammarCorrectionEntries:", v33);

      v8 = v32;
    }

  }
}

- (void)_handleGrammarCheckingResults:(id)a3 sequenceNumber:(int64_t)a4 forSentenceRange:(id)a5 autocorrectionCount:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  void *v42;
  NSRange v43;
  NSRange v44;
  NSRange v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSUInteger range1;
  id range1_8;
  uint64_t v62;
  NSUInteger length;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  UITextCheckingController *v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextCheckingController textChecker](self, "textChecker");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_prechangeCheckingSequenceNumber <= a4)
  {
    -[UITextCheckingController annotatedSubstringForRange:](self, "annotatedSubstringForRange:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "length"))
    {
      v69 = self;
      v53 = v11;
      v51 = v13;
      v70 = (void *)objc_msgSend(v13, "mutableCopy");
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v14, "autocorrectionPreferenceForTraits");
      v50 = v14;
      objc_msgSend(v14, "smartPunctuationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v54 = v10;
      v16 = v10;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v77 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            if (objc_msgSend(v21, "resultType") == 4)
            {
              v22 = objc_msgSend(v21, "range");
              v24 = v23;
              objc_msgSend(v21, "grammarDetails");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              _detailsByApplyingSmartQuotes((uint64_t)v25, v15);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextCheckingController _addGrammarAttributesForRange:details:inAnnotatedString:](v69, "_addGrammarAttributesForRange:details:inAnnotatedString:", v22, v24, v26, v70);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        }
        while (v18);
      }
      v52 = a6;

      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v27 = v16;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v28)
      {
        v29 = v28;
        length = 0;
        v64 = 0;
        v65 = 0;
        v67 = 0;
        v68 = 0;
        v71 = *(_QWORD *)v73;
        v56 = *(_QWORD *)off_1E16790E8;
        v55 = *(_QWORD *)off_1E16790E0;
        range1 = 0x7FFFFFFFFFFFFFFFLL;
        range1_8 = v27;
        v30 = v62;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v73 != v71)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            v33 = objc_msgSend(v32, "range");
            v35 = v34;
            objc_msgSend(v32, "replacementString");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            _stringByApplyingSmartQuotes(v36, v15);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = objc_msgSend(v37, "length");
            if (v30)
            {
              v39 = v38;
              v40 = objc_msgSend(v32, "resultType") != 512 || v37 == 0;
              if (!v40 && ((v68 & 0x8000000000000000) == 0 || v33 >= -v68))
              {
                ++v67;
                v41 = v33 + v68;
                if (v41 >= v64 + v65)
                {
                  if (v41 + v35 <= objc_msgSend(v70, "length"))
                  {
                    objc_msgSend(v59, "recordResponse:toGrammarDetailInAnnotatedString:range:", 4, v70, v41, v35);
                    objc_msgSend(v70, "string");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "substringWithRange:", v41, v35);
                    v66 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v70, "replaceCharactersInRange:withString:", v41, v35, v37);
                    v44.location = objc_msgSend(v32, "range");
                    v43 = v44;
                    v44.length = length;
                    if (length)
                    {
                      v44.location = range1;
                      v45 = NSUnionRange(v44, v43);
                      range1 = v45.location;
                      length = v45.length;
                    }
                    else
                    {
                      range1 = v44.location;
                      length = v43.length;
                    }
                    v46 = v68;
                    v27 = range1_8;
                    v47 = (void *)v66;
                    if (v39)
                    {
                      if (v66)
                        objc_msgSend(v70, "addAttribute:value:range:", CFSTR("NSGrammarAutocorrected"), v66, v41, v39);
                      objc_msgSend(v70, "removeAttribute:range:", v56, v41, v39);
                      objc_msgSend(v70, "removeAttribute:range:", CFSTR("NSGrammarUserDescription"), v41, v39);
                      objc_msgSend(v70, "removeAttribute:range:", v55, v41, v39);
                      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v41, v39);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "addObject:", v48);

                      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBE8]), "initWithCandidate:forInput:", v37, v66);
                      objc_msgSend(v57, "addObject:", v49);

                      v47 = (void *)v66;
                      v46 = v68;
                    }
                    v68 = v46 - v35 + v39;

                    v64 = v41;
                    v65 = v39;
                    v30 = v62;
                  }
                  else
                  {
                    v27 = range1_8;
                    v30 = v62;
                  }
                }
              }
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v29);
      }
      else
      {
        length = 0;
        v67 = 0;
        range1 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v11 = v53;
      -[UITextCheckingClient replaceRange:withAnnotatedString:relativeReplacementRange:](v69->_client, "replaceRange:withAnnotatedString:relativeReplacementRange:", v53, v70, range1, length);
      v13 = v51;
      if (v52)
        *v52 = v67;
      -[UITextCheckingController _addCorrectionUnderlinesForCandidates:ranges:inSentenceRange:](v69, "_addCorrectionUnderlinesForCandidates:ranges:inSentenceRange:", v57, v58, v53);

      v10 = v54;
    }
    else if (a6)
    {
      *a6 = 0;
    }

  }
  else if (a6)
  {
    *a6 = 0;
  }

}

- (void)checkGrammarForSentenceInRange:(id)a3 onPause:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITextCheckingController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UITextCheckingController *v18;
  _QWORD v19[4];
  UITextCheckingController *v20;
  id v21;
  BOOL v22;
  const __CFString *v23;
  _QWORD v24[2];

  v4 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UITextCheckingController textChecker](self, "textChecker");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (self->_client && v7 != 0)
    {
      +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[UITextChecker grammarCheckingEnabledForLanguage:](UITextChecker, "grammarCheckingEnabledForLanguage:", v11))
      {
        -[UITextCheckingClient textInRange:](self->_client, "textInRange:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && objc_msgSend(v12, "length"))
        {
          v14 = self;
          if (v4)
          {
            v23 = CFSTR("IgnoreTermination");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v16 = (void *)MEMORY[0x1E0C9AA70];
          }
          v17 = objc_msgSend(v13, "length");
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke;
          v19[3] = &unk_1E16E7490;
          v22 = v4;
          v20 = v14;
          v21 = v6;
          v18 = v14;
          objc_msgSend(v8, "requestGrammarCheckingOfString:range:language:options:completionHandler:", v13, 0, v17, v11, v16, v19);

        }
      }

    }
  }

}

void __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  __CFRunLoop *Main;
  const void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  Main = CFRunLoopGetMain();
  v7 = (const void *)*MEMORY[0x1E0C9B270];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke_2;
  block[3] = &unk_1E16BFD20;
  v10 = v5;
  v14 = *(_BYTE *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v13 = a2;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  CFRunLoopPerformBlock(Main, v7, block);

}

void __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "resultType", (_QWORD)v11);
        if (v10 == 4 || v10 == 512 && !*(_BYTE *)(a1 + 64))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "_handleGrammarCheckingResults:sequenceNumber:forSentenceRange:autocorrectionCount:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)removeGrammarMarkersFromWordsInRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  UITextCheckingClient *client;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (v4 && self->_client)
  {
    if (qword_1ECD7B3B8 != -1)
      dispatch_once(&qword_1ECD7B3B8, &__block_literal_global_429);
    if (byte_1ECD7B2FB)
    {
      -[UITextCheckingController annotatedSubstringForRange:](self, "annotatedSubstringForRange:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");
      v19 = 0;
      v20 = 0;
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)off_1E16790E8;
        do
        {
          objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", v9, v8, &v19, v8, v7 - v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && objc_msgSend(v10, "integerValue") == 1)
          {
            objc_msgSend(v5, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarCorrections"), v19, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              client = self->_client;
              objc_msgSend(v4, "start");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextCheckingClient positionFromPosition:offset:](client, "positionFromPosition:offset:", v14, v19);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                -[UITextCheckingClient positionFromPosition:offset:](self->_client, "positionFromPosition:offset:", v15, v20);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  -[UITextCheckingClient textRangeFromPosition:toPosition:](self->_client, "textRangeFromPosition:toPosition:", v15, v16);
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {
                    v18 = (void *)v17;
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", v9, v17);
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarCorrections"), v18);
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarUserDescription"), v18);
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarIssueType"), v18);
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarTargetPair"), v18);
                    -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarLanguage"), v18);

                  }
                }
              }
              else
              {
                v16 = 0;
              }

            }
          }

          v8 = v20 + v19;
        }
        while (v20 + v19 < v7);
      }

    }
  }

}

- (void)removeGrammarAnnotationFromWordAtPosition:(id)a3
{
  UITextCheckingClient *client;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    client = self->_client;
    if (client)
    {
      -[UITextCheckingClient tokenizer](client, "tokenizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6
        || (-[UITextCheckingClient tokenizer](self->_client, "tokenizer"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 1),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v6))
      {
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarAutocorrected"), v6);
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarCorrections"), v6);
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarUserDescription"), v6);
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarIssueType"), v6);
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarTargetPair"), v6);
        -[UITextCheckingClient removeAnnotation:forRange:](self->_client, "removeAnnotation:forRange:", CFSTR("NSGrammarLanguage"), v6);

      }
    }
  }

}

- (BOOL)performFinalGrammarCheckingWithAutocorrection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  const __CFString *v34;
  _QWORD v35[3];

  v3 = a3;
  v35[1] = *MEMORY[0x1E0C80C00];
  -[UITextCheckingController textChecker](self, "textChecker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_client)
  {
    +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[UITextChecker grammarCheckingEnabledForLanguage:](UITextChecker, "grammarCheckingEnabledForLanguage:", v7))
    {
      -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextCheckingClient endOfDocument](self->_client, "endOfDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 2, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[UITextCheckingClient textInRange:](self->_client, "textInRange:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v10;
          if (v3)
          {
            v34 = CFSTR("ControlRepeatedAutocorrections");
            v35[0] = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
            v14 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = MEMORY[0x1E0C9AA70];
          }
          v25 = (void *)v14;
          v26 = v12;
          objc_msgSend(v5, "finalResultsFromCheckingString:range:language:options:", v12, 0, objc_msgSend(v12, "length"), v7, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v30 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                v22 = objc_msgSend(v21, "resultType");
                if (v22 != 4 && (v22 != 512 || !v3))
                  continue;
                objc_msgSend(v13, "addObject:", v21);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            }
            while (v18);
          }
          if (v13)
          {
            v10 = v27;
            if (objc_msgSend(v13, "count"))
            {
              v28 = 0;
              -[UITextCheckingController _handleGrammarCheckingResults:sequenceNumber:forSentenceRange:autocorrectionCount:](self, "_handleGrammarCheckingResults:sequenceNumber:forSentenceRange:autocorrectionCount:", v13, self->_prechangeCheckingSequenceNumber, v27, &v28);
              v15 = v28 != 0;
            }
            else
            {
              v15 = 0;
            }
          }
          else
          {
            v15 = 0;
            v10 = v27;
          }
          v12 = v26;

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)performFinalGrammarChecking
{
  return -[UITextCheckingController performFinalGrammarCheckingWithAutocorrection:](self, "performFinalGrammarCheckingWithAutocorrection:", 1);
}

- (void)applyGrammarCheckingIndication
{
  -[UITextCheckingController performFinalGrammarCheckingWithAutocorrection:](self, "performFinalGrammarCheckingWithAutocorrection:", 0);
}

- (void)removeSpellingMarkersFromWordInRange:(id)a3
{
  UITextCheckingClient *client;

  if (a3)
  {
    client = self->_client;
    if (client)
      -[UITextCheckingClient removeAnnotation:forRange:](client, "removeAnnotation:forRange:", *(_QWORD *)off_1E16790E8, a3);
  }
}

- (BOOL)foundApostropheAfterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  UITextCheckingClient *client;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  length = a3.length;
  location = a3.location;
  client = self->_client;
  -[UITextCheckingClient beginningOfDocument](client, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextCheckingClient positionFromPosition:offset:](client, "positionFromPosition:offset:", v7, location + length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = 0;
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }
  -[UITextCheckingClient positionFromPosition:offset:](self->_client, "positionFromPosition:offset:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_7;
  -[UITextCheckingClient textRangeFromPosition:toPosition:](self->_client, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  -[UITextCheckingClient textInRange:](self->_client, "textInRange:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("'")) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("’"));

LABEL_10:
  return v13;
}

- (_NSRange)terminatedSentenceRangeInTextRange:(id)a3
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  -[UITextCheckingClient textInRange:](self->_client, "textInRange:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (qword_1ECD7B380 == -1)
  {
    if (!v4)
    {
LABEL_14:
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&qword_1ECD7B380, &__block_literal_global_323);
    if (!v5)
      goto LABEL_14;
  }
  v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1ECD7B368, 4, 0, v5);
  if (!v7
    || (v8 = v6 + v7, v9 = v5 > v6 + v7, v10 = v5 - (v6 + v7), !v9)
    || (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1ECD7B370, 4, v8, v10), !v11))
  {
    v5 = 0;
    goto LABEL_14;
  }
  v12 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1ECD7B378, 4, v8, v10);
  if (v13)
    v5 = v12 + v13;
  else
    v5 = 0;
  if (v13)
    v14 = 0;
  else
    v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  v15 = v14;
  v16 = v5;
  result.length = v16;
  result.location = v15;
  return result;
}

void __63__UITextCheckingController_terminatedSentenceRangeInTextRange___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B368;
  qword_1ECD7B368 = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".!?։۔।።᙮‼‽⁈⁉。！．？｡"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7B370;
  qword_1ECD7B370 = v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD7B378;
  qword_1ECD7B378 = v4;

}

- (void)_pauseTimer:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *pauseTimer;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextCheckingController invalidateTimers](self, "invalidateTimers");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastPauseTimer = v4;
  if (self->_client
    && -[UITextCheckingController continuousSpellCheckingEnabled](self, "continuousSpellCheckingEnabled")
    && v10)
  {
    if (qword_1ECD7B3E8 != -1)
      dispatch_once(&qword_1ECD7B3E8, &__block_literal_global_507);
    if (byte_1ECD7B2FE == 1)
    {
      -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "start");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rangeEnclosingPosition:withGranularity:inDirection:", v6, 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && objc_msgSend(v10, "isEqual:", v7))
      {
        -[UITextCheckingController removeGrammarMarkersFromWordsInRange:](self, "removeGrammarMarkersFromWordsInRange:", v10);
        -[UITextCheckingController checkGrammarForSentenceInRange:onPause:](self, "checkGrammarForSentenceInRange:onPause:", v10, 1);
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pauseTimer_, 0, 0, 0.5);
        v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        pauseTimer = self->_pauseTimer;
        self->_pauseTimer = v8;

      }
    }
  }

}

- (void)checkSpellingForSelectionChangeFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  BOOL v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  UITextCheckingClient *client;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  UITextCheckingClient *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  UITextCheckingClient *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSUInteger v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  _BOOL4 v48;
  double v49;
  NSTimer *v50;
  NSTimer *pauseTimer;
  char v52;
  void *v53;
  NSUInteger v54;
  _BOOL4 v55;
  id v56;

  length = a3.length;
  location = a3.location;
  v6 = self->_previousCheckedSentenceRange.location;
  v7 = self->_previousCheckedSentenceRange.length;
  v9 = a3.location == self->_selectedRangeFromPreviousUnchecked.location
    && a3.length == self->_selectedRangeFromPreviousUnchecked.length;
  -[UITextCheckingController invalidateTimers](self, "invalidateTimers");
  self->_selectedRangeFromPreviousUnchecked = (_NSRange)xmmword_186679030;
  self->_previousCheckedSentenceRange = (_NSRange)xmmword_186679030;
  if (self->_client
    && -[UITextCheckingController continuousSpellCheckingEnabled](self, "continuousSpellCheckingEnabled"))
  {
    v10 = -[UITextCheckingController selectedRange](self, "selectedRange");
    v12 = v10;
    v13 = v11;
    if (v10 == self->_previousCheckedSelectedRange.location && v11 == self->_previousCheckedSelectedRange.length)
    {
      v55 = 0;
    }
    else
    {
      do
      {
        v14 = __ldaxr(&qword_1ECD7B3B0);
        v15 = v14 + 1;
      }
      while (__stlxr(v15, &qword_1ECD7B3B0));
      self->_previousCheckedSelectedRange.length = v11;
      self->_prechangeCheckingSequenceNumber = v15;
      self->_previousCheckedSelectedRange.location = v10;
      v55 = v11 == 0;
    }
    v54 = v6;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = 0;
    }
    else
    {
      client = self->_client;
      -[UITextCheckingClient beginningOfDocument](client, "beginningOfDocument");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextCheckingClient positionFromPosition:offset:](client, "positionFromPosition:offset:", v17, location);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rangeEnclosingPosition:withGranularity:inDirection:", v18, 1, 0);
      v56 = (id)objc_claimAutoreleasedReturnValue();

      if (!v56)
      {
        -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "rangeEnclosingPosition:withGranularity:inDirection:", v18, 1, 1);
        v56 = (id)objc_claimAutoreleasedReturnValue();

        if (!v56)
        {
          v21 = !v9;
          if (location < 2)
            v21 = 1;
          if ((v21 & 1) != 0)
          {
            v56 = 0;
          }
          else
          {
            -[UITextCheckingClient positionFromPosition:offset:](self->_client, "positionFromPosition:offset:", v18, -1);
            v22 = objc_claimAutoreleasedReturnValue();

            -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "rangeEnclosingPosition:withGranularity:inDirection:", v22, 1, 1);
            v56 = (id)objc_claimAutoreleasedReturnValue();

            v18 = (void *)v22;
          }
        }
      }

    }
    v24 = self->_client;
    -[UITextCheckingClient beginningOfDocument](v24, "beginningOfDocument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextCheckingClient positionFromPosition:offset:](v24, "positionFromPosition:offset:", v25, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rangeEnclosingPosition:withGranularity:inDirection:", v26, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "rangeEnclosingPosition:withGranularity:inDirection:", v26, 1, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v30 = -[UITextCheckingController nsRangeForTextRange:](self, "nsRangeForTextRange:", v56);
    v32 = v31;
    if ((objc_msgSend(v56, "isEqual:", v28) & 1) == 0 && (v12 + v13 < v30 || v12 > v30 + v32))
    {
      if (v12 != length + location + 1
        || v13
        || !-[UITextCheckingController foundApostropheAfterRange:](self, "foundApostropheAfterRange:", location, length))
      {
        -[UITextCheckingController checkSpellingForWordInRange:](self, "checkSpellingForWordInRange:", v56);
        -[UITextCheckingController removeSpellingMarkersFromWordInRange:](self, "removeSpellingMarkersFromWordInRange:", v28);
        v33 = 0;
LABEL_35:
        if (location == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_56:

          return;
        }
        v34 = self->_client;
        -[UITextCheckingClient beginningOfDocument](v34, "beginningOfDocument");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextCheckingClient positionFromPosition:offset:](v34, "positionFromPosition:offset:", v35, location);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[UITextCheckingClient tokenizer](self->_client, "tokenizer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "rangeEnclosingPosition:withGranularity:inDirection:", v36, 2, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38
          || (-[UITextCheckingClient tokenizer](self->_client, "tokenizer"),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v39, "rangeEnclosingPosition:withGranularity:inDirection:", v36, 2, 1),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              v39,
              v38))
        {
          v52 = v33;
          v53 = v36;
          v40 = v7;
          v41 = -[UITextCheckingController nsRangeForTextRange:](self, "nsRangeForTextRange:", v38);
          v43 = v42;
          v44 = -[UITextCheckingController terminatedSentenceRangeInTextRange:](self, "terminatedSentenceRangeInTextRange:", v38);
          if (v45)
          {
            v46 = v45;
            v47 = v44 + v41;
            if (v12 + v13 < v47 || v12 >= v47 + v45)
            {
              if (v47 != v54 || v45 != v40)
              {
                -[UITextCheckingController removeGrammarMarkersFromWordsInRange:](self, "removeGrammarMarkersFromWordsInRange:", v38);
                -[UITextCheckingController checkGrammarForSentenceInRange:onPause:](self, "checkGrammarForSentenceInRange:onPause:", v38, 0);
              }
              self->_previousCheckedSentenceRange.location = v47;
              self->_previousCheckedSentenceRange.length = v46;
              v36 = v53;
              goto LABEL_55;
            }
          }
          else
          {
            v48 = v55;
            if (v43 <= 9)
              v48 = 0;
            if (v48)
            {
              if (qword_1ECD7B3E8 != -1)
                dispatch_once(&qword_1ECD7B3E8, &__block_literal_global_507);
              if (byte_1ECD7B2FE == 1)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pauseTimer_, v38, 0, fmax(self->_lastPauseTimer - v49 + 5.0, 1.0));
                v50 = (NSTimer *)objc_claimAutoreleasedReturnValue();
                pauseTimer = self->_pauseTimer;
                self->_pauseTimer = v50;

              }
            }
          }
          v36 = v53;
          if ((v52 & 1) == 0)
            -[UITextCheckingController removeGrammarMarkersFromWordsInRange:](self, "removeGrammarMarkersFromWordsInRange:", v38);
        }
LABEL_55:

        goto LABEL_56;
      }
      self->_selectedRangeFromPreviousUnchecked.location = v12;
      self->_selectedRangeFromPreviousUnchecked.length = 0;
    }
    v33 = 1;
    goto LABEL_35;
  }
}

- (void)didChangeSelectionFromRange:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[UITextCheckingController nsRangeForTextRange:](self, "nsRangeForTextRange:", a3);
  -[UITextCheckingController checkSpellingForSelectionChangeFromRange:](self, "checkSpellingForSelectionChangeFromRange:", v4, v5);
}

- (void)feedbackForGrammarMarkersFromWordsInRange:(id)a3 replacementText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[UITextCheckingController textChecker](self, "textChecker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && self->_client && v7)
  {
    -[UITextCheckingController annotatedSubstringForRange:](self, "annotatedSubstringForRange:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "length"))
    {
      objc_msgSend(v9, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarAutocorrected"), 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v6 && v10)
      {
        if (objc_msgSend(v6, "isEqualToString:", v10))
          v12 = 5;
        else
          v12 = 3;
        objc_msgSend(v7, "recordResponse:toGrammarDetailInAnnotatedString:range:", v12, v9, 0, objc_msgSend(v9, "length"));
        objc_msgSend(v14, "start");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextCheckingController removeGrammarAnnotationFromWordAtPosition:](self, "removeGrammarAnnotationFromWordAtPosition:", v13);

      }
    }

  }
}

- (BOOL)rangeIsSuitableForGrammarAutocorrections:(id)a3
{
  uint64_t v3;

  -[UITextCheckingController nsRangeForTextRange:](self, "nsRangeForTextRange:", a3);
  return (unint64_t)(v3 - 1) < 0xF;
}

- (void)willReplaceTextInRange:(id)a3 withText:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[UITextCheckingController rangeIsSuitableForGrammarAutocorrections:](self, "rangeIsSuitableForGrammarAutocorrections:", v7))
  {
    -[UITextCheckingController feedbackForGrammarMarkersFromWordsInRange:replacementText:](self, "feedbackForGrammarMarkersFromWordsInRange:replacementText:", v7, v6);
  }

}

@end
