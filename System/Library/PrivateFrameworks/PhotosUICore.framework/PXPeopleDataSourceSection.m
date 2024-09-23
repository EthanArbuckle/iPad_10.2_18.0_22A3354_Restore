@implementation PXPeopleDataSourceSection

- (PXPeopleDataSourceSection)initWithPersonFetchType:(unint64_t)a3
{
  PXPeopleDataSourceSection *v4;
  PXPeopleDataSourceSection *v5;
  NSString *disclosedTitle;
  NSString *unDisclosedTitle;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDataSourceSection;
  v4 = -[PXPeopleDataSourceSection init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_disclosed = 1;
    disclosedTitle = v4->_disclosedTitle;
    v4->_personFetchType = a3;
    v4->_disclosedTitle = (NSString *)&stru_1E5149688;

    unDisclosedTitle = v5->_unDisclosedTitle;
    v5->_unDisclosedTitle = (NSString *)&stru_1E5149688;

  }
  return v5;
}

- (unint64_t)personFetchType
{
  return self->_personFetchType;
}

- (BOOL)isDisclosed
{
  return self->_disclosed;
}

- (void)setDisclosed:(BOOL)a3
{
  self->_disclosed = a3;
}

- (NSString)disclosedTitle
{
  return self->_disclosedTitle;
}

- (void)setDisclosedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)unDisclosedTitle
{
  return self->_unDisclosedTitle;
}

- (void)setUnDisclosedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unDisclosedTitle, 0);
  objc_storeStrong((id *)&self->_disclosedTitle, 0);
}

@end
