@implementation WFActionDrawerSection

- (WFActionDrawerSection)initWithLocalizedTitle:(id)a3 donations:(id)a4 bundleIdentifier:(id)a5 sectionType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  WFActionDrawerSection *v14;
  WFActionDrawerSection *v15;
  uint64_t v16;
  NSArray *donations;
  uint64_t v18;
  NSString *bundleIdentifier;
  WFActionDrawerSection *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFActionDrawerSection;
  v14 = -[WFActionDrawerSection init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_localizedTitle, a3);
    v16 = objc_msgSend(v12, "copy");
    donations = v15->_donations;
    v15->_donations = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v18;

    v15->_sectionType = a6;
    v20 = v15;
  }

  return v15;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSArray)donations
{
  return self->_donations;
}

- (void)setDonations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_donations, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
