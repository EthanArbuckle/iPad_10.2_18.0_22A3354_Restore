@implementation OBTemplateHeaderDetailLabel

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTemplateHeaderDetailLabel;
  -[OBTemplateHeaderDetailLabel traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[OBTemplateHeaderDetailLabel text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTemplateHeaderDetailLabel updateAttributedTextWithString:](self, "updateAttributedTextWithString:", v4);

}

- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[OBTemplateHeaderDetailLabel setTitleRange:](self, "setTitleRange:", 0, objc_msgSend(v7, "length"));
  v8 = objc_msgSend(CFSTR("\n"), "length");
  -[OBTemplateHeaderDetailLabel titleRange](self, "titleRange");
  -[OBTemplateHeaderDetailLabel setBodyRange:](self, "setBodyRange:", v9 + v8, objc_msgSend(v6, "length"));
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingString:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[OBTemplateHeaderDetailLabel setText:](self, "setText:", v11);
}

- (void)setText:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTemplateHeaderDetailLabel;
  v4 = a3;
  -[OBTemplateHeaderDetailLabel setText:](&v5, sel_setText_, v4);
  -[OBTemplateHeaderDetailLabel updateAttributedTextWithString:](self, "updateAttributedTextWithString:", v4, v5.receiver, v5.super_class);

}

- (void)updateAttributedTextWithString:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v4, "mutableCopy");

  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
    v5 = 4;
  else
    v5 = 1;
  objc_msgSend(v21, "setAlignment:", v5);
  objc_msgSend(v21, "setSpansAllLines:", 1);
  -[OBTemplateHeaderDetailLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  objc_msgSend(v8, "boldSystemFontOfSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointSize");
  objc_msgSend(v12, "systemFontOfSize:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0DC1138];
  v16 = -[OBTemplateHeaderDetailLabel titleRange](self, "titleRange");
  objc_msgSend(v7, "addAttribute:value:range:", v15, v11, v16, v17);
  v18 = -[OBTemplateHeaderDetailLabel bodyRange](self, "bodyRange");
  objc_msgSend(v7, "addAttribute:value:range:", v15, v14, v18, v19);
  v20 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x1E0DC1178], 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v7, "length"));
  -[OBTemplateHeaderDetailLabel setAttributedText:](self, "setAttributedText:", v7);

}

- (_NSRange)titleRange
{
  _NSRange *p_titleRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_titleRange = &self->_titleRange;
  location = self->_titleRange.location;
  length = p_titleRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTitleRange:(_NSRange)a3
{
  self->_titleRange = a3;
}

- (_NSRange)bodyRange
{
  _NSRange *p_bodyRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_bodyRange = &self->_bodyRange;
  location = self->_bodyRange.location;
  length = p_bodyRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setBodyRange:(_NSRange)a3
{
  self->_bodyRange = a3;
}

@end
