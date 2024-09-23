@implementation ICLabel

- (void)setString:(id)a3
{
  NSString *v4;
  NSString *string;
  NSAttributedString *attributedString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  string = self->_string;
  self->_string = v4;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  -[ICLabel updateText](self, "updateText");
}

- (void)setAttributedString:(id)a3
{
  NSString *string;
  id v5;
  NSAttributedString *v6;
  NSAttributedString *attributedString;

  string = self->_string;
  self->_string = 0;
  v5 = a3;

  v6 = (NSAttributedString *)objc_msgSend(v5, "copy");
  attributedString = self->_attributedString;
  self->_attributedString = v6;

  -[ICLabel updateText](self, "updateText");
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[ICLabel updateText](self, "updateText");
  }
}

- (void)setParagraphSpacing:(double)a3
{
  if (self->_paragraphSpacing != a3)
  {
    self->_paragraphSpacing = a3;
    -[ICLabel updateText](self, "updateText");
  }
}

- (void)setLineHeight:(double)a3
{
  if (self->_lineHeight != a3)
  {
    self->_lineHeight = a3;
    -[ICLabel updateText](self, "updateText");
  }
}

- (void)updateText
{
  NSString *p_isa;
  NSAttributedString *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSAttributedString *v13;
  objc_super v14;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  p_isa = self->_string;
  v4 = self->_attributedString;
  -[ICLabel spacing](self, "spacing");
  if (v5 <= 0.0)
  {
    -[ICLabel lineHeight](self, "lineHeight");
    if (v6 <= 0.0)
    {
      -[ICLabel paragraphSpacing](self, "paragraphSpacing");
      if (v7 == 0.0)
        goto LABEL_16;
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  -[ICLabel spacing](self, "spacing");
  if (v9 > 0.0)
  {
    -[ICLabel spacing](self, "spacing");
    objc_msgSend(v8, "setLineSpacing:");
  }
  -[ICLabel paragraphSpacing](self, "paragraphSpacing");
  if (v10 != 0.0)
  {
    -[ICLabel paragraphSpacing](self, "paragraphSpacing");
    objc_msgSend(v8, "setParagraphSpacing:");
  }
  -[ICLabel lineHeight](self, "lineHeight");
  if (v11 > 0.0)
  {
    -[ICLabel lineHeight](self, "lineHeight");
    objc_msgSend(v8, "setMaximumLineHeight:");
    -[ICLabel lineHeight](self, "lineHeight");
    objc_msgSend(v8, "setMinimumLineHeight:");
  }
  objc_msgSend(v8, "setLineBreakMode:", -[ICLabel lineBreakMode](self, "lineBreakMode"));
  v16 = *MEMORY[0x1E0DC1178];
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (p_isa)
  {
    v13 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", p_isa, v12);

LABEL_14:
    v4 = v13;

    goto LABEL_15;
  }
  if (v4)
  {
    v13 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v4);
    -[NSAttributedString addAttributes:range:](v13, "addAttributes:range:", v12, 0, -[NSAttributedString length](v13, "length"));
    p_isa = (NSString *)&v4->super.isa;
    goto LABEL_14;
  }
LABEL_15:

  p_isa = 0;
LABEL_16:
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)ICLabel;
    -[ICLabel setAttributedText:](&v15, sel_setAttributedText_, v4);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICLabel;
    -[ICLabel setText:](&v14, sel_setText_, p_isa);
  }

}

- (NSString)string
{
  return self->_string;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (double)spacing
{
  return self->_spacing;
}

- (double)paragraphSpacing
{
  return self->_paragraphSpacing;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
