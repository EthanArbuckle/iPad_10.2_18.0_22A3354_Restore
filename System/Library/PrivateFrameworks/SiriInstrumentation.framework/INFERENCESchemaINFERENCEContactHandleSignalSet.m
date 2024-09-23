@implementation INFERENCESchemaINFERENCEContactHandleSignalSet

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEContactHandleSignalSet;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEContactHandleSignalSet deleteHistoryStats](self, "deleteHistoryStats");
  return v5;
}

- (void)setIsSuggestedHandle:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 1u;
  self->_isSuggestedHandle = a3;
}

- (BOOL)hasIsSuggestedHandle
{
  return *(_WORD *)(&self->_isNotFaceTimeable + 1) & 1;
}

- (void)setHasIsSuggestedHandle:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFE | a3;
}

- (void)deleteIsSuggestedHandle
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsSuggestedHandle:](self, "setIsSuggestedHandle:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~1u;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 2u;
  self->_isFavorite = a3;
}

- (BOOL)hasIsFavorite
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 1) & 1;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFD | v3;
}

- (void)deleteIsFavorite
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFavorite:](self, "setIsFavorite:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~2u;
}

- (void)setIsQueryExactMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 4u;
  self->_isQueryExactMatch = a3;
}

- (BOOL)hasIsQueryExactMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 2) & 1;
}

- (void)setHasIsQueryExactMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFB | v3;
}

- (void)deleteIsQueryExactMatch
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryExactMatch:](self, "setIsQueryExactMatch:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~4u;
}

- (void)setIsQueryMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 8u;
  self->_isQueryMatch = a3;
}

- (BOOL)hasIsQueryMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 3) & 1;
}

- (void)setHasIsQueryMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFF7 | v3;
}

- (void)deleteIsQueryMatch
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryMatch:](self, "setIsQueryMatch:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~8u;
}

- (void)setIsPartialQueryValueMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x10u;
  self->_isPartialQueryValueMatch = a3;
}

- (BOOL)hasIsPartialQueryValueMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 4) & 1;
}

- (void)setHasIsPartialQueryValueMatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFEF | v3;
}

- (void)deleteIsPartialQueryValueMatch
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPartialQueryValueMatch:](self, "setIsPartialQueryValueMatch:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x10u;
}

- (BOOL)hasHistoryStats
{
  return self->_historyStats != 0;
}

- (void)deleteHistoryStats
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setHistoryStats:](self, "setHistoryStats:", 0);
}

- (void)setIsRecentInAnyGroup:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x20u;
  self->_isRecentInAnyGroup = a3;
}

- (BOOL)hasIsRecentInAnyGroup
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 5) & 1;
}

- (void)setHasIsRecentInAnyGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFDF | v3;
}

- (void)deleteIsRecentInAnyGroup
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInAnyGroup:](self, "setIsRecentInAnyGroup:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x20u;
}

- (void)setIsRecentInSameGroup:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x40u;
  self->_isRecentInSameGroup = a3;
}

- (BOOL)hasIsRecentInSameGroup
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 6) & 1;
}

- (void)setHasIsRecentInSameGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFBF | v3;
}

- (void)deleteIsRecentInSameGroup
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInSameGroup:](self, "setIsRecentInSameGroup:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x40u;
}

- (void)setIsPreferredType:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x80u;
  self->_isPreferredType = a3;
}

- (BOOL)hasIsPreferredType
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 7) & 1;
}

- (void)setHasIsPreferredType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFF7F | v3;
}

- (void)deleteIsPreferredType
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPreferredType:](self, "setIsPreferredType:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x80u;
}

- (void)setIsAllowedType:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x100u;
  self->_isAllowedType = a3;
}

- (BOOL)hasIsAllowedType
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1)) & 1;
}

- (void)setHasIsAllowedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFEFF | v3;
}

- (void)deleteIsAllowedType
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsAllowedType:](self, "setIsAllowedType:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x100u;
}

