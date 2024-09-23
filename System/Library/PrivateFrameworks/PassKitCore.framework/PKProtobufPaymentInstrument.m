@implementation PKProtobufPaymentInstrument

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasPassID
{
  return self->_passID != 0;
}

- (void)clearPaymentApplications
{
  -[NSMutableArray removeAllObjects](self->_paymentApplications, "removeAllObjects");
}

- (void)addPaymentApplications:(id)a3
{
  id v4;
  NSMutableArray *paymentApplications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paymentApplications = self->_paymentApplications;
  v8 = v4;
  if (!paymentApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_paymentApplications;
    self->_paymentApplications = v6;

    v4 = v8;
    paymentApplications = self->_paymentApplications;
  }
  -[NSMutableArray addObject:](paymentApplications, "addObject:", v4);

}

- (unint64_t)paymentApplicationsCount
{
  return -[NSMutableArray count](self->_paymentApplications, "count");
}

- (id)paymentApplicationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentApplications, "objectAtIndex:", a3);
}

+ (Class)paymentApplicationsType
{
  return (Class)objc_opt_class();
}

- (void)setIngestedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ingestedDate = a3;
}

- (void)setHasIngestedDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIngestedDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
}

- (BOOL)hasPrimaryAccountIdentifier
{
  return self->_primaryAccountIdentifier != 0;
}

- (void)clearAssociatedWebDomains
{
  -[NSMutableArray removeAllObjects](self->_associatedWebDomains, "removeAllObjects");
}

- (void)addAssociatedWebDomains:(id)a3
{
  id v4;
  NSMutableArray *associatedWebDomains;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  associatedWebDomains = self->_associatedWebDomains;
  v8 = v4;
  if (!associatedWebDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_associatedWebDomains;
    self->_associatedWebDomains = v6;

    v4 = v8;
    associatedWebDomains = self->_associatedWebDomains;
  }
  -[NSMutableArray addObject:](associatedWebDomains, "addObject:", v4);

}

- (unint64_t)associatedWebDomainsCount
{
  return -[NSMutableArray count](self->_associatedWebDomains, "count");
}

- (id)associatedWebDomainsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_associatedWebDomains, "objectAtIndex:", a3);
}

+ (Class)associatedWebDomainsType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsAutomaticSelection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_supportsAutomaticSelection = a3;
}

- (void)setHasSupportsAutomaticSelection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsAutomaticSelection
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasIssuerCountryCode
{
  return self->_issuerCountryCode != 0;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (void)setHasHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasHasAssociatedPeerPaymentAccount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasPeerPaymentAccountCurrency
{
  return self->_peerPaymentAccountCurrency != 0;
}

- (void)setPeerPaymentAccountBalance:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_peerPaymentAccountBalance = a3;
}

- (void)setHasPeerPaymentAccountBalance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPeerPaymentAccountBalance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPeerPaymentAccountState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_peerPaymentAccountState = a3;
}

- (void)setHasPeerPaymentAccountState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeerPaymentAccountState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasCustomPrecisionPeerPaymentAccountBalance
{
  return self->_customPrecisionPeerPaymentAccountBalance != 0;
}

- (BOOL)hasDecimalAccountBalance
{
  return self->_decimalAccountBalance != 0;
}

- (void)setAssociatedAccountFeatureIdentifier:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_associatedAccountFeatureIdentifier = a3;
}

- (void)setHasAssociatedAccountFeatureIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAssociatedAccountFeatureIdentifier
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCobranded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_cobranded = a3;
}

