@implementation PKPaymentSetupProductsSectionListItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupProductsSectionListItem;
  v5 = -[PKPaymentSetupListItem copyWithZone:](&v11, sel_copyWithZone_);
  v6 = -[PKPaymentSetupProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v6;

  v8 = -[NSOrderedSet copyWithZone:](self->_searchTerms, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v8;

  *((_QWORD *)v5 + 10) = self->_isLoadingIcon;
  objc_storeStrong((id *)v5 + 11, self->_sectionIdentifier);
  return v5;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (NSOrderedSet)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)isLoadingIcon
{
  return self->_isLoadingIcon;
}

- (void)setIsLoadingIcon:(unint64_t)a3
{
  self->_isLoadingIcon = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
