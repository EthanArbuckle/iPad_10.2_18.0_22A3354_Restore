@implementation SUICStreamingTextView

- (SUICStreamingTextView)initWithFrame:(CGRect)a3
{
  SUICStreamingTextView *v3;
  SUICStreamingTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICStreamingTextView;
  v3 = -[SUICStreamingTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUICStreamingTextView _sharedInit](v3, "_sharedInit");
  return v4;
}

- (SUICStreamingTextView)initWithCoder:(id)a3
{
  SUICStreamingTextView *v3;
  SUICStreamingTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICStreamingTextView;
  v3 = -[SUICStreamingTextView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SUICStreamingTextView _sharedInit](v3, "_sharedInit");
  return v4;
}

- (void)_sharedInit
{
  NSLayoutManager *v3;
  NSLayoutManager *layoutManager;
  NSTextStorage *v5;
  NSTextStorage *textStorage;
  id v7;
  NSTextContainer *v8;
  NSTextContainer *textContainer;
  NSMutableArray *v10;
  NSMutableArray *words;
  NSMutableArray *v12;
  NSMutableArray *wordsToShow;
  NSMutableSet *v14;
  NSMutableSet *wordsToDelete;
  NSString *editTextSymbol;
  UIColor *v17;
  UIColor *startTextColor;
  UIColor *v19;
  UIColor *endTextColor;
  UIFont *v21;
  UIFont *font;
  CGRect v23;

  v3 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v3;

  v5 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
  textStorage = self->_textStorage;
  self->_textStorage = v5;

  -[NSLayoutManager setTextStorage:](self->_layoutManager, "setTextStorage:", self->_textStorage);
  -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_layoutManager);
  v7 = objc_alloc(MEMORY[0x1E0DC12C0]);
  -[SUICStreamingTextView bounds](self, "bounds");
  v8 = (NSTextContainer *)objc_msgSend(v7, "initWithSize:", CGRectGetWidth(v23), 1.79769313e308);
  textContainer = self->_textContainer;
  self->_textContainer = v8;

  -[NSTextContainer setLineFragmentPadding:](self->_textContainer, "setLineFragmentPadding:", 0.0);
  -[NSLayoutManager addTextContainer:](self->_layoutManager, "addTextContainer:", self->_textContainer);
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  words = self->_words;
  self->_words = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  wordsToShow = self->_wordsToShow;
  self->_wordsToShow = v12;

  v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  wordsToDelete = self->_wordsToDelete;
  self->_wordsToDelete = v14;

  self->_centerAlign = 0;
  self->_renderEmojis = 1;
  self->_animationDuration = 0.4;
  self->_animated = 1;
  self->_showEditTextImage = 0;
  editTextSymbol = self->_editTextSymbol;
  self->_editTextSymbol = (NSString *)CFSTR("chevron.forward");

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.18, 0.6, 0.82, 1.0);
  v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  startTextColor = self->_startTextColor;
  self->_startTextColor = v17;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
  endTextColor = self->_endTextColor;
  self->_endTextColor = v19;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v21 = (UIFont *)objc_claimAutoreleasedReturnValue();
  font = self->_font;
  self->_font = v21;

  -[SUICStreamingTextView setHyphenationFactor:](self, "setHyphenationFactor:", 1.0);
  -[SUICStreamingTextView _updateAnimatedInternal](self, "_updateAnimatedInternal");
}

- (void)setWords:(id)a3
{
  -[SUICStreamingTextView _updateText:](self, "_updateText:", a3);
  -[SUICStreamingTextView setNeedsLayout](self, "setNeedsLayout");
  -[SUICStreamingTextView layoutIfNeeded](self, "layoutIfNeeded");
  -[SUICStreamingTextView _resetState](self, "_resetState");
}

- (NSArray)words
{
  return (NSArray *)self->_words;
}

- (NSString)text
{
  return (NSString *)-[NSTextStorage string](self->_textStorage, "string");
}

- (void)setHyphenationFactor:(double)a3
{
  self->_hyphenationFactor = a3;
  -[NSLayoutManager setHyphenationFactor:](self->_layoutManager, "setHyphenationFactor:");
}

