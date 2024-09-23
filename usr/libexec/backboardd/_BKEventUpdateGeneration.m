@implementation _BKEventUpdateGeneration

- (_BKEventUpdateGeneration)init
{
  _BKEventUpdateGeneration *v2;
  NSMutableArray *v3;
  NSMutableArray *clients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BKEventUpdateGeneration;
  v2 = -[_BKEventUpdateGeneration init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v3;

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v5;
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100037C0C;
  v6[3] = &unk_1000ECD80;
  v6[4] = a3;
  v6[5] = self;
  objc_msgSend(a3, "appendProem:block:", 0, v6);
  v5 = objc_msgSend(a3, "appendObject:withName:", self->_clients, CFSTR("clients"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
