@implementation SBHImmutableIconGridSizeClassDomain

- (SBHImmutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBHImmutableIconGridSizeClassDomain *v11;
  uint64_t v12;
  NSDictionary *registeredClasses;
  uint64_t v14;
  NSArray *registeredOrder;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHImmutableIconGridSizeClassDomain;
  v11 = -[SBHIconGridSizeClassDomain initWithGridSizeClasses:order:fallbackDomain:](&v17, sel_initWithGridSizeClasses_order_fallbackDomain_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    registeredClasses = v11->_registeredClasses;
    v11->_registeredClasses = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    registeredOrder = v11->_registeredOrder;
    v11->_registeredOrder = (NSArray *)v14;

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

- (id)fallbackDomain
{
  return objc_loadWeakRetained((id *)&self->_fallbackDomain);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallbackDomain);
  objc_storeStrong((id *)&self->_registeredClasses, 0);
  objc_storeStrong((id *)&self->_registeredOrder, 0);
}

@end
