@implementation SHSheetScrollingTest

- (SHSheetScrollingTest)initWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  SHSheetScrollingTest *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SHSheetScrollingTest;
  v10 = -[SHSheetScrollingTest init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_type = a4;
    v13 = objc_msgSend(v9, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v13;

  }
  return v10;
}

- (SHSheetScrollingTest)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SHSheetScrollingTest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));

  v7 = -[SHSheetScrollingTest initWithName:type:completionHandler:](self, "initWithName:type:completionHandler:", v5, v6, 0);
  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SHSheetScrollingTest name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("name"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[SHSheetScrollingTest type](self, "type"), CFSTR("type"));
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
