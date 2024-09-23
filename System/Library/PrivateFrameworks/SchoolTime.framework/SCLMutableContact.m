@implementation SCLMutableContact

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->super._contactIdentifier;
  self->super._contactIdentifier = v4;

}

- (void)setType:(unint64_t)a3
{
  self->super._type = a3;
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  value = self->super._value;
  self->super._value = v4;

}

@end
