@implementation UIKeyboardEmojiCategoryBar

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _BYTE *v15;
  UIKeyboardEmojiCategoryBar *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v21;
  UIView *scrubView;
  double v23;
  UIKeyboardEmojiScrubBarView *v24;
  UIView *v25;
  double v26;
  double v27;
  void *v28;
  UIView *v29;
  BOOL v30;
  void *v31;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardEmojiCategoryBar;
  v16 = -[UIView initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    if (!v15)
    {
      +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v17, objc_msgSend(v18, "interfaceOrientation"));
      v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    }
    +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:](UIKeyboardEmojiGraphicsTraits, "emojiGraphicsTraitsWithScreenTraits:", v15);
    v19 = objc_claimAutoreleasedReturnValue();
    emojiGraphicsTraits = v16->_emojiGraphicsTraits;
    v16->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v19;

    v16->_selectedIndex = -1;
    v16->_isScrubbing = 0;
    +[UIColor clearColor](UIColor, "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v21);

    -[UIView setOpaque:](v16, "setOpaque:", 0);
    objc_msgSend(v14, "setState:", 16);
    objc_msgSend(v14, "setSelectedVariantIndex:", v16->_selectedIndex);
    -[UIKBKeyView updateForKeyplane:key:](v16, "updateForKeyplane:key:", v13, v14);
    scrubView = v16->_scrubView;
    if (!scrubView)
    {
      -[UIKeyboardEmojiGraphicsTraits categorySelectedCirWidth](v16->_emojiGraphicsTraits, "categorySelectedCirWidth");
      v24 = -[UIView initWithFrame:]([UIKeyboardEmojiScrubBarView alloc], "initWithFrame:", 0.0, (height - v23) * 0.5, v23, v23);
      v25 = v16->_scrubView;
      v16->_scrubView = &v24->super;

      -[UIKeyboardEmojiGraphicsTraits categorySelectedCirWidth](v16->_emojiGraphicsTraits, "categorySelectedCirWidth");
      v27 = v26 * 0.5;
      -[UIView layer](v16->_scrubView, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCornerRadius:", v27);

      v29 = v16->_scrubView;
      if (v29)
      {
        if (v15)
          v30 = v15[35] != 0;
        else
          v30 = 0;
        LOBYTE(v29[1].super.super.isa) = v30;
        scrubView = v16->_scrubView;
      }
      else
      {
        scrubView = 0;
      }
    }
    -[UIView addSubview:](v16, "addSubview:", scrubView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v16, sel_receiveNotifictaion_, CFSTR("UIKeyboardEmojiDidScrollNotification"), 0);

  }
  return v16;
}

- (UIKeyboardEmojiCategoryBar)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiCategoryBar initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  UIKBTree *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiCategoryBar;
  -[UIKBKeyView prepareForDisplay](&v10, sel_prepareForDisplay);
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 8);
      -[UIKBKeyView renderConfig](self, "renderConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardEmojiGraphics emojiCategoryImagePath:forRenderConfig:](UIKeyboardEmojiGraphics, "emojiCategoryImagePath:forRenderConfig:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree setDisplayString:](v7, "setDisplayString:", v9);

      objc_msgSend(v4, "addObject:", v7);
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  -[UIKBKeyView updateKeySubtrees:](self, "updateKeySubtrees:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardEmojiDidScrollNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardEmojiCategoryBar;
  -[UIKBKeyView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v4, "categoryType"));

  -[UIKeyboardEmojiCategoryBar updateCategoryOnBar:](self, "updateCategoryOnBar:", v5);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiCategoryBar;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  if (!self->_isScrubbing)
  {
    -[UIKeyboardEmojiCategoryBar categorySelectedCircleRect:](self, "categorySelectedCircleRect:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardEmojiCategoryBar;
  -[UIKBKeyView dimKeys:](&v19, sel_dimKeys_, v4);
  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__UIKeyboardEmojiCategoryBar_dimKeys___block_invoke;
    v14[3] = &unk_1E16D59B0;
    v14[4] = &v15;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHidden:", *((_BYTE *)v16 + 24) == 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
      }
      while (v7);
    }

    _Block_object_dispose(&v15, 8);
  }

}

void __38__UIKeyboardEmojiCategoryBar_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  double v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(a2, "integerValue") & 4) != 0)
  {
    objc_msgSend(v8, "doubleValue");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7 != 0.0;
    *a4 = 1;
  }

}

