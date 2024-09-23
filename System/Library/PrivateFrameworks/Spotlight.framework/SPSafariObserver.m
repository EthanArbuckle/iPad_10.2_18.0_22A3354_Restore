@implementation SPSafariObserver

- (SPSafariObserver)init
{
  SPSafariObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPSafariObserver;
  v2 = -[SPSafariObserver init](&v5, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x24BDE81D8], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "reloadSearchEngines");

    }
    else
    {
      dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_7);
    }
  }
  return v2;
}

void __24__SPSafariObserver_init__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDE81D8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reloadSearchEngines");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *MEMORY[0x24BDD0E80];
  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v9 | v8 && (objc_msgSend((id)v9, "isEqual:", v8) & 1) == 0)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_2);

}

void __67__SPSafariObserver_observeValueForKeyPath_ofObject_change_context___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDE81D8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reloadSearchEngines");

}

@end
