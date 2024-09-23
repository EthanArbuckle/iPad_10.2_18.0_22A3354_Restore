@implementation PKProtobufPeerPaymentMessage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2AC6550[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECURRING_PAYMENT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCurrency
{
  return self->_currency != 0;
}

- (void)setAmount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDecimalAmount
{
  return self->_decimalAmount != 0;
}

- (BOOL)hasSenderAddress
{
  return self->_senderAddress != 0;
}

- (BOOL)hasRecipientAddress
{
  return self->_recipientAddress != 0;
}

- (BOOL)hasRequestToken
{
  return self->_requestToken != 0;
}

- (BOOL)hasPaymentIdentifier
{
  return self->_paymentIdentifier != 0;
}

- (BOOL)hasTransactionIdentifier
{
  return self->_transactionIdentifier != 0;
}

- (BOOL)hasMemo
{
  return self->_memo != 0;
}

- (BOOL)hasRequestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2AC6570[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALLET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRecurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier != 0;
}

- (BOOL)hasRecurringPaymentEmoji
{
  return self->_recurringPaymentEmoji != 0;
}

- (BOOL)hasRecurringPaymentColor
{
  return self->_recurringPaymentColor != 0;
}

- (void)setRecurringPaymentStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recurringPaymentStartDate = a3;
}

