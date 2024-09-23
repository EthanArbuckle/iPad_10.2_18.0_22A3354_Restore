@implementation PKPayLaterDynamicContentSection

- (PKPayLaterDynamicContentSection)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKApplyFooterContent *v8;
  BOOL v9;
  PKPayLaterDynamicContentSection *v10;
  uint64_t v11;
  NSArray *rows;
  PKPayLaterDynamicContentSection *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("rows"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_377);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footerContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    v8 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v7);
  else
    v8 = 0;
  if (objc_msgSend(v5, "count"))
    v9 = 0;
  else
    v9 = v8 == 0;
  if (v9)
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PKPayLaterDynamicContentSection;
    v10 = -[PKPayLaterDynamicContentSection init](&v15, sel_init);
    if (v10)
    {
      if (objc_msgSend(v6, "count"))
      {
        v11 = objc_msgSend(v6, "copy");
        rows = v10->_rows;
        v10->_rows = (NSArray *)v11;
      }
      else
      {
        rows = v10->_rows;
        v10->_rows = 0;
      }

      objc_storeStrong((id *)&v10->_footerContent, v8);
    }
    self = v10;
    v13 = self;
  }

  return v13;
}

PKPayLaterDynamicContentPageItem *__54__PKPayLaterDynamicContentSection_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPayLaterDynamicContentPageItem *v3;

  v2 = a2;
  v3 = -[PKPayLaterDynamicContentPageItem initWithDictionary:]([PKPayLaterDynamicContentPageItem alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_rows)
    objc_msgSend(v3, "appendFormat:", CFSTR("rows: '%@'; "), self->_rows);
  if (self->_footerContent)
    objc_msgSend(v4, "appendFormat:", CFSTR("footerContent: '%@'; "), self->_footerContent);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
