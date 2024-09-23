@implementation UIAccessibilityGamepadProductInfo

- (UIAccessibilityGamepadProductInfo)init
{
  UIAccessibilityGamepadProductInfo *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityGamepadProductInfo;
  v2 = -[UIAccessibilityGamepadProductInfo init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

- (NSString)anonymizedIdentifier
{
  void *v2;
  void *v3;

  -[UIAccessibilityGamepadProductInfo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productCategory
{
  return (NSString *)CFSTR("accessibility");
}

- (NSString)detailedProductCategory
{
  return (NSString *)CFSTR("accessibility-virtual");
}

- (NSString)vendorName
{
  return (NSString *)CFSTR("Apple Accessibility Virtual Controller");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSNumber)isAttachedToDevice
{
  return self->_attachedToDevice;
}

- (GCController)accessibilityController
{
  return self->_accessibilityController;
}

- (void)setAccessibilityController:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityController, a3);
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void)setMiscellaneous:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_accessibilityController, 0);
  objc_storeStrong((id *)&self->_attachedToDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
