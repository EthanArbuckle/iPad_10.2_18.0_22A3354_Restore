@implementation _PSContactFillerRecipient

- (_PSContactFillerRecipient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PSContactFillerRecipient;
  return -[_PSContactFillerRecipient init](&v3, sel_init);
}

- (NSString)ID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (_CDInteraction)interaction
{
  return (_CDInteraction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInteraction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