- (void)setEndTextColor:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_animatedInternal = 0;
  objc_storeStrong((id *)&self->_endTextColor, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_wordsToShow;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "setInsertType:", 1, (_QWORD)v13);
        objc_msgSend(v11, "wordLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeFromSuperlayer");

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[SUICStreamingTextView setNeedsLayout](self, "setNeedsLayout");
  -[SUICStreamingTextView layoutIfNeeded](self, "layoutIfNeeded");
  -[SUICStreamingTextView _updateAnimatedInternal](self, "_updateAnimatedInternal");

}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[SUICStreamingTextView _updateAnimatedInternal](self, "_updateAnimatedInternal");
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
  -[SUICStreamingTextView _updateAnimatedInternal](self, "_updateAnimatedInternal");
}

- (void)_updateAnimatedInternal
{
  BOOL animated;

  animated = self->_animated;
  if (animated)
    animated = self->_animationDuration > 0.00000011920929;
  self->_animatedInternal = animated;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  _BOOL4 v6;
  UIImage *v7;
  UIImage *editTextImage;
  UIFont *v9;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    v6 = -[SUICStreamingTextView showEditTextImage](self, "showEditTextImage");
    v5 = v9;
    if (v6)
    {
      -[SUICStreamingTextView _createEditTextImage](self, "_createEditTextImage");
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      editTextImage = self->_editTextImage;
      self->_editTextImage = v7;

      v5 = v9;
    }
  }

}

- (void)setShowEditTextImage:(BOOL)a3
{
  UIImage *v4;
  UIImage *editTextImage;
  void *v6;
  id v7;

  if (self->_showEditTextImage != a3)
  {
    self->_showEditTextImage = a3;
    if (a3)
    {
      -[SUICStreamingTextView _createEditTextImage](self, "_createEditTextImage");
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      editTextImage = self->_editTextImage;
      self->_editTextImage = v4;
    }
    else
    {
      editTextImage = self->_editTextImage;
      self->_editTextImage = 0;
    }

    -[NSMutableArray lastObject](self->_wordsToShow, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setInsertType:", 4);
      -[SUICStreamingTextView setWords:](self, "setWords:", self->_words);
      v6 = v7;
    }

  }
}

