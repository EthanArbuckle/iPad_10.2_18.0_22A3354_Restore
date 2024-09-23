@implementation _UITextInputSessionDeletionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (-[_UITextInputSessionAction isMergeableWith:](self, "isMergeableWith:", v4))
  {
    objc_msgSend(v4, "asDeletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[_UITextInputSessionAction setRemovedTextLengthWithoutTracking:](self, "setRemovedTextLengthWithoutTracking:", objc_msgSend(v5, "removedTextLength") + -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ objc_msgSend(v5, "inputActionCount"));
    -[_UITextInputSessionDeletionAction setOptions:](self, "setOptions:", objc_msgSend(v5, "options") | -[_UITextInputSessionDeletionAction options](self, "options"));
    -[_UITextInputSessionAction setRemovedEmojiCount:](self, "setRemovedEmojiCount:", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount") + objc_msgSend(v5, "removedEmojiCount"));
    v6 = -[_UITextInputSessionAction largestSingleDeletionLength](self, "largestSingleDeletionLength");
    v7 = objc_msgSend(v5, "removedTextLength");
    if (v6 <= v7)
      v8 = v7;
    else
      v8 = v6;
    -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", v8);
    objc_msgSend(v4, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      objc_msgSend(v4, "region");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_12:
        v10 = 1;
        goto LABEL_13;
      }
    }
    objc_msgSend(v4, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setLanguage:](self, "setLanguage:", v12);

    objc_msgSend(v4, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setRegion:](self, "setRegion:", v13);

    objc_msgSend(v4, "keyboardVariant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardVariant:](self, "setKeyboardVariant:", v14);

    objc_msgSend(v4, "keyboardLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardLayout:](self, "setKeyboardLayout:", v15);

    objc_msgSend(v4, "keyboardType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardType:](self, "setKeyboardType:", v16);

    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)changedContent
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextInputSessionDeletionAction;
  -[_UITextInputSessionAction description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removedTextLength=%lu"), -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removedEmojiCount=%lu"), -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)inputActionCount
{
  _BOOL8 v3;

  v3 = -[_UITextInputSessionAction source](self, "source") != 1
    && -[_UITextInputSessionAction source](self, "source") != 8;
  return -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions") + v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
