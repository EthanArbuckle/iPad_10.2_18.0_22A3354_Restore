@implementation OCFont

- (OCFont)initWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  id v9;
  OCFont *v10;
  OCFont *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OCFont;
  v10 = -[OCFont init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subfamily, a3);
    v11->_bold = a4;
    v11->_italic = a5;
  }

  return v11;
}

+ (id)fontWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  OCFont *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[OCFont initWithSubfamily:bold:italic:]([OCFont alloc], "initWithSubfamily:bold:italic:", v7, v6, v5);

  return v8;
}

- (OCFontSubfamily)subfamily
{
  return self->_subfamily;
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (BOOL)italic
{
  return self->_italic;
}

- (void)setItalic:(BOOL)a3
{
  self->_italic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfamily, 0);
}

@end
