@implementation SXDocumentLayout

- (int64_t)margin
{
  return self->_margin;
}

- (int64_t)width
{
  return self->_width;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (int64_t)gutter
{
  return self->_gutter;
}

- (SXDocumentLayout)initWithWidth:(int64_t)a3 margin:(int64_t)a4 gutter:(int64_t)a5 columns:(unint64_t)a6
{
  SXDocumentLayout *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXDocumentLayout;
  result = -[SXDocumentLayout init](&v11, sel_init);
  if (result)
  {
    result->_width = a3;
    result->_margin = a4;
    result->_gutter = a5;
    result->_columns = a6;
  }
  return result;
}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; width: %li"), -[SXDocumentLayout width](self, "width"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; margin: %li"), -[SXDocumentLayout margin](self, "margin"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; gutter: %li"), -[SXDocumentLayout gutter](self, "gutter"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; columns: %li"), -[SXDocumentLayout columns](self, "columns"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

@end
