@implementation _UITitleContent

- (double)width
{
  return self->_width;
}

- (NSString)title
{
  NSAttributedString *attributedText;
  __CFString *v3;

  attributedText = self->_attributedText;
  if (attributedText)
  {
    -[NSAttributedString string](attributedText, "string");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E16EDF20;
  }
  return (NSString *)v3;
}

+ (id)contentWithTitle:(id)a3 attributes:(id)a4 button:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  if (objc_msgSend(v8, "length"))
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v9);
    v13 = (void *)v11[1];
    v11[1] = v12;
  }
  else
  {
    v13 = (void *)v11[1];
    v11[1] = 0;
  }

  objc_msgSend(v11, "updateWithButton:", v10);
  return v11;
}

- (void)updateWithButton:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (self->_attributedText)
  {
    v4 = a3;
    objc_msgSend(v4, "contentEdgeInsets");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "_visualProvider");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_intrinsicWidthForAttributedTitle:", self->_attributedText);
    self->_width = v9 - v6 - v8;

  }
  else
  {
    self->_width = 0.0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
}

- (void)updateWithTitleAttributes:(id)a3 button:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *attributedText;
  id v12;

  v12 = a4;
  if (self->_attributedText)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3498];
    v7 = a3;
    v8 = [v6 alloc];
    -[NSAttributedString string](self->_attributedText, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v9, v7);

    attributedText = self->_attributedText;
    self->_attributedText = v10;

  }
  -[_UITitleContent updateWithButton:](self, "updateWithButton:", v12);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSAttributedString *attributedText;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_UITitleContent;
  -[_UITitleContent description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  attributedText = self->_attributedText;
  if (!attributedText)
    attributedText = (NSAttributedString *)&stru_1E16EDF20;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@' (%f)"), v4, attributedText, *(_QWORD *)&self->_width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