- (void)setIsFaceTimeable:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x200u;
  self->_isFaceTimeable = a3;
}

- (BOOL)hasIsFaceTimeable
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 9) & 1;
}

- (void)setHasIsFaceTimeable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFDFF | v3;
}

- (void)deleteIsFaceTimeable
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFaceTimeable:](self, "setIsFaceTimeable:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x200u;
}

- (void)setIsNotFaceTimeable:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x400u;
  self->_isNotFaceTimeable = a3;
}

- (BOOL)hasIsNotFaceTimeable
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 10) & 1;
}

- (void)setHasIsNotFaceTimeable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFBFF | v3;
}

- (void)deleteIsNotFaceTimeable
{
  -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsNotFaceTimeable:](self, "setIsNotFaceTimeable:", 0);
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x400u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactHandleSignalSetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 v4;
  void *v5;
  void *v6;
  __int16 v7;
  id v8;

  v8 = a3;
  v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v7 & 0x40) == 0)
    {
LABEL_11:
      if ((v7 & 0x80) == 0)
        goto LABEL_12;
      goto LABEL_24;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x200) == 0)
      goto LABEL_14;
LABEL_26:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x200) != 0)
    goto LABEL_26;
LABEL_14:
  if ((v7 & 0x400) != 0)
LABEL_15:
    PBDataWriterWriteBOOLField();
LABEL_16:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  unsigned int v6;
  int isSuggestedHandle;
  int v8;
  int isFavorite;
  int v10;
  int isQueryExactMatch;
  int v12;
  int isQueryMatch;
  int v14;
  int isPartialQueryValueMatch;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int isRecentInAnyGroup;
  int v28;
  int isRecentInSameGroup;
  int v30;
  int isPreferredType;
  int v32;
  int isAllowedType;
  int v34;
  int isFaceTimeable;
  int v36;
  int isNotFaceTimeable;
  BOOL v38;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
  v6 = v4[15];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_51;
  if ((v5 & 1) != 0)
  {
    isSuggestedHandle = self->_isSuggestedHandle;
    if (isSuggestedHandle != objc_msgSend(v4, "isSuggestedHandle"))
      goto LABEL_51;
    v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v6 = v4[15];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_51;
  if (v8)
  {
    isFavorite = self->_isFavorite;
    if (isFavorite != objc_msgSend(v4, "isFavorite"))
      goto LABEL_51;
    v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v6 = v4[15];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_51;
  if (v10)
  {
    isQueryExactMatch = self->_isQueryExactMatch;
    if (isQueryExactMatch != objc_msgSend(v4, "isQueryExactMatch"))
      goto LABEL_51;
    v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v6 = v4[15];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_51;
  if (v12)
  {
    isQueryMatch = self->_isQueryMatch;
    if (isQueryMatch != objc_msgSend(v4, "isQueryMatch"))
      goto LABEL_51;
    v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v6 = v4[15];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_51;
  if (v14)
  {
    isPartialQueryValueMatch = self->_isPartialQueryValueMatch;
    if (isPartialQueryValueMatch != objc_msgSend(v4, "isPartialQueryValueMatch"))
      goto LABEL_51;
  }
  -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "historyStats");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

    goto LABEL_51;
  }
  -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "historyStats");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_51;
  }
  else
  {

  }
  v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
  v25 = (v24 >> 5) & 1;
  v26 = v4[15];
  if (v25 != ((v26 >> 5) & 1))
  {
LABEL_51:
    v38 = 0;
    goto LABEL_52;
  }
  if (v25)
  {
    isRecentInAnyGroup = self->_isRecentInAnyGroup;
    if (isRecentInAnyGroup != objc_msgSend(v4, "isRecentInAnyGroup"))
      goto LABEL_51;
    v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v26 = v4[15];
  }
  v28 = (v24 >> 6) & 1;
  if (v28 != ((v26 >> 6) & 1))
    goto LABEL_51;
  if (v28)
  {
    isRecentInSameGroup = self->_isRecentInSameGroup;
    if (isRecentInSameGroup != objc_msgSend(v4, "isRecentInSameGroup"))
      goto LABEL_51;
    v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v26 = v4[15];
  }
  v30 = (v24 >> 7) & 1;
  if (v30 != ((v26 >> 7) & 1))
    goto LABEL_51;
  if (v30)
  {
    isPreferredType = self->_isPreferredType;
    if (isPreferredType != objc_msgSend(v4, "isPreferredType"))
      goto LABEL_51;
    v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v26 = v4[15];
  }
  v32 = (v24 >> 8) & 1;
  if (v32 != ((v26 >> 8) & 1))
    goto LABEL_51;
  if (v32)
  {
    isAllowedType = self->_isAllowedType;
    if (isAllowedType != objc_msgSend(v4, "isAllowedType"))
      goto LABEL_51;
    v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    v26 = v4[15];
  }
  v34 = (v24 >> 9) & 1;
  if (v34 != ((v26 >> 9) & 1))
    goto LABEL_51;
  if (v34)
  {
    isFaceTimeable = self->_isFaceTimeable;
    if (isFaceTimeable == objc_msgSend(v4, "isFaceTimeable"))
    {
      v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
      v26 = v4[15];
      goto LABEL_47;
    }
    goto LABEL_51;
  }
