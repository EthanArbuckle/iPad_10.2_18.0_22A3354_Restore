@implementation WFRemoteExecutionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
