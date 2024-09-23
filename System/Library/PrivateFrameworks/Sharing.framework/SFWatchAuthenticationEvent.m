@implementation SFWatchAuthenticationEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.WatchAuthentication");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[16];
  _QWORD v30[18];

  v30[16] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("authenticationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SFWatchAuthenticationEvent authenticationType](self, "authenticationType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v28;
  v29[1] = CFSTR("succeeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFWatchAuthenticationEvent succeeded](self, "succeeded"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v27;
  v29[2] = CFSTR("failureReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFWatchAuthenticationEvent failureReason](self, "failureReason"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  v29[3] = CFSTR("screenOn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFWatchAuthenticationEvent screenOn](self, "screenOn"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v25;
  v29[4] = CFSTR("discoveryDuration");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent discoveryDuration](self, "discoveryDuration");
  objc_msgSend(v3, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v24;
  v29[5] = CFSTR("keyExchangeDuration");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent keyExchangeDuration](self, "keyExchangeDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v23;
  v29[6] = CFSTR("awdlBringUpDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent awdlBringUpDuration](self, "awdlBringUpDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v22;
  v29[7] = CFSTR("rangingDuration");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent rangingDuration](self, "rangingDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v7;
  v29[8] = CFSTR("peerFoundDuration");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent peerFoundDuration](self, "peerFoundDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v9;
  v29[9] = CFSTR("totalDuration");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent totalDuration](self, "totalDuration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v11;
  v29[10] = CFSTR("timeSinceBoot");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent timeSinceBoot](self, "timeSinceBoot");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v13;
  v29[11] = CFSTR("timeSinceRemoteUnlocked");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[SFWatchAuthenticationEvent timeSinceRemoteUnlocked](self, "timeSinceRemoteUnlocked");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v15;
  v29[12] = CFSTR("watchHardwareModel");
  -[SFWatchAuthenticationEvent watchHardwareModel](self, "watchHardwareModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v16;
  v29[13] = CFSTR("watchSoftwareVersion");
  -[SFWatchAuthenticationEvent watchSoftwareVersion](self, "watchSoftwareVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[13] = v17;
  v29[14] = CFSTR("remoteHardwareModel");
  -[SFWatchAuthenticationEvent remoteHardwareModel](self, "remoteHardwareModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[14] = v18;
  v29[15] = CFSTR("remoteSoftwareVersion");
  -[SFWatchAuthenticationEvent remoteSoftwareVersion](self, "remoteSoftwareVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[15] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v20;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFWatchAuthenticationEvent eventName](SFWatchAuthenticationEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFWatchAuthenticationEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
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

- (void)setFailureReason:(unsigned int)a3
{
  self->_failureReason = a3;
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (double)discoveryDuration
{
  return self->_discoveryDuration;
}

- (void)setDiscoveryDuration:(double)a3
{
  self->_discoveryDuration = a3;
}

- (double)keyExchangeDuration
{
  return self->_keyExchangeDuration;
}

- (void)setKeyExchangeDuration:(double)a3
{
  self->_keyExchangeDuration = a3;
}

- (double)awdlBringUpDuration
{
  return self->_awdlBringUpDuration;
}

- (void)setAwdlBringUpDuration:(double)a3
{
  self->_awdlBringUpDuration = a3;
}

- (double)rangingDuration
{
  return self->_rangingDuration;
}

- (void)setRangingDuration:(double)a3
{
  self->_rangingDuration = a3;
}

- (double)peerFoundDuration
{
  return self->_peerFoundDuration;
}

- (void)setPeerFoundDuration:(double)a3
{
  self->_peerFoundDuration = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (double)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (void)setTimeSinceBoot:(double)a3
{
  self->_timeSinceBoot = a3;
}

- (double)timeSinceRemoteUnlocked
{
  return self->_timeSinceRemoteUnlocked;
}

- (void)setTimeSinceRemoteUnlocked:(double)a3
{
  self->_timeSinceRemoteUnlocked = a3;
}

- (NSString)watchHardwareModel
{
  return self->_watchHardwareModel;
}

- (void)setWatchHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)watchSoftwareVersion
{
  return self->_watchSoftwareVersion;
}

- (void)setWatchSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)remoteHardwareModel
{
  return self->_remoteHardwareModel;
}

- (void)setRemoteHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)remoteSoftwareVersion
{
  return self->_remoteSoftwareVersion;
}

- (void)setRemoteSoftwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_remoteHardwareModel, 0);
  objc_storeStrong((id *)&self->_watchSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_watchHardwareModel, 0);
}

@end
