@implementation PKSharingURLMessage

- (PKSharingURLMessage)initWithURL:(id)a3
{
  void *v4;
  void *v5;
  PKSharingURLMessage *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = CFSTR("url");
    objc_msgSend(a3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8.receiver = self;
    v8.super_class = (Class)PKSharingURLMessage;
    self = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:](&v8, sel_initWithFormat_type_genericSharingDict_appleSharingDict_, 3, 1003, MEMORY[0x1E0C9AA70], v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *url;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSharingURLMessage;
  if (-[PKSharingGenericMessage configureWithContent:](&v10, sel_configureWithContent_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKURLForKey:", CFSTR("url"));
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v6;

    v8 = self->_url != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("url: '%@'; "), self->_url);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingURLMessage *v4;
  PKSharingURLMessage *v5;
  PKSharingURLMessage *v6;
  NSURL *url;
  NSURL *v8;
  BOOL v9;
  objc_super v11;

  v4 = (PKSharingURLMessage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKSharingURLMessage;
      if (-[PKSharingGenericMessage isEqual:](&v11, sel_isEqual_, v6))
      {
        url = self->_url;
        v8 = v6->_url;
        if (url)
          v9 = v8 == 0;
        else
          v9 = 1;
        if (v9)
          LOBYTE(self) = url == v8;
        else
          LOBYTE(self) = -[NSURL isEqual:](url, "isEqual:");
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
