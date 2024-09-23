@implementation SKEvent

- (SKEvent)initWithEventType:(int)a3
{
  SKEvent *v4;
  SKEvent *v5;
  SKEvent *v6;

  v4 = -[SKEvent init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (SKEvent)initWithEventType:(int)a3 error:(id)a4
{
  id v7;
  SKEvent *v8;
  SKEvent *v9;
  SKEvent *v10;

  v7 = a4;
  v8 = -[SKEvent init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v9->_eventType = a3;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return -[SKEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  __CFString *v6;
  NSError *error;
  NSError *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v13;
  void *v14;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = (__CFString *)0;

  }
  if (self->_eventType)
  {
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  error = self->_error;
  if (error)
  {
    v8 = error;
    CUPrintNSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v9 = v4;

    v4 = v9;
  }
  v10 = &stru_24D22B2A0;
  if (v4)
    v10 = v4;
  v11 = v10;

  return v11;
}

- (NSError)error
{
  return self->_error;
}

- (int)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
