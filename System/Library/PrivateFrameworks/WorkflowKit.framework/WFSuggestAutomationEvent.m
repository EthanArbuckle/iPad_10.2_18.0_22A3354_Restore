@implementation WFSuggestAutomationEvent

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

- (NSString)suggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier;
}

- (void)setSuggestedAutomationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (void)setInteracted:(BOOL)a3
{
  self->_interacted = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
