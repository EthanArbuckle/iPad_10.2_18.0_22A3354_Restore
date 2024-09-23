@implementation ECCurrencyEntry

- (ECCurrencyEntry)initWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7
{
  uint64_t v10;
  id v13;
  id v14;
  ECCurrencyEntry *v15;
  ECCurrencyEntry *v16;
  uint64_t v17;
  NSString *mXlLangId;
  objc_super v20;

  v10 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ECCurrencyEntry;
  v15 = -[ECCurrencyEntry init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mLassoCurrencyCode, a3);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%X"), v10);
    mXlLangId = v16->mXlLangId;
    v16->mXlLangId = (NSString *)v17;

    objc_storeStrong((id *)&v16->mXlCurrencySymbol, a5);
    v16->mAppliesToExport = a6;
    v16->mXlAccountingFormat = a7;
  }

  return v16;
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5
{
  objc_msgSend(a1, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", a3, *(_QWORD *)&a4, a5, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 accountingFormat:(int)a6
{
  objc_msgSend(a1, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", a3, *(_QWORD *)&a4, a5, 1, *(_QWORD *)&a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6
{
  objc_msgSend(a1, "currencyWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", a3, *(_QWORD *)&a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)currencyWithLassoCode:(id)a3 langId:(int)a4 xlSymbol:(id)a5 isExport:(BOOL)a6 accountingFormat:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLassoCode:langId:xlSymbol:isExport:accountingFormat:", v11, v10, v12, v8, v7);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXlCurrencySymbol, 0);
  objc_storeStrong((id *)&self->mXlLangId, 0);
  objc_storeStrong((id *)&self->mLassoCurrencyCode, 0);
}

@end