- (void)setRenderEmojis:(BOOL)a3
{
  self->_renderEmojis = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[NSTextContainer size](self->_textContainer, "size", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, 1.79769313e308);
  -[NSLayoutManager ensureLayoutForTextContainer:](self->_layoutManager, "ensureLayoutForTextContainer:", self->_textContainer);
  -[NSLayoutManager usedRectForTextContainer:](self->_layoutManager, "usedRectForTextContainer:", self->_textContainer);
  v10 = v9;
  v12 = v11;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", v6, v8);
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", CGRectGetWidth(a3), 1.79769313e308);
  v8.receiver = self;
  v8.super_class = (Class)SUICStreamingTextView;
  -[SUICStreamingTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", CGRectGetWidth(a3), 1.79769313e308);
  v8.receiver = self;
  v8.super_class = (Class)SUICStreamingTextView;
  -[SUICStreamingTextView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUICStreamingTextView;
  -[SUICStreamingTextView layoutSubviews](&v3, sel_layoutSubviews);
  -[SUICStreamingTextView _layoutFrames](self, "_layoutFrames");
}

- (void)_updateText:(id)a3
{
  unint64_t v4;
  void *v5;
  int CompositionLanguageForLanguage;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *words;
  id v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void (**v30)(_QWORD, _QWORD);
  void (**v31)(_QWORD, _QWORD);
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = -1;
  +[_SUICEditScriptIndexed editScriptFromArray:toArray:orderAtomsAscending:operationPrecedence:](_SUICEditScriptIndexed, "editScriptFromArray:toArray:orderAtomsAscending:operationPrecedence:", self->_words, a3, 1, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CompositionLanguageForLanguage = CTParagraphStyleGetCompositionLanguageForLanguage();
  v7 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __37__SUICStreamingTextView__updateText___block_invoke;
  v43[3] = &unk_1E4A555C0;
  v43[4] = self;
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8593D14](v43);
  v42[0] = v7;
  v42[1] = 3221225472;
  v42[2] = __37__SUICStreamingTextView__updateText___block_invoke_2;
  v42[3] = &unk_1E4A555E8;
  v42[4] = self;
  v31 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8593D14](v42);
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __37__SUICStreamingTextView__updateText___block_invoke_3;
  v41[3] = &unk_1E4A555E8;
  v41[4] = self;
  v30 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8593D14](v41);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = v5;
  objc_msgSend(v5, "script");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "editOperation");
        if (v14 == 3)
        {
          objc_msgSend(v13, "replacementText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "indexToEdit");
          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_words, "replaceObjectAtIndex:withObject:", v15, v16);
          v29[2](v29, v15, 2);
          goto LABEL_12;
        }
        if (v14 == 2)
        {
          objc_msgSend(v13, "replacementText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "indexInArrayB");
          -[NSMutableArray insertObject:atIndex:](self->_words, "insertObject:atIndex:", v16, v15);
          v30[2](v30, v15);
LABEL_12:

          goto LABEL_13;
        }
        if (v14 != 1)
          continue;
        v15 = objc_msgSend(v13, "indexToEdit");
        -[NSMutableArray removeObjectAtIndex:](self->_words, "removeObjectAtIndex:", v15);
        v31[2](v31, v15);
LABEL_13:
        if (v15 < v4)
          v4 = v15;
        if (CompositionLanguageForLanguage != 1 && v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_wordsToShow, "objectAtIndexedSubscript:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setInsertType:", 4);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v10);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  while (v4 < -[NSMutableArray count](self->_wordsToShow, "count"))
    objc_msgSend(v18, "addIndex:", v4++);
  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __37__SUICStreamingTextView__updateText___block_invoke_4;
  v35[3] = &unk_1E4A55610;
  v35[4] = self;
  v20 = v29;
  v36 = v20;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v35);
  v21 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  if (self->_centerAlign)
    v22 = 1;
  else
    v22 = 2
        * (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUICStreamingTextView semanticContentAttribute](self, "semanticContentAttribute")) == 1);
  objc_msgSend(v21, "setAlignment:", v22);
  v44[0] = *MEMORY[0x1E0DC1138];
  -[SUICStreamingTextView font](self, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = *MEMORY[0x1E0DC1178];
  v45[0] = v23;
  v45[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTextStorage deleteCharactersInRange:](self->_textStorage, "deleteCharactersInRange:", 0, -[NSTextStorage length](self->_textStorage, "length"));
  v25 = -[NSMutableArray count](self->_words, "count");
  words = self->_words;
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __37__SUICStreamingTextView__updateText___block_invoke_5;
  v32[3] = &unk_1E4A55638;
  v33 = v24;
  v34 = v25 - 1;
  v32[4] = self;
  v27 = v24;
  -[NSMutableArray enumerateObjectsUsingBlock:](words, "enumerateObjectsUsingBlock:", v32);

}

void __37__SUICStreamingTextView__updateText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _SUICStreamingWord *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_SUICStreamingWord);
  -[_SUICStreamingWord setPrevious:](v6, "setPrevious:", v7);
  -[_SUICStreamingWord setInsertType:](v6, "setInsertType:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "replaceObjectAtIndex:withObject:", a2, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "addObject:", v7);

}

void __37__SUICStreamingTextView__updateText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeObjectAtIndex:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "addObject:", v4);

}

void __37__SUICStreamingTextView__updateText___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _SUICStreamingWord *v4;

  v4 = objc_alloc_init(_SUICStreamingWord);
  -[_SUICStreamingWord setInsertType:](v4, "setInsertType:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "insertObject:atIndex:", v4, a2);

}

