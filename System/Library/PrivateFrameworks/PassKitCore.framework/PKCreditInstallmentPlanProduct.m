@implementation PKCreditInstallmentPlanProduct

- (PKCreditInstallmentPlanProduct)initWithDictionary:(id)a3
{
  id v4;
  PKCreditInstallmentPlanProduct *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *model;
  uint64_t v10;
  NSString *capacity;
  uint64_t v12;
  NSString *color;
  void *v14;
  uint64_t v15;
  NSSet *features;
  uint64_t v17;
  NSString *serialNumber;
  uint64_t v19;
  NSDictionary *iconURLs;
  uint64_t v21;
  NSDictionary *splashImageURLs;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKCreditInstallmentPlanProduct;
  v5 = -[PKCreditInstallmentPlanProduct init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("model"));
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("capacity"));
    v10 = objc_claimAutoreleasedReturnValue();
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("color"));
    v12 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v12;

    v5->_upgradeEligible = objc_msgSend(v4, "PKBoolForKey:", CFSTR("upgradeEligible"));
    v5->_warrantyYears = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("warranty"));
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("features"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      features = v5->_features;
      v5->_features = (NSSet *)v15;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("serialNumber"));
    v17 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v17;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("icon"));
    v19 = objc_claimAutoreleasedReturnValue();
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v19;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("splashImage"));
    v21 = objc_claimAutoreleasedReturnValue();
    splashImageURLs = v5->_splashImageURLs;
    v5->_splashImageURLs = (NSDictionary *)v21;

  }
  return v5;
}

- (id)iconURLForScale:(double)a3 suffix:(id)a4
{
  return -[PKCreditInstallmentPlanProduct _imageURLFromImageURLs:forScale:suffix:](self, "_imageURLFromImageURLs:forScale:suffix:", self->_iconURLs, a4, a3);
}

- (id)splashImageURLForScale:(double)a3 suffix:(id)a4
{
  return -[PKCreditInstallmentPlanProduct _imageURLFromImageURLs:forScale:suffix:](self, "_imageURLFromImageURLs:forScale:suffix:", self->_splashImageURLs, a4, a3);
}

