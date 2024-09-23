@implementation AWDHoneybeeSignature

- (void)dealloc
{
  objc_super v3;

  -[AWDHoneybeeSignature setRadarTitle:](self, "setRadarTitle:", 0);
  -[AWDHoneybeeSignature setRadarSignature:](self, "setRadarSignature:", 0);
  -[AWDHoneybeeSignature setRadarDescription:](self, "setRadarDescription:", 0);
  -[AWDHoneybeeSignature setRadarComponent:](self, "setRadarComponent:", 0);
  -[AWDHoneybeeSignature setRadarVersion:](self, "setRadarVersion:", 0);
  -[AWDHoneybeeSignature setRadarAttachmentUUID:](self, "setRadarAttachmentUUID:", 0);
  -[AWDHoneybeeSignature setRadarAttachmentTypes:](self, "setRadarAttachmentTypes:", 0);
  -[AWDHoneybeeSignature setRadarAttachmentFilename:](self, "setRadarAttachmentFilename:", 0);
  -[AWDHoneybeeSignature setKeywords:](self, "setKeywords:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDHoneybeeSignature;
  -[AWDHoneybeeSignature dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRadarTitle
{
  return self->_radarTitle != 0;
}

- (BOOL)hasRadarSignature
{
  return self->_radarSignature != 0;
}

- (BOOL)hasRadarDescription
{
  return self->_radarDescription != 0;
}

- (BOOL)hasRadarComponent
{
  return self->_radarComponent != 0;
}

- (BOOL)hasRadarVersion
{
  return self->_radarVersion != 0;
}

- (BOOL)hasRadarAttachmentUUID
{
  return self->_radarAttachmentUUID != 0;
}

- (void)clearRadarAttachmentTypes
{
  -[NSMutableArray removeAllObjects](self->_radarAttachmentTypes, "removeAllObjects");
}

- (void)addRadarAttachmentTypes:(id)a3
{
  NSMutableArray *radarAttachmentTypes;

  radarAttachmentTypes = self->_radarAttachmentTypes;
  if (!radarAttachmentTypes)
  {
    radarAttachmentTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_radarAttachmentTypes = radarAttachmentTypes;
  }
  -[NSMutableArray addObject:](radarAttachmentTypes, "addObject:", a3);
}

- (unint64_t)radarAttachmentTypesCount
{
  return -[NSMutableArray count](self->_radarAttachmentTypes, "count");
}

- (id)radarAttachmentTypesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_radarAttachmentTypes, "objectAtIndex:", a3);
}

+ (Class)radarAttachmentTypesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRadarAttachmentFilename
{
  return self->_radarAttachmentFilename != 0;
}

- (void)clearKeywords
{
  -[NSMutableArray removeAllObjects](self->_keywords, "removeAllObjects");
}

- (void)addKeywords:(id)a3
{
  NSMutableArray *keywords;

  keywords = self->_keywords;
  if (!keywords)
  {
    keywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_keywords = keywords;
  }
  -[NSMutableArray addObject:](keywords, "addObject:", a3);
}

- (unint64_t)keywordsCount
{
  return -[NSMutableArray count](self->_keywords, "count");
}

- (id)keywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keywords, "objectAtIndex:", a3);
}

+ (Class)keywordsType
{
  return (Class)objc_opt_class();
}

- (void)setInstances:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_instances = a3;
}

