@implementation WFWidgetOptions

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (NSNumber)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
