@implementation TUIHostingIdentifier

- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4
{
  return -[TUIHostingIdentifier initWithType:identifier:parameters:modelIdentifier:](self, "initWithType:identifier:parameters:modelIdentifier:", a3, a4, 0, 0);
}

- (TUIHostingIdentifier)initWithType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUIHostingIdentifier *v15;
  TUIHostingIdentifier *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUIHostingIdentifier;
  v15 = -[TUIHostingIdentifier init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    objc_storeStrong((id *)&v16->_parameters, a5);
    objc_storeStrong((id *)&v16->_modelIdentifier, a6);
  }

  return v16;
}

- (TUIHostingIdentifier)identifierWithoutModelIdentifier
{
  TUIHostingIdentifier *v2;

  if (self->_modelIdentifier)
    v2 = -[TUIHostingIdentifier initWithType:identifier:parameters:modelIdentifier:]([TUIHostingIdentifier alloc], "initWithType:identifier:parameters:modelIdentifier:", self->_type, self->_identifier, self->_parameters, 0);
  else
    v2 = self;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  _QWORD *v9;
  NSString *type;
  NSString *identifier;
  NSObject *parameters;
  TUIIdentifier *modelIdentifier;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(TUIHostingIdentifier, v7))
  {
    v9 = v4;
    type = self->_type;
    if ((type == (NSString *)v9[1] || -[NSString isEqualToString:](type, "isEqualToString:"))
      && ((identifier = self->_identifier, identifier == (NSString *)v9[2])
       || -[NSString isEqualToString:](identifier, "isEqualToString:"))
      && ((parameters = self->_parameters, parameters == v9[4])
       || -[NSObject isEqual:](parameters, "isEqual:")))
    {
      modelIdentifier = self->_modelIdentifier;
      if (modelIdentifier == (TUIIdentifier *)v9[3])
        v8 = 1;
      else
        v8 = -[TUIIdentifier isEqual:](modelIdentifier, "isEqual:");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToType:(id)a3 identifier:(id)a4 parameters:(id)a5 modelIdentifier:(id)a6
{
  NSString *v10;
  NSString *v11;
  NSObject *v12;
  TUIIdentifier *v13;
  NSString *type;
  NSString *identifier;
  NSObject *parameters;
  TUIIdentifier *modelIdentifier;
  unsigned __int8 v18;

  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  v12 = a5;
  v13 = (TUIIdentifier *)a6;
  type = self->_type;
  if ((type == v10 || -[NSString isEqualToString:](type, "isEqualToString:", v10))
    && ((identifier = self->_identifier, identifier == v11)
     || -[NSString isEqualToString:](identifier, "isEqualToString:", v11))
    && ((parameters = self->_parameters, parameters == v12)
     || -[NSObject isEqual:](parameters, "isEqual:", v12)))
  {
    modelIdentifier = self->_modelIdentifier;
    if (modelIdentifier == v13)
      v18 = 1;
    else
      v18 = -[TUIIdentifier isEqual:](modelIdentifier, "isEqual:", v13);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_type, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *type;
  NSString *identifier;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  type = self->_type;
  identifier = self->_identifier;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifier tui_identifierToString](self->_modelIdentifier, "tui_identifierToString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ type='%@' identifier='%@' modelIdentifier='%@'>"), v5, type, identifier, v8));

  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TUIIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