- (void)setHasRecurringPaymentStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecurringPaymentStartDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasRecurringPaymentFrequency
{
  return self->_recurringPaymentFrequency != 0;
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
  v8.super_class = (Class)PKProtobufPeerPaymentMessage;
  -[PKProtobufPeerPaymentMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPeerPaymentMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  uint64_t type;
  __CFString *v7;
  NSString *currency;
  void *v9;
  PKProtobufNSDecimalNumber *decimalAmount;
  void *v11;
  NSString *senderAddress;
  NSString *recipientAddress;
  NSString *requestToken;
  NSString *paymentIdentifier;
  NSString *transactionIdentifier;
  NSString *memo;
  NSString *requestDeviceScoreIdentifier;
  uint64_t source;
  __CFString *v20;
  NSString *recurringPaymentIdentifier;
  NSString *recurringPaymentEmoji;
  NSString *recurringPaymentColor;
  void *v24;
  NSString *recurringPaymentFrequency;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2AC6550[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  currency = self->_currency;
  if (currency)
    objc_msgSend(v3, "setObject:forKey:", currency, CFSTR("currency"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("amount"));

  }
  decimalAmount = self->_decimalAmount;
  if (decimalAmount)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](decimalAmount, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("decimal_amount"));

  }
  senderAddress = self->_senderAddress;
  if (senderAddress)
    objc_msgSend(v3, "setObject:forKey:", senderAddress, CFSTR("senderAddress"));
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
    objc_msgSend(v3, "setObject:forKey:", recipientAddress, CFSTR("recipientAddress"));
  requestToken = self->_requestToken;
  if (requestToken)
    objc_msgSend(v3, "setObject:forKey:", requestToken, CFSTR("requestToken"));
  paymentIdentifier = self->_paymentIdentifier;
  if (paymentIdentifier)
    objc_msgSend(v3, "setObject:forKey:", paymentIdentifier, CFSTR("paymentIdentifier"));
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", transactionIdentifier, CFSTR("transactionIdentifier"));
  memo = self->_memo;
  if (memo)
    objc_msgSend(v3, "setObject:forKey:", memo, CFSTR("memo"));
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  if (requestDeviceScoreIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestDeviceScoreIdentifier, CFSTR("requestDeviceScoreIdentifier"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    source = self->_source;
    if (source >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E2AC6570[source];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("source"));

  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  if (recurringPaymentIdentifier)
    objc_msgSend(v3, "setObject:forKey:", recurringPaymentIdentifier, CFSTR("recurringPaymentIdentifier"));
  recurringPaymentEmoji = self->_recurringPaymentEmoji;
  if (recurringPaymentEmoji)
    objc_msgSend(v3, "setObject:forKey:", recurringPaymentEmoji, CFSTR("recurringPaymentEmoji"));
  recurringPaymentColor = self->_recurringPaymentColor;
  if (recurringPaymentColor)
    objc_msgSend(v3, "setObject:forKey:", recurringPaymentColor, CFSTR("recurringPaymentColor"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recurringPaymentStartDate);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("recurringPaymentStartDate"));

  }
  recurringPaymentFrequency = self->_recurringPaymentFrequency;
  if (recurringPaymentFrequency)
    objc_msgSend(v3, "setObject:forKey:", recurringPaymentFrequency, CFSTR("recurringPaymentFrequency"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPeerPaymentMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_currency)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteSint64Field();
    v4 = v5;
  }
  if (self->_senderAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recipientAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_requestToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_paymentIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_memo)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_requestDeviceScoreIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_recurringPaymentIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recurringPaymentEmoji)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recurringPaymentColor)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_recurringPaymentFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[37] = self->_version;
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[36] = self->_type;
    *((_BYTE *)v4 + 152) |= 8u;
  }
  if (self->_currency)
  {
    objc_msgSend(v5, "setCurrency:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_amount;
    *((_BYTE *)v4 + 152) |= 1u;
  }
  if (self->_senderAddress)
  {
    objc_msgSend(v5, "setSenderAddress:");
    v4 = v5;
  }
  if (self->_recipientAddress)
  {
    objc_msgSend(v5, "setRecipientAddress:");
    v4 = v5;
  }
  if (self->_requestToken)
  {
    objc_msgSend(v5, "setRequestToken:");
    v4 = v5;
  }
  if (self->_paymentIdentifier)
  {
    objc_msgSend(v5, "setPaymentIdentifier:");
    v4 = v5;
  }
  if (self->_transactionIdentifier)
  {
    objc_msgSend(v5, "setTransactionIdentifier:");
    v4 = v5;
  }
  if (self->_memo)
  {
    objc_msgSend(v5, "setMemo:");
    v4 = v5;
  }
  if (self->_requestDeviceScoreIdentifier)
  {
    objc_msgSend(v5, "setRequestDeviceScoreIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[32] = self->_source;
    *((_BYTE *)v4 + 152) |= 4u;
  }
  if (self->_recurringPaymentIdentifier)
  {
    objc_msgSend(v5, "setRecurringPaymentIdentifier:");
    v4 = v5;
  }
  if (self->_recurringPaymentEmoji)
  {
    objc_msgSend(v5, "setRecurringPaymentEmoji:");
    v4 = v5;
  }
  if (self->_recurringPaymentColor)
  {
    objc_msgSend(v5, "setRecurringPaymentColor:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_recurringPaymentStartDate;
    *((_BYTE *)v4 + 152) |= 2u;
  }
  if (self->_recurringPaymentFrequency)
  {
    objc_msgSend(v5, "setRecurringPaymentFrequency:");
    v4 = v5;
  }
  if (self->_decimalAmount)
  {
    objc_msgSend(v5, "setDecimalAmount:");
    v4 = v5;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 148) = self->_version;
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_type;
    *(_BYTE *)(v5 + 152) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amount;
    *(_BYTE *)(v5 + 152) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_senderAddress, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v10;

  v12 = -[NSString copyWithZone:](self->_recipientAddress, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_requestToken, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v14;

  v16 = -[NSString copyWithZone:](self->_paymentIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_transactionIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v18;

  v20 = -[NSString copyWithZone:](self->_memo, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NSString copyWithZone:](self->_requestDeviceScoreIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_source;
    *(_BYTE *)(v5 + 152) |= 4u;
  }
  v24 = -[NSString copyWithZone:](self->_recurringPaymentIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[NSString copyWithZone:](self->_recurringPaymentEmoji, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v26;

  v28 = -[NSString copyWithZone:](self->_recurringPaymentColor, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_recurringPaymentStartDate;
    *(_BYTE *)(v5 + 152) |= 2u;
  }
  v30 = -[NSString copyWithZone:](self->_recurringPaymentFrequency, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v30;

  v32 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_decimalAmount, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  char v7;
  NSString *currency;
  NSString *senderAddress;
  NSString *recipientAddress;
  NSString *requestToken;
  NSString *paymentIdentifier;
  NSString *transactionIdentifier;
  NSString *memo;
  NSString *requestDeviceScoreIdentifier;
  NSString *recurringPaymentIdentifier;
  NSString *recurringPaymentEmoji;
  NSString *recurringPaymentColor;
  NSString *recurringPaymentFrequency;
  PKProtobufNSDecimalNumber *decimalAmount;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  if (self->_version != *((_DWORD *)v4 + 37))
    goto LABEL_52;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_52;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 152);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 8) == 0 || self->_type != *((_DWORD *)v4 + 36))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 152) & 8) != 0)
  {
    goto LABEL_52;
  }
  currency = self->_currency;
  if ((unint64_t)currency | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](currency, "isEqual:"))
    {
LABEL_52:
      v21 = 0;
      goto LABEL_53;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 152);
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_amount != *((_QWORD *)v4 + 1))
      goto LABEL_52;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_52;
  }
  senderAddress = self->_senderAddress;
  if ((unint64_t)senderAddress | *((_QWORD *)v4 + 15)
    && !-[NSString isEqual:](senderAddress, "isEqual:"))
  {
    goto LABEL_52;
  }
  recipientAddress = self->_recipientAddress;
  if ((unint64_t)recipientAddress | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](recipientAddress, "isEqual:"))
      goto LABEL_52;
  }
  requestToken = self->_requestToken;
  if ((unint64_t)requestToken | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](requestToken, "isEqual:"))
      goto LABEL_52;
  }
  paymentIdentifier = self->_paymentIdentifier;
  if ((unint64_t)paymentIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](paymentIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  transactionIdentifier = self->_transactionIdentifier;
  if ((unint64_t)transactionIdentifier | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](transactionIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  memo = self->_memo;
  if ((unint64_t)memo | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](memo, "isEqual:"))
      goto LABEL_52;
  }
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  if ((unint64_t)requestDeviceScoreIdentifier | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](requestDeviceScoreIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 4) == 0 || self->_source != *((_DWORD *)v4 + 32))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 152) & 4) != 0)
  {
    goto LABEL_52;
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  if ((unint64_t)recurringPaymentIdentifier | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:"))
  {
    goto LABEL_52;
  }
  recurringPaymentEmoji = self->_recurringPaymentEmoji;
  if ((unint64_t)recurringPaymentEmoji | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](recurringPaymentEmoji, "isEqual:"))
      goto LABEL_52;
  }
  recurringPaymentColor = self->_recurringPaymentColor;
  if ((unint64_t)recurringPaymentColor | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](recurringPaymentColor, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 152) & 2) == 0 || self->_recurringPaymentStartDate != *((double *)v4 + 2))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
    goto LABEL_52;
  }
  recurringPaymentFrequency = self->_recurringPaymentFrequency;
  if ((unint64_t)recurringPaymentFrequency | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](recurringPaymentFrequency, "isEqual:"))
  {
    goto LABEL_52;
  }
  decimalAmount = self->_decimalAmount;
  if ((unint64_t)decimalAmount | *((_QWORD *)v4 + 4))
    v21 = -[PKProtobufNSDecimalNumber isEqual:](decimalAmount, "isEqual:");
  else
    v21 = 1;
