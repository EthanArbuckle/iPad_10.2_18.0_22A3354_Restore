@implementation PKProtobufPaymentApplication

- (BOOL)hasDpanIdentifier
{
  return self->_dpanIdentifier != 0;
}

- (BOOL)hasDpanSuffix
{
  return self->_dpanSuffix != 0;
}

- (BOOL)hasSanitizedDpan
{
  return self->_sanitizedDpan != 0;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (BOOL)hasSecureElementIdenfitier
{
  return self->_secureElementIdenfitier != 0;
}

- (void)setState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSuspendedReason
{
  return self->_suspendedReason != 0;
}

- (void)setSupportsContactlessPayment:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_supportsContactlessPayment = a3;
}

- (void)setHasSupportsContactlessPayment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSupportsContactlessPayment
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSupportsInAppPayment:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_supportsInAppPayment = a3;
}

- (void)setHasSupportsInAppPayment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSupportsInAppPayment
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPaymentNetworkIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_paymentNetworkIdentifier = a3;
}

- (void)setHasPaymentNetworkIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPaymentNetworkIdentifier
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setInAppPINRequired:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_inAppPINRequired = a3;
}

- (void)setHasInAppPINRequired:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasInAppPINRequired
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInAppPINRequiredAmount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_inAppPINRequiredAmount = a3;
}

- (void)setHasInAppPINRequiredAmount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasInAppPINRequiredAmount
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasInAppPINRequiredCurrency
{
  return self->_inAppPINRequiredCurrency != 0;
}

- (void)setPaymentType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPaymentType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setAuxiliary:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_auxiliary = a3;
}

- (void)setHasAuxiliary:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAuxiliary
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setInAppPriority:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_inAppPriority = a3;
}

- (void)setHasInAppPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasInAppPriority
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAuxiliaryPaymentType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_auxiliaryPaymentType = a3;
}

- (void)setHasAuxiliaryPaymentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAuxiliaryPaymentType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasApanIdentifier
{
  return self->_apanIdentifier != 0;
}

- (BOOL)hasApanSuffix
{
  return self->_apanSuffix != 0;
}

- (void)setSupportsMerchantTokens:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_supportsMerchantTokens = a3;
}

- (void)setHasSupportsMerchantTokens:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSupportsMerchantTokens
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasCustomPrecisionInAppPINRequiredAmount
{
  return self->_customPrecisionInAppPINRequiredAmount != 0;
}

- (BOOL)hasBalanceInAppPINRequiredAmount
{
  return self->_balanceInAppPINRequiredAmount != 0;
}

- (void)setSupportsMultiTokensV2:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_supportsMultiTokensV2 = a3;
}

- (void)setHasSupportsMultiTokensV2:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSupportsMultiTokensV2
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSupportsInstantFundsIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_supportsInstantFundsIn = a3;
}

- (void)setHasSupportsInstantFundsIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSupportsInstantFundsIn
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentApplication;
  -[PKProtobufPaymentApplication description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *dpanIdentifier;
  NSString *dpanSuffix;
  NSString *sanitizedDpan;
  NSString *applicationIdentifier;
  NSString *secureElementIdenfitier;
  void *v10;
  NSString *suspendedReason;
  __int16 has;
  void *v13;
  NSString *inAppPINRequiredCurrency;
  void *v15;
  NSString *displayName;
  __int16 v17;
  void *v18;
  NSString *apanIdentifier;
  NSString *apanSuffix;
  void *v21;
  PKProtobufCustomPrecisionAmount *customPrecisionInAppPINRequiredAmount;
  void *v23;
  PKProtobufNSDecimalNumber *balanceInAppPINRequiredAmount;
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dpanIdentifier = self->_dpanIdentifier;
  if (dpanIdentifier)
    objc_msgSend(v3, "setObject:forKey:", dpanIdentifier, CFSTR("dpanIdentifier"));
  dpanSuffix = self->_dpanSuffix;
  if (dpanSuffix)
    objc_msgSend(v4, "setObject:forKey:", dpanSuffix, CFSTR("dpanSuffix"));
  sanitizedDpan = self->_sanitizedDpan;
  if (sanitizedDpan)
    objc_msgSend(v4, "setObject:forKey:", sanitizedDpan, CFSTR("sanitizedDpan"));
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  secureElementIdenfitier = self->_secureElementIdenfitier;
  if (secureElementIdenfitier)
    objc_msgSend(v4, "setObject:forKey:", secureElementIdenfitier, CFSTR("secureElementIdenfitier"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("state"));

  }
  suspendedReason = self->_suspendedReason;
  if (suspendedReason)
    objc_msgSend(v4, "setObject:forKey:", suspendedReason, CFSTR("suspendedReason"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsContactlessPayment);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("supportsContactlessPayment"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInAppPayment);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("supportsInAppPayment"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_paymentNetworkIdentifier);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("paymentNetworkIdentifier"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inAppPINRequired);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("inAppPINRequired"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_inAppPINRequiredAmount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("inAppPINRequiredAmount"));

  }
LABEL_21:
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  if (inAppPINRequiredCurrency)
    objc_msgSend(v4, "setObject:forKey:", inAppPINRequiredCurrency, CFSTR("inAppPINRequiredCurrency"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_paymentType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("paymentType"));

  }
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_auxiliary);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("auxiliary"));

    v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_29:
      if ((v17 & 4) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_inAppPriority);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("inAppPriority"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_auxiliaryPaymentType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("auxiliaryPaymentType"));

  }
LABEL_31:
  apanIdentifier = self->_apanIdentifier;
  if (apanIdentifier)
    objc_msgSend(v4, "setObject:forKey:", apanIdentifier, CFSTR("apanIdentifier"));
  apanSuffix = self->_apanSuffix;
  if (apanSuffix)
    objc_msgSend(v4, "setObject:forKey:", apanSuffix, CFSTR("apanSuffix"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMerchantTokens);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("supportsMerchantTokens"));

  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  if (customPrecisionInAppPINRequiredAmount)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](customPrecisionInAppPINRequiredAmount, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("customPrecisionInAppPINRequiredAmount"));

  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  if (balanceInAppPINRequiredAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](balanceInAppPINRequiredAmount, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("balanceInAppPINRequiredAmount"));

  }
  v26 = (__int16)self->_has;
  if ((v26 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMultiTokensV2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("supportsMultiTokensV2"));

    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInstantFundsIn);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("supportsInstantFundsIn"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentApplicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_dpanIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_dpanSuffix)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sanitizedDpan)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_secureElementIdenfitier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_suspendedReason)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_20:
    PBDataWriterWriteSint64Field();
    v4 = v7;
  }
LABEL_21:
  if (self->_inAppPINRequiredCurrency)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteSint64Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_31:
  if (self->_apanIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_apanSuffix)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_customPrecisionInAppPINRequiredAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_balanceInAppPINRequiredAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_dpanIdentifier)
  {
    objc_msgSend(v4, "setDpanIdentifier:");
    v4 = v7;
  }
  if (self->_dpanSuffix)
  {
    objc_msgSend(v7, "setDpanSuffix:");
    v4 = v7;
  }
  if (self->_sanitizedDpan)
  {
    objc_msgSend(v7, "setSanitizedDpan:");
    v4 = v7;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v7, "setApplicationIdentifier:");
    v4 = v7;
  }
  if (self->_secureElementIdenfitier)
  {
    objc_msgSend(v7, "setSecureElementIdenfitier:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_state;
    *((_WORD *)v4 + 76) |= 0x20u;
  }
  if (self->_suspendedReason)
  {
    objc_msgSend(v7, "setSuspendedReason:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_BYTE *)v4 + 146) = self->_supportsContactlessPayment;
    *((_WORD *)v4 + 76) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v4 + 147) = self->_supportsInAppPayment;
  *((_WORD *)v4 + 76) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 26) = self->_paymentNetworkIdentifier;
  *((_WORD *)v4 + 76) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_49:
  *((_BYTE *)v4 + 145) = self->_inAppPINRequired;
  *((_WORD *)v4 + 76) |= 0x80u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_20:
    *((_QWORD *)v4 + 1) = self->_inAppPINRequiredAmount;
    *((_WORD *)v4 + 76) |= 1u;
  }
