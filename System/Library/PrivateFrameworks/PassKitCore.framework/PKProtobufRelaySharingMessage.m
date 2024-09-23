@implementation PKProtobufRelaySharingMessage

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)clearMailboxURLs
{
  -[NSMutableArray removeAllObjects](self->_mailboxURLs, "removeAllObjects");
}

- (void)addMailboxURLs:(id)a3
{
  id v4;
  NSMutableArray *mailboxURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mailboxURLs = self->_mailboxURLs;
  v8 = v4;
  if (!mailboxURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_mailboxURLs;
    self->_mailboxURLs = v6;

    v4 = v8;
    mailboxURLs = self->_mailboxURLs;
  }
  -[NSMutableArray addObject:](mailboxURLs, "addObject:", v4);

}

- (unint64_t)mailboxURLsCount
{
  return -[NSMutableArray count](self->_mailboxURLs, "count");
}

- (id)mailboxURLsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mailboxURLs, "objectAtIndex:", a3);
}

+ (Class)mailboxURLsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalData
{
  return self->_localData != 0;
}

- (BOOL)hasProvisioningCredentialHash
{
  return self->_provisioningCredentialHash != 0;
}

- (BOOL)hasCarKeyReaderIdentifier
{
  return self->_carKeyReaderIdentifier != 0;
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
  v8.super_class = (Class)PKProtobufRelaySharingMessage;
  -[PKProtobufRelaySharingMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRelaySharingMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *subtitle;
  NSData *thumbnailImage;
  NSString *status;
  NSMutableArray *mailboxURLs;
  NSData *localData;
  NSString *provisioningCredentialHash;
  NSString *carKeyReaderIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", thumbnailImage, CFSTR("thumbnailImage"));
  status = self->_status;
  if (status)
    objc_msgSend(v3, "setObject:forKey:", status, CFSTR("status"));
  mailboxURLs = self->_mailboxURLs;
  if (mailboxURLs)
    objc_msgSend(v3, "setObject:forKey:", mailboxURLs, CFSTR("mailboxURLs"));
  localData = self->_localData;
  if (localData)
    objc_msgSend(v3, "setObject:forKey:", localData, CFSTR("localData"));
  provisioningCredentialHash = self->_provisioningCredentialHash;
  if (provisioningCredentialHash)
    objc_msgSend(v3, "setObject:forKey:", provisioningCredentialHash, CFSTR("provisioningCredentialHash"));
  carKeyReaderIdentifier = self->_carKeyReaderIdentifier;
  if (carKeyReaderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", carKeyReaderIdentifier, CFSTR("carKeyReaderIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRelaySharingMessageReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteUint32Field();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_thumbnailImage)
    PBDataWriterWriteDataField();
  if (self->_status)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_mailboxURLs;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_localData)
    PBDataWriterWriteDataField();
  if (self->_provisioningCredentialHash)
    PBDataWriterWriteStringField();
  if (self->_carKeyReaderIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _DWORD *v9;

  v9 = a3;
  v9[18] = self->_version;
  if (self->_title)
    objc_msgSend(v9, "setTitle:");
  if (self->_subtitle)
    objc_msgSend(v9, "setSubtitle:");
  if (self->_thumbnailImage)
    objc_msgSend(v9, "setThumbnailImage:");
  if (self->_status)
    objc_msgSend(v9, "setStatus:");
  if (-[PKProtobufRelaySharingMessage mailboxURLsCount](self, "mailboxURLsCount"))
  {
    objc_msgSend(v9, "clearMailboxURLs");
    v4 = -[PKProtobufRelaySharingMessage mailboxURLsCount](self, "mailboxURLsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PKProtobufRelaySharingMessage mailboxURLsAtIndex:](self, "mailboxURLsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addMailboxURLs:", v7);

      }
    }
  }
  if (self->_localData)
    objc_msgSend(v9, "setLocalData:");
  v8 = v9;
  if (self->_provisioningCredentialHash)
  {
    objc_msgSend(v9, "setProvisioningCredentialHash:");
    v8 = v9;
  }
  if (self->_carKeyReaderIdentifier)
  {
    objc_msgSend(v9, "setCarKeyReaderIdentifier:");
    v8 = v9;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 72) = self->_version;
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSData copyWithZone:](self->_thumbnailImage, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_status, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_mailboxURLs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addMailboxURLs:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  v20 = -[NSData copyWithZone:](self->_localData, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  v22 = -[NSString copyWithZone:](self->_provisioningCredentialHash, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  v24 = -[NSString copyWithZone:](self->_carKeyReaderIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *subtitle;
  NSData *thumbnailImage;
  NSString *status;
  NSMutableArray *mailboxURLs;
  NSData *localData;
  NSString *provisioningCredentialHash;
  NSString *carKeyReaderIdentifier;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 18)
    && ((title = self->_title, !((unint64_t)title | v4[8]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((subtitle = self->_subtitle, !((unint64_t)subtitle | v4[6]))
     || -[NSString isEqual:](subtitle, "isEqual:"))
    && ((thumbnailImage = self->_thumbnailImage, !((unint64_t)thumbnailImage | v4[7]))
     || -[NSData isEqual:](thumbnailImage, "isEqual:"))
    && ((status = self->_status, !((unint64_t)status | v4[5]))
     || -[NSString isEqual:](status, "isEqual:"))
    && ((mailboxURLs = self->_mailboxURLs, !((unint64_t)mailboxURLs | v4[3]))
     || -[NSMutableArray isEqual:](mailboxURLs, "isEqual:"))
    && ((localData = self->_localData, !((unint64_t)localData | v4[2]))
     || -[NSData isEqual:](localData, "isEqual:"))
    && ((provisioningCredentialHash = self->_provisioningCredentialHash,
         !((unint64_t)provisioningCredentialHash | v4[4]))
     || -[NSString isEqual:](provisioningCredentialHash, "isEqual:")))
  {
    carKeyReaderIdentifier = self->_carKeyReaderIdentifier;
    if ((unint64_t)carKeyReaderIdentifier | v4[1])
      v13 = -[NSString isEqual:](carKeyReaderIdentifier, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = 2654435761 * self->_version;
  v4 = -[NSString hash](self->_title, "hash");
  v5 = v4 ^ -[NSString hash](self->_subtitle, "hash");
  v6 = v5 ^ -[NSData hash](self->_thumbnailImage, "hash");
  v7 = v6 ^ -[NSString hash](self->_status, "hash") ^ v3;
  v8 = -[NSMutableArray hash](self->_mailboxURLs, "hash");
  v9 = v8 ^ -[NSData hash](self->_localData, "hash");
  v10 = v9 ^ -[NSString hash](self->_provisioningCredentialHash, "hash");
  return v7 ^ v10 ^ -[NSString hash](self->_carKeyReaderIdentifier, "hash");
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
  self->_version = *((_DWORD *)v4 + 18);
  if (*((_QWORD *)v4 + 8))
    -[PKProtobufRelaySharingMessage setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 6))
    -[PKProtobufRelaySharingMessage setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)v4 + 7))
    -[PKProtobufRelaySharingMessage setThumbnailImage:](self, "setThumbnailImage:");
  if (*((_QWORD *)v4 + 5))
    -[PKProtobufRelaySharingMessage setStatus:](self, "setStatus:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[PKProtobufRelaySharingMessage addMailboxURLs:](self, "addMailboxURLs:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[PKProtobufRelaySharingMessage setLocalData:](self, "setLocalData:");
  if (*((_QWORD *)v4 + 4))
    -[PKProtobufRelaySharingMessage setProvisioningCredentialHash:](self, "setProvisioningCredentialHash:");
  if (*((_QWORD *)v4 + 1))
    -[PKProtobufRelaySharingMessage setCarKeyReaderIdentifier:](self, "setCarKeyReaderIdentifier:");

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSMutableArray)mailboxURLs
{
  return self->_mailboxURLs;
}

- (void)setMailboxURLs:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxURLs, a3);
}

- (NSData)localData
{
  return self->_localData;
}

- (void)setLocalData:(id)a3
{
  objc_storeStrong((id *)&self->_localData, a3);
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setProvisioningCredentialHash:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningCredentialHash, a3);
}

- (NSString)carKeyReaderIdentifier
{
  return self->_carKeyReaderIdentifier;
}

- (void)setCarKeyReaderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_carKeyReaderIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_mailboxURLs, 0);
  objc_storeStrong((id *)&self->_localData, 0);
  objc_storeStrong((id *)&self->_carKeyReaderIdentifier, 0);
}

@end
