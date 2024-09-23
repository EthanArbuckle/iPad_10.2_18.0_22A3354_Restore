@implementation _TUIElementTextPlainBuilder

- (_TUIElementTextPlainBuilder)init
{
  _TUIElementTextPlainBuilder *v2;
  NSMutableString *v3;
  NSMutableString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TUIElementTextPlainBuilder;
  v2 = -[_TUIElementTextPlainBuilder init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableString);
    string = v2->_string;
    v2->_string = v3;

  }
  return v2;
}

- (NSString)text
{
  return (NSString *)-[NSMutableString copy](self->_string, "copy");
}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)appendString:(id)a3
{
  -[NSMutableString appendString:](self->_string, "appendString:", a3);
}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  if (a6)
    (*((void (**)(id))a6 + 2))(a6);
}

- (_NSRange)appendWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  _BYTE *v5;
  char *v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[NSMutableString length](self->_string, "length");
  if (v4)
    v4[2](v4);
  v6 = (char *)((_BYTE *)-[NSMutableString length](self->_string, "length") - v5);

  v7 = (NSUInteger)v5;
  v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