LABEL_21:
  if (self->_inAppPINRequiredCurrency)
  {
    objc_msgSend(v7, "setInAppPINRequiredCurrency:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_paymentType;
    *((_WORD *)v4 + 76) |= 0x10u;
  }
  if (self->_displayName)
  {
    objc_msgSend(v7, "setDisplayName:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_BYTE *)v4 + 144) = self->_auxiliary;
    *((_WORD *)v4 + 76) |= 0x40u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  *((_QWORD *)v4 + 2) = self->_inAppPriority;
  *((_WORD *)v4 + 76) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 12) = self->_auxiliaryPaymentType;
    *((_WORD *)v4 + 76) |= 4u;
  }
LABEL_31:
  if (self->_apanIdentifier)
  {
    objc_msgSend(v7, "setApanIdentifier:");
    v4 = v7;
  }
  if (self->_apanSuffix)
  {
    objc_msgSend(v7, "setApanSuffix:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_BYTE *)v4 + 149) = self->_supportsMerchantTokens;
    *((_WORD *)v4 + 76) |= 0x800u;
  }
  if (self->_customPrecisionInAppPINRequiredAmount)
  {
    objc_msgSend(v7, "setCustomPrecisionInAppPINRequiredAmount:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *((_BYTE *)v4 + 150) = self->_supportsMultiTokensV2;
    *((_WORD *)v4 + 76) |= 0x1000u;
  }
  if (self->_balanceInAppPINRequiredAmount)
  {
    objc_msgSend(v7, "setBalanceInAppPINRequiredAmount:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_BYTE *)v4 + 148) = self->_supportsInstantFundsIn;
    *((_WORD *)v4 + 76) |= 0x400u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 has;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_dpanIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_dpanSuffix, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_sanitizedDpan, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v10;

  v12 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_secureElementIdenfitier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v14;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_state;
    *(_WORD *)(v5 + 152) |= 0x20u;
  }
  v16 = -[NSString copyWithZone:](self->_suspendedReason, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v16;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 146) = self->_supportsContactlessPayment;
    *(_WORD *)(v5 + 152) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 147) = self->_supportsInAppPayment;
  *(_WORD *)(v5 + 152) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 104) = self->_paymentNetworkIdentifier;
  *(_WORD *)(v5 + 152) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_25:
  *(_BYTE *)(v5 + 145) = self->_inAppPINRequired;
  *(_WORD *)(v5 + 152) |= 0x80u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 8) = self->_inAppPINRequiredAmount;
    *(_WORD *)(v5 + 152) |= 1u;
  }
