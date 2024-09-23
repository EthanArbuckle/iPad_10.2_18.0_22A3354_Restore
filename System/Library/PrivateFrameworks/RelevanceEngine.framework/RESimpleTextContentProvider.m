@implementation RESimpleTextContentProvider

+ (id)textContentProviderWithText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:", v4);

  return v5;
}

- (RESimpleTextContentProvider)initWithText:(id)a3
{
  id v4;
  RESimpleTextContentProvider *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RESimpleTextContentProvider;
  v5 = -[RESimpleTextContentProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v6;

  }
  return v5;
}

- (id)attributedStringRepresentation
{
  id v3;
  NSString *text;

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  if (self->_text)
    text = self->_text;
  else
    text = (NSString *)&stru_24CF92178;
  return (id)objc_msgSend(v3, "initWithString:", text);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithText:", self->_text);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_text, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "text");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == self->_text)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)clockKitTextProviderRepresentation
{
  return (id)objc_msgSend(getCLKSimpleTextProviderClass(), "textProviderWithText:", self->_text);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("text"));
}

- (RESimpleTextContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  RESimpleTextContentProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[RESimpleTextContentProvider initWithText:](self, "initWithText:", v5);
  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

- (id)contentEncodedString
{
  void *v2;
  void *v3;

  -[RESimpleTextContentProvider text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEncodedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
