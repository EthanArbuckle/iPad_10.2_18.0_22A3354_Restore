@implementation HVHtmlParserHyperlink

- (HVHtmlParserHyperlink)initWithURL:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  HVHtmlParserHyperlink *v9;
  HVHtmlParserHyperlink *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HVHtmlParserHyperlink;
  v9 = -[HVHtmlParserHyperlink init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v10->_range.location = location;
    v10->_range.length = length;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HVHtmlParserHyperlink *v4;
  HVHtmlParserHyperlink *v5;
  BOOL v6;

  v4 = (HVHtmlParserHyperlink *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[HVHtmlParserHyperlink isEqualToHtmlParserHyperlink:](self, "isEqualToHtmlParserHyperlink:", v5);

  return v6;
}

- (BOOL)isEqualToHtmlParserHyperlink:(id)a3
{
  id *v4;
  NSURL *url;
  NSURL *v6;
  NSURL *v7;
  NSURL *v8;
  char v9;
  BOOL v10;

  v4 = (id *)a3;
  url = self->_url;
  v6 = (NSURL *)v4[1];
  if (url == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = url;
    v9 = -[NSURL isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_11;
    }
  }
  v10 = (id)self->_range.location == v4[2] && self->_range.length == (_QWORD)v4[3];
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSURL hash](self->_url, "hash");
  v4 = self->_range.location - v3 + 32 * v3;
  return self->_range.length - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  NSURL *url;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  NSStringFromRange(self->_range);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@>"), v5, url, v7);

  return v8;
}

- (NSURL)url
{
  return self->_url;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