LABEL_53:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  double recurringPaymentStartDate;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  NSUInteger v25;
  unsigned int version;

  version = self->_version;
  v25 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v24 = 2654435761 * self->_type;
  else
    v24 = 0;
  v23 = -[NSString hash](self->_currency, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v22 = 2654435761 * self->_amount;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_senderAddress, "hash");
  v20 = -[NSString hash](self->_recipientAddress, "hash");
  v19 = -[NSString hash](self->_requestToken, "hash");
  v18 = -[NSString hash](self->_paymentIdentifier, "hash");
  v3 = -[NSString hash](self->_transactionIdentifier, "hash");
  v4 = -[NSString hash](self->_memo, "hash");
  v5 = -[NSString hash](self->_requestDeviceScoreIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_source;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_recurringPaymentIdentifier, "hash");
  v8 = -[NSString hash](self->_recurringPaymentEmoji, "hash");
  v9 = -[NSString hash](self->_recurringPaymentColor, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    recurringPaymentStartDate = self->_recurringPaymentStartDate;
    v12 = -recurringPaymentStartDate;
    if (recurringPaymentStartDate >= 0.0)
      v12 = self->_recurringPaymentStartDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = v25 ^ v24 ^ v23 ^ v22 ^ (2654435761 * version) ^ v21 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v16 = v10 ^ -[NSString hash](self->_recurringPaymentFrequency, "hash");
  return v15 ^ v16 ^ -[PKProtobufNSDecimalNumber hash](self->_decimalAmount, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PKProtobufNSDecimalNumber *decimalAmount;
  uint64_t v6;
  id v7;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 37);
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufPeerPaymentMessage setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 152) & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 36);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufPeerPaymentMessage setCurrency:](self, "setCurrency:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 152) & 1) != 0)
  {
    self->_amount = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[PKProtobufPeerPaymentMessage setSenderAddress:](self, "setSenderAddress:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[PKProtobufPeerPaymentMessage setRecipientAddress:](self, "setRecipientAddress:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[PKProtobufPeerPaymentMessage setRequestToken:](self, "setRequestToken:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufPeerPaymentMessage setPaymentIdentifier:](self, "setPaymentIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[PKProtobufPeerPaymentMessage setTransactionIdentifier:](self, "setTransactionIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufPeerPaymentMessage setMemo:](self, "setMemo:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PKProtobufPeerPaymentMessage setRequestDeviceScoreIdentifier:](self, "setRequestDeviceScoreIdentifier:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 152) & 4) != 0)
  {
    self->_source = *((_DWORD *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentIdentifier:](self, "setRecurringPaymentIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentEmoji:](self, "setRecurringPaymentEmoji:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentColor:](self, "setRecurringPaymentColor:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 152) & 2) != 0)
  {
    self->_recurringPaymentStartDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PKProtobufPeerPaymentMessage setRecurringPaymentFrequency:](self, "setRecurringPaymentFrequency:");
    v4 = v7;
  }
  decimalAmount = self->_decimalAmount;
  v6 = *((_QWORD *)v4 + 4);
  if (decimalAmount)
  {
    if (v6)
    {
      -[PKProtobufNSDecimalNumber mergeFrom:](decimalAmount, "mergeFrom:");
LABEL_40:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[PKProtobufPeerPaymentMessage setDecimalAmount:](self, "setDecimalAmount:");
    goto LABEL_40;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (int64_t)amount
{
  return self->_amount;
}

- (PKProtobufNSDecimalNumber)decimalAmount
{
  return self->_decimalAmount;
}

- (void)setDecimalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_decimalAmount, a3);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddress, a3);
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_paymentIdentifier, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transactionIdentifier, a3);
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_storeStrong((id *)&self->_memo, a3);
}

- (NSString)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, a3);
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, a3);
}

- (NSString)recurringPaymentEmoji
{
  return self->_recurringPaymentEmoji;
}

- (void)setRecurringPaymentEmoji:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentEmoji, a3);
}

- (NSString)recurringPaymentColor
{
  return self->_recurringPaymentColor;
}

- (void)setRecurringPaymentColor:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentColor, a3);
}

- (double)recurringPaymentStartDate
{
  return self->_recurringPaymentStartDate;
}

- (NSString)recurringPaymentFrequency
{
  return self->_recurringPaymentFrequency;
}

- (void)setRecurringPaymentFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentFrequency, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentFrequency, 0);
  objc_storeStrong((id *)&self->_recurringPaymentEmoji, 0);
  objc_storeStrong((id *)&self->_recurringPaymentColor, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_decimalAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end
