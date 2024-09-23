@implementation PKTransitAppletPlan

- (PKTransitAppletPlan)initWithDictionary:(id)a3
{
  id v4;
  PKTransitAppletPlan *v5;
  PKTransitAppletPlan *v6;
  void *v7;
  uint64_t v8;
  NSString *commutePlanIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDate *expirationDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletPlan;
  v5 = -[PKTransitAppletPlan init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CommutePlanIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    commutePlanIdentifier = v6->_commutePlanIdentifier;
    v6->_commutePlanIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CommutePlanExpirationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v12;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_commutePlanIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *commutePlanIdentifier;
  id v5;

  commutePlanIdentifier = self->_commutePlanIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", commutePlanIdentifier, CFSTR("commutePlanIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (PKTransitAppletPlan)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletPlan *v5;
  uint64_t v6;
  NSString *commutePlanIdentifier;
  uint64_t v8;
  NSDate *expirationDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransitAppletPlan;
  v5 = -[PKTransitAppletPlan init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commutePlanIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    commutePlanIdentifier = v5->_commutePlanIdentifier;
    v5->_commutePlanIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

  }
  return v5;
}

- (NSString)commutePlanIdentifier
{
  return self->_commutePlanIdentifier;
}

- (void)setCommutePlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_commutePlanIdentifier, 0);
}

@end
