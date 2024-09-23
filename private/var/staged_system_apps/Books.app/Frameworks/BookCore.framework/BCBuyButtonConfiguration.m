@implementation BCBuyButtonConfiguration

- (BCBuyButtonConfiguration)init
{
  BCBuyButtonConfiguration *v2;
  BCBuyButtonConfiguration *v3;
  NSString *buyString;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCBuyButtonConfiguration;
  v2 = -[BCBuyButtonConfiguration init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    buyString = v2->_buyString;
    v2->_buyString = (NSString *)&stru_296430;

    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v3->_backgroundColor = CGColorRetain((CGColorRef)objc_msgSend(v5, "CGColor"));

  }
  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColorRelease(self->_backgroundColor);
  self->_backgroundColor = CGColorRetain(a3);
}

- (NSString)buyString
{
  return self->_buyString;
}

- (void)setBuyString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyString, 0);
}

@end
