@implementation SBHGlobalIconGridSizeClassDomain

- (SBHGlobalIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  id v7;
  id v8;
  void *v9;
  SBHGlobalIconGridSizeClassDomain *v10;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  +[SBHIconGridSizeClassDomain builtInDomain](SBHIconGridSizeClassDomain, "builtInDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SBHGlobalIconGridSizeClassDomain;
  v10 = -[SBHMutableIconGridSizeClassDomain initWithGridSizeClasses:order:fallbackDomain:](&v12, sel_initWithGridSizeClasses_order_fallbackDomain_, v8, v7, v9);

  return v10;
}

@end
