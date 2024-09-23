@implementation SYPBContentItem

- (BOOL)hasDisplayTitle
{
  return self->_displayTitle != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (BOOL)hasSourceLastKnownName
{
  return self->_sourceLastKnownName != 0;
}

- (BOOL)hasItemURL
{
  return self->_itemURL != 0;
}

- (BOOL)hasUserActivityData
{
  return self->_userActivityData != 0;
}

- (BOOL)hasLinkPreviewMetadata
{
  return self->_linkPreviewMetadata != 0;
}

- (void)setPreviewLoadLevel:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_previewLoadLevel = a3;
}

- (void)setHasPreviewLoadLevel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreviewLoadLevel
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)SYPBContentItem;
  -[SYPBContentItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYPBContentItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *itemIdentifierData;
  NSString *displayTitle;
  NSString *sourceIdentifier;
  NSString *sourceLastKnownName;
  NSString *itemURL;
  NSData *userActivityData;
  NSData *linkPreviewMetadata;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  itemIdentifierData = self->_itemIdentifierData;
  if (itemIdentifierData)
    objc_msgSend(v3, "setObject:forKey:", itemIdentifierData, CFSTR("itemIdentifierData"));
  displayTitle = self->_displayTitle;
  if (displayTitle)
    objc_msgSend(v4, "setObject:forKey:", displayTitle, CFSTR("displayTitle"));
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceIdentifier, CFSTR("sourceIdentifier"));
  sourceLastKnownName = self->_sourceLastKnownName;
  if (sourceLastKnownName)
    objc_msgSend(v4, "setObject:forKey:", sourceLastKnownName, CFSTR("sourceLastKnownName"));
  itemURL = self->_itemURL;
  if (itemURL)
    objc_msgSend(v4, "setObject:forKey:", itemURL, CFSTR("itemURL"));
  userActivityData = self->_userActivityData;
  if (userActivityData)
    objc_msgSend(v4, "setObject:forKey:", userActivityData, CFSTR("userActivityData"));
  linkPreviewMetadata = self->_linkPreviewMetadata;
  if (linkPreviewMetadata)
    objc_msgSend(v4, "setObject:forKey:", linkPreviewMetadata, CFSTR("linkPreviewMetadata"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_previewLoadLevel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("previewLoadLevel"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYPBContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_itemIdentifierData)
    -[SYPBContentItem writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteDataField();
  if (self->_displayTitle)
    PBDataWriterWriteStringField();
  if (self->_sourceIdentifier)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_sourceLastKnownName)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_itemURL)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_userActivityData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_linkPreviewMetadata)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setItemIdentifierData:", self->_itemIdentifierData);
  if (self->_displayTitle)
    objc_msgSend(v5, "setDisplayTitle:");
  if (self->_sourceIdentifier)
    objc_msgSend(v5, "setSourceIdentifier:");
  v4 = v5;
  if (self->_sourceLastKnownName)
  {
    objc_msgSend(v5, "setSourceLastKnownName:");
    v4 = v5;
  }
  if (self->_itemURL)
  {
    objc_msgSend(v5, "setItemURL:");
    v4 = v5;
  }
  if (self->_userActivityData)
  {
    objc_msgSend(v5, "setUserActivityData:");
    v4 = v5;
  }
  if (self->_linkPreviewMetadata)
  {
    objc_msgSend(v5, "setLinkPreviewMetadata:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_previewLoadLevel;
    *((_BYTE *)v4 + 72) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_itemIdentifierData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_displayTitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_sourceLastKnownName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_itemURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSData copyWithZone:](self->_userActivityData, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSData copyWithZone:](self->_linkPreviewMetadata, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_previewLoadLevel;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *itemIdentifierData;
  NSString *displayTitle;
  NSString *sourceIdentifier;
  NSString *sourceLastKnownName;
  NSString *itemURL;
  NSData *userActivityData;
  NSData *linkPreviewMetadata;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  itemIdentifierData = self->_itemIdentifierData;
  if ((unint64_t)itemIdentifierData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](itemIdentifierData, "isEqual:"))
      goto LABEL_20;
  }
  displayTitle = self->_displayTitle;
  if ((unint64_t)displayTitle | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayTitle, "isEqual:"))
      goto LABEL_20;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:"))
      goto LABEL_20;
  }
  sourceLastKnownName = self->_sourceLastKnownName;
  if ((unint64_t)sourceLastKnownName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](sourceLastKnownName, "isEqual:"))
      goto LABEL_20;
  }
  itemURL = self->_itemURL;
  if ((unint64_t)itemURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemURL, "isEqual:"))
      goto LABEL_20;
  }
  userActivityData = self->_userActivityData;
  if ((unint64_t)userActivityData | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](userActivityData, "isEqual:"))
      goto LABEL_20;
  }
  linkPreviewMetadata = self->_linkPreviewMetadata;
  if ((unint64_t)linkPreviewMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](linkPreviewMetadata, "isEqual:"))
      goto LABEL_20;
  }
  v12 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0 && self->_previewLoadLevel == *((_QWORD *)v4 + 1))
    {
      v12 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSData hash](self->_itemIdentifierData, "hash");
  v4 = -[NSString hash](self->_displayTitle, "hash");
  v5 = -[NSString hash](self->_sourceIdentifier, "hash");
  v6 = -[NSString hash](self->_sourceLastKnownName, "hash");
  v7 = -[NSString hash](self->_itemURL, "hash");
  v8 = -[NSData hash](self->_userActivityData, "hash");
  v9 = -[NSData hash](self->_linkPreviewMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_previewLoadLevel;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[3])
  {
    -[SYPBContentItem setItemIdentifierData:](self, "setItemIdentifierData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[SYPBContentItem setDisplayTitle:](self, "setDisplayTitle:");
    v4 = v5;
  }
  if (v4[6])
  {
    -[SYPBContentItem setSourceIdentifier:](self, "setSourceIdentifier:");
    v4 = v5;
  }
  if (v4[7])
  {
    -[SYPBContentItem setSourceLastKnownName:](self, "setSourceLastKnownName:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[SYPBContentItem setItemURL:](self, "setItemURL:");
    v4 = v5;
  }
  if (v4[8])
  {
    -[SYPBContentItem setUserActivityData:](self, "setUserActivityData:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[SYPBContentItem setLinkPreviewMetadata:](self, "setLinkPreviewMetadata:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_previewLoadLevel = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)itemIdentifierData
{
  return self->_itemIdentifierData;
}

- (void)setItemIdentifierData:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifierData, a3);
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
  objc_storeStrong((id *)&self->_displayTitle, a3);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)sourceLastKnownName
{
  return self->_sourceLastKnownName;
}

- (void)setSourceLastKnownName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceLastKnownName, a3);
}

- (NSString)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (NSData)linkPreviewMetadata
{
  return self->_linkPreviewMetadata;
}

- (void)setLinkPreviewMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkPreviewMetadata, a3);
}

- (int64_t)previewLoadLevel
{
  return self->_previewLoadLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_sourceLastKnownName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_linkPreviewMetadata, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_itemIdentifierData, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYPBContentItem writeTo:]", "SYPBContentItem.m", 186, "nil != self->_itemIdentifierData");
}

@end
