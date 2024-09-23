@implementation PKPaymentSetupProductsSectionListSection

- (PKPaymentSetupProductsSectionListSection)initWithIdentifier:(id)a3
{
  id v5;
  PKPaymentSetupProductsSectionListSection *v6;
  PKPaymentSetupProductsSectionListSection *v7;
  NSMutableArray *v8;
  NSMutableArray *sectionListItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupProductsSectionListSection;
  v6 = -[PKPaymentSetupProductsSectionListSection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sectionListItems = v7->_sectionListItems;
    v7->_sectionListItems = v8;

  }
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)sectionListItems
{
  return self->_sectionListItems;
}

- (void)setSectionListItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionListItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
