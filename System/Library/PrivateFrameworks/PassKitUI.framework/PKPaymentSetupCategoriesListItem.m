@implementation PKPaymentSetupCategoriesListItem

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCategoriesListItem;
  v4 = -[PKPaymentSetupListItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 8, self->_category);
  v4[9] = (id)self->_isLoadingIcon;
  objc_storeStrong(v4 + 10, self->_sectionIdentifier);
  return v4;
}

- (PKPaymentSetupProductCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
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
  objc_storeStrong((id *)&self->_category, 0);
}

@end
