@implementation PKProtobufPaymentDeviceResponse

- (void)setLocked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locked = a3;
}

- (void)setHasLocked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocked
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearPaymentInstruments
{
  -[NSMutableArray removeAllObjects](self->_paymentInstruments, "removeAllObjects");
}

- (void)addPaymentInstruments:(id)a3
{
  id v4;
  NSMutableArray *paymentInstruments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paymentInstruments = self->_paymentInstruments;
  v8 = v4;
  if (!paymentInstruments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_paymentInstruments;
    self->_paymentInstruments = v6;

    v4 = v8;
    paymentInstruments = self->_paymentInstruments;
  }
  -[NSMutableArray addObject:](paymentInstruments, "addObject:", v4);

}

- (unint64_t)paymentInstrumentsCount
{
  return -[NSMutableArray count](self->_paymentInstruments, "count");
}

- (id)paymentInstrumentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentInstruments, "objectAtIndex:", a3);
}

+ (Class)paymentInstrumentsType
{
  return (Class)objc_opt_class();
}

- (void)setDefaultPaymentInstrumentIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_defaultPaymentInstrumentIndex = a3;
}

- (void)setHasDefaultPaymentInstrumentIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefaultPaymentInstrumentIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUserDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_userDisabled = a3;
}

- (void)setHasUserDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserDisabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDeviceDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deviceDisabled = a3;
}

- (void)setHasDeviceDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceDisabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)nearby
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_nearby;
  else
    return 0;
}

- (void)setNearby:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nearby = a3;
}

- (void)setHasNearby:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNearby
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)nearbyAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2AC96A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNearby:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISTANT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsFaceID:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_supportsFaceID = a3;
}

- (void)setHasSupportsFaceID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsFaceID
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearSupportedSetupFeatures
{
  -[NSMutableArray removeAllObjects](self->_supportedSetupFeatures, "removeAllObjects");
}

- (void)addSupportedSetupFeatures:(id)a3
{
  id v4;
  NSMutableArray *supportedSetupFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedSetupFeatures = self->_supportedSetupFeatures;
  v8 = v4;
  if (!supportedSetupFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_supportedSetupFeatures;
    self->_supportedSetupFeatures = v6;

    v4 = v8;
    supportedSetupFeatures = self->_supportedSetupFeatures;
  }
  -[NSMutableArray addObject:](supportedSetupFeatures, "addObject:", v4);

}

- (unint64_t)supportedSetupFeaturesCount
{
  return -[NSMutableArray count](self->_supportedSetupFeatures, "count");
}

- (id)supportedSetupFeaturesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedSetupFeatures, "objectAtIndex:", a3);
}

