@implementation SERequest

+ (id)newSERequestWithReason:(id)a3 callback:(id)a4
{
  NSString *v5;
  id v6;
  SERequest *v7;
  NSString *reason;
  NSString *v9;
  id v10;
  id callback;

  v5 = (NSString *)a3;
  v6 = a4;
  v7 = objc_opt_new(SERequest);
  reason = v7->_reason;
  v7->_reason = v5;
  v9 = v5;

  v10 = objc_msgSend(v6, "copy");
  callback = v7->_callback;
  v7->_callback = v10;

  return v7;
}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