void __37__SUICStreamingTextView__updateText___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "insertType"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __37__SUICStreamingTextView__updateText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "showEditTextImage") && *(_QWORD *)(a1 + 48) == a3)
  {
    objc_msgSend(v5, "setTextRange:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "length"), objc_msgSend(v13, "length") + 2);
    objc_msgSend(*(id *)(a1 + 32), "_substringRangesContainingEmojiInString:startingIndex:", v13, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmojiRangesInText:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v7, "setImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v13, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "appendAttributedString:", v9);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendAttributedString:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "appendAttributedString:", v8);
  }
  else
  {
    objc_msgSend(v5, "setTextRange:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "length"), objc_msgSend(v13, "length"));
    objc_msgSend(*(id *)(a1 + 32), "_substringRangesContainingEmojiInString:startingIndex:", v13, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmojiRangesInText:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, *(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "appendAttributedString:", v7);
  }

}

- (void)_layoutFrames
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSLayoutManager *layoutManager;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  float v26;
  double v27;
  _BOOL4 v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableSet *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  NSMutableArray *obj;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[NSLayoutManager ensureLayoutForTextContainer:](self->_layoutManager, "ensureLayoutForTextContainer:", self->_textContainer);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = self->_wordsToShow;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v3)
  {
    v4 = v3;
    v52 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v58 != v52)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        layoutManager = self->_layoutManager;
        v8 = objc_msgSend(v6, "textRange");
        v10 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v8, v9, 0);
        v12 = v11;
        -[NSLayoutManager boundingRectForGlyphRange:inTextContainer:](self->_layoutManager, "boundingRectForGlyphRange:inTextContainer:", v10, v11, self->_textContainer);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", v10);
        v22 = v21;
        objc_msgSend(v6, "previous");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v6, "previous");
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = v6;
        }
        v25 = v24;
        v26 = v22 - v14;
        v27 = roundf(v26);

        if (-[SUICStreamingTextView showEditTextImage](self, "showEditTextImage"))
        {
          v28 = 0;
        }
        else
        {
          objc_msgSend(v25, "glyphLocationInWordX");
          v28 = vabdd_f64(v29, v27) < 0.00000011920929;
        }
        objc_msgSend(v6, "setGlyphLocationInWordX:", v27);
        switch(objc_msgSend(v6, "insertType"))
        {
          case 0:
            if (v28)
              goto LABEL_17;
            -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v6, v10, v12, self->_startTextColor, v14, v16, v18, v20);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v6, v10, v12, self->_endTextColor, v14, v16, v18, v20);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "wordLayer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "removeFromSuperlayer");

            objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setWordLayer:", v37);

            objc_msgSend(v6, "setInsertType:", 1);
            break;
          case 1:
          case 2:
          case 4:
            goto LABEL_13;
          case 3:
            if (v28)
            {
              objc_msgSend(v6, "previous");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "beginImage");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)objc_msgSend(v33, "copy");

              objc_msgSend(v6, "previous");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "endImage");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v35, "copy");

            }
            else
            {
LABEL_13:
              -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v6, v10, v12, self->_startTextColor, v14, v16, v18, v20);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v6, v10, v12, self->_endTextColor, v14, v16, v18, v20);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
            }
            break;
          default:
LABEL_17:
            v30 = 0;
            v31 = 0;
            break;
        }
        objc_msgSend(v6, "wordLayer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setFrame:", v14, v16, v18, v20);

        if (v30)
          objc_msgSend(v6, "setBeginImage:", v30);
        if (v31)
        {
          objc_msgSend(v6, "setEndImage:", v31);
          objc_msgSend(v6, "wordLayer");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "endImage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setContents:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v40));

        }
        objc_msgSend(v6, "wordLayer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "superlayer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          -[SUICStreamingTextView layer](self, "layer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "wordLayer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addSublayer:", v44);

        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v4);
  }

  if (self->_animatedInternal)
  {
    -[SUICStreamingTextView _animateLayers](self, "_animateLayers");
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v45 = self->_wordsToDelete;
    v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v54 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "wordLayer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "removeFromSuperlayer");

        }
        v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v47);
    }

  }
}

