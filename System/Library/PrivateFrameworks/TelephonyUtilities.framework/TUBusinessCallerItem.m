@implementation TUBusinessCallerItem

- (TUBusinessCallerItem)initWithName:(id)a3 department:(id)a4 logoURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUBusinessCallerItem *v12;
  TUBusinessCallerItem *v13;
  NSURL *v14;
  NSURL *logoURL;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUBusinessCallerItem;
  v12 = -[TUBusinessCallerItem init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_department, a4);
    if (v11)
      v14 = (NSURL *)v11;
    else
      v14 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", CFSTR("/stock"));
    logoURL = v13->_logoURL;
    v13->_logoURL = v14;

    objc_storeStrong((id *)&v13->_name, a3);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUBusinessCallerItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUBusinessCallerItem department](self, "department");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUBusinessCallerItem logoURL](self, "logoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: name=%@, department=%@, logoURL=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUBusinessCallerItem isEqualToCallerItem:](self, "isEqualToCallerItem:", v4);

  return v5;
}

- (BOOL)isEqualToCallerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[TUBusinessCallerItem logoURL](self, "logoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUBusinessCallerItem name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUBusinessCallerItem department](self, "department");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "department");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TUBusinessCallerItem name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUBusinessCallerItem department](self, "department");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUBusinessCallerItem logoURL](self, "logoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)department
{
  return self->_department;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_department, 0);
}

@end
