@implementation PKRemoteRegistrationRequest

+ (id)remoteRegistrationRequestWithProtobuf:(id)a3
{
  id v3;
  PKRemoteRegistrationRequest *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(PKRemoteRegistrationRequest);
  -[PKRemoteRegistrationRequest setRegisterBroker:](v4, "setRegisterBroker:", objc_msgSend(v3, "registerBroker"));
  v5 = objc_msgSend(v3, "registerPeerPayment");

  -[PKRemoteRegistrationRequest setRegisterPeerPayment:](v4, "setRegisterPeerPayment:", v5);
  return v4;
}

- (id)protobuf
{
  PKProtobufRemoteRegistrationRequest *v3;

  v3 = objc_alloc_init(PKProtobufRemoteRegistrationRequest);
  -[PKProtobufRemoteRegistrationRequest setRegisterBroker:](v3, "setRegisterBroker:", -[PKRemoteRegistrationRequest registerBroker](self, "registerBroker"));
  -[PKProtobufRemoteRegistrationRequest setRegisterPeerPayment:](v3, "setRegisterPeerPayment:", -[PKRemoteRegistrationRequest registerPeerPayment](self, "registerPeerPayment"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteRegistrationRequest)initWithCoder:(id)a3
{
  id v4;
  PKRemoteRegistrationRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKRemoteRegistrationRequest;
  v5 = -[PKRemoteRegistrationRequest init](&v7, sel_init);
  if (v5)
  {
    v5->_registerBroker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("registerBroker"));
    v5->_registerPeerPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("registerPeerPayment"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 registerBroker;
  id v5;

  registerBroker = self->_registerBroker;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", registerBroker, CFSTR("registerBroker"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_registerPeerPayment, CFSTR("registerPeerPayment"));

}

- (BOOL)isEqual:(id)a3
{
  PKRemoteRegistrationRequest *v4;
  PKRemoteRegistrationRequest *v5;
  BOOL v6;

  v4 = (PKRemoteRegistrationRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemoteRegistrationRequest isEqualToRemoteRegistrationRequest:](self, "isEqualToRemoteRegistrationRequest:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteRegistrationRequest:(id)a3
{
  return self->_registerBroker == *((unsigned __int8 *)a3 + 8)
      && self->_registerPeerPayment == *((unsigned __int8 *)a3 + 9);
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_registerBroker)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("registerBroker: %@; "), v5);
  if (self->_registerPeerPayment)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("registerPeerPayment: %@; "), v6);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (BOOL)registerBroker
{
  return self->_registerBroker;
}

- (void)setRegisterBroker:(BOOL)a3
{
  self->_registerBroker = a3;
}

- (BOOL)registerPeerPayment
{
  return self->_registerPeerPayment;
}

- (void)setRegisterPeerPayment:(BOOL)a3
{
  self->_registerPeerPayment = a3;
}

@end