- (void)_animateLayers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_wordsToShow;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v8, "insertType") - 1) <= 2)
          -[SUICStreamingTextView _animateWordIn:](self, "_animateWordIn:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  if (-[NSMutableSet count](self->_wordsToDelete, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__SUICStreamingTextView__animateLayers__block_invoke;
    v23[3] = &unk_1E4A54D08;
    v11 = v9;
    v24 = v11;
    objc_msgSend(v10, "setCompletionBlock:", v23);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_wordsToDelete;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          -[SUICStreamingTextView _animateWordOut:](self, "_animateWordOut:", v17, (_QWORD)v19);
          objc_msgSend(v17, "wordLayer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

void __39__SUICStreamingTextView__animateLayers__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "removeFromSuperlayer", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_animateWordIn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (!AFDeviceSupportsSystemAssistantExperience())
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDuration:", self->_animationDuration);
    objc_msgSend(v15, "beginImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFromValue:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v12));

    objc_msgSend(v15, "endImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToValue:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v13));

    objc_msgSend(v15, "wordLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v4, CFSTR("contents"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", self->_animationDuration);
    objc_msgSend(v7, "setFromValue:", &unk_1E4A632D0);
    objc_msgSend(v7, "setToValue:", &unk_1E4A632E0);
    objc_msgSend(v15, "wordLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v11 = v7;
    v10 = CFSTR("opacity");
    goto LABEL_5;
  }
  if (!self->_editTextImage)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.blurFilter.inputRadius"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdditive:", 1);
    objc_msgSend(v4, "setDuration:", self->_animationDuration);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

    objc_msgSend(v4, "setFromValue:", &unk_1E4A632B0);
    objc_msgSend(v4, "setToValue:", &unk_1E4A63130);
    objc_msgSend(v15, "wordLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v4, CFSTR("blurIn"));

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2848]), "initWithPerceptualDuration:bounce:", self->_animationDuration, 0.35);
    objc_msgSend(v7, "setKeyPath:", CFSTR("transform.translation.y"));
    objc_msgSend(v7, "setFromValue:", &unk_1E4A632C0);
    objc_msgSend(v7, "setToValue:", &unk_1E4A63130);
    objc_msgSend(v15, "wordLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("moveUp");
    v11 = v7;
LABEL_5:
    objc_msgSend(v8, "addAnimation:forKey:", v11, v10);

  }
}

- (void)_animateWordOut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.blurFilter.inputRadius"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdditive:", 1);
    objc_msgSend(v4, "setDuration:", self->_animationDuration);
    objc_msgSend(v4, "setByValue:", &unk_1E4A632B0);
    objc_msgSend(v10, "wordLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimation:forKey:", v4, CFSTR("blurOut"));

  }
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wordLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);

  objc_msgSend(v6, "setDuration:", self->_animationDuration);
  objc_msgSend(v6, "setFromValue:", &unk_1E4A632E0);
  objc_msgSend(v6, "setToValue:", &unk_1E4A632D0);
  objc_msgSend(v10, "wordLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v6, CFSTR("opacity"));

}

- (void)_resetState
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_wordsToShow;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setPrevious:", 0, (_QWORD)v9);
        objc_msgSend(v8, "setInsertType:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_wordsToDelete, "removeAllObjects");
}

- (id)_substringRangesContainingEmojiInString:(id)a3 startingIndex:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  +[SUICUtilities substringRangesContainingEmojiInString:](SUICUtilities, "substringRangesContainingEmojiInString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__SUICStreamingTextView__substringRangesContainingEmojiInString_startingIndex___block_invoke;
  v9[3] = &unk_1E4A55660;
  v9[4] = &v10;
  v9[5] = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __79__SUICStreamingTextView__substringRangesContainingEmojiInString_startingIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a2;
  v6 = objc_msgSend(v5, "rangeValue") + *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "rangeValue");
  v8 = v7;

  objc_msgSend(v4, "valueWithRange:", v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

}

- (id)_glyphImageForWord:(id)a3 frame:(CGRect)a4 glyphRange:(_NSRange)a5 textColor:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  _BOOL4 v16;
  NSTextStorage *textStorage;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSTextStorage *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  NSTextStorage *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v43;
  NSUInteger v44;
  id v45;
  id v46;
  NSUInteger v47;
  NSUInteger v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  length = a5.length;
  location = a5.location;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = -[SUICStreamingTextView renderEmojisOnly](self, "renderEmojisOnly");
  textStorage = self->_textStorage;
  v18 = *MEMORY[0x1E0DC1140];
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "textRange");
    -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v18, v19, v20, v21);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v14, "emojiRangesInText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v23)
    {
      v24 = v23;
      v45 = v14;
      v47 = location;
      v25 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(v22);
          v27 = self->_textStorage;
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "rangeValue");
          -[NSTextStorage addAttribute:value:range:](v27, "addAttribute:value:range:", v18, v15, v28, v29);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v24);
      v14 = v45;
      location = v47;
    }
