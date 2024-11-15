@implementation SCWatchlistInlineDefaultsProvider

- (SCWatchlistInlineDefaultsProvider)initWithDefaults:(id)a3
{
  id v5;
  SCWatchlistInlineDefaultsProvider *v6;
  SCWatchlistInlineDefaultsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistInlineDefaultsProvider;
  v6 = -[SCWatchlistInlineDefaultsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaults, a3);

  return v7;
}

- (void)fetchWatchlistDefaultsWithCompletion:(id)a3
{
  SCWatchlistDefaults *defaults;
  id v5;
  id v6;

  defaults = self->_defaults;
  v5 = a3;
  -[SCWatchlistDefaults defaultSymbols](defaults, "defaultSymbols");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
