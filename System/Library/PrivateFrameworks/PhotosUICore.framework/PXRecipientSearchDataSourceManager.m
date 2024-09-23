@implementation PXRecipientSearchDataSourceManager

- (PXRecipientSearchDataSourceManager)init
{
  PXRecipientSearchDataSourceManager *v2;
  uint64_t v3;
  NSSet *usedAddresses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXRecipientSearchDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    usedAddresses = v2->_usedAddresses;
    v2->_usedAddresses = (NSSet *)v3;

  }
  return v2;
}

- (void)setQueryString:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *queryString;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_queryString;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      queryString = self->_queryString;
      self->_queryString = v6;

      -[PXRecipientSearchDataSourceManager queryStringDidChange](self, "queryStringDidChange");
    }
  }

}

- (void)queryStringDidChange
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipientSearchDataSourceManager.m"), 41, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXRecipientSearchDataSourceManager queryStringDidChange]", v6);

  abort();
}

- (void)setSearchState:(unint64_t)a3
{
  if (self->_searchState != a3)
  {
    self->_searchState = a3;
    -[PXRecipientSearchDataSourceManager signalChange:](self, "signalChange:", 2);
  }
}

- (NSString)queryString
{
  return self->_queryString;
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (void)setUsedAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)searchState
{
  return self->_searchState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
