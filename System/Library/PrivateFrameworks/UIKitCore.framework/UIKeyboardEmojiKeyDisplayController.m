@implementation UIKeyboardEmojiKeyDisplayController

- (UIKeyboardEmojiKeyDisplayController)init
{
  UIKeyboardEmojiKeyDisplayController *v2;
  UIKeyboardEmojiKeyDisplayController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiKeyDisplayController;
  v2 = -[UIKeyboardEmojiKeyDisplayController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_inputView, 0);
    objc_storeWeak((id *)&v3->_categoryView, 0);
  }
  return v3;
}

- (void)dealloc
{
  UIKeyboardEmojiKeyView **p_inputView;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_inputView = &self->_inputView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputView);

  if (WeakRetained)
    objc_storeWeak((id *)p_inputView, 0);
  v5 = objc_loadWeakRetained((id *)&self->_categoryView);

  if (v5)
    objc_storeWeak((id *)&self->_categoryView, 0);
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardEmojiKeyDisplayController;
  -[UIKeyboardEmojiKeyDisplayController dealloc](&v6, sel_dealloc);
}

- (void)updateEmojiKeyManagerWithKey:(id)a3 withKeyView:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || _UIApplicationIsStickerPickerService())
  {
    if (objc_msgSend(v9, "displayType") == 36)
    {
      v7 = 8;
LABEL_8:
      v8 = objc_storeWeak((id *)((char *)&self->super.isa + v7), v6);
      objc_msgSend(v6, "setEmojiKeyManager:", self);

      goto LABEL_9;
    }
    if (objc_msgSend(v9, "displayType") == 37)
    {
      v7 = 16;
      goto LABEL_8;
    }
  }
LABEL_9:

}

+ (Class)classForInputView:(int64_t)a3
{
  if (a3 == 1)
    +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  return (Class)(id)objc_opt_class();
}

+ (Class)classForCategoryControl:(int64_t)a3
{
  if (a3 == 1)
  {
    +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
    return (Class)(id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    return (Class)(id)objc_claimAutoreleasedReturnValue();
  }
}

+ (void)writeEmojiDefaultsAndReleaseActiveInputView
{
  id v2;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeEmojiDefaults");

}

- (void)reloadForCategory:(int64_t)a3 withSender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardEmojiKeyDisplayController categoryView](self, "categoryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
    goto LABEL_4;

  if (v7 == v9)
  {
    -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    objc_msgSend(v7, "updateToCategory:", a3);

  }
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshLocalRecents");

}

- (int64_t)reloadCategoryForOffsetPercentage:(double)a3 withSender:(id)a4
{
  id v6;
  id v7;
  void *v9;
  int64_t v10;

  v6 = a4;
  -[UIKeyboardEmojiKeyDisplayController categoryView](self, "categoryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
    return 0;
  -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "updateToCategoryWithOffsetPercentage:", a3);

  return v10;
}

- (void)reloadCategoryForIndexPath:(id)a3 withSender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[UIKeyboardEmojiKeyDisplayController categoryView](self, "categoryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = v10;
      objc_msgSend(v10, "updateToIndexPath:", v14);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v6)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[UIKeyboardEmojiKeyDisplayController inputView](self, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[UIKeyboardEmojiKeyDisplayController categoryView](self, "categoryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

}

- (BOOL)userHasSelectedSkinToneEmoji
{
  void *v2;
  char v3;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisplayedSkinToneHelp");

  return v3;
}

- (void)emojiUsed:(id)a3
{
  -[UIKeyboardEmojiKeyDisplayController emojiUsed:language:](self, "emojiUsed:language:", a3, 0);
}

- (void)emojiUsed:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emojiUsedFromEmojiKeyboardPalette:inputModeIdentifier:completionHandler:", v6, v5, 0);

}

- (void)updateSkinToneBaseKey:(id)a3 variantUsed:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSkinToneBaseKey:variantUsed:", v6, v5);

}

- (id)recents
{
  void *v2;
  void *v3;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recentEmojiAtIndex:(int64_t)a3 size:(unint64_t *)a4
{
  void *v6;
  void *v7;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recentEmojiAtIndex:size:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)emojiWithoutDuplicateRecents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emojiWithoutDuplicateRecents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)skinToneBaseKeyPreferences
{
  void *v2;
  void *v3;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skinToneBaseKeyPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasLastUsedVariantForEmojiString:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasLastUsedVariantForEmojiString:", v3);

  return v5;
}

- (id)lastUsedVariantEmojiForEmojiString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUsedVariantEmojiForEmojiString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIKeyboardEmojiCategory)lastViewedCategory
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", objc_msgSend(v2, "selectedCategoryType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v4, "emojiCategoryDefaultsIndex:", v3));

  return (UIKeyboardEmojiCategory *)v3;
}

- (void)setLastViewedCategory:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedCategoryType:", objc_msgSend(v3, "categoryType"));

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmojiCategoryDefaultsIndex:forCategory:", objc_msgSend(v3, "lastVisibleFirstEmojiIndex"), v3);

}

- (int64_t)lastVisibleFirstEmojiIndexforCategory:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "emojiCategoryDefaultsIndex:", v3);

  return v5;
}

- (UIKeyboardEmojiKeyView)inputView
{
  return (UIKeyboardEmojiKeyView *)objc_loadWeakRetained((id *)&self->_inputView);
}

- (void)setInputView:(id)a3
{
  objc_storeWeak((id *)&self->_inputView, a3);
}

- (UIKeyboardEmojiKeyView)categoryView
{
  return (UIKeyboardEmojiKeyView *)objc_loadWeakRetained((id *)&self->_categoryView);
}

- (void)setCategoryView:(id)a3
{
  objc_storeWeak((id *)&self->_categoryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewedCategory, 0);
  objc_destroyWeak((id *)&self->_categoryView);
  objc_destroyWeak((id *)&self->_inputView);
}

@end
