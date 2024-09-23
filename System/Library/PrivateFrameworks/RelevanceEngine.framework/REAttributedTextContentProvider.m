@implementation REAttributedTextContentProvider

+ (id)textContentProviderWithAttributedText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributedText:", v4);

  return v5;
}

- (REAttributedTextContentProvider)initWithAttributedText:(id)a3
{
  id v4;
  REAttributedTextContentProvider *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAttributedTextContentProvider;
  v5 = -[REAttributedTextContentProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (!v6)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24CF92178);
    objc_storeStrong((id *)&v5->_text, v7);
    if (!v6)

  }
  return v5;
}

- (id)attributedStringRepresentation
{
  return self->_text;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAttributedText:", self->_text);
}

- (unint64_t)hash
{
  return -[NSAttributedString hash](self->_text, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSAttributedString *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "text");
    v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v6 == self->_text)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToAttributedString:", self->_text);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)clockKitTextProviderRepresentation
{
  void *v2;
  void *v3;

  -[NSAttributedString string](self->_text, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCLKSimpleTextProviderClass(), "textProviderWithText:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("text"));
}

- (REAttributedTextContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REAttributedTextContentProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REAttributedTextContentProvider initWithAttributedText:](self, "initWithAttributedText:", v5);
  return v6;
}

- (NSAttributedString)text
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

  -[REAttributedTextContentProvider text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEncodedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
