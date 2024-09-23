@implementation _STKClass0SMSResponseProvider

- (_STKClass0SMSResponseProvider)initWithLogger:(id)a3
{
  id v5;
  _STKClass0SMSResponseProvider *v6;
  _STKClass0SMSResponseProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_STKClass0SMSResponseProvider;
  v6 = -[_STKClass0SMSResponseProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logger, a3);

  return v7;
}

- (BOOL)hasSentResponse
{
  return 0;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
