@implementation ACCComponents

+ (id)components
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACCComponents;
  return objc_msgSendSuper2(&v3, sel_components);
}

- (void)dealloc
{
  objc_super v3;

  -[ACCComponents setTgtStoragePolicy:](self, "setTgtStoragePolicy:", 0);
  -[ACCComponents setTicketManager:](self, "setTicketManager:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACCComponents;
  -[ACFComponents dealloc](&v3, sel_dealloc);
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  return (id)-[objc_class handlerWithContext:](a3, "handlerWithContext:", a4);
}

- (ACCSSOTGTStoragePolicy)tgtStoragePolicy
{
  return self->_tgtStoragePolicy;
}

- (void)setTgtStoragePolicy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (ACCTicketManagerProtocol)ticketManager
{
  return self->_ticketManager;
}

- (void)setTicketManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