- (void)setHasCobranded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCobranded
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasCobrandName
{
  return self->_cobrandName != 0;
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
  v8.super_class = (Class)PKProtobufPaymentInstrument;
  -[PKProtobufPaymentInstrument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *displayName;
  NSString *passID;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSString *primaryAccountNumberSuffix;
  NSData *manifestHash;
  NSString *primaryAccountIdentifier;
  NSMutableArray *associatedWebDomains;
  void *v19;
  NSString *issuerCountryCode;
  void *v21;
  NSString *peerPaymentAccountCurrency;
  char has;
  void *v24;
  void *v25;
  NSString *organizationName;
  PKProtobufCustomPrecisionAmount *customPrecisionPeerPaymentAccountBalance;
  void *v28;
  PKProtobufNSDecimalNumber *decimalAccountBalance;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  NSString *cobrandName;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  passID = self->_passID;
  if (passID)
    objc_msgSend(v4, "setObject:forKey:", passID, CFSTR("passID"));
  if (-[NSMutableArray count](self->_paymentApplications, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_paymentApplications, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = self->_paymentApplications;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v36);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("paymentApplications"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ingestedDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("ingestedDate"));

  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix)
    objc_msgSend(v4, "setObject:forKey:", primaryAccountNumberSuffix, CFSTR("primaryAccountNumberSuffix"));
  manifestHash = self->_manifestHash;
  if (manifestHash)
    objc_msgSend(v4, "setObject:forKey:", manifestHash, CFSTR("manifestHash"));
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if (primaryAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  associatedWebDomains = self->_associatedWebDomains;
  if (associatedWebDomains)
    objc_msgSend(v4, "setObject:forKey:", associatedWebDomains, CFSTR("associatedWebDomains"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAutomaticSelection);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportsAutomaticSelection"));

  }
  issuerCountryCode = self->_issuerCountryCode;
  if (issuerCountryCode)
    objc_msgSend(v4, "setObject:forKey:", issuerCountryCode, CFSTR("issuerCountryCode"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAssociatedPeerPaymentAccount);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("hasAssociatedPeerPaymentAccount"));

  }
  peerPaymentAccountCurrency = self->_peerPaymentAccountCurrency;
  if (peerPaymentAccountCurrency)
    objc_msgSend(v4, "setObject:forKey:", peerPaymentAccountCurrency, CFSTR("peerPaymentAccountCurrency"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_peerPaymentAccountBalance);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("peerPaymentAccountBalance"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_peerPaymentAccountState);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("peerPaymentAccountState"));

  }
  organizationName = self->_organizationName;
  if (organizationName)
    objc_msgSend(v4, "setObject:forKey:", organizationName, CFSTR("organizationName"));
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  if (customPrecisionPeerPaymentAccountBalance)
  {
    -[PKProtobufCustomPrecisionAmount dictionaryRepresentation](customPrecisionPeerPaymentAccountBalance, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("customPrecisionPeerPaymentAccountBalance"));

  }
  decimalAccountBalance = self->_decimalAccountBalance;
  if (decimalAccountBalance)
  {
    -[PKProtobufNSDecimalNumber dictionaryRepresentation](decimalAccountBalance, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("decimal_account_balance"));

  }
  v31 = (char)self->_has;
  if ((v31 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_associatedAccountFeatureIdentifier);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("associatedAccountFeatureIdentifier"));

    v31 = (char)self->_has;
  }
  if ((v31 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cobranded);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("cobranded"));

  }
  cobrandName = self->_cobrandName;
  if (cobrandName)
    objc_msgSend(v4, "setObject:forKey:", cobrandName, CFSTR("cobrandName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_passID)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_paymentApplications;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_primaryAccountNumberSuffix)
    PBDataWriterWriteStringField();
  if (self->_manifestHash)
    PBDataWriterWriteDataField();
  if (self->_primaryAccountIdentifier)
    PBDataWriterWriteStringField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_associatedWebDomains;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_issuerCountryCode)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_peerPaymentAccountCurrency)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_organizationName)
    PBDataWriterWriteStringField();
  if (self->_customPrecisionPeerPaymentAccountBalance)
    PBDataWriterWriteSubmessage();
  if (self->_decimalAccountBalance)
    PBDataWriterWriteSubmessage();
  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v16 = (char)self->_has;
  }
  if ((v16 & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_cobrandName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  _BYTE *v12;
  char has;
  char v14;
  id v15;

  v15 = a3;
  if (self->_displayName)
    objc_msgSend(v15, "setDisplayName:");
  if (self->_passID)
    objc_msgSend(v15, "setPassID:");
  if (-[PKProtobufPaymentInstrument paymentApplicationsCount](self, "paymentApplicationsCount"))
  {
    objc_msgSend(v15, "clearPaymentApplications");
    v4 = -[PKProtobufPaymentInstrument paymentApplicationsCount](self, "paymentApplicationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PKProtobufPaymentInstrument paymentApplicationsAtIndex:](self, "paymentApplicationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addPaymentApplications:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v15 + 1) = *(_QWORD *)&self->_ingestedDate;
    *((_BYTE *)v15 + 148) |= 1u;
  }
  if (self->_primaryAccountNumberSuffix)
    objc_msgSend(v15, "setPrimaryAccountNumberSuffix:");
  if (self->_manifestHash)
    objc_msgSend(v15, "setManifestHash:");
  if (self->_primaryAccountIdentifier)
    objc_msgSend(v15, "setPrimaryAccountIdentifier:");
  if (-[PKProtobufPaymentInstrument associatedWebDomainsCount](self, "associatedWebDomainsCount"))
  {
    objc_msgSend(v15, "clearAssociatedWebDomains");
    v8 = -[PKProtobufPaymentInstrument associatedWebDomainsCount](self, "associatedWebDomainsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[PKProtobufPaymentInstrument associatedWebDomainsAtIndex:](self, "associatedWebDomainsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAssociatedWebDomains:", v11);

      }
    }
  }
  v12 = v15;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_BYTE *)v15 + 146) = self->_supportsAutomaticSelection;
    *((_BYTE *)v15 + 148) |= 0x40u;
  }
  if (self->_issuerCountryCode)
  {
    objc_msgSend(v15, "setIssuerCountryCode:");
    v12 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v12[145] = self->_hasAssociatedPeerPaymentAccount;
    v12[148] |= 0x20u;
  }
  if (self->_peerPaymentAccountCurrency)
  {
    objc_msgSend(v15, "setPeerPaymentAccountCurrency:");
    v12 = v15;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v12 + 2) = self->_peerPaymentAccountBalance;
    v12[148] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v12 + 30) = self->_peerPaymentAccountState;
    v12[148] |= 8u;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v15, "setOrganizationName:");
    v12 = v15;
  }
  if (self->_customPrecisionPeerPaymentAccountBalance)
  {
    objc_msgSend(v15, "setCustomPrecisionPeerPaymentAccountBalance:");
    v12 = v15;
  }
  if (self->_decimalAccountBalance)
  {
    objc_msgSend(v15, "setDecimalAccountBalance:");
    v12 = v15;
  }
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v12 + 6) = self->_associatedAccountFeatureIdentifier;
    v12[148] |= 4u;
    v14 = (char)self->_has;
  }
  if ((v14 & 0x10) != 0)
  {
    v12[144] = self->_cobranded;
    v12[148] |= 0x10u;
  }
  if (self->_cobrandName)
  {
    objc_msgSend(v15, "setCobrandName:");
    v12 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char has;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_passID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_paymentApplications;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPaymentApplications:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_ingestedDate;
    *(_BYTE *)(v5 + 148) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_primaryAccountNumberSuffix, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v16;

  v18 = -[NSData copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSString copyWithZone:](self->_primaryAccountIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v20;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = self->_associatedWebDomains;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend((id)v5, "addAssociatedWebDomains:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 146) = self->_supportsAutomaticSelection;
    *(_BYTE *)(v5 + 148) |= 0x40u;
  }
  v28 = -[NSString copyWithZone:](self->_issuerCountryCode, "copyWithZone:", a3, (_QWORD)v43);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 145) = self->_hasAssociatedPeerPaymentAccount;
    *(_BYTE *)(v5 + 148) |= 0x20u;
  }
  v30 = -[NSString copyWithZone:](self->_peerPaymentAccountCurrency, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v30;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_peerPaymentAccountBalance;
    *(_BYTE *)(v5 + 148) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_peerPaymentAccountState;
    *(_BYTE *)(v5 + 148) |= 8u;
  }
  v33 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v33;

  v35 = -[PKProtobufCustomPrecisionAmount copyWithZone:](self->_customPrecisionPeerPaymentAccountBalance, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v35;

  v37 = -[PKProtobufNSDecimalNumber copyWithZone:](self->_decimalAccountBalance, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v37;

  v39 = (char)self->_has;
  if ((v39 & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_associatedAccountFeatureIdentifier;
    *(_BYTE *)(v5 + 148) |= 4u;
    v39 = (char)self->_has;
  }
  if ((v39 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_cobranded;
    *(_BYTE *)(v5 + 148) |= 0x10u;
  }
  v40 = -[NSString copyWithZone:](self->_cobrandName, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v40;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  NSString *passID;
  NSMutableArray *paymentApplications;
  NSString *primaryAccountNumberSuffix;
  NSData *manifestHash;
  NSString *primaryAccountIdentifier;
  NSMutableArray *associatedWebDomains;
  char has;
  char v13;
  NSString *issuerCountryCode;
  NSString *peerPaymentAccountCurrency;
  NSString *organizationName;
  PKProtobufCustomPrecisionAmount *customPrecisionPeerPaymentAccountBalance;
  PKProtobufNSDecimalNumber *decimalAccountBalance;
  char v19;
  NSString *cobrandName;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_68;
  }
  passID = self->_passID;
  if ((unint64_t)passID | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](passID, "isEqual:"))
      goto LABEL_68;
  }
  paymentApplications = self->_paymentApplications;
  if ((unint64_t)paymentApplications | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](paymentApplications, "isEqual:"))
      goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_ingestedDate != *((double *)v4 + 1))
      goto LABEL_68;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_68;
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:"))
  {
    goto LABEL_68;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](manifestHash, "isEqual:"))
      goto LABEL_68;
  }
  primaryAccountIdentifier = self->_primaryAccountIdentifier;
  if ((unint64_t)primaryAccountIdentifier | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](primaryAccountIdentifier, "isEqual:"))
      goto LABEL_68;
  }
  associatedWebDomains = self->_associatedWebDomains;
  if ((unint64_t)associatedWebDomains | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](associatedWebDomains, "isEqual:"))
      goto LABEL_68;
  }
  has = (char)self->_has;
  v13 = *((_BYTE *)v4 + 148);
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x40) == 0)
      goto LABEL_68;
    if (self->_supportsAutomaticSelection)
    {
      if (!*((_BYTE *)v4 + 146))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x40) != 0)
  {
    goto LABEL_68;
  }
  issuerCountryCode = self->_issuerCountryCode;
  if ((unint64_t)issuerCountryCode | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](issuerCountryCode, "isEqual:"))
      goto LABEL_68;
    has = (char)self->_has;
    v13 = *((_BYTE *)v4 + 148);
  }
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0)
      goto LABEL_68;
    if (self->_hasAssociatedPeerPaymentAccount)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_68;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  peerPaymentAccountCurrency = self->_peerPaymentAccountCurrency;
  if ((unint64_t)peerPaymentAccountCurrency | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](peerPaymentAccountCurrency, "isEqual:"))
      goto LABEL_68;
    has = (char)self->_has;
    v13 = *((_BYTE *)v4 + 148);
  }
  if ((has & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_peerPaymentAccountBalance != *((_QWORD *)v4 + 2))
      goto LABEL_68;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_peerPaymentAccountState != *((_DWORD *)v4 + 30))
      goto LABEL_68;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_68;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](organizationName, "isEqual:"))
  {
    goto LABEL_68;
  }
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  if ((unint64_t)customPrecisionPeerPaymentAccountBalance | *((_QWORD *)v4 + 6))
  {
    if (!-[PKProtobufCustomPrecisionAmount isEqual:](customPrecisionPeerPaymentAccountBalance, "isEqual:"))
      goto LABEL_68;
  }
  decimalAccountBalance = self->_decimalAccountBalance;
  if ((unint64_t)decimalAccountBalance | *((_QWORD *)v4 + 7))
  {
    if (!-[PKProtobufNSDecimalNumber isEqual:](decimalAccountBalance, "isEqual:"))
      goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0 || self->_associatedAccountFeatureIdentifier != *((_DWORD *)v4 + 6))
      goto LABEL_68;
  }
  else if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x10) == 0)
      goto LABEL_74;
