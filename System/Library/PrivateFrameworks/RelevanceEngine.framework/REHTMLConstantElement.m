@implementation REHTMLConstantElement

- (REHTMLConstantElement)initWithContent:(id)a3
{
  id v4;
  REHTMLConstantElement *v5;
  uint64_t v6;
  NSString *content;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REHTMLConstantElement;
  v5 = -[REHTMLElement init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    content = v5->_content;
    v5->_content = (NSString *)v6;

  }
  return v5;
}

- (id)_contentString
{
  return self->_content;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLConstantElement;
  v4 = -[REHTMLElement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_content);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
