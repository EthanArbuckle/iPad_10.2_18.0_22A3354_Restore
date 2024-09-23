@implementation UIKeyboardEmojiSplitCategoryPicker

- (UIKeyboardEmojiSplitCategoryPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIKeyboardEmojiSplitCategoryPicker *v13;
  void *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIKeyboardEmojiSplitCategoryPicker *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  v13 = -[UIKeyboardEmojiSplit initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    objc_msgSend(v12, "setClipCorners:", 10);
    -[UIKBKeyView updateForKeyplane:key:](v13, "updateForKeyplane:key:", v11, v12);
    -[UIKeyboardEmojiSplit picker](v13, "picker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v13);

    -[UIKeyboardEmojiSplit picker](v13, "picker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDataSource:", v13);

    v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 6.0);
    -[UIKeyboardEmojiSplit picker](v13, "picker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTableHeaderView:", v16);

    -[UIKeyboardEmojiSplit picker](v13, "picker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTableFooterView:", v16);

    -[UIKeyboardEmojiSplit picker](v13, "picker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScrollEnabled:", 1);

    v13->_whiteText = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v13, sel_receiveNotifictaion_, CFSTR("UIKeyboardEmojiDidScrollNotification"), 0);

    v21 = v13;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardEmojiDidScrollNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  -[UIKBKeyView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double currentSelected;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  -[UIView didMoveToWindow](&v18, sel_didMoveToWindow);
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentSelected = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", objc_msgSend(v4, "categoryType"));

  -[UIKeyboardEmojiSplit picker](self, "picker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentSelected = (double)(uint64_t)self->_currentSelected;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rivenSizeFactor:", 34.0);
  v10 = v9 * currentSelected;
  -[UIKeyboardEmojiSplit picker](self, "picker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v12;
  v14 = (double)(uint64_t)self->_currentSelected;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferencesActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rivenSizeFactor:", 34.0);
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0, 0.0, v10, v13, v17 * v14);

}

- (void)updateToCategory:(int64_t)a3
{
  self->_lastUsedCategory = a3;
  self->_currentSelected = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:");
  -[UIKeyboardEmojiSplitCategoryPicker updateCategorySelectedIndicator:](self, "updateCategorySelectedIndicator:", a3);
}

- (void)updateCategorySelectedIndicator:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  id v29;

  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      -[UIKeyboardEmojiSplit picker](self, "picker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setPressIndicatorHidden:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", i) != a3);
    }
  }
  +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", objc_msgSend(v11, "count") - 6);

  if (v12 == a3)
  {
    -[UIKeyboardEmojiSplit picker](self, "picker");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiSplit picker](self, "picker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentSize");
    v15 = v14;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferencesActions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rivenSizeFactor:", 34.0);
    objc_msgSend(v29, "scrollRectToVisible:animated:", 1, 0.0, 0.0, v15, v18);
  }
  else
  {
    if (+[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", 5) != a3)return;
    -[UIKeyboardEmojiSplit picker](self, "picker");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferencesActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rivenSizeFactor:", 34.0);
    v20 = v19 * 3.0;
    -[UIKeyboardEmojiSplit picker](self, "picker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentSize");
    v22 = v21;
    -[UIKeyboardEmojiSplit picker](self, "picker");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentSize");
    v25 = v24;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferencesActions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rivenSizeFactor:", 34.0);
    objc_msgSend(v29, "scrollRectToVisible:animated:", 1, 0.0, v20, v22, v25 - v28);

  }
}

- (id)titleForRow:(int64_t)a3 fallback:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v4 = a4;
  v6 = _MergedGlobals_11_7;
  if (!_MergedGlobals_11_7)
  {
    +[UIKeyboardEmojiCategory enabledCategoryIndexes](UIKeyboardEmojiCategory, "enabledCategoryIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __59__UIKeyboardEmojiSplitCategoryPicker_titleForRow_fallback___block_invoke;
    v21 = &unk_1E16D39D8;
    v10 = v8;
    v22 = v10;
    v11 = v9;
    v23 = v11;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v18);
    v12 = (void *)_MergedGlobals_11_7;
    _MergedGlobals_11_7 = (uint64_t)v10;
    v13 = v10;

    v14 = (void *)qword_1ECD7AEE0;
    qword_1ECD7AEE0 = (uint64_t)v11;
    v15 = v11;

    v6 = _MergedGlobals_11_7;
  }
  if (v4)
    v16 = (void *)qword_1ECD7AEE0;
  else
    v16 = (void *)v6;
  objc_msgSend(v16, "objectAtIndex:", a3, v18, v19, v20, v21);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__UIKeyboardEmojiSplitCategoryPicker_titleForRow_fallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  +[UIKeyboardEmojiCategory displayName:](UIKeyboardEmojiCategory, "displayName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  +[UIKeyboardEmojiCategory fallbackDisplayName:](UIKeyboardEmojiCategory, "fallbackDisplayName:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (id)symbolForRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardEmojiGraphics emojiCategoryImagePath:forRenderConfig:](UIKeyboardEmojiGraphics, "emojiCategoryImagePath:forRenderConfig:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  UIKeyboardEmojiSplitCategoryCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[UIKeyboardEmojiSplitCategoryPicker titleForRow:fallback:](self, "titleForRow:fallback:", objc_msgSend(v5, "row"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKeyboardEmojiSplitCategoryCell initWithStyle:reuseIdentifier:]([UIKeyboardEmojiSplitCategoryCell alloc], "initWithStyle:reuseIdentifier:", 0, v6);
  -[UIKeyboardEmojiSplitCategoryPicker symbolForRow:](self, "symbolForRow:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageWithName(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiSplitCategoryCell symbol](v7, "symbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  v35 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithAttributes:", v12);
  v14 = v13;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferencesActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rivenSizeFactor:", ceil(v14));
  v18 = v17;
  -[UIKeyboardEmojiSplitCategoryCell title](v7, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;

  if (v18 > v21)
  {
    -[UIKeyboardEmojiSplitCategoryPicker titleForRow:fallback:](self, "titleForRow:fallback:", objc_msgSend(v5, "row"), 1);
    v22 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v22;
  }
  -[UIKeyboardEmojiSplitCategoryCell setTitleText:](v7, "setTitleText:", v6);
  -[UIKeyboardEmojiSplitCategoryCell setPressIndicatorHidden:](v7, "setPressIndicatorHidden:", objc_msgSend(v5, "row") != self->_currentSelected);
  v23 = -[UIKeyboardEmojiSplitCategoryPicker whiteText](self, "whiteText");
  -[UIKeyboardEmojiSplitCategoryCell symbol](v7, "symbol");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "image");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_flatImageWithColor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiSplitCategoryCell symbol](v7, "symbol");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImage:", v27);

    +[UIColor whiteColor](UIColor, "whiteColor");
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_flatImageWithColor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiSplitCategoryCell symbol](v7, "symbol");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setImage:", v30);

    +[UIColor blackColor](UIColor, "blackColor");
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiSplitCategoryCell title](v7, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTextColor:", v32);

  -[UIKeyboardEmojiSplitCategoryCell setSelectedCircleBlendMode:](v7, "setSelectedCircleBlendMode:", -[UIKeyboardEmojiSplitCategoryPicker whiteText](self, "whiteText") ^ 1);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:](UIKeyboardEmojiCategory, "categoryTypeForCategoryIndex:", objc_msgSend(v5, "row"));
  -[UIKeyboardEmojiKeyView emojiKeyManager](self, "emojiKeyManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadForCategory:withSender:", v6, self);

  v8 = objc_msgSend(v5, "row");
  self->_currentSelected = v8;
  -[UIKeyboardEmojiSplitCategoryPicker updateCategorySelectedIndicator:](self, "updateCategorySelectedIndicator:", v6);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "feedbackGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionOccurred:", 1);

}

- (void)setRenderConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardEmojiSplitCategoryPicker;
  v4 = a3;
  -[UIKBKeyView setRenderConfig:](&v8, sel_setRenderConfig_, v4);
  v5 = objc_msgSend(v4, "whiteText", v8.receiver, v8.super_class);

  -[UIKeyboardEmojiSplitCategoryPicker setWhiteText:](self, "setWhiteText:", v5);
  -[UIKeyboardEmojiSplit picker](self, "picker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  -[UIKeyboardEmojiSplit picker](self, "picker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsDisplay");

  if (self->_lastUsedCategory)
    -[UIKeyboardEmojiSplitCategoryPicker updateCategorySelectedIndicator:](self, "updateCategorySelectedIndicator:");
}

- (BOOL)whiteText
{
  return self->_whiteText;
}

- (void)setWhiteText:(BOOL)a3
{
  self->_whiteText = a3;
}

@end