- (id)_imageURLFromImageURLs:(id)a3 forScale:(double)a4 suffix:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;

  v7 = a3;
  v8 = a5;
  if (a4 <= 2.0)
    v9 = CFSTR("2x");
  else
    v9 = CFSTR("3x");
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (__CFString *)v11;
  }
  objc_msgSend(v7, "PKURLForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    if (a4 >= 3.0)
      v14 = CFSTR("2x");
    else
      v14 = CFSTR("3x");
    v15 = v14;

    if (v8)
    {
      objc_msgSend(v8, "stringByAppendingString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v16;
    }
    objc_msgSend(v7, "PKURLForKey:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditInstallmentPlanProduct *v4;
  PKCreditInstallmentPlanProduct *v5;
  BOOL v6;

  v4 = (PKCreditInstallmentPlanProduct *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditInstallmentPlanProduct isEqualToInstallmentPlanProduct:](self, "isEqualToInstallmentPlanProduct:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlanProduct:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  NSSet *features;
  NSSet *v21;
  void *v22;
  NSString *v23;
  _BOOL4 v24;
  char v25;
  NSDictionary *iconURLs;
  NSDictionary *v28;
  NSDictionary *splashImageURLs;
  NSDictionary *v30;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_39;
  v6 = (void *)*((_QWORD *)v4 + 2);
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_38;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_39;
  }
  v11 = (void *)*((_QWORD *)v5 + 3);
  v7 = self->_model;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_38;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_39;
  }
  v14 = (void *)*((_QWORD *)v5 + 4);
  v7 = self->_capacity;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_38;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_39;
  }
  v17 = (void *)*((_QWORD *)v5 + 5);
  v7 = self->_color;
  v18 = v17;
  if (v7 == v18)
  {

  }
  else
  {
    v9 = v18;
    if (!v7 || !v18)
      goto LABEL_38;
    v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_39;
  }
  if (self->_upgradeEligible != v5[8] || self->_warrantyYears != *((_QWORD *)v5 + 6))
    goto LABEL_39;
  features = self->_features;
  v21 = (NSSet *)*((_QWORD *)v5 + 7);
  if (features && v21)
  {
    if ((-[NSSet isEqual:](features, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (features != v21)
  {
    goto LABEL_39;
  }
  v22 = (void *)*((_QWORD *)v5 + 8);
  v7 = self->_serialNumber;
  v23 = v22;
  if (v7 == v23)
  {

    goto LABEL_42;
  }
  v9 = v23;
  if (!v7 || !v23)
  {
LABEL_38:

    goto LABEL_39;
  }
  v24 = -[NSString isEqualToString:](v7, "isEqualToString:", v23);

  if (!v24)
    goto LABEL_39;
LABEL_42:
  iconURLs = self->_iconURLs;
  v28 = (NSDictionary *)*((_QWORD *)v5 + 9);
  if (iconURLs && v28)
  {
    if ((-[NSDictionary isEqual:](iconURLs, "isEqual:") & 1) != 0)
      goto LABEL_47;
LABEL_39:
    v25 = 0;
    goto LABEL_40;
  }
  if (iconURLs != v28)
    goto LABEL_39;
LABEL_47:
  splashImageURLs = self->_splashImageURLs;
  v30 = (NSDictionary *)*((_QWORD *)v5 + 10);
  if (splashImageURLs && v30)
    v25 = -[NSDictionary isEqual:](splashImageURLs, "isEqual:");
  else
    v25 = splashImageURLs == v30;
LABEL_40:

  return v25;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_model);
  objc_msgSend(v3, "safelyAddObject:", self->_capacity);
  objc_msgSend(v3, "safelyAddObject:", self->_color);
  objc_msgSend(v3, "safelyAddObject:", self->_features);
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_iconURLs);
  objc_msgSend(v3, "safelyAddObject:", self->_splashImageURLs);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_upgradeEligible - v4 + 32 * v4;
  v6 = self->_warrantyYears - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanProduct)initWithCoder:(id)a3
{
  id v4;
  PKCreditInstallmentPlanProduct *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *model;
  uint64_t v10;
  NSString *capacity;
  uint64_t v12;
  NSString *color;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *features;
  uint64_t v19;
  NSString *serialNumber;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *iconURLs;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *splashImageURLs;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKCreditInstallmentPlanProduct;
  v5 = -[PKCreditInstallmentPlanProduct init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capacity"));
    v10 = objc_claimAutoreleasedReturnValue();
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v12 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v12;

    v5->_upgradeEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("upgradeEligible"));
    v5->_warrantyYears = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("warranty"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("features"));
    v17 = objc_claimAutoreleasedReturnValue();
    features = v5->_features;
    v5->_features = (NSSet *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v19 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("iconURLs"));
    v24 = objc_claimAutoreleasedReturnValue();
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("splashImageURLs"));
    v29 = objc_claimAutoreleasedReturnValue();
    splashImageURLs = v5->_splashImageURLs;
    v5->_splashImageURLs = (NSDictionary *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_capacity, CFSTR("capacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_upgradeEligible, CFSTR("upgradeEligible"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_warrantyYears, CFSTR("warranty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_features, CFSTR("features"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURLs, CFSTR("iconURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_splashImageURLs, CFSTR("splashImageURLs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_capacity, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_color, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(_BYTE *)(v5 + 8) = self->_upgradeEligible;
  *(_QWORD *)(v5 + 48) = self->_warrantyYears;
  v14 = -[NSSet copyWithZone:](self->_features, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSDictionary copyWithZone:](self->_iconURLs, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSDictionary copyWithZone:](self->_splashImageURLs, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v20;

  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isUpgradeEligible
{
  return self->_upgradeEligible;
}

- (void)setUpgradeEligible:(BOOL)a3
{
  self->_upgradeEligible = a3;
}

- (unint64_t)warrantyYears
{
  return self->_warrantyYears;
}

- (void)setWarrantyYears:(unint64_t)a3
{
  self->_warrantyYears = a3;
}

- (NSSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)iconURLs
{
  return self->_iconURLs;
}

- (void)setIconURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)splashImageURLs
{
  return self->_splashImageURLs;
}

- (void)setSplashImageURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splashImageURLs, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
