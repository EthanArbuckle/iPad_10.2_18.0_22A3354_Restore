@implementation CRLWPRubyField

- (CRLWPRubyField)initWithRubyText:(id)a3
{
  id v4;
  CRLWPRubyField *v5;
  NSString *v6;
  NSString *rubyText;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWPRubyField;
  v5 = -[CRLWPRubyField init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    rubyText = v5->_rubyText;
    v5->_rubyText = v6;

  }
  return v5;
}

- (void)setRubyText:(id)a3
{
  NSString *v4;
  NSString *rubyText;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (NSString *)objc_msgSend(v7, "copy");
  rubyText = self->_rubyText;
  self->_rubyText = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartField parentStorage](self, "parentStorage"));
  objc_msgSend(v6, "smartFieldDidChange:", self);

}

- (NSString)baseText
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartField parentStorage](self, "parentStorage"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartField parentStorage](self, "parentStorage"));
    v5 = -[CRLWPSmartField range](self, "range");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v5, v6));

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (int)baseTextScript
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRubyField baseText](self, "baseText"));
  v3 = objc_msgSend(v2, "crlwp_contentsScript");

  return v3;
}

- (unsigned)smartFieldKind
{
  return 256;
}

- (unint64_t)attributeArrayKind
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
  id v5;
  uint64_t v6;

  length = a3.length;
  location = a3.location;
  v5 = -[CRLWPSmartField range](self, "range");
  return location <= (unint64_t)v5 && location + length >= (unint64_t)v5 + v6;
}

- (BOOL)supportsDeepCopyForUndo
{
  return 0;
}

- (NSString)rubyText
{
  return self->_rubyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubyText, 0);
}

@end
