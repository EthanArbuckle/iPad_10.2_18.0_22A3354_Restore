@implementation SBHMutableIconGridSizeClassDomain

- (SBHMutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBHMutableIconGridSizeClassDomain *v11;
  uint64_t v12;
  NSMutableDictionary *registeredClasses;
  uint64_t v14;
  NSMutableArray *registeredOrder;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHMutableIconGridSizeClassDomain;
  v11 = -[SBHIconGridSizeClassDomain initWithGridSizeClasses:order:fallbackDomain:](&v17, sel_initWithGridSizeClasses_order_fallbackDomain_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(v8, "mutableCopy");
    registeredClasses = v11->_registeredClasses;
    v11->_registeredClasses = (NSMutableDictionary *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    registeredOrder = v11->_registeredOrder;
    v11->_registeredOrder = (NSMutableArray *)v14;

    objc_storeWeak((id *)&v11->_fallbackDomain, v10);
  }

  return v11;
}

- (id)registeredGridSizeClassOrder
{
  return self->_registeredOrder;
}

- (id)registeredGridSizeClasses
{
  return self->_registeredClasses;
}

- (void)registerIconGridSizeClass:(id)a3 info:(id)a4
{
  NSMutableDictionary *registeredClasses;
  void *v7;
  id v8;

  registeredClasses = self->_registeredClasses;
  v8 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  -[NSMutableDictionary setObject:forKey:](registeredClasses, "setObject:forKey:", v7, v8);

  -[NSMutableArray addObject:](self->_registeredOrder, "addObject:", v8);
}

- (void)registerIconGridSizeClasses:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__SBHMutableIconGridSizeClassDomain_registerIconGridSizeClasses___block_invoke;
  v3[3] = &unk_1E8D89258;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __65__SBHMutableIconGridSizeClassDomain_registerIconGridSizeClasses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerIconGridSizeClass:info:", a2, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassDomain initWithIconGridSizeClassDomain:]([SBHImmutableIconGridSizeClassDomain alloc], "initWithIconGridSizeClassDomain:", self);
}

- (SBHIconGridSizeClassDomain)fallbackDomain
{
  return (SBHIconGridSizeClassDomain *)objc_loadWeakRetained((id *)&self->_fallbackDomain);
}

- (void)setFallbackDomain:(id)a3
{
  objc_storeWeak((id *)&self->_fallbackDomain, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallbackDomain);
  objc_storeStrong((id *)&self->_registeredClasses, 0);
  objc_storeStrong((id *)&self->_registeredOrder, 0);
}

@end
