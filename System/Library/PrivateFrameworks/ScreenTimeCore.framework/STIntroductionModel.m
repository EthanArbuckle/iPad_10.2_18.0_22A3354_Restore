@implementation STIntroductionModel

- (STIntroductionModel)initWithAppAndWebsiteActivityEnabled:(id)a3 downtimeStartTime:(id)a4 downtimeEndTime:(id)a5 restrictions:(id)a6 passcode:(id)a7 communicationSafetyEnabled:(id)a8 eyeReliefEnabled:(id)a9
{
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  STIntroductionModel *v22;
  NSNumber *isAppAndWebsiteActivityEnabled;
  NSNumber *v24;
  uint64_t v25;
  NSDateComponents *downtimeStartTime;
  uint64_t v27;
  NSDateComponents *downtimeEndTime;
  uint64_t v29;
  NSDictionary *restrictions;
  uint64_t v31;
  NSString *passcode;
  NSNumber *isCommunicationSafetyEnabled;
  NSNumber *v34;
  NSNumber *isEyeReliefEnabled;
  objc_super v37;

  v15 = (NSNumber *)a3;
  v16 = (NSNumber *)a8;
  v17 = (NSNumber *)a9;
  v37.receiver = self;
  v37.super_class = (Class)STIntroductionModel;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = -[STIntroductionModel init](&v37, sel_init);
  isAppAndWebsiteActivityEnabled = v22->_isAppAndWebsiteActivityEnabled;
  v22->_isAppAndWebsiteActivityEnabled = v15;
  v24 = v15;

  v25 = objc_msgSend(v21, "copy", v37.receiver, v37.super_class);
  downtimeStartTime = v22->_downtimeStartTime;
  v22->_downtimeStartTime = (NSDateComponents *)v25;

  v27 = objc_msgSend(v20, "copy");
  downtimeEndTime = v22->_downtimeEndTime;
  v22->_downtimeEndTime = (NSDateComponents *)v27;

  v29 = objc_msgSend(v19, "copy");
  restrictions = v22->_restrictions;
  v22->_restrictions = (NSDictionary *)v29;

  v31 = objc_msgSend(v18, "copy");
  passcode = v22->_passcode;
  v22->_passcode = (NSString *)v31;

  isCommunicationSafetyEnabled = v22->_isCommunicationSafetyEnabled;
  v22->_isCommunicationSafetyEnabled = v16;
  v34 = v16;

  isEyeReliefEnabled = v22->_isEyeReliefEnabled;
  v22->_isEyeReliefEnabled = v17;

  return v22;
}

- (STIntroductionModel)initWithCoder:(id)a3
{
  id v4;
  NSNumber *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  uint64_t v13;
  STIntroductionModel *v14;
  NSNumber *isAppAndWebsiteActivityEnabled;
  NSNumber *v16;
  void *v17;
  uint64_t v18;
  NSDateComponents *downtimeStartTime;
  uint64_t v20;
  NSDateComponents *downtimeEndTime;
  uint64_t v22;
  NSDictionary *restrictions;
  uint64_t v24;
  NSString *passcode;
  NSNumber *isCommunicationSafetyEnabled;
  NSNumber *v27;
  NSNumber *isEyeReliefEnabled;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppAndWebsiteActivity"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DowntimeStartTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DowntimeEndTime"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v31 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("Restrictions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Passcode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CommunicationSafety"));
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EyeRelief"));
  v13 = objc_claimAutoreleasedReturnValue();

  v32.receiver = self;
  v32.super_class = (Class)STIntroductionModel;
  v14 = -[STIntroductionModel init](&v32, sel_init);
  isAppAndWebsiteActivityEnabled = v14->_isAppAndWebsiteActivityEnabled;
  v14->_isAppAndWebsiteActivityEnabled = v5;
  v16 = v5;

  v17 = v6;
  v18 = objc_msgSend(v6, "copy");
  downtimeStartTime = v14->_downtimeStartTime;
  v14->_downtimeStartTime = (NSDateComponents *)v18;

  v20 = objc_msgSend(v30, "copy");
  downtimeEndTime = v14->_downtimeEndTime;
  v14->_downtimeEndTime = (NSDateComponents *)v20;

  v22 = objc_msgSend(v10, "copy");
  restrictions = v14->_restrictions;
  v14->_restrictions = (NSDictionary *)v22;

  v24 = objc_msgSend(v11, "copy");
  passcode = v14->_passcode;
  v14->_passcode = (NSString *)v24;

  isCommunicationSafetyEnabled = v14->_isCommunicationSafetyEnabled;
  v14->_isCommunicationSafetyEnabled = v12;
  v27 = v12;

  isEyeReliefEnabled = v14->_isEyeReliefEnabled;
  v14->_isEyeReliefEnabled = (NSNumber *)v13;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *isAppAndWebsiteActivityEnabled;
  id v5;

  isAppAndWebsiteActivityEnabled = self->_isAppAndWebsiteActivityEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", isAppAndWebsiteActivityEnabled, CFSTR("AppAndWebsiteActivity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downtimeStartTime, CFSTR("DowntimeStartTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downtimeEndTime, CFSTR("DowntimeEndTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restrictions, CFSTR("Restrictions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passcode, CFSTR("Passcode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isCommunicationSafetyEnabled, CFSTR("CommunicationSafety"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isEyeReliefEnabled, CFSTR("EyeRelief"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)isAppAndWebsiteActivityEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIsAppAndWebsiteActivityEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSDateComponents)downtimeStartTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDowntimeStartTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDateComponents)downtimeEndTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDowntimeEndTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)restrictions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRestrictions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)isCommunicationSafetyEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsCommunicationSafetyEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)isEyeReliefEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIsEyeReliefEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyeReliefEnabled, 0);
  objc_storeStrong((id *)&self->_isCommunicationSafetyEnabled, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_downtimeEndTime, 0);
  objc_storeStrong((id *)&self->_downtimeStartTime, 0);
  objc_storeStrong((id *)&self->_isAppAndWebsiteActivityEnabled, 0);
}

@end
