@implementation TSPTemporaryObjectContextDelegate

- (TSPTemporaryObjectContextDelegate)init
{
  return -[TSPTemporaryObjectContextDelegate initWithPackageURL:](self, "initWithPackageURL:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_persistenceWarnings, 0);
}

- (TSPTemporaryObjectContextDelegate)initWithPackageURL:(id)a3
{
  id v4;
  TSPTemporaryObjectContextDelegate *v5;
  uint64_t v6;
  NSURL *packageURL;
  NSMutableSet *v8;
  NSMutableSet *persistenceWarnings;
  TSPTemporaryObjectContextDelegate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TSPTemporaryObjectContextDelegate;
  v5 = -[TSPTemporaryObjectContextDelegate init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    persistenceWarnings = v5->_persistenceWarnings;
    v5->_persistenceWarnings = v8;

    v5->_ignoreDocumentSupport = 1;
    v10 = v5;
  }

  return v5;
}

- (void)presentPersistenceError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)addPersistenceWarnings:(id)a3
{
  -[NSMutableSet unionSet:](self->_persistenceWarnings, "unionSet:", a3);
}

- (void)performReadUsingAccessor:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[TSPTemporaryObjectContextDelegate packageURL](self, "packageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "filename");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("Package");
    if (v5)
      v14 = CFSTR("External");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ data %@ is missing."), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)persistenceWarnings
{
  return &self->_persistenceWarnings->super;
}

- (BOOL)ignoreDocumentSupport
{
  return self->_ignoreDocumentSupport;
}

- (void)setIgnoreDocumentSupport:(BOOL)a3
{
  self->_ignoreDocumentSupport = a3;
}

@end