LABEL_19:

    goto LABEL_20;
  }
  v30 = objc_msgSend(v14, "textRange");
  -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v18, v15, v30, v31);
  if (!-[SUICStreamingTextView renderEmojis](self, "renderEmojis"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v14, "emojiRangesInText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v32)
    {
      v33 = v32;
      v43 = v15;
      v44 = length;
      v46 = v14;
      v48 = location;
      v34 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v50 != v34)
            objc_enumerationMutation(v22);
          v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          v37 = self->_textStorage;
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", v43, v44);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v36, "rangeValue");
          -[NSTextStorage addAttribute:value:range:](v37, "addAttribute:value:range:", v18, v38, v39, v40);

        }
        v33 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v33);
      length = v44;
      v14 = v46;
      location = v48;
      v15 = v43;
    }
    goto LABEL_19;
  }
LABEL_20:
  -[SUICStreamingTextView _createGlyphImage:glyphRange:layoutManager:](self, "_createGlyphImage:glyphRange:layoutManager:", location, length, self->_layoutManager, x, y, width, height);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)_createGlyphImage:(CGRect)a3 glyphRange:(_NSRange)a4 layoutManager:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  NSUInteger v26;
  NSUInteger v27;
  CGRect v28;
  CGRect v29;

  length = a4.length;
  location = a4.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectIntegral(v28);
  v12 = v29.origin.x;
  v13 = v29.origin.y;
  v14 = v29.size.width;
  v15 = v29.size.height;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v29.size.width, v29.size.height);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__SUICStreamingTextView__createGlyphImage_glyphRange_layoutManager___block_invoke;
  v20[3] = &unk_1E4A55688;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v21 = v11;
  v26 = location;
  v27 = length;
  v17 = v11;
  objc_msgSend(v16, "imageWithActions:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __68__SUICStreamingTextView__createGlyphImage_glyphRange_layoutManager___block_invoke(uint64_t a1, void *a2)
{
  CGContextTranslateCTM((CGContextRef)objc_msgSend(a2, "CGContext"), -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)_createEditTextImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (AFDeviceSupportsSystemAssistantExperience())
    v3 = 1;
  else
    v3 = 2;
  v4 = (void *)MEMORY[0x1E0DC3888];
  -[SUICStreamingTextView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:scale:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", self->_startTextColor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationByApplyingConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", self->_editTextSymbol, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGImage)_imageRefForImage:(id)a3
{
  return (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
}

- (SUICStreamingTextViewDelegate)streamingTextViewDelegate
{
  return (SUICStreamingTextViewDelegate *)objc_loadWeakRetained((id *)&self->_streamingTextViewDelegate);
}

- (void)setStreamingTextViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_streamingTextViewDelegate, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (UIColor)startTextColor
{
  return self->_startTextColor;
}

- (void)setStartTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_startTextColor, a3);
}

- (UIColor)endTextColor
{
  return self->_endTextColor;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (BOOL)animated
{
  return self->_animated;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)centerAlign
{
  return self->_centerAlign;
}

- (void)setCenterAlign:(BOOL)a3
{
  self->_centerAlign = a3;
}

- (BOOL)showEditTextImage
{
  return self->_showEditTextImage;
}

- (NSString)editTextSymbol
{
  return self->_editTextSymbol;
}

- (void)setEditTextSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_editTextSymbol, a3);
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)renderEmojisOnly
{
  return self->_renderEmojisOnly;
}

- (void)setRenderEmojisOnly:(BOOL)a3
{
  self->_renderEmojisOnly = a3;
}

- (BOOL)renderEmojis
{
  return self->_renderEmojis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editTextSymbol, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_endTextColor, 0);
  objc_storeStrong((id *)&self->_startTextColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_streamingTextViewDelegate);
  objc_storeStrong((id *)&self->_editTextImage, 0);
  objc_storeStrong((id *)&self->_wordsToDelete, 0);
  objc_storeStrong((id *)&self->_wordsToShow, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
