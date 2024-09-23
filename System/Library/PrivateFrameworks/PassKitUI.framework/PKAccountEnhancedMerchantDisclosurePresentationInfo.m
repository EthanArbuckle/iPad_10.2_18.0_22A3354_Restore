@implementation PKAccountEnhancedMerchantDisclosurePresentationInfo

- (PKAccountEnhancedMerchantDisclosurePresentationInfo)initWithAccountEnhancedMerchant:(id)a3
{
  id v5;
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v6;
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *disclosures;
  NSString *v12;
  NSString *v13;
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountEnhancedMerchantDisclosurePresentationInfo;
  v6 = -[PKAccountEnhancedMerchantDisclosurePresentationInfo init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_storeStrong((id *)&v6->_enhancedMerchant, a3);
  objc_msgSend(v5, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  name = v7->_name;
  v7->_name = (NSString *)v8;

  objc_msgSend(v5, "disclosures");
  v10 = objc_claimAutoreleasedReturnValue();
  disclosures = v7->_disclosures;
  v7->_disclosures = (NSString *)v10;

  v12 = v7->_name;
  if (!v12)
    goto LABEL_7;
  if (-[NSString length](v12, "length") && (v13 = v7->_disclosures) != 0 && -[NSString length](v13, "length"))
LABEL_6:
    v14 = v7;
  else
LABEL_7:
    v14 = 0;

  return v14;
}

- (NSCopying)identifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PKAccountEnhancedMerchant privateIdentifier](self->_enhancedMerchant, "privateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_disclosures"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v4;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v4;
  PKAccountEnhancedMerchantDisclosurePresentationInfo *v5;
  BOOL v6;

  v4 = (PKAccountEnhancedMerchantDisclosurePresentationInfo *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountEnhancedMerchantDisclosurePresentationInfo isEqualToAccountEnhancedMerchantDisclosure:](self, "isEqualToAccountEnhancedMerchantDisclosure:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchantDisclosure:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  v6 = (void *)v4[1];
  v7 = self->_name;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {
LABEL_13:

      goto LABEL_14;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_14;
  }
  v11 = (void *)v5[2];
  v7 = self->_disclosures;
  v12 = v11;
  if (v7 == v12)
  {

LABEL_17:
    v14 = PKEqualObjects();
    goto LABEL_15;
  }
  v9 = v12;
  if (!v7 || !v12)
    goto LABEL_13;
  v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

  if (v13)
    goto LABEL_17;
LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_disclosures);
  objc_msgSend(v3, "safelyAddObject:", self->_enhancedMerchant);
  v4 = PKCombinedHash();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)disclosures
{
  return self->_disclosures;
}

- (void)setDisclosures:(id)a3
{
  objc_storeStrong((id *)&self->_disclosures, a3);
}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (void)setEnhancedMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedMerchant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_disclosures, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
