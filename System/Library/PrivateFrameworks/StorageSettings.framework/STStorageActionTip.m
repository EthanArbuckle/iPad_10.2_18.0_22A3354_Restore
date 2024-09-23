@implementation STStorageActionTip

- (STStorageActionTip)init
{
  STStorageActionTip *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStorageActionTip;
  v2 = -[STStorageTip init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, v2, 0, 0, 0, 2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[STStorageTip setSpecifier:](v2, "setSpecifier:", v3);
    -[STStorageTip setProperty:forKey:](v2, "setProperty:forKey:", CFSTR("stActionTip"), CFSTR("stTipKind"));

  }
  return v2;
}

- (void)setDetailControllerClass:(Class)a3
{
  id v4;

  -[STStorageTip specifier](self, "specifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetailControllerClass:", a3);

}

- (Class)detailControllerClass
{
  void *v2;
  void *v3;

  -[STStorageTip specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailControllerClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (NSArray)significantItems
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignificantItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantItems, 0);
}

@end
