@implementation PKPayLaterPreliminaryAssessmentInstallmentPlan

- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  id v6;
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v7;
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v8;
  PKPayLaterFinancingAmount *v9;
  void *v10;
  uint64_t v11;
  PKPayLaterFinancingAmount *installmentAmount;
  uint64_t v13;
  NSDecimalNumber *minimumAPR;
  uint64_t v15;
  NSDecimalNumber *maximumAPR;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterPreliminaryAssessmentInstallmentPlan;
  v7 = -[PKPayLaterPreliminaryAssessmentInstallmentPlan init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    v9 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("installmentAmount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPayLaterFinancingAmount initWithDictionary:](v9, "initWithDictionary:", v10);
    installmentAmount = v8->_installmentAmount;
    v8->_installmentAmount = (PKPayLaterFinancingAmount *)v11;

    v8->_installmentCount = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("installmentCount"));
    v8->_hasAPR = objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasAPR"));
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("minimumAPR"));
    v13 = objc_claimAutoreleasedReturnValue();
    minimumAPR = v8->_minimumAPR;
    v8->_minimumAPR = (NSDecimalNumber *)v13;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("maximumAPR"));
    v15 = objc_claimAutoreleasedReturnValue();
    maximumAPR = v8->_maximumAPR;
    v8->_maximumAPR = (NSDecimalNumber *)v15;

  }
  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumAPR);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumAPR);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_installmentCount - v4 + 32 * v4;
  v6 = self->_hasAPR - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v4;
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v5;
  BOOL v6;

  v4 = (PKPayLaterPreliminaryAssessmentInstallmentPlan *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterPreliminaryAssessmentInstallmentPlan isEqualToPreliminaryAssessmentInstallmentPlan:](self, "isEqualToPreliminaryAssessmentInstallmentPlan:", v5);

  return v6;
}

- (BOOL)isEqualToPreliminaryAssessmentInstallmentPlan:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  PKPayLaterFinancingAmount *installmentAmount;
  PKPayLaterFinancingAmount *v7;
  NSDecimalNumber *minimumAPR;
  NSDecimalNumber *v9;
  NSDecimalNumber *maximumAPR;
  NSDecimalNumber *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_installmentCount != v4[4] || self->_hasAPR != *((unsigned __int8 *)v4 + 8))
    goto LABEL_16;
  installmentAmount = self->_installmentAmount;
  v7 = (PKPayLaterFinancingAmount *)v5[3];
  if (installmentAmount && v7)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:"))
      goto LABEL_16;
  }
  else if (installmentAmount != v7)
  {
    goto LABEL_16;
  }
  minimumAPR = self->_minimumAPR;
  v9 = (NSDecimalNumber *)v5[5];
  if (!minimumAPR || !v9)
  {
    if (minimumAPR == v9)
      goto LABEL_12;
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  if ((-[NSDecimalNumber isEqual:](minimumAPR, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_12:
  maximumAPR = self->_maximumAPR;
  v11 = (NSDecimalNumber *)v5[6];
  if (maximumAPR && v11)
    v12 = -[NSDecimalNumber isEqual:](maximumAPR, "isEqual:");
  else
    v12 = maximumAPR == v11;
LABEL_17:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPreliminaryAssessmentInstallmentPlan)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v5;
  uint64_t v6;
  PKPayLaterFinancingAmount *installmentAmount;
  uint64_t v8;
  NSDecimalNumber *minimumAPR;
  uint64_t v10;
  NSDecimalNumber *maximumAPR;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterPreliminaryAssessmentInstallmentPlan;
  v5 = -[PKPayLaterPreliminaryAssessmentInstallmentPlan init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKPayLaterFinancingAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumAPR"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumAPR = v5->_minimumAPR;
    v5->_minimumAPR = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumAPR"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumAPR = v5->_maximumAPR;
    v5->_maximumAPR = (NSDecimalNumber *)v10;

    v5->_installmentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentCount"));
    v5->_hasAPR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAPR"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPayLaterFinancingAmount *installmentAmount;
  id v5;

  installmentAmount = self->_installmentAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installmentAmount, CFSTR("installmentAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumAPR, CFSTR("minimumAPR"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumAPR, CFSTR("maximumAPR"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentCount, CFSTR("installmentCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAPR, CFSTR("hasAPR"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[PKPayLaterFinancingAmount copyWithZone:](self->_installmentAmount, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_minimumAPR, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_maximumAPR, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  *(_QWORD *)(v5 + 32) = self->_installmentCount;
  *(_BYTE *)(v5 + 8) = self->_hasAPR;
  return (id)v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAmount: '%@'; "), self->_installmentAmount);
  if (self->_hasAPR)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasAPR: %@; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAPR: %@; "), self->_minimumAPR);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAPR: %@; "), self->_maximumAPR);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentCount: %ld; "), self->_installmentCount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (PKPayLaterFinancingAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
  objc_storeStrong((id *)&self->_installmentAmount, a3);
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (NSDecimalNumber)minimumAPR
{
  return self->_minimumAPR;
}

- (void)setMinimumAPR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)maximumAPR
{
  return self->_maximumAPR;
}

- (void)setMaximumAPR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAPR, 0);
  objc_storeStrong((id *)&self->_minimumAPR, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
}

@end
