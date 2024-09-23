@implementation TSWPRubyField

- (TSWPRubyField)initWithContext:(id)a3 rubyText:(id)a4
{
  TSWPRubyField *v5;
  TSWPRubyField *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPRubyField;
  v5 = -[TSWPSmartField initWithContext:](&v8, sel_initWithContext_, a3);
  v6 = v5;
  if (v5)
    -[TSWPRubyField setRubyText:](v5, "setRubyText:", a4);
  return v6;
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPRubyField zone](self, "zone")), "initWithContext:rubyText:", a3, -[TSWPRubyField rubyText](self, "rubyText"));
}

- (void)dealloc
{
  objc_super v3;

  self->_rubyText = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPRubyField;
  -[TSWPSmartField dealloc](&v3, sel_dealloc);
}

- (void)setRubyText:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->_rubyText = v5;
  -[TSWPStorage smartFieldDidChange:](-[TSWPSmartField parentStorage](self, "parentStorage"), "smartFieldDidChange:", self);
}

- (NSString)baseText
{
  NSString *result;
  TSWPStorage *v4;
  uint64_t v5;
  uint64_t v6;

  result = -[TSWPSmartField parentStorage](self, "parentStorage");
  if (result)
  {
    v4 = -[TSWPSmartField parentStorage](self, "parentStorage");
    v5 = -[TSWPSmartField range](self, "range");
    return (NSString *)-[TSWPStorage substringWithRange:](v4, "substringWithRange:", v5, v6);
  }
  return result;
}

- (int)baseTextScript
{
  return -[NSString contentsScript](-[TSWPRubyField baseText](self, "baseText"), "contentsScript");
}

- (int)elementKind
{
  return 4096;
}

- (unsigned)attributeArrayKind
{
  return 7;
}

- (int)styleAttributeArrayKind
{
  return 7;
}

- (BOOL)allowsEditing
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v5;
  uint64_t v6;

  length = a3.length;
  location = a3.location;
  v5 = -[TSWPSmartField range](self, "range");
  return location <= v5 && location + length >= v5 + v6;
}

- (NSString)rubyText
{
  return self->_rubyText;
}

@end
