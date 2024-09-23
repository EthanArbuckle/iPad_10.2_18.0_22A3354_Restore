@implementation INFERENCESchemaINFERENCERequestMatchSignalSet

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumPrimaryTokens:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numPrimaryTokens = a3;
}

- (BOOL)hasNumPrimaryTokens
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumPrimaryTokens:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumPrimaryTokens
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setNumPrimaryTokens:](self, "setNumPrimaryTokens:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setAreAllQueryTokensInContact:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_areAllQueryTokensInContact = a3;
}

- (BOOL)hasAreAllQueryTokensInContact
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAreAllQueryTokensInContact:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteAreAllQueryTokensInContact
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllQueryTokensInContact:](self, "setAreAllQueryTokensInContact:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_areAllPrimaryContactTokensInQuery = a3;
}

- (BOOL)hasAreAllPrimaryContactTokensInQuery
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteAreAllPrimaryContactTokensInQuery
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllPrimaryContactTokensInQuery:](self, "setAreAllPrimaryContactTokensInQuery:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setIsGivenNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isGivenNameMatch = a3;
}

- (BOOL)hasIsGivenNameMatch
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsGivenNameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteIsGivenNameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsGivenNameMatch:](self, "setIsGivenNameMatch:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setIsMiddleNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isMiddleNameMatch = a3;
}

- (BOOL)hasIsMiddleNameMatch
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasIsMiddleNameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteIsMiddleNameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsMiddleNameMatch:](self, "setIsMiddleNameMatch:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setIsFamilyNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isFamilyNameMatch = a3;
}

- (BOOL)hasIsFamilyNameMatch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasIsFamilyNameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteIsFamilyNameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsFamilyNameMatch:](self, "setIsFamilyNameMatch:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setIsOrganizationNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isOrganizationNameMatch = a3;
}

- (BOOL)hasIsOrganizationNameMatch
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsOrganizationNameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsOrganizationNameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsOrganizationNameMatch:](self, "setIsOrganizationNameMatch:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setIsWeakOrganizationMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isWeakOrganizationMatch = a3;
}

- (BOOL)hasIsWeakOrganizationMatch
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsWeakOrganizationMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteIsWeakOrganizationMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsWeakOrganizationMatch:](self, "setIsWeakOrganizationMatch:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setIsNicknameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isNicknameMatch = a3;
}

- (BOOL)hasIsNicknameMatch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsNicknameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteIsNicknameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNicknameMatch:](self, "setIsNicknameMatch:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setIsNamePrefixMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isNamePrefixMatch = a3;
}

- (BOOL)hasIsNamePrefixMatch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsNamePrefixMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteIsNamePrefixMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNamePrefixMatch:](self, "setIsNamePrefixMatch:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setIsNameSuffixMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isNameSuffixMatch = a3;
}

- (BOOL)hasIsNameSuffixMatch
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsNameSuffixMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteIsNameSuffixMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNameSuffixMatch:](self, "setIsNameSuffixMatch:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setIsHandleQueryMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isHandleQueryMatch = a3;
}

- (BOOL)hasIsHandleQueryMatch
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsHandleQueryMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteIsHandleQueryMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryMatch:](self, "setIsHandleQueryMatch:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setIsHandleQueryLabelNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isHandleQueryLabelNameMatch = a3;
}

