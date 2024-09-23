@implementation SISchemaUUFRShown

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaUUFRShown;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUUFRShown deleteDialogIdentifier](self, "deleteDialogIdentifier");
  -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaUUFRShown deleteSiriResponseContext](self, "deleteSiriResponseContext");
  -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaUUFRShown deleteGridCardSection](self, "deleteGridCardSection");
  -[SISchemaUUFRShown linkId](self, "linkId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaUUFRShown deleteLinkId](self, "deleteLinkId");
  -[SISchemaUUFRShown subRequestId](self, "subRequestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaUUFRShown deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (BOOL)hasViewID
{
  return self->_viewID != 0;
}

- (void)deleteViewID
{
  -[SISchemaUUFRShown setViewID:](self, "setViewID:", 0);
}

- (BOOL)hasSnippetClass
{
  return self->_snippetClass != 0;
}

- (void)deleteSnippetClass
{
  -[SISchemaUUFRShown setSnippetClass:](self, "setSnippetClass:", 0);
}

- (void)setSiriUILocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_siriUILocation = a3;
}

- (BOOL)hasSiriUILocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSiriUILocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSiriUILocation
{
  -[SISchemaUUFRShown setSiriUILocation:](self, "setSiriUILocation:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasDialogIdentifier
{
  return self->_dialogIdentifier != 0;
}

- (void)deleteDialogIdentifier
{
  -[SISchemaUUFRShown setDialogIdentifier:](self, "setDialogIdentifier:", 0);
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (void)deleteSiriResponseContext
{
  -[SISchemaUUFRShown setSiriResponseContext:](self, "setSiriResponseContext:", 0);
}

- (BOOL)hasAceViewID
{
  return self->_aceViewID != 0;
}

- (void)deleteAceViewID
{
  -[SISchemaUUFRShown setAceViewID:](self, "setAceViewID:", 0);
}

- (BOOL)hasAceViewClass
{
  return self->_aceViewClass != 0;
}

- (void)deleteAceViewClass
{
  -[SISchemaUUFRShown setAceViewClass:](self, "setAceViewClass:", 0);
}

- (void)setViewRegionDesignation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_viewRegionDesignation = a3;
}

- (BOOL)hasViewRegionDesignation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasViewRegionDesignation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteViewRegionDesignation
{
  -[SISchemaUUFRShown setViewRegionDesignation:](self, "setViewRegionDesignation:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setGridCardSection:(id)a3
{
  unint64_t v3;

  v3 = 9;
  if (!a3)
    v3 = 0;
  self->_whichSubsection = v3;
  objc_storeStrong((id *)&self->_gridCardSection, a3);
}

- (SISchemaGridCardSection)gridCardSection
{
  if (self->_whichSubsection == 9)
    return self->_gridCardSection;
  else
    return (SISchemaGridCardSection *)0;
}

- (void)deleteGridCardSection
{
  SISchemaGridCardSection *gridCardSection;

  if (self->_whichSubsection == 9)
  {
    self->_whichSubsection = 0;
    gridCardSection = self->_gridCardSection;
    self->_gridCardSection = 0;

  }
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[SISchemaUUFRShown setLinkId:](self, "setLinkId:", 0);
}

- (void)setResponseCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_responseCategory = a3;
}

- (BOOL)hasResponseCategory
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteResponseCategory
{
  -[SISchemaUUFRShown setResponseCategory:](self, "setResponseCategory:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[SISchemaUUFRShown setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRShownReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[SISchemaUUFRShown viewID](self, "viewID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SISchemaUUFRShown snippetClass](self, "snippetClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaUUFRShown dialogIdentifier](self, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUUFRShown aceViewID](self, "aceViewID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[SISchemaUUFRShown aceViewClass](self, "aceViewClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaUUFRShown linkId](self, "linkId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SISchemaUUFRShown linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaUUFRShown subRequestId](self, "subRequestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    -[SISchemaUUFRShown subRequestId](self, "subRequestId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v16 = v18;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichSubsection;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int siriUILocation;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int viewRegionDesignation;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  int responseCategory;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  whichSubsection = self->_whichSubsection;
  if (whichSubsection != objc_msgSend(v4, "whichSubsection"))
    goto LABEL_57;
  -[SISchemaUUFRShown viewID](self, "viewID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown viewID](self, "viewID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUUFRShown viewID](self, "viewID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_57;
  }
  else
  {

  }
  -[SISchemaUUFRShown snippetClass](self, "snippetClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snippetClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown snippetClass](self, "snippetClass");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaUUFRShown snippetClass](self, "snippetClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snippetClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_57;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[104] & 1))
    goto LABEL_57;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    siriUILocation = self->_siriUILocation;
    if (siriUILocation != objc_msgSend(v4, "siriUILocation"))
      goto LABEL_57;
  }
  -[SISchemaUUFRShown dialogIdentifier](self, "dialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown dialogIdentifier](self, "dialogIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[SISchemaUUFRShown dialogIdentifier](self, "dialogIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_57;
  }
  else
  {

  }
  -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriResponseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriResponseContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_57;
  }
  else
  {

  }
  -[SISchemaUUFRShown aceViewID](self, "aceViewID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown aceViewID](self, "aceViewID");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[SISchemaUUFRShown aceViewID](self, "aceViewID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_57;
  }
  else
  {

  }
  -[SISchemaUUFRShown aceViewClass](self, "aceViewClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown aceViewClass](self, "aceViewClass");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[SISchemaUUFRShown aceViewClass](self, "aceViewClass");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewClass");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_57;
  }
  else
  {

  }
  v39 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v39 != ((v4[104] >> 1) & 1))
    goto LABEL_57;
  if (v39)
  {
    viewRegionDesignation = self->_viewRegionDesignation;
    if (viewRegionDesignation != objc_msgSend(v4, "viewRegionDesignation"))
      goto LABEL_57;
  }
  -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridCardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridCardSection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_57;
  }
  else
  {

  }
  -[SISchemaUUFRShown linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_56;
  -[SISchemaUUFRShown linkId](self, "linkId");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[SISchemaUUFRShown linkId](self, "linkId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_57;
  }
  else
  {

  }
  v51 = (*(_BYTE *)&self->_has >> 2) & 1;
  if (v51 != ((v4[104] >> 2) & 1))
    goto LABEL_57;
  if (v51)
  {
    responseCategory = self->_responseCategory;
    if (responseCategory != objc_msgSend(v4, "responseCategory"))
      goto LABEL_57;
  }
  -[SISchemaUUFRShown subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaUUFRShown subRequestId](self, "subRequestId");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_60:
      v58 = 1;
      goto LABEL_58;
    }
    v54 = (void *)v53;
    -[SISchemaUUFRShown subRequestId](self, "subRequestId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_60;
  }
  else
  {
LABEL_56:

  }
LABEL_57:
  v58 = 0;
LABEL_58:

  return v58;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;

  v15 = -[NSString hash](self->_viewID, "hash");
  v13 = -[NSString hash](self->_snippetClass, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_siriUILocation;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_dialogIdentifier, "hash", v13);
  v5 = -[SISchemaSiriResponseContext hash](self->_siriResponseContext, "hash");
  v6 = -[NSString hash](self->_aceViewID, "hash");
  v7 = -[NSString hash](self->_aceViewClass, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_viewRegionDesignation;
  else
    v8 = 0;
  v9 = -[SISchemaGridCardSection hash](self->_gridCardSection, "hash");
  v10 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_responseCategory;
  else
    v11 = 0;
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
}

- (id)dictionaryRepresentation
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
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  const __CFString *v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceViewClass)
  {
    -[SISchemaUUFRShown aceViewClass](self, "aceViewClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceViewClass"));

  }
  if (self->_aceViewID)
  {
    -[SISchemaUUFRShown aceViewID](self, "aceViewID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("aceViewID"));

  }
  if (self->_dialogIdentifier)
  {
    -[SISchemaUUFRShown dialogIdentifier](self, "dialogIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dialogIdentifier"));

  }
  if (self->_gridCardSection)
  {
    -[SISchemaUUFRShown gridCardSection](self, "gridCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("gridCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("gridCardSection"));

    }
  }
  if (self->_linkId)
  {
    -[SISchemaUUFRShown linkId](self, "linkId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v16 = -[SISchemaUUFRShown responseCategory](self, "responseCategory") - 1;
    if (v16 > 0xC)
      v17 = CFSTR("RESPONSECATEGORY_UNKNOWN");
    else
      v17 = off_1E5637960[v16];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("responseCategory"));
  }
  if (self->_siriResponseContext)
  {
    -[SISchemaUUFRShown siriResponseContext](self, "siriResponseContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("siriResponseContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("siriResponseContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v21 = -[SISchemaUUFRShown siriUILocation](self, "siriUILocation") - 1;
    if (v21 > 2)
      v22 = CFSTR("SIRIUILOCATION_UNKNOWN_SIRI_UI_LOCATION");
    else
      v22 = off_1E56379C8[v21];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("siriUILocation"));
  }
  if (self->_snippetClass)
  {
    -[SISchemaUUFRShown snippetClass](self, "snippetClass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("snippetClass"));

  }
  if (self->_subRequestId)
  {
    -[SISchemaUUFRShown subRequestId](self, "subRequestId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("subRequestId"));

    }
  }
  if (self->_viewID)
  {
    -[SISchemaUUFRShown viewID](self, "viewID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("viewID"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v30 = -[SISchemaUUFRShown viewRegionDesignation](self, "viewRegionDesignation") - 1;
    if (v30 > 2)
      v31 = CFSTR("VIEWREGIONDESIGNATION_UNKNOWN_VIEW_REGION");
    else
      v31 = off_1E56379E0[v30];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("viewRegionDesignation"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRShown dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRShown)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRShown *v5;
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
    self = -[SISchemaUUFRShown initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRShown)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRShown *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SISchemaSiriResponseContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SISchemaGridCardSection *v21;
  void *v22;
  SISchemaUUID *v23;
  void *v24;
  void *v25;
  SISchemaUUID *v26;
  SISchemaUUFRShown *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SISchemaUUFRShown;
  v5 = -[SISchemaUUFRShown init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaUUFRShown setViewID:](v5, "setViewID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snippetClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaUUFRShown setSnippetClass:](v5, "setSnippetClass:", v9);

    }
    v32 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUILocation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRShown setSiriUILocation:](v5, "setSiriUILocation:", objc_msgSend(v10, "intValue"));
    v31 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialogIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[SISchemaUUFRShown setDialogIdentifier:](v5, "setDialogIdentifier:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResponseContext"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaSiriResponseContext initWithDictionary:]([SISchemaSiriResponseContext alloc], "initWithDictionary:", v13);
      -[SISchemaUUFRShown setSiriResponseContext:](v5, "setSiriResponseContext:", v14);

    }
    v29 = (void *)v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[SISchemaUUFRShown setAceViewID:](v5, "setAceViewID:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewClass"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[SISchemaUUFRShown setAceViewClass:](v5, "setAceViewClass:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewRegionDesignation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRShown setViewRegionDesignation:](v5, "setViewRegionDesignation:", objc_msgSend(v19, "intValue"));
    v30 = v11;
    v33 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gridCardSection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[SISchemaGridCardSection initWithDictionary:]([SISchemaGridCardSection alloc], "initWithDictionary:", v20);
      -[SISchemaUUFRShown setGridCardSection:](v5, "setGridCardSection:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v22);
      -[SISchemaUUFRShown setLinkId:](v5, "setLinkId:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCategory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRShown setResponseCategory:](v5, "setResponseCategory:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v25);
      -[SISchemaUUFRShown setSubRequestId:](v5, "setSubRequestId:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (unint64_t)whichSubsection
{
  return self->_whichSubsection;
}

- (NSString)viewID
{
  return self->_viewID;
}

- (void)setViewID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)snippetClass
{
  return self->_snippetClass;
}

- (void)setSnippetClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)siriUILocation
{
  return self->_siriUILocation;
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (void)setDialogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setSiriResponseContext:(id)a3
{
  objc_storeStrong((id *)&self->_siriResponseContext, a3);
}

- (NSString)aceViewID
{
  return self->_aceViewID;
}

- (void)setAceViewID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)aceViewClass
{
  return self->_aceViewClass;
}

- (void)setAceViewClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)viewRegionDesignation
{
  return self->_viewRegionDesignation;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (void)setHasViewID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSnippetClass:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasDialogIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  self->_hasViewID = a3;
}

- (void)setHasAceViewID:(BOOL)a3
{
  self->_hasSnippetClass = a3;
}

- (void)setHasAceViewClass:(BOOL)a3
{
  self->_hasDialogIdentifier = a3;
}

- (BOOL)hasGridCardSection
{
  return self->_hasSiriResponseContext;
}

- (void)setHasGridCardSection:(BOOL)a3
{
  self->_hasSiriResponseContext = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasAceViewID = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasAceViewClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_gridCardSection, 0);
  objc_storeStrong((id *)&self->_aceViewClass, 0);
  objc_storeStrong((id *)&self->_aceViewID, 0);
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetClass, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
