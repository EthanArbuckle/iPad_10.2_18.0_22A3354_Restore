@implementation TUIHoverIdentifier

- (TUIHoverIdentifier)initWithName:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  TUIHoverIdentifier *v9;
  TUIHoverIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIHoverIdentifier;
  v9 = -[TUIHoverIdentifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (TUIHoverIdentifier)initWithName:(id)a3
{
  id v5;
  TUIHoverIdentifier *v6;
  TUIHoverIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIHoverIdentifier;
  v6 = -[TUIHoverIdentifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  name = self->_name;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifier tui_identifierToString](self->_identifier, "tui_identifierToString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ name=%@ identifier=%@>"), v5, name, v7));

  return v8;
}

- (id)anonymousIdentifier
{
  TUIHoverIdentifier *v2;

  if (self->_identifier)
    v2 = self;
  else
    v2 = -[TUIHoverIdentifier initWithName:]([TUIHoverIdentifier alloc], "initWithName:", self->_name);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TUIHoverIdentifier *v9;
  TUIHoverIdentifier *v10;
  unsigned __int8 v11;
  BOOL v12;
  NSString *name;
  TUIIdentifier *identifier;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(TUIHoverIdentifier, v7))
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  v11 = v9 == self;
  if (v9)
    v12 = v9 == self;
  else
    v12 = 1;
  if (!v12)
  {
    name = self->_name;
    if (name == v10->_name || -[NSString isEqualToString:](name, "isEqualToString:"))
    {
      identifier = self->_identifier;
      if (identifier == v10->_identifier)
        v11 = 1;
      else
        v11 = -[TUIIdentifier isEqual:](identifier, "isEqual:");
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return (unint64_t)-[TUIIdentifier hash](self->_identifier, "hash") ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
