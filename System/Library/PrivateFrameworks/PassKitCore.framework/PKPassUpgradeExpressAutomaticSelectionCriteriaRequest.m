@implementation PKPassUpgradeExpressAutomaticSelectionCriteriaRequest

- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradeExpressAutomaticSelectionCriteriaRequest *v5;
  id *p_isa;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  PKPassUpgradeExpressAutomaticSelectionCriteriaRequest *v12;
  NSObject *v13;
  const char *v14;
  uint8_t v16[16];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v5 = -[PKPassUpgradeRequest initWithDictionary:](&v17, sel_initWithDictionary_, v4);
  p_isa = (id *)&v5->super.super.isa;
  if (!v5)
    goto LABEL_5;
  -[PKPassUpgradeRequest secureElementIdentifier](v5, "secureElementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLogFacilityTypeGetObject(0x25uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)v16 = 0;
    v14 = "Missing seid key for upgrade request";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, v14, v16, 2u);
    goto LABEL_13;
  }
  objc_msgSend(p_isa, "paymentApplicationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    PKLogFacilityTypeGetObject(0x25uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)v16 = 0;
    v14 = "Missing applet id key for upgrade request";
    goto LABEL_12;
  }
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("criteriaType"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = p_isa[6];
  p_isa[6] = (id)v10;

  if (!objc_msgSend(p_isa[6], "count"))
  {
    PKLogFacilityTypeGetObject(0x25uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v14 = "Missing criterion type key for upgrade request";
      goto LABEL_12;
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
LABEL_5:
  v12 = p_isa;
LABEL_14:

  return v12;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  -[PKPassUpgradeRequest asDictionary](&v7, sel_asDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSArray count](self->_technologyTypes, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_technologyTypes, CFSTR("criteriaType"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradeExpressAutomaticSelectionCriteriaRequest)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradeExpressAutomaticSelectionCriteriaRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *technologyTypes;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v5 = -[PKPassUpgradeRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("criteriaType"));
    v9 = objc_claimAutoreleasedReturnValue();
    technologyTypes = v5->_technologyTypes;
    v5->_technologyTypes = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
  v4 = a3;
  -[PKPassUpgradeRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_technologyTypes, CFSTR("criteriaType"), v5.receiver, v5.super_class);

}

- (NSArray)technologyTypes
{
  return self->_technologyTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technologyTypes, 0);
}

@end
