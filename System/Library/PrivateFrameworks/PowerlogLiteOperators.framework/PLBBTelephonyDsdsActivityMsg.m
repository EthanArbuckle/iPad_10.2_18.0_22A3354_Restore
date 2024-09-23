@implementation PLBBTelephonyDsdsActivityMsg

- (NSString)campedRAT
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (PLBBTelephonyDsdsActivityMsg)init
{
  PLBBTelephonyDsdsActivityMsg *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLBBTelephonyDsdsActivityMsg;
  v2 = -[PLBBTelephonyDsdsActivityMsg init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBTelephonyDsdsActivityMsg setSignalStrengthLogTimestamp:](v2, "setSignalStrengthLogTimestamp:", v3);

    -[PLBBTelephonyDsdsActivityMsg setSignalBars:](v2, "setSignalBars:", 0);
    -[PLBBTelephonyDsdsActivityMsg setCampedRAT:](v2, "setCampedRAT:", 0);
    -[PLBBTelephonyDsdsActivityMsg setSimStatus:](v2, "setSimStatus:", 0);
    -[PLBBTelephonyDsdsActivityMsg setCallStatus:](v2, "setCallStatus:", CFSTR("Inactive"));
  }
  return v2;
}

- (NSDate)signalStrengthLogTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignalStrengthLogTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)signalBars
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignalBars:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setCampedRAT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSimStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)callStatus
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)currentRAT
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentRAT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)preferredRAT
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreferredRAT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredRAT, 0);
  objc_storeStrong((id *)&self->_currentRAT, 0);
  objc_storeStrong((id *)&self->_callStatus, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_campedRAT, 0);
  objc_storeStrong((id *)&self->_signalBars, 0);
  objc_storeStrong((id *)&self->_signalStrengthLogTimestamp, 0);
}

@end
