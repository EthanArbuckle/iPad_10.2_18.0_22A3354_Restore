@implementation PXSymbolBadgeView

- (PXSymbolBadgeView)initWithIndex:(id)a3
{
  void *v4;
  PXSymbolBadgeView *v5;
  objc_super v7;

  -[PXSymbolBadgeView symbolForIndex:](self, "symbolForIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PXSymbolBadgeView;
  v5 = -[PXTextSymbolView initWithSymbol:](&v7, sel_initWithSymbol_, v4);

  return v5;
}

- (void)setIndex:(id)a3
{
  id v4;

  -[PXSymbolBadgeView symbolForIndex:](self, "symbolForIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTextSymbolView setSymbol:](self, "setSymbol:", v4);

}

- (id)symbolForIndex:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    if (symbolForIndex__onceToken != -1)
      dispatch_once(&symbolForIndex__onceToken, &__block_literal_global_282572);
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    v5 = objc_msgSend((id)symbolForIndex__sSymbols, "count");
    objc_msgSend((id)symbolForIndex__sSymbols, "objectAtIndexedSubscript:", v4 % v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __36__PXSymbolBadgeView_symbolForIndex___block_invoke()
{
  void *v0;

  v0 = (void *)symbolForIndex__sSymbols;
  symbolForIndex__sSymbols = (uint64_t)&unk_1E53EAB78;

}

@end
