@implementation SSNumberFormatManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)sharedNumberFormatManager;
    sharedNumberFormatManager = v2;

  }
}

- (SSNumberFormatManager)init
{
  SSNumberFormatManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSNumberFormatManager;
  v2 = -[SSNumberFormatManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SSNumberFormatManager setNumberFormatter:](v2, "setNumberFormatter:", v3);

    v4 = (void *)objc_opt_new();
    -[SSNumberFormatManager setByteCountFormatter:](v2, "setByteCountFormatter:", v4);

    -[SSNumberFormatManager byteCountFormatter](v2, "byteCountFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCountStyle:", 0);

    v6 = (void *)objc_opt_new();
    -[SSNumberFormatManager setCurrencyFormatter:](v2, "setCurrencyFormatter:", v6);

    -[SSNumberFormatManager currencyFormatter](v2, "currencyFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberStyle:", 2);

  }
  return v2;
}

+ (id)stringFromInt:(int)a3 withMinimumDigits:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&a3;
  objc_msgSend((id)sharedNumberFormatManager, "numberFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumIntegerDigits:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringFromByteCount:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)sharedNumberFormatManager, "byteCountFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromByteCount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)currencyStringWithAmount:(id)a3 currencyCode:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)sharedNumberFormatManager;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currencyFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrencyCode:", v6);

  objc_msgSend((id)sharedNumberFormatManager, "currencyFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSNumberFormatter)numberFormatter
{
  return (NSNumberFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNumberFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSByteCountFormatter)byteCountFormatter
{
  return (NSByteCountFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (void)setByteCountFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumberFormatter)currencyFormatter
{
  return (NSNumberFormatter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrencyFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end