LABEL_68:
    v19 = 0;
    goto LABEL_69;
  }
  if ((*((_BYTE *)v4 + 148) & 0x10) == 0)
    goto LABEL_68;
  if (!self->_cobranded)
  {
    if (!*((_BYTE *)v4 + 144))
      goto LABEL_74;
    goto LABEL_68;
  }
  if (!*((_BYTE *)v4 + 144))
    goto LABEL_68;
LABEL_74:
  cobrandName = self->_cobrandName;
  if ((unint64_t)cobrandName | *((_QWORD *)v4 + 5))
    v19 = -[NSString isEqual:](cobrandName, "isEqual:");
  else
    v19 = 1;
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  double ingestedDate;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  unint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;

  v27 = -[NSString hash](self->_displayName, "hash");
  v26 = -[NSString hash](self->_passID, "hash");
  v25 = -[NSMutableArray hash](self->_paymentApplications, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    ingestedDate = self->_ingestedDate;
    v4 = -ingestedDate;
    if (ingestedDate >= 0.0)
      v4 = self->_ingestedDate;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
    v24 = v7;
  }
  else
  {
    v24 = 0;
  }
  v23 = -[NSString hash](self->_primaryAccountNumberSuffix, "hash");
  v22 = -[NSData hash](self->_manifestHash, "hash");
  v21 = -[NSString hash](self->_primaryAccountIdentifier, "hash");
  v20 = -[NSMutableArray hash](self->_associatedWebDomains, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v19 = 2654435761 * self->_supportsAutomaticSelection;
  else
    v19 = 0;
  v8 = -[NSString hash](self->_issuerCountryCode, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v9 = 2654435761 * self->_hasAssociatedPeerPaymentAccount;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_peerPaymentAccountCurrency, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_peerPaymentAccountBalance;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_18;
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_18:
      v12 = 2654435761 * self->_peerPaymentAccountState;
      goto LABEL_21;
    }
  }
  v12 = 0;
