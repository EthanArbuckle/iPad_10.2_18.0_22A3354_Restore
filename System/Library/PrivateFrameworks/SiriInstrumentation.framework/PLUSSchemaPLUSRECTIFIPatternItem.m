@implementation PLUSSchemaPLUSRECTIFIPatternItem

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setItemSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_itemSource = a3;
}

- (BOOL)hasItemSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasItemSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteItemSource
{
  -[PLUSSchemaPLUSRECTIFIPatternItem setItemSource:](self, "setItemSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setItemType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_itemType = a3;
}

- (BOOL)hasItemType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasItemType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteItemType
{
  -[PLUSSchemaPLUSRECTIFIPatternItem setItemType:](self, "setItemType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setRelativeTimestampInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_relativeTimestampInMs = a3;
}

- (BOOL)hasRelativeTimestampInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRelativeTimestampInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteRelativeTimestampInMs
{
  -[PLUSSchemaPLUSRECTIFIPatternItem setRelativeTimestampInMs:](self, "setRelativeTimestampInMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCdmMatchingSpanLabel:(id)a3
{
  NSString *uufrSaidDialogIdentifier;
  NSString *v5;
  NSString *cdmMatchingSpanLabel;
  id v7;

  uufrSaidDialogIdentifier = self->_uufrSaidDialogIdentifier;
  self->_uufrSaidDialogIdentifier = 0;
  v7 = a3;

  self->_whichPatternitemcontent = 4 * (v7 != 0);
  v5 = (NSString *)objc_msgSend(v7, "copy");
  cdmMatchingSpanLabel = self->_cdmMatchingSpanLabel;
  self->_cdmMatchingSpanLabel = v5;

}

- (NSString)cdmMatchingSpanLabel
{
  if (self->_whichPatternitemcontent == 4)
    return self->_cdmMatchingSpanLabel;
  else
    return (NSString *)0;
}

- (void)deleteCdmMatchingSpanLabel
{
  NSString *cdmMatchingSpanLabel;

  if (self->_whichPatternitemcontent == 4)
  {
    self->_whichPatternitemcontent = 0;
    cdmMatchingSpanLabel = self->_cdmMatchingSpanLabel;
    self->_cdmMatchingSpanLabel = 0;

  }
}

- (void)setUufrSaidDialogIdentifier:(id)a3
{
  NSString *cdmMatchingSpanLabel;
  unint64_t v5;
  NSString *v6;
  NSString *uufrSaidDialogIdentifier;
  id v8;

  cdmMatchingSpanLabel = self->_cdmMatchingSpanLabel;
  self->_cdmMatchingSpanLabel = 0;
  v8 = a3;

  v5 = 5;
  if (!v8)
    v5 = 0;
  self->_whichPatternitemcontent = v5;
  v6 = (NSString *)objc_msgSend(v8, "copy");
  uufrSaidDialogIdentifier = self->_uufrSaidDialogIdentifier;
  self->_uufrSaidDialogIdentifier = v6;

}

- (NSString)uufrSaidDialogIdentifier
{
  if (self->_whichPatternitemcontent == 5)
    return self->_uufrSaidDialogIdentifier;
  else
    return (NSString *)0;
}

- (void)deleteUufrSaidDialogIdentifier
{
  NSString *uufrSaidDialogIdentifier;

  if (self->_whichPatternitemcontent == 5)
  {
    self->_whichPatternitemcontent = 0;
    uufrSaidDialogIdentifier = self->_uufrSaidDialogIdentifier;
    self->_uufrSaidDialogIdentifier = 0;

  }
}

- (BOOL)hasItemDomainName
{
  return self->_itemDomainName != 0;
}

- (void)deleteItemDomainName
{
  -[PLUSSchemaPLUSRECTIFIPatternItem setItemDomainName:](self, "setItemDomainName:", 0);
}

- (BOOL)hasItemPayload
{
  return self->_itemPayload != 0;
}

- (void)deleteItemPayload
{
  -[PLUSSchemaPLUSRECTIFIPatternItem setItemPayload:](self, "setItemPayload:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSRECTIFIPatternItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  -[PLUSSchemaPLUSRECTIFIPatternItem cdmMatchingSpanLabel](self, "cdmMatchingSpanLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSRECTIFIPatternItem uufrSaidDialogIdentifier](self, "uufrSaidDialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSRECTIFIPatternItem itemDomainName](self, "itemDomainName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSRECTIFIPatternItem itemPayload](self, "itemPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichPatternitemcontent;
  $9E180F69763847707AE01B8F091C8801 has;
  unsigned int v7;
  int itemSource;
  int v9;
  int itemType;
  int v11;
  unint64_t relativeTimestampInMs;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  whichPatternitemcontent = self->_whichPatternitemcontent;
  if (whichPatternitemcontent != objc_msgSend(v4, "whichPatternitemcontent"))
    goto LABEL_34;
  has = self->_has;
  v7 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    itemSource = self->_itemSource;
    if (itemSource != objc_msgSend(v4, "itemSource"))
      goto LABEL_34;
    has = self->_has;
    v7 = v4[56];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      itemType = self->_itemType;
      if (itemType != objc_msgSend(v4, "itemType"))
        goto LABEL_34;
      has = self->_has;
      v7 = v4[56];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 != ((v7 >> 2) & 1))
      goto LABEL_34;
    if (v11)
    {
      relativeTimestampInMs = self->_relativeTimestampInMs;
      if (relativeTimestampInMs != objc_msgSend(v4, "relativeTimestampInMs"))
        goto LABEL_34;
    }
    -[PLUSSchemaPLUSRECTIFIPatternItem cdmMatchingSpanLabel](self, "cdmMatchingSpanLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmMatchingSpanLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) == (v14 != 0))
      goto LABEL_33;
    -[PLUSSchemaPLUSRECTIFIPatternItem cdmMatchingSpanLabel](self, "cdmMatchingSpanLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[PLUSSchemaPLUSRECTIFIPatternItem cdmMatchingSpanLabel](self, "cdmMatchingSpanLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cdmMatchingSpanLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_34;
    }
    else
    {

    }
    -[PLUSSchemaPLUSRECTIFIPatternItem uufrSaidDialogIdentifier](self, "uufrSaidDialogIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uufrSaidDialogIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) == (v14 != 0))
      goto LABEL_33;
    -[PLUSSchemaPLUSRECTIFIPatternItem uufrSaidDialogIdentifier](self, "uufrSaidDialogIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[PLUSSchemaPLUSRECTIFIPatternItem uufrSaidDialogIdentifier](self, "uufrSaidDialogIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uufrSaidDialogIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_34;
    }
    else
    {

    }
    -[PLUSSchemaPLUSRECTIFIPatternItem itemDomainName](self, "itemDomainName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemDomainName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) == (v14 != 0))
      goto LABEL_33;
    -[PLUSSchemaPLUSRECTIFIPatternItem itemDomainName](self, "itemDomainName");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[PLUSSchemaPLUSRECTIFIPatternItem itemDomainName](self, "itemDomainName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemDomainName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

      if (!v29)
        goto LABEL_34;
    }
    else
    {

    }
    -[PLUSSchemaPLUSRECTIFIPatternItem itemPayload](self, "itemPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 == 0) != (v14 != 0))
    {
      -[PLUSSchemaPLUSRECTIFIPatternItem itemPayload](self, "itemPayload");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {

LABEL_37:
        v35 = 1;
        goto LABEL_35;
      }
      v31 = (void *)v30;
      -[PLUSSchemaPLUSRECTIFIPatternItem itemPayload](self, "itemPayload");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemPayload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if ((v34 & 1) != 0)
        goto LABEL_37;
    }
    else
    {
LABEL_33:

    }
  }
LABEL_34:
  v35 = 0;
LABEL_35:

  return v35;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_itemSource;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_itemType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_relativeTimestampInMs;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_cdmMatchingSpanLabel, "hash");
  v7 = -[NSString hash](self->_uufrSaidDialogIdentifier, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_itemDomainName, "hash");
  return v8 ^ -[NSString hash](self->_itemPayload, "hash");
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
  char has;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cdmMatchingSpanLabel)
  {
    -[PLUSSchemaPLUSRECTIFIPatternItem cdmMatchingSpanLabel](self, "cdmMatchingSpanLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cdmMatchingSpanLabel"));

  }
  if (self->_itemDomainName)
  {
    -[PLUSSchemaPLUSRECTIFIPatternItem itemDomainName](self, "itemDomainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("itemDomainName"));

  }
  if (self->_itemPayload)
  {
    -[PLUSSchemaPLUSRECTIFIPatternItem itemPayload](self, "itemPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("itemPayload"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v15 = -[PLUSSchemaPLUSRECTIFIPatternItem itemSource](self, "itemSource");
    v16 = CFSTR("PLUSRECTIFIPATTERNITEMSOURCE_UNKNOWN");
    if (v15 == 1)
      v16 = CFSTR("PLUSRECTIFIPATTERNITEMSOURCE_SIRI");
    if (v15 == 2)
      v17 = CFSTR("PLUSRECTIFIPATTERNITEMSOURCE_APP");
    else
      v17 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("itemSource"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v18 = -[PLUSSchemaPLUSRECTIFIPatternItem itemType](self, "itemType") - 1;
  if (v18 > 6)
    v19 = CFSTR("PLUSRECTIFIPATTERNITEMTYPE_UNKNOWN");
  else
    v19 = off_1E5632ED8[v18];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("itemType"));
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSRECTIFIPatternItem relativeTimestampInMs](self, "relativeTimestampInMs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("relativeTimestampInMs"));

LABEL_11:
  if (self->_uufrSaidDialogIdentifier)
  {
    -[PLUSSchemaPLUSRECTIFIPatternItem uufrSaidDialogIdentifier](self, "uufrSaidDialogIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("uufrSaidDialogIdentifier"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSRECTIFIPatternItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSRECTIFIPatternItem)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSRECTIFIPatternItem *v5;
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
    self = -[PLUSSchemaPLUSRECTIFIPatternItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternItem)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSRECTIFIPatternItem *v5;
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
  PLUSSchemaPLUSRECTIFIPatternItem *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternItem;
  v5 = -[PLUSSchemaPLUSRECTIFIPatternItem init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemSource:](v5, "setItemSource:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemType:](v5, "setItemType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeTimestampInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSRECTIFIPatternItem setRelativeTimestampInMs:](v5, "setRelativeTimestampInMs:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmMatchingSpanLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PLUSSchemaPLUSRECTIFIPatternItem setCdmMatchingSpanLabel:](v5, "setCdmMatchingSpanLabel:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uufrSaidDialogIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[PLUSSchemaPLUSRECTIFIPatternItem setUufrSaidDialogIdentifier:](v5, "setUufrSaidDialogIdentifier:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemDomainName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemDomainName:](v5, "setItemDomainName:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemPayload"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemPayload:](v5, "setItemPayload:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (unint64_t)whichPatternitemcontent
{
  return self->_whichPatternitemcontent;
}

- (int)itemSource
{
  return self->_itemSource;
}

- (int)itemType
{
  return self->_itemType;
}

- (unint64_t)relativeTimestampInMs
{
  return self->_relativeTimestampInMs;
}

- (NSString)itemDomainName
{
  return self->_itemDomainName;
}

- (void)setItemDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)itemPayload
{
  return self->_itemPayload;
}

- (void)setItemPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasCdmMatchingSpanLabel
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasCdmMatchingSpanLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasUufrSaidDialogIdentifier
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasUufrSaidDialogIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasItemDomainName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasItemPayload:(BOOL)a3
{
  self->_hasCdmMatchingSpanLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPayload, 0);
  objc_storeStrong((id *)&self->_itemDomainName, 0);
  objc_storeStrong((id *)&self->_uufrSaidDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_cdmMatchingSpanLabel, 0);
}

@end
