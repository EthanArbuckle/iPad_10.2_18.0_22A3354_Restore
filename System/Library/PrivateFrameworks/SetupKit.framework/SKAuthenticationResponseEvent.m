@implementation SKAuthenticationResponseEvent

- (SKAuthenticationResponseEvent)initWithPassword:(id)a3
{
  id v4;
  SKAuthenticationResponseEvent *v5;
  uint64_t v6;
  NSString *password;
  SKAuthenticationResponseEvent *v8;

  v4 = a3;
  v5 = -[SKEvent initWithEventType:](self, "initWithEventType:", 130);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    password = v5->_password;
    v5->_password = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v8;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v3 = 0;

  }
  CUAppendF();
  v4 = (__CFString *)v3;

  v5 = &stru_24D22B2A0;
  if (v4)
    v5 = v4;
  v6 = v5;

  return v6;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
}

@end
