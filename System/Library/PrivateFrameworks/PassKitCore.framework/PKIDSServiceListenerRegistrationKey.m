@implementation PKIDSServiceListenerRegistrationKey

- (PKIDSServiceListenerRegistrationKey)initWithMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4
{
  PKIDSServiceListenerRegistrationKey *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKIDSServiceListenerRegistrationKey;
  result = -[PKIDSServiceListenerRegistrationKey init](&v7, sel_init);
  if (result)
  {
    result->_messageType = a3;
    result->_isRequest = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_messageType == *((unsigned __int16 *)v4 + 4))
  {
    v5 = self->_isRequest ^ (v4[10] == 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return SipHash();
}

@end