+ (Class)supportedSetupFeaturesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)PKProtobufPaymentDeviceResponse;
  -[PKProtobufPaymentDeviceResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentDeviceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t nearby;
  __CFString *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locked);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("locked"));

  }
  if (-[NSMutableArray count](self->_paymentInstruments, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_paymentInstruments, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = self->_paymentInstruments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paymentInstruments"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_defaultPaymentInstrumentIndex);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("defaultPaymentInstrumentIndex"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userDisabled);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("userDisabled"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceDisabled);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("deviceDisabled"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 4) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_32:
  nearby = self->_nearby;
  if (nearby >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nearby);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E2AC96A8[nearby];
  }
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("nearby"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_17:
    if ((has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_protocolVersion);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("protocolVersion"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFaceID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("supportsFaceID"));

  }
LABEL_19:
  if (-[NSMutableArray count](self->_supportedSetupFeatures, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_supportedSetupFeatures, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = self->_supportedSetupFeatures;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("supportedSetupFeatures"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentDeviceResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_paymentInstruments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_supportedSetupFeatures;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[41] = self->_locked;
    v4[44] |= 0x10u;
  }
  v14 = v4;
  if (-[PKProtobufPaymentDeviceResponse paymentInstrumentsCount](self, "paymentInstrumentsCount"))
  {
    objc_msgSend(v14, "clearPaymentInstruments");
    v5 = -[PKProtobufPaymentDeviceResponse paymentInstrumentsCount](self, "paymentInstrumentsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PKProtobufPaymentDeviceResponse paymentInstrumentsAtIndex:](self, "paymentInstrumentsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addPaymentInstruments:", v8);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v14 + 2) = self->_defaultPaymentInstrumentIndex;
    *((_BYTE *)v14 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v14 + 43) = self->_userDisabled;
  *((_BYTE *)v14 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v14 + 40) = self->_deviceDisabled;
  *((_BYTE *)v14 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
LABEL_23:
    *((_DWORD *)v14 + 6) = self->_protocolVersion;
    *((_BYTE *)v14 + 44) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  *((_DWORD *)v14 + 3) = self->_nearby;
  *((_BYTE *)v14 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 0x20) != 0)
  {
LABEL_13:
    *((_BYTE *)v14 + 42) = self->_supportsFaceID;
    *((_BYTE *)v14 + 44) |= 0x20u;
  }
LABEL_14:
  if (-[PKProtobufPaymentDeviceResponse supportedSetupFeaturesCount](self, "supportedSetupFeaturesCount"))
  {
    objc_msgSend(v14, "clearSupportedSetupFeatures");
    v10 = -[PKProtobufPaymentDeviceResponse supportedSetupFeaturesCount](self, "supportedSetupFeaturesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[PKProtobufPaymentDeviceResponse supportedSetupFeaturesAtIndex:](self, "supportedSetupFeaturesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSupportedSetupFeatures:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 41) = self->_locked;
    *(_BYTE *)(v5 + 44) |= 0x10u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = self->_paymentInstruments;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPaymentInstruments:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_defaultPaymentInstrumentIndex;
    *(_BYTE *)(v6 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  *(_BYTE *)(v6 + 43) = self->_userDisabled;
  *(_BYTE *)(v6 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v6 + 40) = self->_deviceDisabled;
  *(_BYTE *)(v6 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 12) = self->_nearby;
  *(_BYTE *)(v6 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v6 + 24) = self->_protocolVersion;
  *(_BYTE *)(v6 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    *(_BYTE *)(v6 + 42) = self->_supportsFaceID;
    *(_BYTE *)(v6 + 44) |= 0x20u;
  }
LABEL_17:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_supportedSetupFeatures;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v6, "addSupportedSetupFeatures:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *paymentInstruments;
  char v8;
  NSMutableArray *supportedSetupFeatures;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_48;
    if (self->_locked)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  paymentInstruments = self->_paymentInstruments;
  if ((unint64_t)paymentInstruments | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](paymentInstruments, "isEqual:"))
      goto LABEL_48;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_defaultPaymentInstrumentIndex != *((_DWORD *)v4 + 2))
      goto LABEL_48;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_48;
    if (self->_userDisabled)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_48;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_48;
    if (self->_deviceDisabled)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_48;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_nearby != *((_DWORD *)v4 + 3))
      goto LABEL_48;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 6))
      goto LABEL_48;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x20) == 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_54;
LABEL_48:
    v8 = 0;
    goto LABEL_49;
  }
  if ((v6 & 0x20) == 0)
    goto LABEL_48;
  if (!self->_supportsFaceID)
  {
    if (!*((_BYTE *)v4 + 42))
      goto LABEL_54;
    goto LABEL_48;
  }
  if (!*((_BYTE *)v4 + 42))
    goto LABEL_48;
LABEL_54:
  supportedSetupFeatures = self->_supportedSetupFeatures;
  if ((unint64_t)supportedSetupFeatures | *((_QWORD *)v4 + 4))
    v8 = -[NSMutableArray isEqual:](supportedSetupFeatures, "isEqual:");
  else
    v8 = 1;
LABEL_49:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_locked;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_paymentInstruments, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_defaultPaymentInstrumentIndex;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_userDisabled;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_deviceDisabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_nearby;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_10;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_supportedSetupFeatures, "hash");
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_9:
  v9 = 2654435761 * self->_protocolVersion;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_16;
LABEL_10:
  v10 = 2654435761 * self->_supportsFaceID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_supportedSetupFeatures, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    self->_locked = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[PKProtobufPaymentDeviceResponse addPaymentInstruments:](self, "addPaymentInstruments:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v5 + 44);
  if ((v11 & 1) != 0)
  {
    self->_defaultPaymentInstrumentIndex = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v11 = *((_BYTE *)v5 + 44);
    if ((v11 & 0x40) == 0)
    {
LABEL_12:
      if ((v11 & 8) == 0)
        goto LABEL_13;
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v5 + 44) & 0x40) == 0)
  {
    goto LABEL_12;
  }
  self->_userDisabled = *((_BYTE *)v5 + 43);
  *(_BYTE *)&self->_has |= 0x40u;
  v11 = *((_BYTE *)v5 + 44);
  if ((v11 & 8) == 0)
  {
LABEL_13:
    if ((v11 & 2) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_deviceDisabled = *((_BYTE *)v5 + 40);
  *(_BYTE *)&self->_has |= 8u;
  v11 = *((_BYTE *)v5 + 44);
  if ((v11 & 2) == 0)
  {
LABEL_14:
    if ((v11 & 4) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  self->_nearby = *((_DWORD *)v5 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v11 = *((_BYTE *)v5 + 44);
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  self->_protocolVersion = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v5 + 44) & 0x20) != 0)
  {
LABEL_16:
    self->_supportsFaceID = *((_BYTE *)v5 + 42);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_17:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v5 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[PKProtobufPaymentDeviceResponse addSupportedSetupFeatures:](self, "addSupportedSetupFeatures:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)locked
{
  return self->_locked;
}

- (NSMutableArray)paymentInstruments
{
  return self->_paymentInstruments;
}

- (void)setPaymentInstruments:(id)a3
{
  objc_storeStrong((id *)&self->_paymentInstruments, a3);
}

- (unsigned)defaultPaymentInstrumentIndex
{
  return self->_defaultPaymentInstrumentIndex;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (BOOL)deviceDisabled
{
  return self->_deviceDisabled;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)supportsFaceID
{
  return self->_supportsFaceID;
}

- (NSMutableArray)supportedSetupFeatures
{
  return self->_supportedSetupFeatures;
}

- (void)setSupportedSetupFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, 0);
  objc_storeStrong((id *)&self->_paymentInstruments, 0);
}

@end
