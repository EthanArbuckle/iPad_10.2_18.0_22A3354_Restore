@implementation ADSearchCriteria

- (id)copyWithZone:(_NSZone *)a3
{
  ADSearchCriteria *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = objc_alloc_init(ADSearchCriteria);
  objc_msgSend_languageLocale(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLanguageLocale_(v4, v10, (uint64_t)v9, v11, v12);

  objc_msgSend_searchTerm(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSearchTerm_(v4, v18, (uint64_t)v17, v19, v20);

  return v4;
}

- (NSString)languageLocale
{
  return self->_languageLocale;
}

- (void)setLanguageLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_languageLocale, 0);
}

@end