- (void)setHasInstances:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInstances
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDHoneybeeSignature;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDHoneybeeSignature description](&v3, sel_description), -[AWDHoneybeeSignature dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *radarTitle;
  NSString *radarSignature;
  NSString *radarDescription;
  NSString *radarComponent;
  NSString *radarVersion;
  NSString *radarAttachmentUUID;
  NSMutableArray *radarAttachmentTypes;
  NSString *radarAttachmentFilename;
  NSMutableArray *keywords;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  radarTitle = self->_radarTitle;
  if (radarTitle)
    objc_msgSend(v3, "setObject:forKey:", radarTitle, CFSTR("radarTitle"));
  radarSignature = self->_radarSignature;
  if (radarSignature)
    objc_msgSend(v3, "setObject:forKey:", radarSignature, CFSTR("radarSignature"));
  radarDescription = self->_radarDescription;
  if (radarDescription)
    objc_msgSend(v3, "setObject:forKey:", radarDescription, CFSTR("radarDescription"));
  radarComponent = self->_radarComponent;
  if (radarComponent)
    objc_msgSend(v3, "setObject:forKey:", radarComponent, CFSTR("radarComponent"));
  radarVersion = self->_radarVersion;
  if (radarVersion)
    objc_msgSend(v3, "setObject:forKey:", radarVersion, CFSTR("radarVersion"));
  radarAttachmentUUID = self->_radarAttachmentUUID;
  if (radarAttachmentUUID)
    objc_msgSend(v3, "setObject:forKey:", radarAttachmentUUID, CFSTR("radarAttachmentUUID"));
  radarAttachmentTypes = self->_radarAttachmentTypes;
  if (radarAttachmentTypes)
    objc_msgSend(v3, "setObject:forKey:", radarAttachmentTypes, CFSTR("radarAttachmentTypes"));
  radarAttachmentFilename = self->_radarAttachmentFilename;
  if (radarAttachmentFilename)
    objc_msgSend(v3, "setObject:forKey:", radarAttachmentFilename, CFSTR("radarAttachmentFilename"));
  keywords = self->_keywords;
  if (keywords)
    objc_msgSend(v3, "setObject:forKey:", keywords, CFSTR("keywords"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_instances), CFSTR("instances"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHoneybeeSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *radarAttachmentTypes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *keywords;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_radarTitle)
    PBDataWriterWriteStringField();
  if (self->_radarSignature)
    PBDataWriterWriteStringField();
  if (self->_radarDescription)
    PBDataWriterWriteStringField();
  if (self->_radarComponent)
    PBDataWriterWriteStringField();
  if (self->_radarVersion)
    PBDataWriterWriteStringField();
  if (self->_radarAttachmentUUID)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  radarAttachmentTypes = self->_radarAttachmentTypes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](radarAttachmentTypes, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(radarAttachmentTypes);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](radarAttachmentTypes, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  if (self->_radarAttachmentFilename)
    PBDataWriterWriteStringField();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  keywords = self->_keywords;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keywords, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(keywords);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keywords, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 96) |= 1u;
  }
  if (self->_radarTitle)
    objc_msgSend(a3, "setRadarTitle:");
  if (self->_radarSignature)
    objc_msgSend(a3, "setRadarSignature:");
  if (self->_radarDescription)
    objc_msgSend(a3, "setRadarDescription:");
  if (self->_radarComponent)
    objc_msgSend(a3, "setRadarComponent:");
  if (self->_radarVersion)
    objc_msgSend(a3, "setRadarVersion:");
  if (self->_radarAttachmentUUID)
    objc_msgSend(a3, "setRadarAttachmentUUID:");
  if (-[AWDHoneybeeSignature radarAttachmentTypesCount](self, "radarAttachmentTypesCount"))
  {
    objc_msgSend(a3, "clearRadarAttachmentTypes");
    v5 = -[AWDHoneybeeSignature radarAttachmentTypesCount](self, "radarAttachmentTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRadarAttachmentTypes:", -[AWDHoneybeeSignature radarAttachmentTypesAtIndex:](self, "radarAttachmentTypesAtIndex:", i));
    }
  }
  if (self->_radarAttachmentFilename)
    objc_msgSend(a3, "setRadarAttachmentFilename:");
  if (-[AWDHoneybeeSignature keywordsCount](self, "keywordsCount"))
  {
    objc_msgSend(a3, "clearKeywords");
    v8 = -[AWDHoneybeeSignature keywordsCount](self, "keywordsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addKeywords:", -[AWDHoneybeeSignature keywordsAtIndex:](self, "keywordsAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_instances;
    *((_BYTE *)a3 + 96) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *radarAttachmentTypes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *keywords;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 96) |= 1u;
  }

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_radarTitle, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_radarSignature, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_radarDescription, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_radarComponent, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_radarVersion, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_radarAttachmentUUID, "copyWithZone:", a3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  radarAttachmentTypes = self->_radarAttachmentTypes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](radarAttachmentTypes, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(radarAttachmentTypes);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addRadarAttachmentTypes:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](radarAttachmentTypes, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_radarAttachmentFilename, "copyWithZone:", a3);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  keywords = self->_keywords;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keywords, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(keywords);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addKeywords:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keywords, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_instances;
    *(_BYTE *)(v6 + 96) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *radarTitle;
  NSString *radarSignature;
  NSString *radarDescription;
  NSString *radarComponent;
  NSString *radarVersion;
  NSString *radarAttachmentUUID;
  NSMutableArray *radarAttachmentTypes;
  NSString *radarAttachmentFilename;
  NSMutableArray *keywords;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 96) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 96) & 1) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    radarTitle = self->_radarTitle;
    if (!((unint64_t)radarTitle | *((_QWORD *)a3 + 10))
      || (v5 = -[NSString isEqual:](radarTitle, "isEqual:")) != 0)
    {
      radarSignature = self->_radarSignature;
      if (!((unint64_t)radarSignature | *((_QWORD *)a3 + 9))
        || (v5 = -[NSString isEqual:](radarSignature, "isEqual:")) != 0)
      {
        radarDescription = self->_radarDescription;
        if (!((unint64_t)radarDescription | *((_QWORD *)a3 + 8))
          || (v5 = -[NSString isEqual:](radarDescription, "isEqual:")) != 0)
        {
          radarComponent = self->_radarComponent;
          if (!((unint64_t)radarComponent | *((_QWORD *)a3 + 7))
            || (v5 = -[NSString isEqual:](radarComponent, "isEqual:")) != 0)
          {
            radarVersion = self->_radarVersion;
            if (!((unint64_t)radarVersion | *((_QWORD *)a3 + 11))
              || (v5 = -[NSString isEqual:](radarVersion, "isEqual:")) != 0)
            {
              radarAttachmentUUID = self->_radarAttachmentUUID;
              if (!((unint64_t)radarAttachmentUUID | *((_QWORD *)a3 + 6))
                || (v5 = -[NSString isEqual:](radarAttachmentUUID, "isEqual:")) != 0)
              {
                radarAttachmentTypes = self->_radarAttachmentTypes;
                if (!((unint64_t)radarAttachmentTypes | *((_QWORD *)a3 + 5))
                  || (v5 = -[NSMutableArray isEqual:](radarAttachmentTypes, "isEqual:")) != 0)
                {
                  radarAttachmentFilename = self->_radarAttachmentFilename;
                  if (!((unint64_t)radarAttachmentFilename | *((_QWORD *)a3 + 4))
                    || (v5 = -[NSString isEqual:](radarAttachmentFilename, "isEqual:")) != 0)
                  {
                    keywords = self->_keywords;
                    if (!((unint64_t)keywords | *((_QWORD *)a3 + 3))
                      || (v5 = -[NSMutableArray isEqual:](keywords, "isEqual:")) != 0)
                    {
                      LOBYTE(v5) = (*((_BYTE *)a3 + 96) & 2) == 0;
                      if ((*(_BYTE *)&self->_has & 2) != 0)
                      {
                        if ((*((_BYTE *)a3 + 96) & 2) == 0 || self->_instances != *((_DWORD *)a3 + 4))
                          goto LABEL_29;
                        LOBYTE(v5) = 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v14 = 2654435761u * self->_timestamp;
  else
    v14 = 0;
  v3 = -[NSString hash](self->_radarTitle, "hash");
  v4 = -[NSString hash](self->_radarSignature, "hash");
  v5 = -[NSString hash](self->_radarDescription, "hash");
  v6 = -[NSString hash](self->_radarComponent, "hash");
  v7 = -[NSString hash](self->_radarVersion, "hash");
  v8 = -[NSString hash](self->_radarAttachmentUUID, "hash");
  v9 = -[NSMutableArray hash](self->_radarAttachmentTypes, "hash");
  v10 = -[NSString hash](self->_radarAttachmentFilename, "hash");
  v11 = -[NSMutableArray hash](self->_keywords, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_instances;
  else
    v12 = 0;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 96) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 10))
    -[AWDHoneybeeSignature setRadarTitle:](self, "setRadarTitle:");
  if (*((_QWORD *)a3 + 9))
    -[AWDHoneybeeSignature setRadarSignature:](self, "setRadarSignature:");
  if (*((_QWORD *)a3 + 8))
    -[AWDHoneybeeSignature setRadarDescription:](self, "setRadarDescription:");
  if (*((_QWORD *)a3 + 7))
    -[AWDHoneybeeSignature setRadarComponent:](self, "setRadarComponent:");
  if (*((_QWORD *)a3 + 11))
    -[AWDHoneybeeSignature setRadarVersion:](self, "setRadarVersion:");
  if (*((_QWORD *)a3 + 6))
    -[AWDHoneybeeSignature setRadarAttachmentUUID:](self, "setRadarAttachmentUUID:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[AWDHoneybeeSignature addRadarAttachmentTypes:](self, "addRadarAttachmentTypes:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDHoneybeeSignature setRadarAttachmentFilename:](self, "setRadarAttachmentFilename:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[AWDHoneybeeSignature addKeywords:](self, "addKeywords:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
  if ((*((_BYTE *)a3 + 96) & 2) != 0)
  {
    self->_instances = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)radarSignature
{
  return self->_radarSignature;
}

- (void)setRadarSignature:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)radarComponent
{
  return self->_radarComponent;
}

- (void)setRadarComponent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)radarVersion
{
  return self->_radarVersion;
}

- (void)setRadarVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)radarAttachmentUUID
{
  return self->_radarAttachmentUUID;
}

- (void)setRadarAttachmentUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)radarAttachmentTypes
{
  return self->_radarAttachmentTypes;
}

- (void)setRadarAttachmentTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)radarAttachmentFilename
{
  return self->_radarAttachmentFilename;
}

- (void)setRadarAttachmentFilename:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)instances
{
  return self->_instances;
}

@end
