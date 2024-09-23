@implementation TUICursorAccessory

- (TUICursorAccessory)init
{
  return -[TUICursorAccessory initWithIdentifier:actionHandler:](self, "initWithIdentifier:actionHandler:", 0, 0);
}

- (TUICursorAccessory)initWithIdentifier:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  TUICursorAccessory *v8;
  uint64_t v9;
  void *identifier;
  void *v11;
  uint64_t v12;
  NSString *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUICursorAccessory;
  v8 = -[TUICursorAccessory init](&v15, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v9;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.action.cursoraccessory.%@"), identifier);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v8->_identifier;
      v8->_identifier = (NSString *)v12;

    }
    -[TUICursorAccessory setActionHandler:](v8, "setActionHandler:", v7);
  }

  return v8;
}

- (TUICursorAccessory)initWithCoder:(id)a3
{
  id v4;
  TUICursorAccessory *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUICursorAccessory;
  v5 = -[TUICursorAccessory init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TUIndentifierCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUICursorAccessory identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("TUIndentifierCodingKey"));

}

- (BOOL)isEqual:(id)a3
{
  TUICursorAccessory *v4;
  TUICursorAccessory *v5;
  BOOL v6;

  v4 = (TUICursorAccessory *)a3;
  v5 = v4;
  if (v4)
    v6 = self == v4 || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4->_identifier);
  else
    v6 = 0;

  return v6;
}

- (id)additionalComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[TUICursorAccessory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("identifier = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[TUICursorAccessory actionHandler](self, "actionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[TUICursorAccessory actionHandler](self, "actionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _Block_copy(v9);
    objc_msgSend(v8, "stringWithFormat:", CFSTR("actionHandler = %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUICursorAccessory;
  -[TUICursorAccessory description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICursorAccessory additionalComponents](self, "additionalComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TUICursorAccessory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
