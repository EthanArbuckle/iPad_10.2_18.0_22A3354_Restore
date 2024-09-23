@implementation PKProtobufPaymentDeviceRequest

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setShouldAdvertise:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldAdvertise = a3;
}

- (void)setHasShouldAdvertise:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldAdvertise
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearKnownManifestHashes
{
  -[NSMutableArray removeAllObjects](self->_knownManifestHashes, "removeAllObjects");
}

- (void)addKnownManifestHashes:(id)a3
{
  id v4;
  NSMutableArray *knownManifestHashes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  knownManifestHashes = self->_knownManifestHashes;
  v8 = v4;
  if (!knownManifestHashes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_knownManifestHashes;
    self->_knownManifestHashes = v6;

    v4 = v8;
    knownManifestHashes = self->_knownManifestHashes;
  }
  -[NSMutableArray addObject:](knownManifestHashes, "addObject:", v4);

}

- (unint64_t)knownManifestHashesCount
{
  return -[NSMutableArray count](self->_knownManifestHashes, "count");
}

- (id)knownManifestHashesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_knownManifestHashes, "objectAtIndex:", a3);
}

+ (Class)knownManifestHashesType
{
  return (Class)objc_opt_class();
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtocolVersion
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
  v8.super_class = (Class)PKProtobufPaymentDeviceRequest;
  -[PKProtobufPaymentDeviceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentDeviceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceName;
  void *v6;
  NSMutableArray *knownManifestHashes;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAdvertise);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("shouldAdvertise"));

  }
  knownManifestHashes = self->_knownManifestHashes;
  if (knownManifestHashes)
    objc_msgSend(v4, "setObject:forKey:", knownManifestHashes, CFSTR("knownManifestHashes"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_protocolVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("protocolVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentDeviceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_knownManifestHashes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  v9 = v4;
  if (self->_deviceName)
  {
    objc_msgSend(v4, "setDeviceName:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[28] = self->_shouldAdvertise;
    v4[32] |= 2u;
  }
  if (-[PKProtobufPaymentDeviceRequest knownManifestHashesCount](self, "knownManifestHashesCount"))
  {
    objc_msgSend(v9, "clearKnownManifestHashes");
    v5 = -[PKProtobufPaymentDeviceRequest knownManifestHashesCount](self, "knownManifestHashesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PKProtobufPaymentDeviceRequest knownManifestHashesAtIndex:](self, "knownManifestHashesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addKnownManifestHashes:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 6) = self->_protocolVersion;
    v9[32] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 28) = self->_shouldAdvertise;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_knownManifestHashes;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addKnownManifestHashes:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_protocolVersion;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceName;
  char has;
  char v7;
  NSMutableArray *knownManifestHashes;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_19;
    if (self->_shouldAdvertise)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_19;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  knownManifestHashes = self->_knownManifestHashes;
  if (!((unint64_t)knownManifestHashes | *((_QWORD *)v4 + 2)))
    goto LABEL_15;
  if (!-[NSMutableArray isEqual:](knownManifestHashes, "isEqual:"))
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 32);
LABEL_15:
  v9 = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 6))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_deviceName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_shouldAdvertise;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_knownManifestHashes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_protocolVersion;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[PKProtobufPaymentDeviceRequest setDeviceName:](self, "setDeviceName:");
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_shouldAdvertise = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PKProtobufPaymentDeviceRequest addKnownManifestHashes:](self, "addKnownManifestHashes:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_protocolVersion = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (BOOL)shouldAdvertise
{
  return self->_shouldAdvertise;
}

- (NSMutableArray)knownManifestHashes
{
  return self->_knownManifestHashes;
}

- (void)setKnownManifestHashes:(id)a3
{
  objc_storeStrong((id *)&self->_knownManifestHashes, a3);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownManifestHashes, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