LABEL_21:
  v13 = -[NSString hash](self->_organizationName, "hash");
  v14 = -[PKProtobufCustomPrecisionAmount hash](self->_customPrecisionPeerPaymentAccountBalance, "hash");
  v15 = -[PKProtobufNSDecimalNumber hash](self->_decimalAccountBalance, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v16 = 2654435761 * self->_associatedAccountFeatureIdentifier;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_23;
LABEL_25:
    v17 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_cobrandName, "hash");
  }
  v16 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_25;
LABEL_23:
  v17 = 2654435761 * self->_cobranded;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_cobrandName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  PKProtobufCustomPrecisionAmount *customPrecisionPeerPaymentAccountBalance;
  uint64_t v17;
  PKProtobufNSDecimalNumber *decimalAccountBalance;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[PKProtobufPaymentInstrument setDisplayName:](self, "setDisplayName:");
  if (*((_QWORD *)v4 + 12))
    -[PKProtobufPaymentInstrument setPassID:](self, "setPassID:");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = *((id *)v4 + 13);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        -[PKProtobufPaymentInstrument addPaymentApplications:](self, "addPaymentApplications:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    self->_ingestedDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 17))
    -[PKProtobufPaymentInstrument setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
  if (*((_QWORD *)v4 + 10))
    -[PKProtobufPaymentInstrument setManifestHash:](self, "setManifestHash:");
  if (*((_QWORD *)v4 + 16))
    -[PKProtobufPaymentInstrument setPrimaryAccountIdentifier:](self, "setPrimaryAccountIdentifier:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        -[PKProtobufPaymentInstrument addAssociatedWebDomains:](self, "addAssociatedWebDomains:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 148) & 0x40) != 0)
  {
    self->_supportsAutomaticSelection = *((_BYTE *)v4 + 146);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 9))
    -[PKProtobufPaymentInstrument setIssuerCountryCode:](self, "setIssuerCountryCode:");
  if ((*((_BYTE *)v4 + 148) & 0x20) != 0)
  {
    self->_hasAssociatedPeerPaymentAccount = *((_BYTE *)v4 + 145);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 14))
    -[PKProtobufPaymentInstrument setPeerPaymentAccountCurrency:](self, "setPeerPaymentAccountCurrency:");
  v15 = *((_BYTE *)v4 + 148);
  if ((v15 & 2) != 0)
  {
    self->_peerPaymentAccountBalance = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v15 = *((_BYTE *)v4 + 148);
  }
  if ((v15 & 8) != 0)
  {
    self->_peerPaymentAccountState = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 11))
    -[PKProtobufPaymentInstrument setOrganizationName:](self, "setOrganizationName:");
  customPrecisionPeerPaymentAccountBalance = self->_customPrecisionPeerPaymentAccountBalance;
  v17 = *((_QWORD *)v4 + 6);
  if (customPrecisionPeerPaymentAccountBalance)
  {
    if (v17)
      -[PKProtobufCustomPrecisionAmount mergeFrom:](customPrecisionPeerPaymentAccountBalance, "mergeFrom:");
  }
  else if (v17)
  {
    -[PKProtobufPaymentInstrument setCustomPrecisionPeerPaymentAccountBalance:](self, "setCustomPrecisionPeerPaymentAccountBalance:");
  }
  decimalAccountBalance = self->_decimalAccountBalance;
  v19 = *((_QWORD *)v4 + 7);
  if (decimalAccountBalance)
  {
    if (v19)
      -[PKProtobufNSDecimalNumber mergeFrom:](decimalAccountBalance, "mergeFrom:");
  }
  else if (v19)
  {
    -[PKProtobufPaymentInstrument setDecimalAccountBalance:](self, "setDecimalAccountBalance:");
  }
  v20 = *((_BYTE *)v4 + 148);
  if ((v20 & 4) != 0)
  {
    self->_associatedAccountFeatureIdentifier = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v20 = *((_BYTE *)v4 + 148);
  }
  if ((v20 & 0x10) != 0)
  {
    self->_cobranded = *((_BYTE *)v4 + 144);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 5))
    -[PKProtobufPaymentInstrument setCobrandName:](self, "setCobrandName:");

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
  objc_storeStrong((id *)&self->_passID, a3);
}

