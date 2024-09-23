@implementation PXSelectionCountNumberFormatter

- (void)setSelectionNumberLimit:(int64_t)a3
{
  self->_selectionNumberLimit = a3;
}

- (PXSelectionCountNumberFormatter)init
{
  PXSelectionCountNumberFormatter *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *decimalNumberFormatter;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSelectionCountNumberFormatter;
  v2 = -[PXSelectionCountNumberFormatter init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    decimalNumberFormatter = v2->_decimalNumberFormatter;
    v2->_decimalNumberFormatter = v3;

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v2->_decimalNumberFormatter, "setLocale:", v5);

    -[NSNumberFormatter setGeneratesDecimalNumbers:](v2->_decimalNumberFormatter, "setGeneratesDecimalNumbers:", 1);
    -[NSNumberFormatter setNumberStyle:](v2->_decimalNumberFormatter, "setNumberStyle:", 1);
    v2->_selectionNumberLimit = 9999;
  }
  return v2;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;
  v6 = -[PXSelectionCountNumberFormatter selectionNumberLimit](self, "selectionNumberLimit");
  -[PXSelectionCountNumberFormatter decimalNumberFormatter](self, "decimalNumberFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 <= v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PXSelectionCountNumberFormatter selectionNumberLimit](self, "selectionNumberLimit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PXSelectionNumberFormatterOverflowFormat"), &stru_2514D17B8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v12;
}

- (int64_t)selectionNumberLimit
{
  return self->_selectionNumberLimit;
}

- (NSNumberFormatter)decimalNumberFormatter
{
  return self->_decimalNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decimalNumberFormatter, 0);
}

@end
