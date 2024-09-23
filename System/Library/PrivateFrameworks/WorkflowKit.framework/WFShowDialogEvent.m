@implementation WFShowDialogEvent

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dialogType
{
  return self->_dialogType;
}

- (void)setDialogType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_dismissalType, 0);
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_dialogType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
