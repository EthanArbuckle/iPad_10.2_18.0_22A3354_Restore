@implementation OBTemplateLabel

- (OBTemplateLabel)init
{
  OBTemplateLabel *v2;
  OBTemplateLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTemplateLabel;
  v2 = -[OBTemplateLabel initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[OBTemplateLabel updateTextAlignmentIfNeeded](v2, "updateTextAlignmentIfNeeded");
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBTemplateLabel;
  -[OBTemplateLabel traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[OBTemplateLabel updateTextAlignmentIfNeeded](self, "updateTextAlignmentIfNeeded");
  -[OBTemplateLabel symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[OBTemplateLabel symbolName](self, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTemplateLabel setTitleTrailingSymbol:](self, "setTitleTrailingSymbol:", v6);

  }
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[OBTemplateLabel setDisplayText:](self, "setDisplayText:", v4);
  v8.receiver = self;
  v8.super_class = (Class)OBTemplateLabel;
  -[OBTemplateLabel setText:](&v8, sel_setText_, v4);

  -[OBTemplateLabel symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[OBTemplateLabel symbolName](self, "symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTemplateLabel setTitleTrailingSymbol:](self, "setTitleTrailingSymbol:", v7);

  }
}

- (void)setTitleTrailingSymbol:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  objc_storeStrong((id *)&self->_symbolName, a3);
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0DC3888];
  -[OBTemplateLabel font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:", v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTemplateLabel tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTintColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setImage:", v11);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTemplateLabel displayText](self, "displayText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0CB3778]);
  v17 = (void *)objc_msgSend(v16, "initWithString:", v15);
  objc_msgSend(v17, "appendAttributedString:", v13);
  -[OBTemplateLabel setAttributedText:](self, "setAttributedText:", v17);

}

- (void)updateTextAlignmentIfNeeded
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[OBTemplateLabel textAlignment](self, "textAlignment");
  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
    v4 = 4;
  else
    v4 = 1;
  if (v4 != v3)
  {
    -[OBTemplateLabel setTextAlignment:](self, "setTextAlignment:");
    -[OBTemplateLabel _textAlignmentDidChange](self, "_textAlignmentDidChange");
  }
}

- (void)_textAlignmentDidChange
{
  void *v3;
  uint64_t v4;
  id v5;

  -[OBTemplateLabel symbolName](self, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[OBTemplateLabel symbolName](self, "symbolName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[OBTemplateLabel setTitleTrailingSymbol:](self, "setTitleTrailingSymbol:", v5);

  }
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