LABEL_47:
  v36 = (v24 >> 10) & 1;
  if (v36 != ((v26 >> 10) & 1))
    goto LABEL_51;
  if (v36)
  {
    isNotFaceTimeable = self->_isNotFaceTimeable;
    if (isNotFaceTimeable != objc_msgSend(v4, "isNotFaceTimeable"))
      goto LABEL_51;
  }
  v38 = 1;
LABEL_52:

  return v38;
}

- (unint64_t)hash
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v3 & 1) != 0)
  {
    v4 = 2654435761 * self->_isSuggestedHandle;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isFavorite;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isQueryExactMatch;
    if ((v3 & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((v3 & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_isQueryMatch;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isPartialQueryValueMatch;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats hash](self->_historyStats, "hash");
  v10 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v10 & 0x20) != 0)
  {
    v11 = 2654435761 * self->_isRecentInAnyGroup;
    if ((v10 & 0x40) != 0)
    {
LABEL_14:
      v12 = 2654435761 * self->_isRecentInSameGroup;
      if ((v10 & 0x80) != 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else
  {
    v11 = 0;
    if ((v10 & 0x40) != 0)
      goto LABEL_14;
  }
  v12 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_15:
    v13 = 2654435761 * self->_isPreferredType;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x100) != 0)
      goto LABEL_16;
    goto LABEL_22;
  }
LABEL_21:
  v13 = 0;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x100) != 0)
  {
LABEL_16:
    v14 = 2654435761 * self->_isAllowedType;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) != 0)
      goto LABEL_17;
LABEL_23:
    v15 = 0;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) != 0)
      goto LABEL_18;
LABEL_24:
    v16 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v9;
  }
LABEL_22:
  v14 = 0;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) == 0)
    goto LABEL_23;
LABEL_17:
  v15 = 2654435761 * self->_isFaceTimeable;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) == 0)
    goto LABEL_24;
