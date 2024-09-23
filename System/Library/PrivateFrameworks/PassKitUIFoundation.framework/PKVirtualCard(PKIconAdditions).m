@implementation PKVirtualCard(PKIconAdditions)

- (id)cardIcon
{
  void *v1;
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "type") == 1)
  {
    v1 = (void *)MEMORY[0x24BDF6AC8];
    PKPassKitUIFoundationBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "imageNamed:inBundle:", CFSTR("AppleCardAutoFillCreditCardIcon"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
