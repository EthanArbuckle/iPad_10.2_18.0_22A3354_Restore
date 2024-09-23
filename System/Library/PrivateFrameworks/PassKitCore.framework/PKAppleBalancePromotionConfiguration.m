@implementation PKAppleBalancePromotionConfiguration

- (PKAppleBalancePromotionConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKAppleBalancePromotionConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *programIdentifier;
  uint64_t v9;
  NSString *versionIdentifier;
  uint64_t v11;
  NSDecimalNumber *bonusMinAmount;
  uint64_t v13;
  NSDecimalNumber *bonusMaxAmount;
  uint64_t v15;
  NSString *offerText;
  uint64_t v17;
  NSString *conditionText;
  uint64_t v19;
  NSDate *lastUpdatedDate;
  PKAppleBalancePromotionConfiguration *v21;
  NSObject *v22;
  uint8_t v24[16];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAppleBalancePromotionConfiguration;
  v5 = -[PKAppleBalancePromotionConfiguration init](&v25, sel_init);
  if (!v5)
    goto LABEL_4;
  if (v4)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("promotionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_promotionType = PKAppleBalancePromotionTypeFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("programIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("versionIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v9;

    v5->_generationIdentifier = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("generationIdentifier"));
    v5->_stamp = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("stamp"));
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("bonusMinAmount"));
    v11 = objc_claimAutoreleasedReturnValue();
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v11;

    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("bonusMaxAmount"));
    v13 = objc_claimAutoreleasedReturnValue();
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("offerText"));
    v15 = objc_claimAutoreleasedReturnValue();
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("conditionText"));
    v17 = objc_claimAutoreleasedReturnValue();
    conditionText = v5->_conditionText;
    v5->_conditionText = (NSString *)v17;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v19;

LABEL_4:
    v21 = v5;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Error: promotion configuration dictionary missing", v24, 2u);
  }

  v21 = 0;
LABEL_8:

  return v21;
}

- (PKAppleBalancePromotionConfiguration)initWithAMSOfferDictionary:(id)a3
{
  id v4;
  PKAppleBalancePromotionConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *programIdentifier;
  uint64_t v11;
  NSString *versionIdentifier;
  uint64_t v13;
  NSDecimalNumber *bonusMinAmount;
  uint64_t v15;
  NSDecimalNumber *bonusMaxAmount;
  uint64_t v17;
  NSString *offerText;
  void *v19;
  uint64_t v20;
  NSString *conditionText;
  uint64_t v22;
  NSDate *lastUpdatedDate;
  PKAppleBalancePromotionConfiguration *v24;
  NSObject *v25;
  uint8_t v27[16];
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKAppleBalancePromotionConfiguration;
  v5 = -[PKAppleBalancePromotionConfiguration init](&v28, sel_init);
  if (!v5)
  {
LABEL_6:
    v24 = v5;
    goto LABEL_10;
  }
  if (v4)
  {
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("details"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PKStringForKey:", CFSTR("bonus-type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_promotionType = PKAppleBalancePromotionTypeFromString(v8);

    objc_msgSend(v7, "PKStringForKey:", CFSTR("program-id"));
    v9 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v9;

    objc_msgSend(v7, "PKStringForKey:", CFSTR("version-id"));
    v11 = objc_claimAutoreleasedReturnValue();
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v11;

    v5->_generationIdentifier = objc_msgSend(v7, "PKIntegerForKey:", CFSTR("generation-id"));
    v5->_stamp = objc_msgSend(v7, "PKIntegerForKey:", CFSTR("stamp"));
    objc_msgSend(v7, "PKDecimalNumberForKey:", CFSTR("bonus-min-amount"));
    v13 = objc_claimAutoreleasedReturnValue();
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v13;

    objc_msgSend(v7, "PKDecimalNumberForKey:", CFSTR("bonus-max-amount"));
    v15 = objc_claimAutoreleasedReturnValue();
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v15;

    objc_msgSend(v7, "PKStringForKey:", CFSTR("text"));
    v17 = objc_claimAutoreleasedReturnValue();
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v17;

    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndex:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "PKStringForKey:", CFSTR("text"));
      v20 = objc_claimAutoreleasedReturnValue();
      conditionText = v5->_conditionText;
      v5->_conditionText = (NSString *)v20;

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v22;

    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Error: ams promotion dictionary missing", v27, 2u);
  }

  v24 = 0;
LABEL_10:

  return v24;
}

