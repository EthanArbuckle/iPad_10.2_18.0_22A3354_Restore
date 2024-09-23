@implementation PXDedupingBadgeView

- (PXDedupingBadgeView)initWithDedupingType:(id)a3
{
  void *v4;
  PXDedupingBadgeView *v5;
  objc_super v7;

  -[PXDedupingBadgeView symbolWithDedupingType:](self, "symbolWithDedupingType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXDedupingBadgeView;
  v5 = -[PXTextSymbolView initWithSymbol:](&v7, sel_initWithSymbol_, v4);

  return v5;
}

- (void)setDedupingType:(id)a3
{
  id v4;

  -[PXDedupingBadgeView symbolWithDedupingType:](self, "symbolWithDedupingType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTextSymbolView setSymbol:](self, "setSymbol:", v4);

}

- (id)symbolWithDedupingType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SimilarStacking")) & 1) != 0)
  {
    v4 = CFSTR("⏏️");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Semantic")) & 1) != 0)
  {
    v4 = CFSTR("🔀");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDOFOrHDR")) & 1) != 0)
  {
    v4 = CFSTR("⤴️");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Timing")) & 1) != 0)
  {
    v4 = CFSTR("🔃");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SimilarVideo")))
  {
    v4 = CFSTR("🎦");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end
