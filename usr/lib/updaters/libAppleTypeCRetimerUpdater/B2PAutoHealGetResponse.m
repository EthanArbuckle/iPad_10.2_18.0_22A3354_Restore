@implementation B2PAutoHealGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    self->_enable = *v6;
    self->_persistent = v6[1];
  }

  return v5 > 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v10.receiver = self;
  v10.super_class = (Class)B2PAutoHealGetResponse;
  -[B2PResponse description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_enable)
    v6 = "yes";
  else
    v6 = "no";
  objc_msgSend(v5, "appendFormat:", CFSTR("\tEnable: %s\n"), v6);
  if (self->_persistent)
    v7 = "yes";
  else
    v7 = "no";
  objc_msgSend(v5, "appendFormat:", CFSTR("\tPersistent: %s\n"), v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)enable
{
  return self->_enable;
}

- (unsigned)persistent
{
  return self->_persistent;
}

@end
