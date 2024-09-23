@implementation INFERENCESchemaINFERENCECommonAppIndependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRawLanguage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rawLanguage = a3;
}

- (BOOL)hasRawLanguage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteRawLanguage
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLanguage:](self, "setRawLanguage:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setRawLocale:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rawLocale = a3;
}

- (BOOL)hasRawLocale
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasRawLocale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteRawLocale
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLocale:](self, "setRawLocale:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setRawStateOrProvince:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rawStateOrProvince = a3;
}

- (BOOL)hasRawStateOrProvince
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRawStateOrProvince:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteRawStateOrProvince
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawStateOrProvince:](self, "setRawStateOrProvince:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setRawCountry:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rawCountry = a3;
}

- (BOOL)hasRawCountry
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRawCountry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteRawCountry
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawCountry:](self, "setRawCountry:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setRawRequestDeviceCategory:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rawRequestDeviceCategory = a3;
}

- (BOOL)hasRawRequestDeviceCategory
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRawRequestDeviceCategory:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteRawRequestDeviceCategory
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawRequestDeviceCategory:](self, "setRawRequestDeviceCategory:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setClientDayOfWeek:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_clientDayOfWeek = a3;
}

- (BOOL)hasClientDayOfWeek
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteClientDayOfWeek
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setClientDayOfWeek:](self, "setClientDayOfWeek:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setRawClientHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rawClientHourOfDay = a3;
}

- (BOOL)hasRawClientHourOfDay
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteRawClientHourOfDay
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawClientHourOfDay:](self, "setRawClientHourOfDay:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setIsClientDaylight:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isClientDaylight = a3;
}

- (BOOL)hasIsClientDaylight
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteIsClientDaylight
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setIsClientDaylight:](self, "setIsClientDaylight:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setAppResolutionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_appResolutionType = a3;
}

- (BOOL)hasAppResolutionType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasAppResolutionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteAppResolutionType
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppResolutionType:](self, "setAppResolutionType:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setSirikitResponseCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sirikitResponseCode = a3;
}

- (BOOL)hasSirikitResponseCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteSirikitResponseCode
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setSirikitResponseCode:](self, "setSirikitResponseCode:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setAppSelectionUses:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_appSelectionUses = a3;
}

