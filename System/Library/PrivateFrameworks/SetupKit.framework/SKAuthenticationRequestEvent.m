@implementation SKAuthenticationRequestEvent

- (SKAuthenticationRequestEvent)initWithPasswordType:(int)a3 pairingFlags:(unsigned int)a4 throttleSeconds:(int)a5
{
  SKAuthenticationRequestEvent *v8;
  SKAuthenticationRequestEvent *v9;
  SKAuthenticationRequestEvent *v10;

  v8 = -[SKEvent initWithEventType:](self, "initWithEventType:", 120);
  v9 = v8;
  if (v8)
  {
    v8->_passwordType = a3;
    v8->_pairingFlags = a4;
    v8->_throttleSeconds = a5;
    v10 = v8;
  }

  return v9;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v11;
  void *v12;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = 0;

  }
  CUAppendF();
  v5 = (__CFString *)v4;

  if (self->_pairingFlags)
  {
    CUPrintFlags32();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v6 = v5;

    v5 = v6;
  }
  if (self->_throttleSeconds >= 1)
  {
    CUAppendF();
    v7 = v5;

    v5 = v7;
  }
  v8 = &stru_24D22B2A0;
  if (v5)
    v8 = v5;
  v9 = v8;

  return v9;
}

- (unsigned)pairingFlags
{
  return self->_pairingFlags;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (int)throttleSeconds
{
  return self->_throttleSeconds;
}

@end
