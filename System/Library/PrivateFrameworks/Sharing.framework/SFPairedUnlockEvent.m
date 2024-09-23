@implementation SFPairedUnlockEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.PairedUnlock.PhoneAttempt");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[16];
  _QWORD v26[18];

  v26[16] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("succeeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent succeeded](self, "succeeded"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v24;
  v25[1] = CFSTR("failureReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[SFPairedUnlockEvent failureReason](self, "failureReason"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v25[2] = CFSTR("attemptHourLocal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[SFPairedUnlockEvent attemptHourLocal](self, "attemptHourLocal"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v22;
  v25[3] = CFSTR("phoneAutoUnlockEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent phoneAutoUnlockEnabled](self, "phoneAutoUnlockEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v25[4] = CFSTR("canRelock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent canRelock](self, "canRelock"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v20;
  v25[5] = CFSTR("relockedWatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent relockedWatch](self, "relockedWatch"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v19;
  v25[6] = CFSTR("phoneState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFPairedUnlockEvent phoneState](self, "phoneState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v18;
  v25[7] = CFSTR("usingEscrowRecord");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent usingEscrowRecord](self, "usingEscrowRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v3;
  v25[8] = CFSTR("retriedWithEscrowRecord");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFPairedUnlockEvent retriedWithEscrowRecord](self, "retriedWithEscrowRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v4;
  v25[9] = CFSTR("watchSoftwareVersion");
  -[SFPairedUnlockEvent watchSoftwareVersion](self, "watchSoftwareVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E483B8E8;
  v26[9] = v7;
  v25[10] = CFSTR("watchHardwareModel");
  -[SFPairedUnlockEvent watchHardwareModel](self, "watchHardwareModel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E483B8E8;
  v26[10] = v10;
  v25[11] = CFSTR("keyExchangeDurationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockEvent keyExchangeDuration](self, "keyExchangeDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[11] = v11;
  v25[12] = CFSTR("pillDelayMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockEvent pillDelay](self, "pillDelay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[12] = v12;
  v25[13] = CFSTR("confirmationDurationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockEvent confirmationDuration](self, "confirmationDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[13] = v13;
  v25[14] = CFSTR("totalUnlockProcessDurationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockEvent totalUnlockProcessDuration](self, "totalUnlockProcessDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[14] = v14;
  v25[15] = CFSTR("totalUnlockDurationMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFPairedUnlockEvent totalUnlockDuration](self, "totalUnlockDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[15] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFPairedUnlockEvent eventName](SFPairedUnlockEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFPairedUnlockEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (unsigned)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unsigned __int16)a3
{
  self->_failureReason = a3;
}

- (unsigned)attemptHourLocal
{
  return self->_attemptHourLocal;
}

- (void)setAttemptHourLocal:(unsigned __int16)a3
{
  self->_attemptHourLocal = a3;
}

- (BOOL)phoneAutoUnlockEnabled
{
  return self->_phoneAutoUnlockEnabled;
}

- (void)setPhoneAutoUnlockEnabled:(BOOL)a3
{
  self->_phoneAutoUnlockEnabled = a3;
}

- (BOOL)canRelock
{
  return self->_canRelock;
}

- (void)setCanRelock:(BOOL)a3
{
  self->_canRelock = a3;
}

- (BOOL)relockedWatch
{
  return self->_relockedWatch;
}

- (void)setRelockedWatch:(BOOL)a3
{
  self->_relockedWatch = a3;
}

- (NSString)bannerDismissReason
{
  return self->_bannerDismissReason;
}

- (void)setBannerDismissReason:(id)a3
{
  self->_bannerDismissReason = (NSString *)a3;
}

- (int64_t)bannerDismissalCount
{
  return self->_bannerDismissalCount;
}

- (void)setBannerDismissalCount:(int64_t)a3
{
  self->_bannerDismissalCount = a3;
}

- (int64_t)phoneState
{
  return self->_phoneState;
}

- (void)setPhoneState:(int64_t)a3
{
  self->_phoneState = a3;
}

- (BOOL)usingEscrowRecord
{
  return self->_usingEscrowRecord;
}

- (void)setUsingEscrowRecord:(BOOL)a3
{
  self->_usingEscrowRecord = a3;
}

- (BOOL)retriedWithEscrowRecord
{
  return self->_retriedWithEscrowRecord;
}

- (void)setRetriedWithEscrowRecord:(BOOL)a3
{
  self->_retriedWithEscrowRecord = a3;
}

- (NSString)watchHardwareModel
{
  return self->_watchHardwareModel;
}

- (void)setWatchHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)watchSoftwareVersion
{
  return self->_watchSoftwareVersion;
}

- (void)setWatchSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)keyExchangeDuration
{
  return self->_keyExchangeDuration;
}

- (void)setKeyExchangeDuration:(unsigned int)a3
{
  self->_keyExchangeDuration = a3;
}

- (unsigned)pillDelay
{
  return self->_pillDelay;
}

- (void)setPillDelay:(unsigned int)a3
{
  self->_pillDelay = a3;
}

- (unsigned)confirmationDuration
{
  return self->_confirmationDuration;
}

- (void)setConfirmationDuration:(unsigned int)a3
{
  self->_confirmationDuration = a3;
}

- (unsigned)totalUnlockProcessDuration
{
  return self->_totalUnlockProcessDuration;
}

- (void)setTotalUnlockProcessDuration:(unsigned int)a3
{
  self->_totalUnlockProcessDuration = a3;
}

- (unsigned)totalUnlockDuration
{
  return self->_totalUnlockDuration;
}

- (void)setTotalUnlockDuration:(unsigned int)a3
{
  self->_totalUnlockDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_watchHardwareModel, 0);
}

@end