LABEL_9:
  v19 = -[NSString copyWithZone:](self->_inAppPINRequiredCurrency, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v19;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_paymentType;
    *(_WORD *)(v5 + 152) |= 0x10u;
  }
  v21 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v21;

  v23 = (__int16)self->_has;
  if ((v23 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_auxiliary;
    *(_WORD *)(v5 + 152) |= 0x40u;
    v23 = (__int16)self->_has;
    if ((v23 & 2) == 0)
    {
LABEL_13:
      if ((v23 & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(_QWORD *)(v5 + 16) = self->_inAppPriority;
  *(_WORD *)(v5 + 152) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 48) = self->_auxiliaryPaymentType;
    *(_WORD *)(v5 + 152) |= 4u;
  }
LABEL_15:
  v24 = -[NSString copyWithZone:](self->_apanIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v24;

  v26 = -[NSString copyWithZone:](self->_apanSuffix, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v26;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 149) = self->_supportsMerchantTokens;
    *(_WORD *)(v5 + 152) |= 0x800u;
  }
  v28 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_customPrecisionInAppPINRequiredAmount, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v28;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 150) = self->_supportsMultiTokensV2;
    *(_WORD *)(v5 + 152) |= 0x1000u;
  }
  v30 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_balanceInAppPINRequiredAmount, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v30;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 148) = self->_supportsInstantFundsIn;
    *(_WORD *)(v5 + 152) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *dpanIdentifier;
  NSString *dpanSuffix;
  NSString *sanitizedDpan;
  NSString *applicationIdentifier;
  NSString *secureElementIdenfitier;
  __int16 has;
  __int16 v11;
  NSString *suspendedReason;
  NSString *inAppPINRequiredCurrency;
  NSString *displayName;
  NSString *apanIdentifier;
  NSString *apanSuffix;
  __int16 v17;
  __int16 v18;
  PKProtobufCustomPrecisionAmount *customPrecisionInAppPINRequiredAmount;
  PKProtobufNSDecimalNumber *balanceInAppPINRequiredAmount;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_112;
  dpanIdentifier = self->_dpanIdentifier;
  if ((unint64_t)dpanIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](dpanIdentifier, "isEqual:"))
      goto LABEL_112;
  }
  dpanSuffix = self->_dpanSuffix;
  if ((unint64_t)dpanSuffix | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](dpanSuffix, "isEqual:"))
      goto LABEL_112;
  }
  sanitizedDpan = self->_sanitizedDpan;
  if ((unint64_t)sanitizedDpan | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](sanitizedDpan, "isEqual:"))
      goto LABEL_112;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](applicationIdentifier, "isEqual:"))
      goto LABEL_112;
  }
  secureElementIdenfitier = self->_secureElementIdenfitier;
  if ((unint64_t)secureElementIdenfitier | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](secureElementIdenfitier, "isEqual:"))
      goto LABEL_112;
  }
  has = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 76);
  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_state != *((_DWORD *)v4 + 32))
      goto LABEL_112;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_112;
  }
  suspendedReason = self->_suspendedReason;
  if ((unint64_t)suspendedReason | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](suspendedReason, "isEqual:"))
      goto LABEL_112;
    has = (__int16)self->_has;
    v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0)
      goto LABEL_112;
    if (self->_supportsContactlessPayment)
    {
      if (!*((_BYTE *)v4 + 146))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0)
      goto LABEL_112;
    if (self->_supportsInAppPayment)
    {
      if (!*((_BYTE *)v4 + 147))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 147))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_paymentNetworkIdentifier != *((_DWORD *)v4 + 26))
      goto LABEL_112;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_112;
    if (self->_inAppPINRequired)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_inAppPINRequiredAmount != *((_QWORD *)v4 + 1))
      goto LABEL_112;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_112;
  }
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  if ((unint64_t)inAppPINRequiredCurrency | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](inAppPINRequiredCurrency, "isEqual:"))
      goto LABEL_112;
    has = (__int16)self->_has;
    v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_paymentType != *((_DWORD *)v4 + 27))
      goto LABEL_112;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_112;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_112;
    has = (__int16)self->_has;
    v11 = *((_WORD *)v4 + 76);
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0)
      goto LABEL_112;
    if (self->_auxiliary)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_112;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_inAppPriority != *((_QWORD *)v4 + 2))
      goto LABEL_112;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_112;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_auxiliaryPaymentType != *((_DWORD *)v4 + 12))
      goto LABEL_112;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_112;
  }
  apanIdentifier = self->_apanIdentifier;
  if ((unint64_t)apanIdentifier | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](apanIdentifier, "isEqual:"))
  {
    goto LABEL_112;
  }
  apanSuffix = self->_apanSuffix;
  if ((unint64_t)apanSuffix | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](apanSuffix, "isEqual:"))
      goto LABEL_112;
  }
  v17 = (__int16)self->_has;
  v18 = *((_WORD *)v4 + 76);
  if ((v17 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x800) == 0)
      goto LABEL_112;
    if (self->_supportsMerchantTokens)
    {
      if (!*((_BYTE *)v4 + 149))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 149))
    {
      goto LABEL_112;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x800) != 0)
  {
    goto LABEL_112;
  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  if ((unint64_t)customPrecisionInAppPINRequiredAmount | *((_QWORD *)v4 + 8))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionInAppPINRequiredAmount, "isEqual:"))
      goto LABEL_112;
    v17 = (__int16)self->_has;
    v18 = *((_WORD *)v4 + 76);
  }
  if ((v17 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0)
      goto LABEL_112;
    if (self->_supportsMultiTokensV2)
    {
      if (!*((_BYTE *)v4 + 150))
        goto LABEL_112;
    }
    else if (*((_BYTE *)v4 + 150))
    {
      goto LABEL_112;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_112;
  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  if ((unint64_t)balanceInAppPINRequiredAmount | *((_QWORD *)v4 + 7))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](balanceInAppPINRequiredAmount, "isEqual:"))
      goto LABEL_112;
    v17 = (__int16)self->_has;
    v18 = *((_WORD *)v4 + 76);
  }
  if ((v17 & 0x400) != 0)
  {
    if ((v18 & 0x400) != 0)
    {
      if (self->_supportsInstantFundsIn)
      {
        if (!*((_BYTE *)v4 + 148))
          goto LABEL_112;
      }
      else if (*((_BYTE *)v4 + 148))
      {
        goto LABEL_112;
      }
      v21 = 1;
      goto LABEL_113;
    }
LABEL_112:
    v21 = 0;
    goto LABEL_113;
  }
  v21 = (v18 & 0x400) == 0;