- (id)uniqueIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), self->_programIdentifier, self->_versionIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalancePromotionConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalancePromotionConfiguration *v5;
  uint64_t v6;
  NSString *programIdentifier;
  uint64_t v8;
  NSString *versionIdentifier;
  uint64_t v10;
  NSDecimalNumber *bonusMinAmount;
  uint64_t v12;
  NSDecimalNumber *bonusMaxAmount;
  uint64_t v14;
  NSString *offerText;
  uint64_t v16;
  NSString *conditionText;
  uint64_t v18;
  NSDate *lastUpdatedDate;

  v4 = a3;
  v5 = -[PKAppleBalancePromotionConfiguration init](self, "init");
  if (v5)
  {
    v5->_promotionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promotionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v8;

    v5->_generationIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("generationIdentifier"));
    v5->_stamp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stamp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bonusMinAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bonusMaxAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerText"));
    v14 = objc_claimAutoreleasedReturnValue();
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conditionText"));
    v16 = objc_claimAutoreleasedReturnValue();
    conditionText = v5->_conditionText;
    v5->_conditionText = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t promotionType;
  id v5;

  promotionType = self->_promotionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", promotionType, CFSTR("promotionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programIdentifier, CFSTR("programIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionIdentifier, CFSTR("versionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_generationIdentifier, CFSTR("generationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stamp, CFSTR("stamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bonusMinAmount, CFSTR("bonusMinAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bonusMaxAmount, CFSTR("bonusMaxAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offerText, CFSTR("offerText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conditionText, CFSTR("conditionText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *programIdentifier;
  NSString *v6;
  NSString *versionIdentifier;
  NSString *v8;
  NSDecimalNumber *bonusMinAmount;
  NSDecimalNumber *v10;
  NSDecimalNumber *bonusMaxAmount;
  NSDecimalNumber *v12;
  NSString *offerText;
  NSString *v14;
  NSString *conditionText;
  NSString *v16;
  NSDate *lastUpdatedDate;
  NSDate *v18;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_39;
  programIdentifier = self->_programIdentifier;
  v6 = (NSString *)v4[2];
  if (programIdentifier && v6)
  {
    if ((-[NSString isEqual:](programIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (programIdentifier != v6)
  {
    goto LABEL_39;
  }
  versionIdentifier = self->_versionIdentifier;
  v8 = (NSString *)v4[3];
  if (versionIdentifier && v8)
  {
    if ((-[NSString isEqual:](versionIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (versionIdentifier != v8)
  {
    goto LABEL_39;
  }
  if (self->_generationIdentifier != v4[4] || self->_stamp != v4[5])
    goto LABEL_39;
  bonusMinAmount = self->_bonusMinAmount;
  v10 = (NSDecimalNumber *)v4[6];
  if (bonusMinAmount && v10)
  {
    if ((-[NSDecimalNumber isEqual:](bonusMinAmount, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (bonusMinAmount != v10)
  {
    goto LABEL_39;
  }
  bonusMaxAmount = self->_bonusMaxAmount;
  v12 = (NSDecimalNumber *)v4[7];
  if (bonusMaxAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](bonusMaxAmount, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (bonusMaxAmount != v12)
  {
    goto LABEL_39;
  }
  offerText = self->_offerText;
  v14 = (NSString *)v4[8];
  if (offerText && v14)
  {
    if ((-[NSString isEqual:](offerText, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (offerText != v14)
  {
    goto LABEL_39;
  }
  conditionText = self->_conditionText;
  v16 = (NSString *)v4[9];
  if (conditionText && v16)
  {
    if ((-[NSString isEqual:](conditionText, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (conditionText != v16)
  {
    goto LABEL_39;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  v18 = (NSDate *)v4[10];
  if (!lastUpdatedDate || !v18)
  {
    if (lastUpdatedDate == v18)
      goto LABEL_37;
LABEL_39:
    v19 = 0;
    goto LABEL_40;
  }
  if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
    goto LABEL_39;
LABEL_37:
  v19 = self->_promotionType == v4[1];
LABEL_40:

  return v19;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_programIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_versionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_bonusMinAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_bonusMaxAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_offerText);
  objc_msgSend(v3, "safelyAddObject:", self->_conditionText);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_promotionType - v4 + 32 * v4;
  v6 = self->_generationIdentifier - v5 + 32 * v5;
  v7 = self->_stamp - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_promotionType)
    v5 = CFSTR("unknown");
  else
    v5 = CFSTR("content");
  objc_msgSend(v3, "appendFormat:", CFSTR("promotionType: '%@'; "), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("programIdentifier: '%@'; "), self->_programIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("versionIdentifier: '%@'; "), self->_versionIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("generationIdentifier: '%ld'; "), self->_generationIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("stamp: '%ld'; "), self->_stamp);
  objc_msgSend(v4, "appendFormat:", CFSTR("bonusMinAmount: '%@'; "), self->_bonusMinAmount);
  objc_msgSend(v4, "appendFormat:", CFSTR("bonusMaxAmount: '%@'; "), self->_bonusMaxAmount);
  objc_msgSend(v4, "appendFormat:", CFSTR("offerText: '%@'; "), self->_offerText);
  objc_msgSend(v4, "appendFormat:", CFSTR("conditionText: '%@'; "), self->_conditionText);
  objc_msgSend(v4, "appendFormat:", CFSTR("lastUpdateDated: '%@'; "), self->_lastUpdatedDate);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalancePromotionConfiguration *v5;
  uint64_t v6;
  NSString *programIdentifier;
  uint64_t v8;
  NSString *versionIdentifier;
  uint64_t v10;
  NSDecimalNumber *bonusMinAmount;
  uint64_t v12;
  NSDecimalNumber *bonusMaxAmount;
  uint64_t v14;
  NSString *offerText;
  uint64_t v16;
  NSString *conditionText;
  uint64_t v18;
  NSDate *lastUpdatedDate;

  v5 = -[PKAppleBalancePromotionConfiguration init](+[PKAppleBalancePromotionConfiguration allocWithZone:](PKAppleBalancePromotionConfiguration, "allocWithZone:"), "init");
  v5->_promotionType = self->_promotionType;
  v6 = -[NSString copyWithZone:](self->_programIdentifier, "copyWithZone:", a3);
  programIdentifier = v5->_programIdentifier;
  v5->_programIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_versionIdentifier, "copyWithZone:", a3);
  versionIdentifier = v5->_versionIdentifier;
  v5->_versionIdentifier = (NSString *)v8;

  v5->_generationIdentifier = self->_generationIdentifier;
  v5->_stamp = self->_stamp;
  v10 = -[NSDecimalNumber copyWithZone:](self->_bonusMinAmount, "copyWithZone:", a3);
  bonusMinAmount = v5->_bonusMinAmount;
  v5->_bonusMinAmount = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_bonusMaxAmount, "copyWithZone:", a3);
  bonusMaxAmount = v5->_bonusMaxAmount;
  v5->_bonusMaxAmount = (NSDecimalNumber *)v12;

  v14 = -[NSString copyWithZone:](self->_offerText, "copyWithZone:", a3);
  offerText = v5->_offerText;
  v5->_offerText = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_conditionText, "copyWithZone:", a3);
  conditionText = v5->_conditionText;
  v5->_conditionText = (NSString *)v16;

  v18 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v18;

  return v5;
}

- (int64_t)promotionType
{
  return self->_promotionType;
}

- (void)setPromotionType:(int64_t)a3
{
  self->_promotionType = a3;
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)generationIdentifier
{
  return self->_generationIdentifier;
}

- (void)setGenerationIdentifier:(int64_t)a3
{
  self->_generationIdentifier = a3;
}

- (int64_t)stamp
{
  return self->_stamp;
}

- (void)setStamp:(int64_t)a3
{
  self->_stamp = a3;
}

- (NSDecimalNumber)bonusMinAmount
{
  return self->_bonusMinAmount;
}

- (void)setBonusMinAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)bonusMaxAmount
{
  return self->_bonusMaxAmount;
}

- (void)setBonusMaxAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)offerText
{
  return self->_offerText;
}

- (void)setOfferText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)conditionText
{
  return self->_conditionText;
}

- (void)setConditionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_conditionText, 0);
  objc_storeStrong((id *)&self->_offerText, 0);
  objc_storeStrong((id *)&self->_bonusMaxAmount, 0);
  objc_storeStrong((id *)&self->_bonusMinAmount, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

@end
