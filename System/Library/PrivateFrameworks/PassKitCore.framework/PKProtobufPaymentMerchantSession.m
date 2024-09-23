@implementation PKProtobufPaymentMerchantSession

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (void)setEpochTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_epochTimestamp = a3;
}

- (void)setHasEpochTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpochTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasRetryNonce
{
  return self->_retryNonce != 0;
}

- (void)setExpiresAt:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expiresAt = a3;
}

- (void)setHasExpiresAt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpiresAt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasInitiativeContext
{
  return self->_initiativeContext != 0;
}

- (BOOL)hasInitiative
{
  return self->_initiative != 0;
}

- (void)clearSignedFields
{
  -[NSMutableArray removeAllObjects](self->_signedFields, "removeAllObjects");
}

- (void)addSignedFields:(id)a3
{
  id v4;
  NSMutableArray *signedFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  signedFields = self->_signedFields;
  v8 = v4;
  if (!signedFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_signedFields;
    self->_signedFields = v6;

    v4 = v8;
    signedFields = self->_signedFields;
  }
  -[NSMutableArray addObject:](signedFields, "addObject:", v4);

}

- (unint64_t)signedFieldsCount
{
  return -[NSMutableArray count](self->_signedFields, "count");
}

- (id)signedFieldsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_signedFields, "objectAtIndex:", a3);
}

+ (Class)signedFieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAmpEnrollmentPinning
{
  return self->_ampEnrollmentPinning != 0;
}

