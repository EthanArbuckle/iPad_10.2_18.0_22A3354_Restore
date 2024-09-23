@implementation SFPairedUnlockDailyEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.PairedUnlock.Daily");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[9];

  v18[8] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("successfulAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockDailyEvent successfulAttempts](self, "successfulAttempts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("failedAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockDailyEvent failedAttempts](self, "failedAttempts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("totalAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockDailyEvent totalAttempts](self, "totalAttempts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v17[3] = CFSTR("passcodeUnlocks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockDailyEvent passcodeUnlocks](self, "passcodeUnlocks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v6;
  v17[4] = CFSTR("totalUnlocks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockDailyEvent totalUnlocks](self, "totalUnlocks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v7;
  v17[5] = CFSTR("phoneSoftwareVersion");
  -[SFPairedUnlockDailyEvent phoneSoftwareVersion](self, "phoneSoftwareVersion");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E483B8E8;
  v18[5] = v10;
  v17[6] = CFSTR("phoneHardwareModel");
  -[SFPairedUnlockDailyEvent phoneHardwareModel](self, "phoneHardwareModel");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E483B8E8;
  v18[6] = v13;
  v17[7] = CFSTR("phoneAutoUnlockEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockDailyEvent phoneAutoUnlockEnabled](self, "phoneAutoUnlockEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFPairedUnlockDailyEvent eventName](SFPairedUnlockDailyEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFPairedUnlockDailyEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (int64_t)successfulAttempts
{
  return self->_successfulAttempts;
}

- (void)setSuccessfulAttempts:(int64_t)a3
{
  self->_successfulAttempts = a3;
}

- (int64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (void)setFailedAttempts:(int64_t)a3
{
  self->_failedAttempts = a3;
}

- (int64_t)totalAttempts
{
  return self->_totalAttempts;
}

- (void)setTotalAttempts:(int64_t)a3
{
  self->_totalAttempts = a3;
}

- (int64_t)passcodeUnlocks
{
  return self->_passcodeUnlocks;
}

- (void)setPasscodeUnlocks:(int64_t)a3
{
  self->_passcodeUnlocks = a3;
}

- (int64_t)totalUnlocks
{
  return self->_totalUnlocks;
}

- (void)setTotalUnlocks:(int64_t)a3
{
  self->_totalUnlocks = a3;
}

- (BOOL)phoneAutoUnlockEnabled
{
  return self->_phoneAutoUnlockEnabled;
}

- (void)setPhoneAutoUnlockEnabled:(BOOL)a3
{
  self->_phoneAutoUnlockEnabled = a3;
}

- (NSString)phoneHardwareModel
{
  return self->_phoneHardwareModel;
}

- (void)setPhoneHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)phoneSoftwareVersion
{
  return self->_phoneSoftwareVersion;
}

- (void)setPhoneSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_phoneHardwareModel, 0);
}

@end
