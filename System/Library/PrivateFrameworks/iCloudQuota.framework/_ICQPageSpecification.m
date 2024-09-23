@implementation _ICQPageSpecification

- (void)setPageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pageIdentifier, a3);
}

- (void)setHasCancelButtonForBack:(BOOL)a3
{
  self->_hasCancelButtonForBack = a3;
}

- (NSString)pageIdentifier
{
  return self->_pageIdentifier;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_ICQPageSpecification;
  -[_ICQPageSpecification debugDescription](&v12, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[_ICQPageSpecification pageClassIdentifier](self, "pageClassIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQPageSpecification pageIdentifier](self, "pageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQPageSpecification pageTitle](self, "pageTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %@: %@>"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)pageClassIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyWithBindings:(id)a3
{
  NSObject *v4;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ICQPageSpecification copyWithBindings:].cold.1((uint64_t)self, a2, v4);

  return self;
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_storeStrong((id *)&self->_pageTitle, a3);
}

- (BOOL)hasCancelButtonForBack
{
  return self->_hasCancelButtonForBack;
}

- (void)setPageClassIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pageClassIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageClassIdentifier, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pageIdentifier, 0);
}

- (void)copyWithBindings:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1CDEBD000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ subclass must implement %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
