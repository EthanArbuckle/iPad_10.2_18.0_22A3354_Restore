@implementation SKAuthenticationPresentEvent

- (SKAuthenticationPresentEvent)initWithPasswordType:(int)a3 password:(id)a4
{
  id v6;
  SKAuthenticationPresentEvent *v7;
  uint64_t v8;
  NSString *password;
  SKAuthenticationPresentEvent *v10;

  v6 = a4;
  v7 = -[SKEvent initWithEventType:](self, "initWithEventType:", 110);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    password = v7->_password;
    v7->_password = (NSString *)v8;

    v7->_passwordType = a3;
    v10 = v7;
  }

  return v7;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = 0;

  }
  if (self->_passwordType)
  {
    CUAppendF();
    v5 = v4;

    v4 = v5;
  }
  CUAppendF();
  v6 = (__CFString *)v4;

  v7 = &stru_24D22B2A0;
  if (v6)
    v7 = v6;
  v8 = v7;

  return v8;
}

- (NSString)password
{
  return self->_password;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
}

@end
