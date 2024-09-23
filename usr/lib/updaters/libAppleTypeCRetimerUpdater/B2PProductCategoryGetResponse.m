@implementation B2PProductCategoryGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
    self->_category = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");

  return v5 != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v8.receiver = self;
  v8.super_class = (Class)B2PProductCategoryGetResponse;
  -[B2PResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status"))
    objc_msgSend(v5, "appendFormat:", CFSTR("\tCategory: %s\n"), stringForB2PProductCategory(self->_category));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)category
{
  return self->_category;
}

@end
