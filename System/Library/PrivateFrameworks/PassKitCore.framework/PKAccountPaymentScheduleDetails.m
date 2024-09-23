@implementation PKAccountPaymentScheduleDetails

- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3
{
  return -[PKAccountPaymentScheduleDetails initWithDictionary:productTimeZone:](self, "initWithDictionary:productTimeZone:", a3, 0);
}

- (PKAccountPaymentScheduleDetails)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6;
  id v7;
  PKAccountPaymentScheduleDetails *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *scheduledDate;
  uint64_t v16;
  NSString *paymentTermsIdentifier;

  v6 = a3;
  v7 = a4;
  v8 = -[PKAccountPaymentScheduleDetails init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("frequency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_frequency = PKAccountPaymentFrequencyFromString(v9);
    v8->_scheduledDay = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("scheduledDay"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("preset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_preset = PKAccountPaymentPresetFromString(v10);
    objc_msgSend(v6, "PKStringForKey:", CFSTR("scheduledDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_productTimeZone, a4);
    PKPaymentDateFormatterWithTimeZone(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "dateFromString:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      scheduledDate = v8->_scheduledDate;
      v8->_scheduledDate = (NSDate *)v14;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentTermsIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    paymentTermsIdentifier = v8->_paymentTermsIdentifier;
    v8->_paymentTermsIdentifier = (NSString *)v16;

  }
  return v8;
}

- (void)setScheduleTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZone, a3);
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PKAccountPaymentScheduleDetails jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccountPaymentFrequencyToString(self->_frequency);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("frequency"));

  PKAccountPaymentPresetToString(self->_preset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("preset"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_paymentTermsIdentifier, CFSTR("paymentTermsIdentifier"));
  if (self->_frequency == 6 && self->_scheduledDay)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("scheduledDay"));
  }
  else
  {
    PKPaymentDateFormatterWithTimeZone(self->_productTimeZone);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", self->_scheduledDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("scheduledDate"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)hashString
{
  void *v3;
  int64_t frequency;
  void *v5;
  int64_t preset;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  frequency = self->_frequency;
  if (frequency)
  {
    PKAccountPaymentFrequencyToString(frequency);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  preset = self->_preset;
  if (preset)
  {
    PKAccountPaymentPresetToString(preset);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  if (self->_frequency == 6 && self->_scheduledDay)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_scheduledDate)
      goto LABEL_11;
    PKPaymentDateFormatterWithTimeZone(self->_productTimeZone);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", self->_scheduledDate);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v3, "appendString:", v9);

LABEL_11:
  if (self->_paymentTermsIdentifier)
    objc_msgSend(v3, "appendString:");
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentScheduleDetails)initWithCoder:(id)a3
{
  id v4;
  PKAccountPaymentScheduleDetails *v5;
  uint64_t v6;
  NSDate *scheduledDate;
  uint64_t v8;
  NSString *paymentTermsIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountPaymentScheduleDetails;
  v5 = -[PKAccountPaymentScheduleDetails init](&v11, sel_init);
  if (v5)
  {
    v5->_frequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
    v5->_scheduledDay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledDay"));
    v5->_preset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preset"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentTermsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentTermsIdentifier = v5->_paymentTermsIdentifier;
    v5->_paymentTermsIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t frequency;
  id v5;

  frequency = self->_frequency;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", frequency, CFSTR("frequency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preset, CFSTR("preset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduledDate, CFSTR("scheduledDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scheduledDay, CFSTR("scheduledDay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentTermsIdentifier, CFSTR("paymentTermsIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *scheduledDate;
  NSDate *v6;
  NSString *paymentTermsIdentifier;
  NSString *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  scheduledDate = self->_scheduledDate;
  v6 = (NSDate *)v4[5];
  if (scheduledDate && v6)
  {
    if ((-[NSDate isEqual:](scheduledDate, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (scheduledDate != v6)
  {
    goto LABEL_15;
  }
  paymentTermsIdentifier = self->_paymentTermsIdentifier;
  v8 = (NSString *)v4[6];
  if (!paymentTermsIdentifier || !v8)
  {
    if (paymentTermsIdentifier == v8)
      goto LABEL_12;
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](paymentTermsIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_12:
  if (self->_frequency != v4[2] || self->_scheduledDay != v4[3])
    goto LABEL_15;
  v9 = self->_preset == v4[4];
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_scheduledDate);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentTermsIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_frequency - v4 + 32 * v4;
  v6 = self->_scheduledDay - v5 + 32 * v5;
  v7 = self->_preset - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccountPaymentFrequencyToString(self->_frequency);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("frequency: '%@'; "), v4);

  if (self->_scheduledDay)
    objc_msgSend(v3, "appendFormat:", CFSTR("scheduledDay: '%ld': "), self->_scheduledDay);
  PKAccountPaymentPresetToString(self->_preset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("preset: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("scheduledDate: '%@'; "), self->_scheduledDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentTermsIdentifier: '%@'; "), self->_paymentTermsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (int64_t)scheduledDay
{
  return self->_scheduledDay;
}

- (void)setScheduledDay:(int64_t)a3
{
  self->_scheduledDay = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (void)setPreset:(int64_t)a3
{
  self->_preset = a3;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)paymentTermsIdentifier
{
  return self->_paymentTermsIdentifier;
}

- (void)setPaymentTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
}

@end