LABEL_113:

  return v21;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;

  v31 = -[NSString hash](self->_dpanIdentifier, "hash");
  v30 = -[NSString hash](self->_dpanSuffix, "hash");
  v29 = -[NSString hash](self->_sanitizedDpan, "hash");
  v28 = -[NSString hash](self->_applicationIdentifier, "hash");
  v27 = -[NSString hash](self->_secureElementIdenfitier, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v26 = 2654435761 * self->_state;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_suspendedReason, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v24 = 2654435761 * self->_supportsContactlessPayment;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      v23 = 2654435761 * self->_supportsInAppPayment;
      if ((has & 8) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
  }
  v23 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v22 = 2654435761 * self->_paymentNetworkIdentifier;
    if ((has & 0x80) != 0)
      goto LABEL_8;
LABEL_13:
    v21 = 0;
    if ((has & 1) != 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_12:
  v22 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_13;
LABEL_8:
  v21 = 2654435761 * self->_inAppPINRequired;
  if ((has & 1) != 0)
  {
LABEL_9:
    v20 = 2654435761 * self->_inAppPINRequiredAmount;
    goto LABEL_15;
  }
LABEL_14:
  v20 = 0;
LABEL_15:
  v19 = -[NSString hash](self->_inAppPINRequiredCurrency, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v18 = 2654435761 * self->_paymentType;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_displayName, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x40) == 0)
  {
    v15 = 0;
    if ((v4 & 2) != 0)
      goto LABEL_20;
LABEL_23:
    v5 = 0;
    if ((v4 & 4) != 0)
      goto LABEL_21;
    goto LABEL_24;
  }
  v15 = 2654435761 * self->_auxiliary;
  if ((v4 & 2) == 0)
    goto LABEL_23;
LABEL_20:
  v5 = 2654435761 * self->_inAppPriority;
  if ((v4 & 4) != 0)
  {
LABEL_21:
    v6 = 2654435761 * self->_auxiliaryPaymentType;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
LABEL_25:
  v7 = -[NSString hash](self->_apanIdentifier, "hash", v15);
  v8 = -[NSString hash](self->_apanSuffix, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v9 = 2654435761 * self->_supportsMerchantTokens;
  else
    v9 = 0;
  v10 = -[PKProtobufCustomPrecisionAmount hash](self->_customPrecisionInAppPINRequiredAmount, "hash");
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v11 = 2654435761 * self->_supportsMultiTokensV2;
  else
    v11 = 0;
  v12 = -[PKProtobufNSDecimalNumber hash](self->_balanceInAppPINRequiredAmount, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v13 = 2654435761 * self->_supportsInstantFundsIn;
  else
    v13 = 0;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  PKProtobufCustomPrecisionAmount *customPrecisionInAppPINRequiredAmount;
  uint64_t v8;
  PKProtobufNSDecimalNumber *balanceInAppPINRequiredAmount;
  uint64_t v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[PKProtobufPaymentApplication setDpanIdentifier:](self, "setDpanIdentifier:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PKProtobufPaymentApplication setDpanSuffix:](self, "setDpanSuffix:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[PKProtobufPaymentApplication setSanitizedDpan:](self, "setSanitizedDpan:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufPaymentApplication setApplicationIdentifier:](self, "setApplicationIdentifier:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[PKProtobufPaymentApplication setSecureElementIdenfitier:](self, "setSecureElementIdenfitier:");
    v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x20) != 0)
  {
    self->_state = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[PKProtobufPaymentApplication setSuspendedReason:](self, "setSuspendedReason:");
    v4 = v11;
  }
  v5 = *((_WORD *)v4 + 76);
  if ((v5 & 0x100) != 0)
  {
    self->_supportsContactlessPayment = *((_BYTE *)v4 + 146);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 76);
    if ((v5 & 0x200) == 0)
    {
LABEL_17:
      if ((v5 & 8) == 0)
        goto LABEL_18;
      goto LABEL_42;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x200) == 0)
  {
    goto LABEL_17;
  }
  self->_supportsInAppPayment = *((_BYTE *)v4 + 147);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 76);
  if ((v5 & 8) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  self->_paymentNetworkIdentifier = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 76);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_43:
  self->_inAppPINRequired = *((_BYTE *)v4 + 145);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 76) & 1) != 0)
  {
LABEL_20:
    self->_inAppPINRequiredAmount = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_21:
  if (*((_QWORD *)v4 + 12))
  {
    -[PKProtobufPaymentApplication setInAppPINRequiredCurrency:](self, "setInAppPINRequiredCurrency:");
    v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x10) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PKProtobufPaymentApplication setDisplayName:](self, "setDisplayName:");
    v4 = v11;
  }
  v6 = *((_WORD *)v4 + 76);
  if ((v6 & 0x40) != 0)
  {
    self->_auxiliary = *((_BYTE *)v4 + 144);
    *(_WORD *)&self->_has |= 0x40u;
    v6 = *((_WORD *)v4 + 76);
    if ((v6 & 2) == 0)
    {
LABEL_29:
      if ((v6 & 4) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_29;
  }
  self->_inAppPriority = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 76) & 4) != 0)
  {
LABEL_30:
    self->_auxiliaryPaymentType = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_31:
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufPaymentApplication setApanIdentifier:](self, "setApanIdentifier:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufPaymentApplication setApanSuffix:](self, "setApanSuffix:");
    v4 = v11;
  }
  if ((*((_WORD *)v4 + 76) & 0x800) != 0)
  {
    self->_supportsMerchantTokens = *((_BYTE *)v4 + 149);
    *(_WORD *)&self->_has |= 0x800u;
  }
  customPrecisionInAppPINRequiredAmount = self->_customPrecisionInAppPINRequiredAmount;
  v8 = *((_QWORD *)v4 + 8);
  if (customPrecisionInAppPINRequiredAmount)
  {
    if (!v8)
      goto LABEL_51;
    -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionInAppPINRequiredAmount, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_51;
    -[PKProtobufPaymentApplication setCustomPrecisionInAppPINRequiredAmount:](self, "setCustomPrecisionInAppPINRequiredAmount:");
  }
  v4 = v11;
