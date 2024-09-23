@implementation SVXSessionIdleAssertion

- (SVXSessionIdleAssertion)initWithTimestamp:(unint64_t)a3 session:(id)a4
{
  id v7;
  SVXSessionIdleAssertion *v8;
  SVXSessionIdleAssertion *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SVXSessionIdleAssertion;
  v8 = -[SVXSessionIdleAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    objc_storeStrong((id *)&v8->_session, a4);
  }

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXSessionIdleAssertion;
  -[SVXSessionIdleAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {timestamp = %llu, session = %@}"), v4, self->_timestamp, self->_session);

  return v5;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SVXSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
