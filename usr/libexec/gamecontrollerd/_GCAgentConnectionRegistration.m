@implementation _GCAgentConnectionRegistration

- (_GCAgentConnectionRegistration)initWithUserIdentifier:(unsigned int)a3
{
  _GCAgentConnectionRegistration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GCAgentConnectionRegistration;
  result = -[_GCAgentConnectionRegistration init](&v5, "init");
  if (result)
    result->_userIdentifier = a3;
  return result;
}

- (void)invalidate
{
  id connectionInterruptedRegistration;
  id connectionInvalidationRegistration;

  connectionInterruptedRegistration = self->_connectionInterruptedRegistration;
  self->_connectionInterruptedRegistration = 0;

  connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_connectionInvalidationRegistration = 0;

}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (id)connectionInvalidationRegistration
{
  return self->_connectionInvalidationRegistration;
}

- (void)setConnectionInvalidationRegistration:(id)a3
{
  objc_storeStrong(&self->_connectionInvalidationRegistration, a3);
}

- (id)connectionInterruptedRegistration
{
  return self->_connectionInterruptedRegistration;
}

- (void)setConnectionInterruptedRegistration:(id)a3
{
  objc_storeStrong(&self->_connectionInterruptedRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
}

@end