LABEL_51:
  if ((*((_WORD *)v4 + 76) & 0x1000) != 0)
  {
    self->_supportsMultiTokensV2 = *((_BYTE *)v4 + 150);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  balanceInAppPINRequiredAmount = self->_balanceInAppPINRequiredAmount;
  v10 = *((_QWORD *)v4 + 7);
  if (balanceInAppPINRequiredAmount)
  {
    if (!v10)
      goto LABEL_59;
    -[PKProtobufNSDecimalNumber mergeFrom:](balanceInAppPINRequiredAmount, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_59;
    -[PKProtobufPaymentApplication setBalanceInAppPINRequiredAmount:](self, "setBalanceInAppPINRequiredAmount:");
  }
  v4 = v11;
LABEL_59:
  if ((*((_WORD *)v4 + 76) & 0x400) != 0)
  {
    self->_supportsInstantFundsIn = *((_BYTE *)v4 + 148);
    *(_WORD *)&self->_has |= 0x400u;
  }

}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dpanIdentifier, a3);
}

- (NSString)dpanSuffix
{
  return self->_dpanSuffix;
}

- (void)setDpanSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_dpanSuffix, a3);
}

- (NSString)sanitizedDpan
{
  return self->_sanitizedDpan;
}

- (void)setSanitizedDpan:(id)a3
{
  objc_storeStrong((id *)&self->_sanitizedDpan, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (NSString)secureElementIdenfitier
{
  return self->_secureElementIdenfitier;
}

- (void)setSecureElementIdenfitier:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementIdenfitier, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (NSString)suspendedReason
{
  return self->_suspendedReason;
}

- (void)setSuspendedReason:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedReason, a3);
}

