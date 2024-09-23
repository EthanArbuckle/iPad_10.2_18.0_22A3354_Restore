@implementation _PSContactFillerNormalizationConstants

- (_PSContactFillerNormalizationConstants)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PSContactFillerNormalizationConstants;
  return -[_PSContactFillerNormalizationConstants init](&v3, sel_init);
}

- (NSNumber)incomingCallTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncomingCallTotal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)outgoingCallTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutgoingCallTotal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)shareTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShareTotal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)incomingTextTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIncomingTextTotal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)outgoingTextTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutgoingTextTotal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingTextTotal, 0);
  objc_storeStrong((id *)&self->_incomingTextTotal, 0);
  objc_storeStrong((id *)&self->_shareTotal, 0);
  objc_storeStrong((id *)&self->_outgoingCallTotal, 0);
  objc_storeStrong((id *)&self->_incomingCallTotal, 0);
}

@end
