@implementation SFHeadphoneProxPairingEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.HeadphoneProxPairing");
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
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  _QWORD v21[10];
  _QWORD v22[12];

  v22[10] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFHeadphoneProxPairingEvent errorCode](self, "errorCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("pairingType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFHeadphoneProxPairingEvent pairingType](self, "pairingType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v3;
  v21[2] = CFSTR("attemptedPairing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFHeadphoneProxPairingEvent attemptedPairing](self, "attemptedPairing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v4;
  v21[3] = CFSTR("pairingDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SFHeadphoneProxPairingEvent pairingDuration](self, "pairingDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  v21[4] = CFSTR("foundToFirstCardDuration");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SFHeadphoneProxPairingEvent foundToFirstCardDuration](self, "foundToFirstCardDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v8;
  v21[5] = CFSTR("triggerToFirstCardDuration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SFHeadphoneProxPairingEvent triggerToFirstCardDuration](self, "triggerToFirstCardDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v10;
  v21[6] = CFSTR("assetFetchDuration");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[SFHeadphoneProxPairingEvent assetFetchDuration](self, "assetFetchDuration");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v12;
  v21[7] = CFSTR("color");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[SFHeadphoneProxPairingEvent color](self, "color"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = CFSTR("productID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFHeadphoneProxPairingEvent productID](self, "productID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v14;
  v21[9] = CFSTR("productIDString");
  -[SFHeadphoneProxPairingEvent productIDString](self, "productIDString");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_1E483B8E8;
  if (v15)
    v17 = (const __CFString *)v15;
  v22[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v18;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFHeadphoneProxPairingEvent eventName](SFHeadphoneProxPairingEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFHeadphoneProxPairingEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)attemptedPairing
{
  return self->_attemptedPairing;
}

- (void)setAttemptedPairing:(BOOL)a3
{
  self->_attemptedPairing = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (double)pairingDuration
{
  return self->_pairingDuration;
}

- (void)setPairingDuration:(double)a3
{
  self->_pairingDuration = a3;
}

- (double)foundToFirstCardDuration
{
  return self->_foundToFirstCardDuration;
}

- (void)setFoundToFirstCardDuration:(double)a3
{
  self->_foundToFirstCardDuration = a3;
}

- (double)triggerToFirstCardDuration
{
  return self->_triggerToFirstCardDuration;
}

- (void)setTriggerToFirstCardDuration:(double)a3
{
  self->_triggerToFirstCardDuration = a3;
}

- (double)assetFetchDuration
{
  return self->_assetFetchDuration;
}

- (void)setAssetFetchDuration:(double)a3
{
  self->_assetFetchDuration = a3;
}

- (unsigned)color
{
  return self->_color;
}

- (void)setColor:(unsigned __int8)a3
{
  self->_color = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (NSString)productIDString
{
  return self->_productIDString;
}

- (void)setProductIDString:(id)a3
{
  self->_productIDString = (NSString *)a3;
}

@end
