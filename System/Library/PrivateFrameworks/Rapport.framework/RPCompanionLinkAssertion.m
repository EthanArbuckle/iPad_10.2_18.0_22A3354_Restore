@implementation RPCompanionLinkAssertion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPCompanionLinkAssertion)initWithCoder:(id)a3
{
  id v4;
  RPCompanionLinkAssertion *v5;
  id v6;
  id v7;
  id v8;
  RPCompanionLinkAssertion *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPCompanionLinkAssertion;
  v5 = -[RPCompanionLinkAssertion init](&v11, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *assertionID;
  NSString *destinationID;
  NSString *identifier;
  id v8;

  v4 = a3;
  assertionID = self->_assertionID;
  v8 = v4;
  if (assertionID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", assertionID, CFSTR("asID"));
    v4 = v8;
  }
  destinationID = self->_destinationID;
  if (destinationID)
  {
    objc_msgSend(v8, "encodeObject:forKey:", destinationID, CFSTR("dID"));
    v4 = v8;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", identifier, CFSTR("id"));
    v4 = v8;
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v8;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_destinationID)
  {
    v8 = v3;
    NSAppendPrintF();
    v5 = v8;

    v4 = v5;
  }
  if (self->_identifier)
  {
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  return v4;
}

- (void)invalidate
{
  -[RPCompanionLinkClient _invalidateAssertion:](self->_client, "_invalidateAssertion:", self);
}

- (NSString)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
}

@end
