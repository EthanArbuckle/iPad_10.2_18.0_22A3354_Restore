@implementation CPXIDSForwardingProxy

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[CPXIDSForwardingProxy serverPort](self, "serverPort");
  return -[CPXIDSForwardingProxy targetPort](self, "targetPort") | (unint64_t)(v3 << 16);
}

- (BOOL)isEqual:(id)a3
{
  CPXIDSForwardingProxy *v4;
  CPXIDSForwardingProxy *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (CPXIDSForwardingProxy *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[CPXIDSForwardingProxy isEqualToCPXIDSproxy:](self, "isEqualToCPXIDSproxy:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToCPXIDSproxy:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;

  v4 = a3;
  v5 = -[CPXIDSForwardingProxy serverPort](self, "serverPort");
  if (v5 == objc_msgSend(v4, "serverPort"))
  {
    v6 = -[CPXIDSForwardingProxy targetPort](self, "targetPort");
    v7 = v6 == objc_msgSend(v4, "targetPort");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CPXIDSForwardingProxy)initWithServerPort:(unsigned __int16)a3 targetingPort:(unsigned __int16)a4
{
  CPXIDSForwardingProxy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPXIDSForwardingProxy;
  result = -[CPXIDSForwardingProxy init](&v7, "init");
  if (result)
  {
    result->_serverPort = a3;
    result->_targetPort = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CPXIDSForwardingProxy initWithServerPort:targetingPort:]([CPXIDSForwardingProxy alloc], "initWithServerPort:targetingPort:", -[CPXIDSForwardingProxy serverPort](self, "serverPort"), -[CPXIDSForwardingProxy targetPort](self, "targetPort"));
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (unsigned)targetPort
{
  return self->_targetPort;
}

@end
