@implementation PXVisualDiagnosticsConfiguration

- (PXVisualDiagnosticsConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsConfiguration.m"), 18, CFSTR("%s is not available as initializer"), "-[PXVisualDiagnosticsConfiguration init]");

  abort();
}

- (PXVisualDiagnosticsConfiguration)initWithRootProvider:(id)a3
{
  id v5;
  PXVisualDiagnosticsConfiguration *v6;
  PXVisualDiagnosticsConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVisualDiagnosticsConfiguration;
  v6 = -[PXVisualDiagnosticsConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootProvider, a3);
    v7->_defaultPageSize = (CGSize)xmmword_24438BC10;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXVisualDiagnosticsConfiguration rootProvider](self, "rootProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRootProvider:", v5);

  -[PXVisualDiagnosticsConfiguration defaultPageSize](self, "defaultPageSize");
  objc_msgSend(v6, "setDefaultPageSize:");
  -[PXVisualDiagnosticsConfiguration name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v7);

  return v6;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[PXVisualDiagnosticsConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVisualDiagnosticsConfiguration rootProvider](self, "rootProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; name: %@, rootProvider: %@>"), v4, self, v5, v6);

  return v7;
}

- (PXVisualDiagnosticsProvider)rootProvider
{
  return self->_rootProvider;
}

- (void)setRootProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rootProvider, a3);
}

- (CGSize)defaultPageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultPageSize.width;
  height = self->_defaultPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultPageSize:(CGSize)a3
{
  self->_defaultPageSize = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPrivateDataAllowed
{
  return self->_isPrivateDataAllowed;
}

- (void)setIsPrivateDataAllowed:(BOOL)a3
{
  self->_isPrivateDataAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rootProvider, 0);
}

@end
