@implementation _UITextInputControllerTokenizer

- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4
{
  id v6;
  id WeakRetained;
  BOOL v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  if ((unint64_t)(a3 - 3) < 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v8 = objc_msgSend(WeakRetained, "writingDirectionAtPosition:", v6) == 1;
  }
  else
  {
    if (a3 != 5 && a3 != 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UITextInputControllerTokenizer;
      v9 = -[UITextInputStringTokenizer _isDownstreamForDirection:atPosition:](&v11, sel__isDownstreamForDirection_atPosition_, a3, v6);
      goto LABEL_11;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v8 = objc_msgSend(WeakRetained, "writingDirectionAtPosition:", v6) == 0;
  }
  v9 = v8;

LABEL_11:
  return v9;
}

- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5
{
  id v8;
  UITextInputController **p_textInput;
  id WeakRetained;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  int64_t v38;
  int64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;

  v8 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3010000000;
  v50 = &unk_18685B0AF;
  v51 = xmmword_186679030;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__208;
  v45 = __Block_byref_object_dispose__208;
  p_textInput = &self->_textInput;
  v46 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  v11 = WeakRetained;
  v12 = a4;
  if (!a4)
    goto LABEL_6;
  if (a4 != 4)
  {
    v12 = -[UITextInputStringTokenizer _distanceForTokenizerWithGranularity:](self, "_distanceForTokenizerWithGranularity:", a4);
LABEL_6:
    objc_msgSend(v11, "_textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke;
    v34[3] = &unk_1E16E6C80;
    v36 = &v41;
    v34[4] = self;
    v38 = v12;
    v39 = a4;
    v35 = v8;
    v37 = &v47;
    v40 = a5;
    objc_msgSend(v15, "coordinateReading:", v34);

    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "textLayoutController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least())
  {
    v14 = objc_msgSend(v13, "affinityForPosition:", v8);
  }
  else if (a5)
  {
    v14 = 0;
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&self->_textInput);
    v14 = objc_msgSend(v16, "selectionAffinity") == 1;

  }
  objc_msgSend(v13, "textRangeForLineEnclosingPosition:effectiveAffinity:", v8, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "characterRangeForTextRange:", v17);
  v19 = v48;
  v48[4] = v18;
  v19[5] = v20;
  objc_msgSend(v13, "attributedTextInRange:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "string");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v42[5];
  v42[5] = v22;

  if (v48[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "longCharacterIsMember:", objc_msgSend((id)v42[5], "_lastLongCharacter"));

    if (v25)
    {
      v26 = v48[5];
      objc_msgSend((id)v42[5], "_rangeOfLongCharacterAtIndex:", objc_msgSend((id)v42[5], "length") - 1);
      v48[5] = v26 - v27;
      objc_msgSend((id)v42[5], "_stringByTrimmingLastCharacter");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v42[5];
      v42[5] = v28;

    }
  }

LABEL_14:
  +[_UITextInputStringTokenizerSubrange subrangeWithSubstring:basePosition:](_UITextInputStringTokenizerSubrange, "subrangeWithSubstring:basePosition:", v42[5], v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_loadWeakRetained((id *)p_textInput);
  objc_msgSend(v31, "beginningOfDocument");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setIndexOfBase:", objc_msgSend(v31, "offsetFromPosition:toPosition:", v32, v8));

  objc_msgSend(v30, "setRelevantRange:", v48[4], v48[5]);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v30;
}

- (void)setTokenizer:(uint64_t)a3 forGranularity:
{
  int *v5;
  uint64_t v6;
  const void *v7;

  if (a1)
  {
    if (a3 == 1)
      v5 = &OBJC_IVAR____UITextInputControllerTokenizer__wordTokenizer;
    else
      v5 = &OBJC_IVAR____UITextInputControllerTokenizer__tokenizer;
    v6 = *v5;
    v7 = *(const void **)(a1 + v6);
    if (v7)
    {
      CFRelease(v7);
      v6 = *v5;
    }
    *(_QWORD *)(a1 + v6) = a2;
  }
}

- (_UITextInputControllerTokenizer)initWithTextInputController:(id)a3
{
  id v4;
  _UITextInputControllerTokenizer *v5;
  _UITextInputControllerTokenizer *v6;
  _UITextInputControllerTokenizer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextInputControllerTokenizer;
  v5 = -[UITextInputStringTokenizer initWithTextInput:](&v9, sel_initWithTextInput_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInput, v4);
    v6->_tokenizerRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)xmmword_186679030;
    v6->_wordTokenizerRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)xmmword_186679030;
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  __CFStringTokenizer *wordTokenizer;
  objc_super v5;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  wordTokenizer = self->_wordTokenizer;
  if (wordTokenizer)
    CFRelease(wordTokenizer);
  v5.receiver = self;
  v5.super_class = (Class)_UITextInputControllerTokenizer;
  -[_UITextInputControllerTokenizer dealloc](&v5, sel_dealloc);
}

- (void)invalidateTokenizer
{
  self->_wordTokenizerIsInvalid = 1;
  self->_tokenizerIsInvalid = 1;
}

- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5
{
  UITextInputController **p_textInput;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;

  p_textInput = &self->_textInput;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  objc_msgSend(WeakRetained, "textLayoutController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "positionFromPosition:offset:affinity:", v8, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)_indexForTextPosition:(id)a3
{
  UITextInputController **p_textInput;
  id v4;
  id v5;
  void *v6;
  int64_t v7;

  p_textInput = &self->_textInput;
  v4 = a3;
  v5 = objc_loadWeakRetained((id *)p_textInput);
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textInput);
}

@end
