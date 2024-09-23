@implementation TUConversationLinkOriginator

- (TUConversationLinkOriginator)initWithIdentifier:(id)a3 revision:(int64_t)a4 handle:(id)a5
{
  id v8;
  id v9;
  TUConversationLinkOriginator *v10;
  TUConversationLinkOriginator *v11;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUConversationLinkOriginator;
  v10 = -[TUConversationLinkOriginator init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_handle, a5);
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_revision = a4;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  TUHandle *handle;
  id v5;
  void *v6;
  NSString *identifier;
  void *v8;
  int64_t revision;
  id v10;

  handle = self->_handle;
  v5 = a3;
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", handle, v6);

  identifier = self->_identifier;
  NSStringFromSelector(sel_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v8);

  revision = self->_revision;
  NSStringFromSelector(sel_revision);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", revision, v10);

}

- (TUConversationLinkOriginator)initWithCoder:(id)a3
{
  id v4;
  TUConversationLinkOriginator *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TUHandle *handle;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUConversationLinkOriginator;
  v5 = -[TUConversationLinkOriginator init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    NSStringFromSelector(sel_revision);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_revision = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:revision:handle:", self->_identifier, self->_revision, self->_handle);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkOriginator identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_revision);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v6, -[TUConversationLinkOriginator revision](self, "revision"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_handle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationLinkOriginator handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v7, v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[TUConversationLinkOriginator handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationLinkOriginator identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[TUConversationLinkOriginator revision](self, "revision");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationLinkOriginator *v4;
  BOOL v5;

  v4 = (TUConversationLinkOriginator *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationLinkOriginator isEqualToConversationLinkOriginator:](self, "isEqualToConversationLinkOriginator:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConversationLinkOriginator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = a3;
  -[TUConversationLinkOriginator handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUConversationLinkOriginator identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = -[TUConversationLinkOriginator revision](self, "revision");
      v10 = v9 == objc_msgSend(v4, "revision");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
