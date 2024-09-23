@implementation _SCRCStackQueueEnumerator

- (_SCRCStackQueueEnumerator)initWithListMember:(id)a3
{
  id v5;
  _SCRCStackQueueEnumerator *v6;
  _SCRCStackQueueEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SCRCStackQueueEnumerator;
  v6 = -[_SCRCStackQueueEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentListMemeber, a3);

  return v7;
}

- (id)nextObject
{
  _SCRCStackNode *currentListMemeber;
  void *v4;
  _SCRCStackNode *v5;
  _SCRCStackNode *v6;

  currentListMemeber = self->_currentListMemeber;
  if (currentListMemeber)
  {
    -[_SCRCStackNode object](currentListMemeber, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SCRCStackNode next](self->_currentListMemeber, "next");
    v5 = (_SCRCStackNode *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentListMemeber;
    self->_currentListMemeber = v5;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListMemeber, 0);
}

@end
