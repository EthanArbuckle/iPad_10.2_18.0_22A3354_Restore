@implementation VSJSError

- (VSJSError)init
{
  void *v3;
  VSJSError *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)VSJSError;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15.receiver = self;
  v15.super_class = (Class)VSJSError;
  -[VSJSError description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VSJSError code](self, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("code"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[VSJSError message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("message"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)error
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[VSJSError message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = *MEMORY[0x24BDD0FC8];
    v5 = (void *)objc_msgSend(v3, "copy");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDF8E60], -[VSJSError code](self, "code"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
