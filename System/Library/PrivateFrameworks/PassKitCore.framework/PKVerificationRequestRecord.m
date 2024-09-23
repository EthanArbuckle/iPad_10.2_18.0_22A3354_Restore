@implementation PKVerificationRequestRecord

+ (id)verificationRequestRecordForPass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v3, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPassUniqueID:", v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDate:", v8);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Cannot create verification record without pass unique ID :%{public}@", (uint8_t *)&v12, 0xCu);

    }
    v6 = 0;
  }

  return v6;
}

- (PKVerificationRequestRecord)initWithCoder:(id)a3
{
  id v4;
  PKVerificationRequestRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKVerificationRequestRecord;
  v5 = -[PKVerificationRequestRecord init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setPassUniqueID:](v5, "setPassUniqueID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setDate:](v5, "setDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setChannel:](v5, "setChannel:", v8);

    -[PKVerificationRequestRecord setVerificationStatus:](v5, "setVerificationStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verificationStatus")));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("allChannels"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setAllChannels:](v5, "setAllChannels:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("PKVerificationRequestRecordRequiredFieldData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setRequiredFieldData:](v5, "setRequiredFieldData:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentStepIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setCurrentStepIdentifier:](v5, "setCurrentStepIdentifier:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousStepIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationRequestRecord setPreviousStepIdentifier:](v5, "setPreviousStepIdentifier:", v21);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PKVerificationRequestRecord passUniqueID](self, "passUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("passUniqueID"));

  -[PKVerificationRequestRecord channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("channel"));

  -[PKVerificationRequestRecord date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("date"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationRequestRecord verificationStatus](self, "verificationStatus"), CFSTR("verificationStatus"));
  -[PKVerificationRequestRecord allChannels](self, "allChannels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("allChannels"));

  -[PKVerificationRequestRecord requiredFieldData](self, "requiredFieldData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("PKVerificationRequestRecordRequiredFieldData"));

  -[PKVerificationRequestRecord currentStepIdentifier](self, "currentStepIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("currentStepIdentifier"));

  -[PKVerificationRequestRecord previousStepIdentifier](self, "previousStepIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("previousStepIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%lu'; "), self->_verificationStatus);
  objc_msgSend(v6, "appendFormat:", CFSTR("step: (cur: %@, prev: %@); "),
    self->_currentStepIdentifier,
    self->_previousStepIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("date: '%@'; "), self->_date);
  objc_msgSend(v6, "appendFormat:", CFSTR("channel: '%@'; "), self->_channel);
  objc_msgSend(v6, "appendFormat:", CFSTR("allChannels: '%@'; "), self->_allChannels);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)requiredVerificationFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSDictionary PKArrayContaining:forKey:](self->_requiredFieldData, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[NSDictionary PKDictionaryForKey:](self->_requiredFieldData, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKDictionaryForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safelyAddObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSString)currentStepIdentifier
{
  return self->_currentStepIdentifier;
}

- (void)setCurrentStepIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)previousStepIdentifier
{
  return self->_previousStepIdentifier;
}

- (void)setPreviousStepIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKVerificationChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)allChannels
{
  return self->_allChannels;
}

- (void)setAllChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)requiredFieldData
{
  return self->_requiredFieldData;
}

- (void)setRequiredFieldData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFieldData, 0);
  objc_storeStrong((id *)&self->_allChannels, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_previousStepIdentifier, 0);
  objc_storeStrong((id *)&self->_currentStepIdentifier, 0);
}

@end