- (BOOL)hasOperationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier != 0;
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
  v8.super_class = (Class)PKProtobufPaymentMerchantSession;
  -[PKProtobufPaymentMerchantSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMerchantSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *merchantIdentifier;
  NSString *sessionIdentifier;
  NSString *nonce;
  void *v8;
  NSString *domain;
  NSString *displayName;
  NSData *signature;
  NSString *retryNonce;
  void *v13;
  NSString *initiativeContext;
  NSString *initiative;
  NSMutableArray *signedFields;
  NSData *ampEnrollmentPinning;
  NSString *operationalAnalyticsIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier)
    objc_msgSend(v3, "setObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  nonce = self->_nonce;
  if (nonce)
    objc_msgSend(v4, "setObject:forKey:", nonce, CFSTR("nonce"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_epochTimestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("epochTimestamp"));

  }
  domain = self->_domain;
  if (domain)
    objc_msgSend(v4, "setObject:forKey:", domain, CFSTR("domain"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  signature = self->_signature;
  if (signature)
    objc_msgSend(v4, "setObject:forKey:", signature, CFSTR("signature"));
  retryNonce = self->_retryNonce;
  if (retryNonce)
    objc_msgSend(v4, "setObject:forKey:", retryNonce, CFSTR("retryNonce"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_expiresAt);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("expiresAt"));

  }
  initiativeContext = self->_initiativeContext;
  if (initiativeContext)
    objc_msgSend(v4, "setObject:forKey:", initiativeContext, CFSTR("initiativeContext"));
  initiative = self->_initiative;
  if (initiative)
    objc_msgSend(v4, "setObject:forKey:", initiative, CFSTR("initiative"));
  signedFields = self->_signedFields;
  if (signedFields)
    objc_msgSend(v4, "setObject:forKey:", signedFields, CFSTR("signedFields"));
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if (ampEnrollmentPinning)
    objc_msgSend(v4, "setObject:forKey:", ampEnrollmentPinning, CFSTR("ampEnrollmentPinning"));
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  if (operationalAnalyticsIdentifier)
    objc_msgSend(v4, "setObject:forKey:", operationalAnalyticsIdentifier, CFSTR("operationalAnalyticsIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentMerchantSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_merchantIdentifier)
    PBDataWriterWriteStringField();
  if (self->_sessionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_nonce)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_signature)
    PBDataWriterWriteDataField();
  if (self->_retryNonce)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_initiativeContext)
    PBDataWriterWriteStringField();
  if (self->_initiative)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_signedFields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_ampEnrollmentPinning)
    PBDataWriterWriteDataField();
  if (self->_operationalAnalyticsIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_merchantIdentifier)
  {
    objc_msgSend(v4, "setMerchantIdentifier:");
    v4 = v10;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v10, "setSessionIdentifier:");
    v4 = v10;
  }
  if (self->_nonce)
  {
    objc_msgSend(v10, "setNonce:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_epochTimestamp;
    *((_BYTE *)v4 + 120) |= 1u;
  }
  if (self->_domain)
  {
    objc_msgSend(v10, "setDomain:");
    v4 = v10;
  }
  if (self->_displayName)
  {
    objc_msgSend(v10, "setDisplayName:");
    v4 = v10;
  }
  if (self->_signature)
  {
    objc_msgSend(v10, "setSignature:");
    v4 = v10;
  }
  if (self->_retryNonce)
  {
    objc_msgSend(v10, "setRetryNonce:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_expiresAt;
    *((_BYTE *)v4 + 120) |= 2u;
  }
  if (self->_initiativeContext)
    objc_msgSend(v10, "setInitiativeContext:");
  if (self->_initiative)
    objc_msgSend(v10, "setInitiative:");
  if (-[PKProtobufPaymentMerchantSession signedFieldsCount](self, "signedFieldsCount"))
  {
    objc_msgSend(v10, "clearSignedFields");
    v5 = -[PKProtobufPaymentMerchantSession signedFieldsCount](self, "signedFieldsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PKProtobufPaymentMerchantSession signedFieldsAtIndex:](self, "signedFieldsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSignedFields:", v8);

      }
    }
  }
  if (self->_ampEnrollmentPinning)
    objc_msgSend(v10, "setAmpEnrollmentPinning:");
  v9 = v10;
  if (self->_operationalAnalyticsIdentifier)
  {
    objc_msgSend(v10, "setOperationalAnalyticsIdentifier:");
    v9 = v10;
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
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  v10 = -[NSString copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_epochTimestamp;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_retryNonce, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_expiresAt;
    *(_BYTE *)(v5 + 120) |= 2u;
  }
  v20 = -[NSString copyWithZone:](self->_initiativeContext, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSString copyWithZone:](self->_initiative, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = self->_signedFields;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend((id)v5, "addSignedFields:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v26);
  }

  v30 = -[NSData copyWithZone:](self->_ampEnrollmentPinning, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v30;

  v32 = -[NSString copyWithZone:](self->_operationalAnalyticsIdentifier, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *merchantIdentifier;
  NSString *sessionIdentifier;
  NSString *nonce;
  NSString *domain;
  NSString *displayName;
  NSData *signature;
  NSString *retryNonce;
  NSString *initiativeContext;
  NSString *initiative;
  NSMutableArray *signedFields;
  NSData *ampEnrollmentPinning;
  NSString *operationalAnalyticsIdentifier;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](nonce, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_epochTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
LABEL_36:
    v17 = 0;
    goto LABEL_37;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](domain, "isEqual:"))
    goto LABEL_36;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_36;
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](signature, "isEqual:"))
      goto LABEL_36;
  }
  retryNonce = self->_retryNonce;
  if ((unint64_t)retryNonce | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](retryNonce, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_expiresAt != *((_QWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    goto LABEL_36;
  }
  initiativeContext = self->_initiativeContext;
  if ((unint64_t)initiativeContext | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](initiativeContext, "isEqual:"))
  {
    goto LABEL_36;
  }
  initiative = self->_initiative;
  if ((unint64_t)initiative | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](initiative, "isEqual:"))
      goto LABEL_36;
  }
  signedFields = self->_signedFields;
  if ((unint64_t)signedFields | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](signedFields, "isEqual:"))
      goto LABEL_36;
  }
  ampEnrollmentPinning = self->_ampEnrollmentPinning;
  if ((unint64_t)ampEnrollmentPinning | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](ampEnrollmentPinning, "isEqual:"))
      goto LABEL_36;
  }
  operationalAnalyticsIdentifier = self->_operationalAnalyticsIdentifier;
  if ((unint64_t)operationalAnalyticsIdentifier | *((_QWORD *)v4 + 10))
    v17 = -[NSString isEqual:](operationalAnalyticsIdentifier, "isEqual:");
  else
    v17 = 1;
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v17;

  v17 = -[NSString hash](self->_merchantIdentifier, "hash");
  v3 = -[NSString hash](self->_sessionIdentifier, "hash");
  v4 = -[NSString hash](self->_nonce, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_epochTimestamp;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_domain, "hash");
  v7 = -[NSString hash](self->_displayName, "hash");
  v8 = -[NSData hash](self->_signature, "hash");
  v9 = -[NSString hash](self->_retryNonce, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761u * self->_expiresAt;
  else
    v10 = 0;
  v11 = v3 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  v12 = v9 ^ v10 ^ -[NSString hash](self->_initiativeContext, "hash");
  v13 = v11 ^ v12 ^ -[NSString hash](self->_initiative, "hash");
  v14 = -[NSMutableArray hash](self->_signedFields, "hash");
  v15 = v14 ^ -[NSData hash](self->_ampEnrollmentPinning, "hash");
  return v13 ^ v15 ^ -[NSString hash](self->_operationalAnalyticsIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[PKProtobufPaymentMerchantSession setMerchantIdentifier:](self, "setMerchantIdentifier:");
  if (*((_QWORD *)v4 + 12))
    -[PKProtobufPaymentMerchantSession setSessionIdentifier:](self, "setSessionIdentifier:");
  if (*((_QWORD *)v4 + 9))
    -[PKProtobufPaymentMerchantSession setNonce:](self, "setNonce:");
  if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    self->_epochTimestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[PKProtobufPaymentMerchantSession setDomain:](self, "setDomain:");
  if (*((_QWORD *)v4 + 4))
    -[PKProtobufPaymentMerchantSession setDisplayName:](self, "setDisplayName:");
  if (*((_QWORD *)v4 + 13))
    -[PKProtobufPaymentMerchantSession setSignature:](self, "setSignature:");
  if (*((_QWORD *)v4 + 11))
    -[PKProtobufPaymentMerchantSession setRetryNonce:](self, "setRetryNonce:");
  if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    self->_expiresAt = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[PKProtobufPaymentMerchantSession setInitiativeContext:](self, "setInitiativeContext:");
  if (*((_QWORD *)v4 + 6))
    -[PKProtobufPaymentMerchantSession setInitiative:](self, "setInitiative:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 14);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PKProtobufPaymentMerchantSession addSignedFields:](self, "addSignedFields:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[PKProtobufPaymentMerchantSession setAmpEnrollmentPinning:](self, "setAmpEnrollmentPinning:");
  if (*((_QWORD *)v4 + 10))
    -[PKProtobufPaymentMerchantSession setOperationalAnalyticsIdentifier:](self, "setOperationalAnalyticsIdentifier:");

}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_merchantIdentifier, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (unint64_t)epochTimestamp
{
  return self->_epochTimestamp;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void)setRetryNonce:(id)a3
{
  objc_storeStrong((id *)&self->_retryNonce, a3);
}

- (unint64_t)expiresAt
{
  return self->_expiresAt;
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (void)setInitiativeContext:(id)a3
{
  objc_storeStrong((id *)&self->_initiativeContext, a3);
}

- (NSString)initiative
{
  return self->_initiative;
}

- (void)setInitiative:(id)a3
{
  objc_storeStrong((id *)&self->_initiative, a3);
}

- (NSMutableArray)signedFields
{
  return self->_signedFields;
}

- (void)setSignedFields:(id)a3
{
  objc_storeStrong((id *)&self->_signedFields, a3);
}

- (NSData)ampEnrollmentPinning
{
  return self->_ampEnrollmentPinning;
}

- (void)setAmpEnrollmentPinning:(id)a3
{
  objc_storeStrong((id *)&self->_ampEnrollmentPinning, a3);
}

- (NSString)operationalAnalyticsIdentifier
{
  return self->_operationalAnalyticsIdentifier;
}

- (void)setOperationalAnalyticsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_operationalAnalyticsIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_retryNonce, 0);
  objc_storeStrong((id *)&self->_operationalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_ampEnrollmentPinning, 0);
}

@end
