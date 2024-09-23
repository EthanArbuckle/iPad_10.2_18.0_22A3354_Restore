@implementation PPPBFeedbackMetadata

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (void)setUnixTimestampSec:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_unixTimestampSec = a3;
}

- (void)setHasUnixTimestampSec:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnixTimestampSec
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsMapped:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isMapped = a3;
}

- (void)setHasIsMapped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsMapped
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)PPPBFeedbackMetadata;
  -[PPPBFeedbackMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBFeedbackMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientBundleId;
  NSString *clientIdentifier;
  NSString *mappingId;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientBundleId = self->_clientBundleId;
  if (clientBundleId)
    objc_msgSend(v3, "setObject:forKey:", clientBundleId, CFSTR("clientBundleId"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v4, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v4, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_unixTimestampSec);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("unixTimestampSec"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMapped);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("isMapped"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeedbackMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientBundleId)
  {
    objc_msgSend(v4, "setClientBundleId:");
    v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v6, "setClientIdentifier:");
    v4 = v6;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v6, "setMappingId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_unixTimestampSec;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_isMapped;
    *((_BYTE *)v4 + 44) |= 2u;
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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientBundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_unixTimestampSec;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_isMapped;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientBundleId;
  NSString *clientIdentifier;
  NSString *mappingId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:"))
      goto LABEL_15;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_unixTimestampSec != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_15;
  }
  v8 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
    {
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (self->_isMapped)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_15;
    }
    v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_clientBundleId, "hash");
  v4 = -[NSString hash](self->_clientIdentifier, "hash");
  v5 = -[NSString hash](self->_mappingId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_unixTimestampSec;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_isMapped;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PPPBFeedbackMetadata setClientBundleId:](self, "setClientBundleId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PPPBFeedbackMetadata setClientIdentifier:](self, "setClientIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PPPBFeedbackMetadata setMappingId:](self, "setMappingId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_unixTimestampSec = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_isMapped = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (unint64_t)unixTimestampSec
{
  return self->_unixTimestampSec;
}

- (BOOL)isMapped
{
  return self->_isMapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

@end
