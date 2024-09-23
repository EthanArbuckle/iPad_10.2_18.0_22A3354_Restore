@implementation WBSHistoryServiceURLRepresentation

- (WBSHistoryServiceURLRepresentation)init
{

  return 0;
}

- (WBSHistoryServiceURLRepresentation)initWithURLString:(id)a3
{
  id v4;
  WBSHistoryServiceURLRepresentation *v5;
  uint64_t v6;
  NSString *urlString;
  WBSHistoryServiceURLRepresentation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v5 = -[WBSHistoryServiceURLRepresentation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceURLRepresentation)initWithURLHash:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  WBSHistoryServiceURLRepresentation *v8;
  uint64_t v9;
  NSData *urlHash;
  uint64_t v11;
  NSData *urlSalt;
  WBSHistoryServiceURLRepresentation *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v8 = -[WBSHistoryServiceURLRepresentation init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    urlHash = v8->_urlHash;
    v8->_urlHash = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    urlSalt = v8->_urlSalt;
    v8->_urlSalt = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryServiceURLRepresentation)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryServiceURLRepresentation *v5;
  uint64_t v6;
  NSString *urlString;
  uint64_t v8;
  NSData *urlHash;
  uint64_t v10;
  NSData *urlSalt;
  WBSHistoryServiceURLRepresentation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceURLRepresentation;
  v5 = -[WBSHistoryServiceURLRepresentation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    urlHash = v5->_urlHash;
    v5->_urlHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlSalt"));
    v10 = objc_claimAutoreleasedReturnValue();
    urlSalt = v5->_urlSalt;
    v5->_urlSalt = (NSData *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *urlString;
  id v5;

  urlString = self->_urlString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urlString, CFSTR("urlString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlHash, CFSTR("urlHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlSalt, CFSTR("urlSalt"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSString *urlString;
  void *v5;

  urlString = self->_urlString;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (urlString)
    return (id)objc_msgSend(v5, "initWithURLString:", self->_urlString);
  else
    return (id)objc_msgSend(v5, "initWithURLHash:salt:", self->_urlHash, self->_urlSalt);
}

- (id)description
{
  NSString *urlString;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  urlString = self->_urlString;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (urlString)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; urlString = \"%@\">"), v6, self, self->_urlString, v10);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; urlHash = \"%@\"; urlSalt = \"%@\">"),
      v6,
      self,
      self->_urlHash,
      self->_urlSalt);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  NSString *urlString;
  uint64_t v5;

  urlString = self->_urlString;
  if (urlString)
    return -[NSString hash](urlString, "hash");
  v5 = -[NSData hash](self->_urlSalt, "hash");
  return -[NSData hash](self->_urlHash, "hash") ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  WBSHistoryServiceURLRepresentation *v4;
  WBSHistoryServiceURLRepresentation *v5;
  NSData *urlString;
  NSData *urlSalt;
  char v8;

  v4 = (WBSHistoryServiceURLRepresentation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      urlString = (NSData *)self->_urlString;
      if (!urlString || (urlSalt = (NSData *)v5->_urlString) == 0)
      {
        if (!-[NSData isEqual:](self->_urlHash, "isEqual:", v5->_urlHash))
        {
          v8 = 0;
          goto LABEL_11;
        }
        urlString = self->_urlSalt;
        urlSalt = v5->_urlSalt;
      }
      v8 = -[NSData isEqual:](urlString, "isEqual:", urlSalt);
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSData)urlHash
{
  return self->_urlHash;
}

- (NSData)urlSalt
{
  return self->_urlSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
