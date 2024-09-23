@implementation UIStatusBarNotChargingItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSString **p_notChargingString;
  char v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = objc_msgSend(v6, "rawData");

  v9 = (void *)objc_msgSend(v7, "initWithCString:encoding:", v8 + 2112, 4);
  p_notChargingString = &self->_notChargingString;
  v11 = objc_msgSend(v9, "isEqualToString:", *p_notChargingString);
  if ((v11 & 1) == 0)
    objc_storeStrong((id *)p_notChargingString, v9);

  return v11 ^ 1;
}

- (id)contentsImage
{
  return -[UIStatusBarItemView imageWithText:](self, "imageWithText:", self->_notChargingString);
}

- (id)accessibilityHUDRepresentation
{
  return -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_notChargingString, 0, 0.0, 0.0, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notChargingString, 0);
}

@end