- (void)updateToCategory:(int64_t)a3
{
  -[UIKeyboardEmojiCategoryBar updateCategoryOnBar:](self, "updateCategoryOnBar:", +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", a3));
}

- (void)updateCategoryOnBar:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;

  -[UIKeyboardEmojiCategoryBar setSelectedIndex:](self, "setSelectedIndex:");
  -[UIKBKeyView updateKeySelectedVariantIndex:](self, "updateKeySelectedVariantIndex:", a3);
  if (!self->_isScrubbing)
  {
    -[UIKeyboardEmojiCategoryBar categorySelectedCircleRect:](self, "categorySelectedCircleRect:", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[UIKBKeyView renderConfig](self, "renderConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "whiteText");

    if (v15)
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)updateCategory
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionOccurred:", 1);

  v5 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadForCategory:withSender:", v5, self);

}

- (unint64_t)flippedIndexForIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  if (+[UIKeyboardEmojiCategory isRTLMode](UIKeyboardEmojiCategory, "isRTLMode"))
  {
    +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    return v5 + ~a3;
  }
  return a3;
}

- (CGRect)paddedFrame
{
  UIKeyboardEmojiGraphicsTraits *emojiGraphicsTraits;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers)
  {
    -[UIKBKeyView key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paddedFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[UIView frame](self, "frame");
    v14 = v6 - v13;
    v16 = v8 - v15;
  }
  else
  {
    -[UIView bounds](self, "bounds");
    v10 = v17;
    v12 = v18;
  }
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (CGRect)frameForDivider:(int)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[UIKeyboardEmojiCategoryBar paddedFrame](self, "paddedFrame");
  v5 = v4 + 4.0;
  v7 = v6 + -8.0;
  v9 = v8 + 5.0;
  v11 = v10 + -13.0;
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = round(v5 + ((v7 - (double)(v13 + 1)) / (double)v13 + 1.0) * (double)a3);
  v15 = 1.0;
  v16 = v9;
  v17 = v11;
  result.size.height = v17;
  result.size.width = v15;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (void)animateScrubberToRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  BOOL v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  _QWORD v14[9];
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectEqualToRect(v15, v16);

  if (!v9)
  {
    -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11 > width;

    v13 = dbl_186680B90[v12];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__UIKeyboardEmojiCategoryBar_animateScrubberToRect___block_invoke;
    v14[3] = &unk_1E16B20D8;
    v14[4] = self;
    *(CGFloat *)&v14[5] = x;
    *(CGFloat *)&v14[6] = y;
    *(double *)&v14[7] = width;
    *(CGFloat *)&v14[8] = height;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 458752, v14, 0, v13, 0.0);
  }
}

void __52__UIKeyboardEmojiCategoryBar_animateScrubberToRect___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "scrubView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

- (CGRect)categorySelectedCircleRect:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[UIKeyboardEmojiCategoryBar paddedFrame](self, "paddedFrame");
  v6 = v5;
  v8 = v7;
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 / (double)(unint64_t)objc_msgSend(v9, "count");

  -[UIKeyboardEmojiGraphicsTraits categorySelectedCirWidth](self->_emojiGraphicsTraits, "categorySelectedCirWidth");
  v12 = v11;
  v13 = v6
      + (v10 - v11) * 0.5
      + v10 * (double)-[UIKeyboardEmojiCategoryBar flippedIndexForIndex:](self, "flippedIndexForIndex:", a3);
  -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "origin");
  v16 = v15;

  v17 = v13;
  v18 = v16;
  v19 = v12;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)removeFromSuperview
{
  objc_super v2;

  self->_hitTestResponder = 0;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiCategoryBar;
  -[UIKBKeyView removeFromSuperview](&v2, sel_removeFromSuperview);
}

