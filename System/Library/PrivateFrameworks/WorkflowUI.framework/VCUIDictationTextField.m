@implementation VCUIDictationTextField

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VCUIDictationTextField;
  -[VCUIDictationTextField didMoveToSuperview](&v4, sel_didMoveToSuperview);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_dictationDidFinish_, *MEMORY[0x24BEBE108], 0);

  if (-[VCUIDictationTextField conformsToProtocol:](self, "conformsToProtocol:", &unk_255618BD8))
    -[VCUIDictationTextField setAcceptsDictationSearchResults:](self, "setAcceptsDictationSearchResults:", 1);
}

- (void)setAttributedPlaceholder:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VCUIDictationTextField;
  -[VCUIDictationTextField setAttributedPlaceholder:](&v5, sel_setAttributedPlaceholder_, a3);
  -[VCUIDictationTextField placeholderLabel](self, "placeholderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "setTextAlignment:", -[VCUIDictationTextField textAlignment](self, "textAlignment"));

}

- (id)placeholderLabel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VCUIDictationTextField subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v6);
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v7 = 0;
  }

  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCUIDictationTextField;
  -[VCUIDictationTextField layoutSubviews](&v10, sel_layoutSubviews);
  -[VCUIDictationTextField placeholderLabel](self, "placeholderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    +[VCUIDictationTextField bottomPadding](VCUIDictationTextField, "bottomPadding");
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, v6, v8 + v9);
  }

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4 * 3.25;

  -[VCUIDictationTextField placeholderLabel](self, "placeholderLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIDictationTextField text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[VCUIDictationTextField bounds](self, "bounds");
  if (v8 || !v6)
  {
    -[VCUIDictationTextField sizeThatFits:](self, "sizeThatFits:", v9, v5);
    v11 = v16;
    v15 = v17;
  }
  else
  {
    objc_msgSend(v6, "sizeThatFits:", v9, v5);
    v11 = v10;
    v13 = v12;
    +[VCUIDictationTextField bottomPadding](VCUIDictationTextField, "bottomPadding");
    v15 = v13 + v14;
  }

  v18 = v11;
  v19 = v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)startDictation
{
  id v2;

  -[VCUIDictationTextField becomeFirstResponder](self, "becomeFirstResponder");
  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToDictationInputMode");

}

+ (double)bottomPadding
{
  return 16.0;
}

@end
