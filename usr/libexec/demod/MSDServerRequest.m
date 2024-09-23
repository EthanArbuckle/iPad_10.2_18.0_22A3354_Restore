@implementation MSDServerRequest

- (BOOL)isValid
{
  return 1;
}

- (NSString)getName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDServerResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[MSDServerRequest getResponseClass](self, "getResponseClass");
  v10 = (void *)objc_opt_new(v8, v9);
  if (v6)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C9DB4(self, (uint64_t)v6, v12);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("data")));
    objc_msgSend(v10, "setData:", v13);

  }
  objc_msgSend(v10, "setError:", v6);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSavePath:", self->_savePath);
  objc_msgSend(v4, "setCompletion:", self->_completion);
  return v4;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSavePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_savePath, 0);
}

@end