LABEL_18:
  v16 = 2654435761 * self->_isNotFaceTimeable;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int16 v7;
  void *v8;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_historyStats)
  {
    -[INFERENCESchemaINFERENCEContactHandleSignalSet historyStats](self, "historyStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("historyStats"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("historyStats"));

    }
  }
  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isAllowedType](self, "isAllowedType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isAllowedType"));

    v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v7 & 0x200) == 0)
    {
LABEL_8:
      if ((v7 & 2) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isFaceTimeable](self, "isFaceTimeable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isFaceTimeable"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 2) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isFavorite](self, "isFavorite"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isFavorite"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isNotFaceTimeable](self, "isNotFaceTimeable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isNotFaceTimeable"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isPartialQueryValueMatch](self, "isPartialQueryValueMatch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isPartialQueryValueMatch"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isPreferredType](self, "isPreferredType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isPreferredType"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isQueryExactMatch](self, "isQueryExactMatch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isQueryExactMatch"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 8) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isQueryMatch](self, "isQueryMatch"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isQueryMatch"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_15:
    if ((v7 & 0x40) == 0)
      goto LABEL_16;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isRecentInSameGroup](self, "isRecentInSameGroup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isRecentInSameGroup"));

    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isRecentInAnyGroup](self, "isRecentInAnyGroup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isRecentInAnyGroup"));

  v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x40) != 0)
    goto LABEL_28;
LABEL_16:
  if ((v7 & 1) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isSuggestedHandle](self, "isSuggestedHandle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSuggestedHandle"));

  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactHandleSignalSet dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactHandleSignalSet *v5;
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
    self = -[INFERENCESchemaINFERENCEContactHandleSignalSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactHandleSignalSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  INFERENCESchemaINFERENCEPrivatizedHistoryStats *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INFERENCESchemaINFERENCEContactHandleSignalSet *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)INFERENCESchemaINFERENCEContactHandleSignalSet;
  v5 = -[INFERENCESchemaINFERENCEContactHandleSignalSet init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggestedHandle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsSuggestedHandle:](v5, "setIsSuggestedHandle:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryExactMatch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryExactMatch:](v5, "setIsQueryExactMatch:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryMatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryMatch:](v5, "setIsQueryMatch:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPartialQueryValueMatch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPartialQueryValueMatch:](v5, "setIsPartialQueryValueMatch:", objc_msgSend(v10, "BOOLValue"));
    v23 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historyStats"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats initWithDictionary:]([INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc], "initWithDictionary:", v11);
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setHistoryStats:](v5, "setHistoryStats:", v12);

    }
    v22 = (void *)v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInAnyGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInAnyGroup:](v5, "setIsRecentInAnyGroup:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInSameGroup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInSameGroup:](v5, "setIsRecentInSameGroup:", objc_msgSend(v14, "BOOLValue"));
    v26 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPreferredType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPreferredType:](v5, "setIsPreferredType:", objc_msgSend(v15, "BOOLValue"));
    v24 = v9;
    v25 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAllowedType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsAllowedType:](v5, "setIsAllowedType:", objc_msgSend(v16, "BOOLValue"));
    v17 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFaceTimeable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFaceTimeable:](v5, "setIsFaceTimeable:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNotFaceTimeable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsNotFaceTimeable:](v5, "setIsNotFaceTimeable:", objc_msgSend(v19, "BOOLValue"));
    v20 = v5;

  }
  return v5;
}

- (BOOL)isSuggestedHandle
{
  return self->_isSuggestedHandle;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isQueryExactMatch
{
  return self->_isQueryExactMatch;
}

- (BOOL)isQueryMatch
{
  return self->_isQueryMatch;
}

- (BOOL)isPartialQueryValueMatch
{
  return self->_isPartialQueryValueMatch;
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats
{
  return self->_historyStats;
}

- (void)setHistoryStats:(id)a3
{
  objc_storeStrong((id *)&self->_historyStats, a3);
}

- (BOOL)isRecentInAnyGroup
{
  return self->_isRecentInAnyGroup;
}

- (BOOL)isRecentInSameGroup
{
  return self->_isRecentInSameGroup;
}

- (BOOL)isPreferredType
{
  return self->_isPreferredType;
}

- (BOOL)isAllowedType
{
  return self->_isAllowedType;
}

- (BOOL)isFaceTimeable
{
  return self->_isFaceTimeable;
}

- (BOOL)isNotFaceTimeable
{
  return self->_isNotFaceTimeable;
}

- (void)setHasHistoryStats:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyStats, 0);
}

@end