- (BOOL)hasIsHandleQueryLabelNameMatch
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasIsHandleQueryLabelNameMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteIsHandleQueryLabelNameMatch
{
  -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryLabelNameMatch:](self, "setIsHandleQueryLabelNameMatch:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCERequestMatchSignalSetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x1000) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $2263722ABC7A478F6E4EF28E6FA6E58C has;
  unsigned int v6;
  unsigned int numPrimaryTokens;
  int v8;
  int areAllQueryTokensInContact;
  int v10;
  int areAllPrimaryContactTokensInQuery;
  int v12;
  int isGivenNameMatch;
  int v14;
  int isMiddleNameMatch;
  int v16;
  int isFamilyNameMatch;
  int v18;
  int isOrganizationNameMatch;
  int v20;
  int isWeakOrganizationMatch;
  int v22;
  int isNicknameMatch;
  int v24;
  int isNamePrefixMatch;
  int v26;
  int isNameSuffixMatch;
  int v28;
  int isHandleQueryMatch;
  int v30;
  int isHandleQueryLabelNameMatch;
  BOOL v32;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  has = self->_has;
  v6 = v4[12];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_54;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numPrimaryTokens = self->_numPrimaryTokens;
    if (numPrimaryTokens != objc_msgSend(v4, "numPrimaryTokens"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_54;
  if (v8)
  {
    areAllQueryTokensInContact = self->_areAllQueryTokensInContact;
    if (areAllQueryTokensInContact != objc_msgSend(v4, "areAllQueryTokensInContact"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_54;
  if (v10)
  {
    areAllPrimaryContactTokensInQuery = self->_areAllPrimaryContactTokensInQuery;
    if (areAllPrimaryContactTokensInQuery != objc_msgSend(v4, "areAllPrimaryContactTokensInQuery"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_54;
  if (v12)
  {
    isGivenNameMatch = self->_isGivenNameMatch;
    if (isGivenNameMatch != objc_msgSend(v4, "isGivenNameMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_54;
  if (v14)
  {
    isMiddleNameMatch = self->_isMiddleNameMatch;
    if (isMiddleNameMatch != objc_msgSend(v4, "isMiddleNameMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_54;
  if (v16)
  {
    isFamilyNameMatch = self->_isFamilyNameMatch;
    if (isFamilyNameMatch != objc_msgSend(v4, "isFamilyNameMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_54;
  if (v18)
  {
    isOrganizationNameMatch = self->_isOrganizationNameMatch;
    if (isOrganizationNameMatch != objc_msgSend(v4, "isOrganizationNameMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_54;
  if (v20)
  {
    isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
    if (isWeakOrganizationMatch != objc_msgSend(v4, "isWeakOrganizationMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_54;
  if (v22)
  {
    isNicknameMatch = self->_isNicknameMatch;
    if (isNicknameMatch != objc_msgSend(v4, "isNicknameMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_54;
  if (v24)
  {
    isNamePrefixMatch = self->_isNamePrefixMatch;
    if (isNamePrefixMatch != objc_msgSend(v4, "isNamePrefixMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_54;
  if (v26)
  {
    isNameSuffixMatch = self->_isNameSuffixMatch;
    if (isNameSuffixMatch != objc_msgSend(v4, "isNameSuffixMatch"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[12];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_54;
  if (v28)
  {
    isHandleQueryMatch = self->_isHandleQueryMatch;
    if (isHandleQueryMatch == objc_msgSend(v4, "isHandleQueryMatch"))
    {
      has = self->_has;
      v6 = v4[12];
      goto LABEL_50;
    }
LABEL_54:
    v32 = 0;
    goto LABEL_55;
  }
LABEL_50:
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_54;
  if (v30)
  {
    isHandleQueryLabelNameMatch = self->_isHandleQueryLabelNameMatch;
    if (isHandleQueryLabelNameMatch != objc_msgSend(v4, "isHandleQueryLabelNameMatch"))
      goto LABEL_54;
  }
  v32 = 1;
LABEL_55:

  return v32;
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
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761 * self->_numPrimaryTokens;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_areAllQueryTokensInContact;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_17;
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
    v5 = 2654435761 * self->_areAllPrimaryContactTokensInQuery;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_isGivenNameMatch;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_isMiddleNameMatch;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_isFamilyNameMatch;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_isOrganizationNameMatch;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_isWeakOrganizationMatch;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_isNicknameMatch;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_isNamePrefixMatch;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_isNameSuffixMatch;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761 * self->_isHandleQueryMatch;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761 * self->_isHandleQueryLabelNameMatch;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet areAllPrimaryContactTokensInQuery](self, "areAllPrimaryContactTokensInQuery"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("areAllPrimaryContactTokensInQuery"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet areAllQueryTokensInContact](self, "areAllQueryTokensInContact"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("areAllQueryTokensInContact"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isFamilyNameMatch](self, "isFamilyNameMatch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isFamilyNameMatch"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isGivenNameMatch](self, "isGivenNameMatch"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isGivenNameMatch"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isHandleQueryLabelNameMatch](self, "isHandleQueryLabelNameMatch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isHandleQueryLabelNameMatch"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isHandleQueryMatch](self, "isHandleQueryMatch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isHandleQueryMatch"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isMiddleNameMatch](self, "isMiddleNameMatch"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isMiddleNameMatch"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNamePrefixMatch](self, "isNamePrefixMatch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isNamePrefixMatch"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNameSuffixMatch](self, "isNameSuffixMatch"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isNameSuffixMatch"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNicknameMatch](self, "isNicknameMatch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isNicknameMatch"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isWeakOrganizationMatch](self, "isWeakOrganizationMatch"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isWeakOrganizationMatch"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isOrganizationNameMatch](self, "isOrganizationNameMatch"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isOrganizationNameMatch"));

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCERequestMatchSignalSet numPrimaryTokens](self, "numPrimaryTokens"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numPrimaryTokens"));

  }
LABEL_15:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCERequestMatchSignalSet dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCERequestMatchSignalSet *v5;
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
    self = -[INFERENCESchemaINFERENCERequestMatchSignalSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCERequestMatchSignalSet *v5;
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
  INFERENCESchemaINFERENCERequestMatchSignalSet *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCERequestMatchSignalSet;
  v5 = -[INFERENCESchemaINFERENCERequestMatchSignalSet init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPrimaryTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setNumPrimaryTokens:](v5, "setNumPrimaryTokens:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("areAllQueryTokensInContact"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllQueryTokensInContact:](v5, "setAreAllQueryTokensInContact:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("areAllPrimaryContactTokensInQuery"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllPrimaryContactTokensInQuery:](v5, "setAreAllPrimaryContactTokensInQuery:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGivenNameMatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsGivenNameMatch:](v5, "setIsGivenNameMatch:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMiddleNameMatch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsMiddleNameMatch:](v5, "setIsMiddleNameMatch:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFamilyNameMatch"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsFamilyNameMatch:](v5, "setIsFamilyNameMatch:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOrganizationNameMatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsOrganizationNameMatch:](v5, "setIsOrganizationNameMatch:", objc_msgSend(v12, "BOOLValue"));
    v27 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWeakOrganizationMatch"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsWeakOrganizationMatch:](v5, "setIsWeakOrganizationMatch:", objc_msgSend(v13, "BOOLValue"));
    v26 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNicknameMatch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNicknameMatch:](v5, "setIsNicknameMatch:", objc_msgSend(v14, "BOOLValue"));
    v25 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNamePrefixMatch"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNamePrefixMatch:](v5, "setIsNamePrefixMatch:", objc_msgSend(v15, "BOOLValue"));
    v23 = v11;
    v24 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNameSuffixMatch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNameSuffixMatch:](v5, "setIsNameSuffixMatch:", objc_msgSend(v16, "BOOLValue"));
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHandleQueryMatch"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryMatch:](v5, "setIsHandleQueryMatch:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHandleQueryLabelNameMatch"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryLabelNameMatch:](v5, "setIsHandleQueryLabelNameMatch:", objc_msgSend(v19, "BOOLValue"));
    v20 = v5;

  }
  return v5;
}

- (unsigned)numPrimaryTokens
{
  return self->_numPrimaryTokens;
}

- (BOOL)areAllQueryTokensInContact
{
  return self->_areAllQueryTokensInContact;
}

- (BOOL)areAllPrimaryContactTokensInQuery
{
  return self->_areAllPrimaryContactTokensInQuery;
}

- (BOOL)isGivenNameMatch
{
  return self->_isGivenNameMatch;
}

- (BOOL)isMiddleNameMatch
{
  return self->_isMiddleNameMatch;
}

- (BOOL)isFamilyNameMatch
{
  return self->_isFamilyNameMatch;
}

- (BOOL)isOrganizationNameMatch
{
  return self->_isOrganizationNameMatch;
}

- (BOOL)isWeakOrganizationMatch
{
  return self->_isWeakOrganizationMatch;
}

- (BOOL)isNicknameMatch
{
  return self->_isNicknameMatch;
}

- (BOOL)isNamePrefixMatch
{
  return self->_isNamePrefixMatch;
}

- (BOOL)isNameSuffixMatch
{
  return self->_isNameSuffixMatch;
}

- (BOOL)isHandleQueryMatch
{
  return self->_isHandleQueryMatch;
}

- (BOOL)isHandleQueryLabelNameMatch
{
  return self->_isHandleQueryLabelNameMatch;
}

@end
