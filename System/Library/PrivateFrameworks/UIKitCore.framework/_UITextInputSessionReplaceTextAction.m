@implementation _UITextInputSessionReplaceTextAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (-[_UITextInputSessionAction isMergeableWith:](self, "isMergeableWith:", v4))
  {
    objc_msgSend(v4, "asReplaceText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[_UITextInputSessionAction setInsertedTextLengthWithoutTracking:](self, "setInsertedTextLengthWithoutTracking:", objc_msgSend(v5, "insertedTextLength")+ -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    -[_UITextInputSessionAction setRemovedTextLengthWithoutTracking:](self, "setRemovedTextLengthWithoutTracking:", objc_msgSend(v5, "removedTextLength") + -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ objc_msgSend(v5, "inputActionCount"));
    -[_UITextInputSessionReplaceTextAction setOptions:](self, "setOptions:", objc_msgSend(v5, "options") | -[_UITextInputSessionReplaceTextAction options](self, "options"));
    -[_UITextInputSessionAction setRemovedEmojiCount:](self, "setRemovedEmojiCount:", -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount") + objc_msgSend(v5, "removedEmojiCount"));
    -[_UITextInputSessionAction setInsertedEmojiCount:](self, "setInsertedEmojiCount:", -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount")+ objc_msgSend(v5, "insertedEmojiCount"));
    -[_UITextInputSessionAction setRemovedPunctuationCount:](self, "setRemovedPunctuationCount:", -[_UITextInputSessionAction removedPunctuationCount](self, "removedPunctuationCount")+ objc_msgSend(v5, "removedPunctuationCount"));
    -[_UITextInputSessionAction setInsertedPunctuationCount:](self, "setInsertedPunctuationCount:", -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount")+ objc_msgSend(v5, "insertedPunctuationCount"));
    v6 = objc_msgSend(v5, "netCharacterCount");
    v7 = v6;
    if (v6 < 1)
    {
      if (v6 < 0)
      {
        v11 = -[_UITextInputSessionAction largestSingleDeletionLength](self, "largestSingleDeletionLength");
        if (v11 <= -(uint64_t)v7)
          v12 = -(uint64_t)v7;
        else
          v12 = v11;
        -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", v12);
      }
    }
    else
    {
      v8 = -[_UITextInputSessionAction largestSingleInsertionLength](self, "largestSingleInsertionLength");
      if (v8 <= v7)
        v9 = v7;
      else
        v9 = v8;
      -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", v9);
    }
    objc_msgSend(v4, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      objc_msgSend(v4, "region");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_19:
        v10 = 1;
        goto LABEL_20;
      }
    }
    objc_msgSend(v4, "language");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setLanguage:](self, "setLanguage:", v15);

    objc_msgSend(v4, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setRegion:](self, "setRegion:", v16);

    objc_msgSend(v4, "keyboardVariant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardVariant:](self, "setKeyboardVariant:", v17);

    objc_msgSend(v4, "keyboardLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardLayout:](self, "setKeyboardLayout:", v18);

    objc_msgSend(v4, "keyboardType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextInputSessionAction setKeyboardType:](self, "setKeyboardType:", v19);

    goto LABEL_19;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
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