- (BOOL)supportsContactlessPayment
{
  return self->_supportsContactlessPayment;
}

- (BOOL)supportsInAppPayment
{
  return self->_supportsInAppPayment;
}

- (unsigned)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (BOOL)inAppPINRequired
{
  return self->_inAppPINRequired;
}

- (int64_t)inAppPINRequiredAmount
{
  return self->_inAppPINRequiredAmount;
}

- (NSString)inAppPINRequiredCurrency
{
  return self->_inAppPINRequiredCurrency;
}

- (void)setInAppPINRequiredCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPINRequiredCurrency, a3);
}

- (unsigned)paymentType
{
  return self->_paymentType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)auxiliary
{
  return self->_auxiliary;
}

- (int64_t)inAppPriority
{
  return self->_inAppPriority;
}

- (unsigned)auxiliaryPaymentType
{
  return self->_auxiliaryPaymentType;
}

- (NSString)apanIdentifier
{
  return self->_apanIdentifier;
}

- (void)setApanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_apanIdentifier, a3);
}

- (NSString)apanSuffix
{
  return self->_apanSuffix;
}

- (void)setApanSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_apanSuffix, a3);
}

- (BOOL)supportsMerchantTokens
{
  return self->_supportsMerchantTokens;
}

- (PKProtobufCustomPrecisionAmount)customPrecisionInAppPINRequiredAmount
{
  return self->_customPrecisionInAppPINRequiredAmount;
}

- (void)setCustomPrecisionInAppPINRequiredAmount:(id)a3
{
  objc_storeStrong((id *)&self->_customPrecisionInAppPINRequiredAmount, a3);
}

- (PKProtobufNSDecimalNumber)balanceInAppPINRequiredAmount
{
  return self->_balanceInAppPINRequiredAmount;
}

- (void)setBalanceInAppPINRequiredAmount:(id)a3
{
  objc_storeStrong((id *)&self->_balanceInAppPINRequiredAmount, a3);
}

- (BOOL)supportsMultiTokensV2
{
  return self->_supportsMultiTokensV2;
}

- (BOOL)supportsInstantFundsIn
{
  return self->_supportsInstantFundsIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedReason, 0);
  objc_storeStrong((id *)&self->_secureElementIdenfitier, 0);
  objc_storeStrong((id *)&self->_sanitizedDpan, 0);
  objc_storeStrong((id *)&self->_inAppPINRequiredCurrency, 0);
  objc_storeStrong((id *)&self->_dpanSuffix, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_customPrecisionInAppPINRequiredAmount, 0);
  objc_storeStrong((id *)&self->_balanceInAppPINRequiredAmount, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_apanSuffix, 0);
  objc_storeStrong((id *)&self->_apanIdentifier, 0);
}

@end
