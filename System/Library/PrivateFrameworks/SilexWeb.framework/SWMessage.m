@implementation SWMessage

- (SWMessage)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  SWMessage *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SWMessage;
    v7 = -[SWMessage init](&v9, sel_init);
    self = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_name, v6);
      objc_storeStrong((id *)&self->_body, a3);
    }
  }

  return self;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