- (void)setHitTestResponder:(id)a3
{
  self->_hitTestResponder = (UIKBEmojiHitTestResponder *)a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTrackpadMode");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v10, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    self->_scrubStartXLocation = v8;
    -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareSliderBehaviorFeedback");

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;

  v32 = a3;
  -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTrackpadMode");

  v7 = v32;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v32, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", self);
    v10 = v9;
    if (vabdd_f64(v9, self->_scrubStartXLocation) > 5.0)
    {
      self->_isScrubbing = 1;
      -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "origin");
      v13 = v12;
      -[UIView frame](self, "frame");
      v15 = v14;
      -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v18 = v17;

      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:", 0.0, v13, v15, v18);
      -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v21 = v10 - v20;
      -[UIKeyboardEmojiCategoryBar scrubView](self, "scrubView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v21 / v23;

      if (v24 >= 0.0)
        v25 = v24;
      else
        v25 = 0.0;
      v26 = fmin(v25, 1.0);
      if (+[UIKeyboardEmojiCategory isRTLMode](UIKeyboardEmojiCategory, "isRTLMode"))
        v27 = 1.0 - v26;
      else
        v27 = v26;
      -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "reloadCategoryForOffsetPercentage:withSender:", self, v27);

      v30 = -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex");
      if (v30 != +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", v29))
      {
        -[UIKeyboardEmojiCategoryBar setSelectedIndex:](self, "setSelectedIndex:", +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", v29));
        -[UIKeyboardEmojiCategoryBar updateCategoryOnBar:](self, "updateCategoryOnBar:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
        -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "provideSliderBehaviorFeedback");

      }
    }

    v7 = v32;
  }

}

- (unint64_t)selectedIndexForTouches:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;

  v4 = a3;
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 0;
  v8 = v6 - 1;
  v9 = (v6 - 1) & ~((v6 - 1) >> 63);
  while (v9 != v7)
  {
    -[UIKeyboardEmojiCategoryBar frameForDivider:](self, "frameForDivider:", ++v7);
    v11 = v10;
    objc_msgSend(v4, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", self);
    v14 = v13;

    if (v11 >= v14)
    {
      v8 = v7 - 1;
      break;
    }
  }
  v15 = -[UIKeyboardEmojiCategoryBar flippedIndexForIndex:](self, "flippedIndexForIndex:", v8);

  return v15;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTrackpadMode");

  if ((v6 & 1) == 0)
  {
    if (self->_isScrubbing)
    {
      -[UIKeyboardEmojiCategoryBar categorySelectedCircleRect:](self, "categorySelectedCircleRect:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:");
      self->_isScrubbing = 0;
    }
    else
    {
      -[UIKeyboardEmojiCategoryBar setSelectedIndex:](self, "setSelectedIndex:", -[UIKeyboardEmojiCategoryBar selectedIndexForTouches:](self, "selectedIndexForTouches:", v9));
      -[UIKeyboardEmojiCategoryBar updateCategory](self, "updateCategory");
      -[UIKeyboardEmojiCategoryBar updateCategoryOnBar:](self, "updateCategoryOnBar:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
      -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "provideSliderBehaviorFeedback");

    }
    -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishSliderBehaviorFeedback");

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTrackpadMode");

  if ((v6 & 1) == 0)
  {
    if (self->_isScrubbing)
    {
      -[UIKeyboardEmojiCategoryBar categorySelectedCircleRect:](self, "categorySelectedCircleRect:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
      -[UIKeyboardEmojiCategoryBar animateScrubberToRect:](self, "animateScrubberToRect:");
      -[UIKeyboardEmojiCategoryBar updateCategory](self, "updateCategory");
      self->_isScrubbing = 0;
      -[UIKeyboardEmojiCategoryBar hitTestResponder](self, "hitTestResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishSliderBehaviorFeedback");

    }
    else
    {
      -[UIKeyboardEmojiCategoryBar setSelectedIndex:](self, "setSelectedIndex:", -[UIKeyboardEmojiCategoryBar selectedIndexForTouches:](self, "selectedIndexForTouches:", v8));
      -[UIKeyboardEmojiCategoryBar updateCategory](self, "updateCategory");
      -[UIKeyboardEmojiCategoryBar updateCategoryOnBar:](self, "updateCategoryOnBar:", -[UIKeyboardEmojiCategoryBar selectedIndex](self, "selectedIndex"));
    }
  }

}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (UIView)scrubView
{
  return self->_scrubView;
}

- (void)setScrubView:(id)a3
{
  objc_storeStrong((id *)&self->_scrubView, a3);
}

- (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraits
{
  return self->_emojiGraphicsTraits;
}

- (void)setEmojiGraphicsTraits:(id)a3
{
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, a3);
}

- (UIKBEmojiHitTestResponder)hitTestResponder
{
  return self->_hitTestResponder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_scrubView, 0);
}

@end
