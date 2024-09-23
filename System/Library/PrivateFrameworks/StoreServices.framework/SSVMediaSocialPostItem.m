@implementation SSVMediaSocialPostItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setType:", self->_type);
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SSVMediaSocialPostItem;
  -[SSVMediaSocialPostItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [ID: %@, Type: %@]"), v4, self->_identifier, self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SSVMediaSocialPostItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SSVMediaSocialPostItem)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVMediaSocialPostItem *v6;
  CFArrayRef v8;
  NSString *identifier;
  CFArrayRef v10;
  NSString *type;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVMediaSocialPostItem;
    v6 = -[SSVMediaSocialPostItem init](&v12, sel_init);
    if (v6)
    {
      v8 = SSXPCDictionaryCopyCFObject(v5, "0");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      v10 = SSXPCDictionaryCopyCFObject(v5, "1");
      type = v6->_type;
      v6->_type = (NSString *)v10;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_identifier);
  SSXPCDictionarySetObject(v3, "1", self->_type);
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
