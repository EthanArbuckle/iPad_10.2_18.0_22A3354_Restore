@implementation PKBankConnectFormatter

+ (id)formatAsOfDate:(id)a3 hasMultipleBalance:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _TtC9PassKitUI20BankConnectFormatter *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(_TtC9PassKitUI20BankConnectFormatter);
  -[BankConnectFormatter formatAsOfDate:hasMultipleBalances:](v6, "formatAsOfDate:hasMultipleBalances:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