- (NSMutableArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplications, a3);
}

- (double)ingestedDate
{
  return self->_ingestedDate;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, a3);
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, a3);
}

- (NSMutableArray)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
  objc_storeStrong((id *)&self->_associatedWebDomains, a3);
}

- (BOOL)supportsAutomaticSelection
{
  return self->_supportsAutomaticSelection;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_issuerCountryCode, a3);
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (NSString)peerPaymentAccountCurrency
{
  return self->_peerPaymentAccountCurrency;
}

- (void)setPeerPaymentAccountCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccountCurrency, a3);
}

- (int64_t)peerPaymentAccountBalance
{
  return self->_peerPaymentAccountBalance;
}

- (unsigned)peerPaymentAccountState
{
  return self->_peerPaymentAccountState;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (PKProtobufCustomPrecisionAmount)customPrecisionPeerPaymentAccountBalance
{
  return self->_customPrecisionPeerPaymentAccountBalance;
}

- (void)setCustomPrecisionPeerPaymentAccountBalance:(id)a3
{
  objc_storeStrong((id *)&self->_customPrecisionPeerPaymentAccountBalance, a3);
}

- (PKProtobufNSDecimalNumber)decimalAccountBalance
{
  return self->_decimalAccountBalance;
}

- (void)setDecimalAccountBalance:(id)a3
{
  objc_storeStrong((id *)&self->_decimalAccountBalance, a3);
}

- (unsigned)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

- (BOOL)cobranded
{
  return self->_cobranded;
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (void)setCobrandName:(id)a3
{
  objc_storeStrong((id *)&self->_cobrandName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountCurrency, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_decimalAccountBalance, 0);
  objc_storeStrong((id *)&self->_customPrecisionPeerPaymentAccountBalance, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
}

@end
