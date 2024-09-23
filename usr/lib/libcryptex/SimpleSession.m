@implementation SimpleSession

- (SimpleSession)initWithFlags:(unint64_t)a3
{
  SimpleSession *v3;
  uint64_t v4;
  OS_session *session;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SimpleSession;
  v3 = -[SimpleSession init](&v7, sel_init);
  v4 = session_create();
  session = v3->_session;
  v3->_session = (OS_session *)v4;

  return v3;
}

- (SimpleSession)initWithSessionCore:(id)a3
{
  id v3;
  SimpleSession *v4;
  uint64_t v5;
  OS_session *session;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SimpleSession;
  v3 = a3;
  v4 = -[SimpleSession init](&v8, sel_init);
  v5 = session_create_from_core((uint64_t)v3);

  session = v4->_session;
  v4->_session = (OS_session *)v5;

  return v4;
}

- (void)dealloc
{
  OS_session *session;
  objc_super v4;

  session = self->_session;
  self->_session = 0;

  v4.receiver = self;
  v4.super_class = (Class)SimpleSession;
  -[SimpleSession dealloc](&v4, sel_dealloc);
}

- (OS_session)session
{
  return (OS_session *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
