@implementation RBPLEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

- (RBPLEvent)initWithevent:(unint64_t)a3 identity:(id)a4 assertionCount:(int)a5 pid:(int)a6
{
  id v11;
  RBPLEvent *v12;
  RBPLEvent *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RBPLEvent;
  v12 = -[RBPLEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_event = a3;
    objc_storeStrong((id *)&v12->_identity, a4);
    v13->_assertionCount = a5;
    v13->_pid = a6;
  }

  return v13;
}

- (int)pid
{
  return self->_pid;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (unint64_t)event
{
  return self->_event;
}

- (int)assertionCount
{
  return self->_assertionCount;
}

@end