- (BOOL)hasAppSelectionUses
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteAppSelectionUses
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppSelectionUses:](self, "setAppSelectionUses:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_modelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasModelVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCECommonAppIndependentSignals setModelVersion:](self, "setModelVersion:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x800) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field();
LABEL_14:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $D0A0D8F83E59B8C98DCEAE04751221F4 has;
  unsigned int v6;
  int64_t rawLanguage;
  int v8;
  int64_t rawLocale;
  int v10;
  int64_t rawStateOrProvince;
  int v12;
  int64_t rawCountry;
  int v14;
  int64_t rawRequestDeviceCategory;
  int v16;
  int clientDayOfWeek;
  int v18;
  int rawClientHourOfDay;
  int v20;
  int isClientDaylight;
  int v22;
  int appResolutionType;
  int v24;
  int sirikitResponseCode;
  int v26;
  int appSelectionUses;
  int v28;
  unsigned int modelVersion;
  BOOL v30;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  has = self->_has;
  v6 = v4[38];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_50;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    rawLanguage = self->_rawLanguage;
    if (rawLanguage != objc_msgSend(v4, "rawLanguage"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_50;
  if (v8)
  {
    rawLocale = self->_rawLocale;
    if (rawLocale != objc_msgSend(v4, "rawLocale"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_50;
  if (v10)
  {
    rawStateOrProvince = self->_rawStateOrProvince;
    if (rawStateOrProvince != objc_msgSend(v4, "rawStateOrProvince"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_50;
  if (v12)
  {
    rawCountry = self->_rawCountry;
    if (rawCountry != objc_msgSend(v4, "rawCountry"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_50;
  if (v14)
  {
    rawRequestDeviceCategory = self->_rawRequestDeviceCategory;
    if (rawRequestDeviceCategory != objc_msgSend(v4, "rawRequestDeviceCategory"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_50;
  if (v16)
  {
    clientDayOfWeek = self->_clientDayOfWeek;
    if (clientDayOfWeek != objc_msgSend(v4, "clientDayOfWeek"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_50;
  if (v18)
  {
    rawClientHourOfDay = self->_rawClientHourOfDay;
    if (rawClientHourOfDay != objc_msgSend(v4, "rawClientHourOfDay"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_50;
  if (v20)
  {
    isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != objc_msgSend(v4, "isClientDaylight"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_50;
  if (v22)
  {
    appResolutionType = self->_appResolutionType;
    if (appResolutionType != objc_msgSend(v4, "appResolutionType"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_50;
  if (v24)
  {
    sirikitResponseCode = self->_sirikitResponseCode;
    if (sirikitResponseCode != objc_msgSend(v4, "sirikitResponseCode"))
      goto LABEL_50;
    has = self->_has;
    v6 = v4[38];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_50;
  if (v26)
  {
    appSelectionUses = self->_appSelectionUses;
    if (appSelectionUses == objc_msgSend(v4, "appSelectionUses"))
    {
      has = self->_has;
      v6 = v4[38];
      goto LABEL_46;
    }
LABEL_50:
    v30 = 0;
    goto LABEL_51;
  }
LABEL_46:
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_50;
  if (v28)
  {
    modelVersion = self->_modelVersion;
    if (modelVersion != objc_msgSend(v4, "modelVersion"))
      goto LABEL_50;
  }
  v30 = 1;
LABEL_51:

  return v30;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_rawLanguage;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rawLocale;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_rawStateOrProvince;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_rawCountry;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_rawRequestDeviceCategory;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_clientDayOfWeek;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_rawClientHourOfDay;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_isClientDaylight;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_appResolutionType;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_sirikitResponseCode;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_appSelectionUses;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_modelVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v5 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals appResolutionType](self, "appResolutionType") - 1;
    if (v5 > 9)
      v6 = CFSTR("INFERENCEAPPRESOLUTIONTYPE_UNKNOWN");
    else
      v6 = off_1E56393D8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appResolutionType"));
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals appSelectionUses](self, "appSelectionUses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appSelectionUses"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_8:
      if ((has & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("clientDayOfWeek"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals isClientDaylight](self, "isClientDaylight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isClientDaylight"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals modelVersion](self, "modelVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("modelVersion"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rawClientHourOfDay"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawCountry](self, "rawCountry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rawCountry"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawLanguage](self, "rawLanguage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rawLanguage"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawLocale](self, "rawLocale"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rawLocale"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 4) == 0)
      goto LABEL_16;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawStateOrProvince](self, "rawStateOrProvince"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("rawStateOrProvince"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawRequestDeviceCategory](self, "rawRequestDeviceCategory"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rawRequestDeviceCategory"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_28;
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sirikitResponseCode"));

  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommonAppIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommonAppIndependentSignals *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[INFERENCESchemaINFERENCECommonAppIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommonAppIndependentSignals *v5;
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
  INFERENCESchemaINFERENCECommonAppIndependentSignals *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCECommonAppIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCECommonAppIndependentSignals init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLanguage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLanguage:](v5, "setRawLanguage:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLocale:](v5, "setRawLocale:", objc_msgSend(v7, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawStateOrProvince"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawStateOrProvince:](v5, "setRawStateOrProvince:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawCountry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawCountry:](v5, "setRawCountry:", objc_msgSend(v9, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawRequestDeviceCategory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawRequestDeviceCategory:](v5, "setRawRequestDeviceCategory:", objc_msgSend(v10, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientDayOfWeek"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setClientDayOfWeek:](v5, "setClientDayOfWeek:", objc_msgSend(v11, "intValue"));
    v21 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawClientHourOfDay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawClientHourOfDay:](v5, "setRawClientHourOfDay:", objc_msgSend(v12, "intValue"));
    v25 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientDaylight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setIsClientDaylight:](v5, "setIsClientDaylight:", objc_msgSend(v13, "BOOLValue"));
    v24 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appResolutionType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppResolutionType:](v5, "setAppResolutionType:", objc_msgSend(v14, "intValue"));
    v22 = v10;
    v23 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sirikitResponseCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setSirikitResponseCode:](v5, "setSirikitResponseCode:", objc_msgSend(v15, "intValue"));
    v16 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appSelectionUses"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppSelectionUses:](v5, "setAppSelectionUses:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setModelVersion:](v5, "setModelVersion:", objc_msgSend(v18, "unsignedIntValue"));
    v19 = v5;

  }
  return v5;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (int64_t)rawStateOrProvince
{
  return self->_rawStateOrProvince;
}

- (int64_t)rawCountry
{
  return self->_rawCountry;
}

- (int64_t)rawRequestDeviceCategory
{
  return self->_rawRequestDeviceCategory;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (int)appResolutionType
{
  return self->_appResolutionType;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

@end
