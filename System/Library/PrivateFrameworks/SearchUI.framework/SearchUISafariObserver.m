@implementation SearchUISafariObserver

- (SearchUISafariObserver)init
{
  SearchUISafariObserver *v2;
  SearchUISafariObserver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUISafariObserver;
  v2 = -[SearchUISafariObserver init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SearchUISafariObserver reloadSearchEngines](v2, "reloadSearchEngines");
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7 = *MEMORY[0x1E0CB2CC8];
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v10 | v9 && (objc_msgSend((id)v10, "isEqual:", v9) & 1) == 0)
    -[SearchUISafariObserver reloadSearchEngines](self, "reloadSearchEngines");

}

- (void)reloadSearchEngines
{
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", &__block_literal_global_25);
}

void __45__SearchUISafariObserver_reloadSearchEngines__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reloadSearchEngines");

}

@end
