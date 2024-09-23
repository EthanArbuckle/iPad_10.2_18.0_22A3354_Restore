@implementation PXStateBadgeView

- (PXStateBadgeView)initWithState:(id)a3
{
  void *v4;
  PXStateBadgeView *v5;
  objc_super v7;

  -[PXStateBadgeView symbolWithState:](self, "symbolWithState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXStateBadgeView;
  v5 = -[PXTextSymbolView initWithSymbol:](&v7, sel_initWithSymbol_, v4);

  return v5;
}

- (void)setState:(id)a3
{
  id v4;

  -[PXStateBadgeView symbolWithState:](self, "symbolWithState:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTextSymbolView setSymbol:](self, "setSymbol:", v4);

}

- (id)symbolWithState:(id)a3
{
  id v3;
  const __CFString *v4;
  char v5;
  const __CFString *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
  {
    v4 = CFSTR("❌");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Chosen")) & 1) != 0)
  {
    v4 = CFSTR("✅");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ForceChosen")) & 1) != 0)
  {
    v4 = CFSTR("✳️");
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("Required"));
    v6 = CFSTR("⁉️");
    if (!v3)
      v6 = 0;
    if ((v5 & 1) != 0)
      v4 = CFSTR("🔑");
    else
      v4 = v6;
  }

  return (id)v4;
}

@end
