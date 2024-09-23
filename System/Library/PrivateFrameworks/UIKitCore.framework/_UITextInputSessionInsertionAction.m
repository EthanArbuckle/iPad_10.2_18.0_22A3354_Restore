@implementation _UITextInputSessionInsertionAction

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
    objc_msgSend(v4, "asInsertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[_UITextInputSessionAction setInsertedTextLengthWithoutTracking:](self, "setInsertedTextLengthWithoutTracking:", objc_msgSend(v5, "insertedTextLength")+ -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ objc_msgSend(v5, "inputActionCount"));
    -[_UITextInputSessionInsertionAction setWithAlternativesCount:](self, "setWithAlternativesCount:", -[_UITextInputSessionInsertionAction withAlternativesCount](self, "withAlternativesCount")+ objc_msgSend(v5, "withAlternativesCount"));
    -[_UITextInputSessionInsertionAction setOptions:](self, "setOptions:", objc_msgSend(v5, "options") | -[_UITextInputSessionInsertionAction options](self, "options"));
    -[_UITextInputSessionAction setInsertedEmojiCount:](self, "setInsertedEmojiCount:", -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount")+ objc_msgSend(v5, "insertedEmojiCount"));
    -[_UITextInputSessionAction setInsertedPunctuationCount:](self, "setInsertedPunctuationCount:", -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount")+ objc_msgSend(v5, "insertedPunctuationCount"));
    v6 = -[_UITextInputSessionAction largestSingleInsertionLength](self, "largestSingleInsertionLength");
    v7 = objc_msgSend(v5, "insertedTextLength");
    if (v6 <= v7)
      v8 = v7;
    else
      v8 = v6;
    -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", v8);
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

- (BOOL)isCapableOfTextInsertion
{
  return 1;
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

- (unint64_t)withAlternativesCount
{
  return self->_withAlternativesCount;
}

- (void)setWithAlternativesCount:(unint64_t)a3
{
  self->_withAlternativesCount = a3;
}

@end
