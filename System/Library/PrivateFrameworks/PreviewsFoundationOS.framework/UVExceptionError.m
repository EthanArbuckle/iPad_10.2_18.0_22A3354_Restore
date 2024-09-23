@implementation UVExceptionError

- (UVExceptionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  UVExceptionError *v14;

  v8 = (objc_class *)MEMORY[0x24BDBCE88];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UVExceptionError instantiated for domain %@ with code %zd."), v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithName:reason:userInfo:", CFSTR("No exception specified"), v12, v9);
  v14 = -[UVExceptionError initWithException:](self, "initWithException:", v13);

  return v14;
}

- (UVExceptionError)initWithException:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UVExceptionError *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BDD0FD8];
  objc_msgSend(v5, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)UVExceptionError;
  v9 = -[UVExceptionError initWithDomain:code:userInfo:](&v11, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.PreviewsFoundation.ExceptionError"), 0, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_exception, a3);

  return v9;
}

- (NSException)exception
{
  return self->_exception;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exception, 0);
}

@end
