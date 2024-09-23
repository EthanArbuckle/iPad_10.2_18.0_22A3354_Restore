@implementation PKProtobufShareableCredentialMessage

- (void)clearShareableCredentials
{
  -[NSMutableArray removeAllObjects](self->_shareableCredentials, "removeAllObjects");
}

- (void)addShareableCredentials:(id)a3
{
  id v4;
  NSMutableArray *shareableCredentials;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  shareableCredentials = self->_shareableCredentials;
  v8 = v4;
  if (!shareableCredentials)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_shareableCredentials;
    self->_shareableCredentials = v6;

    v4 = v8;
    shareableCredentials = self->_shareableCredentials;
  }
  -[NSMutableArray addObject:](shareableCredentials, "addObject:", v4);

}

- (unint64_t)shareableCredentialsCount
{
  return -[NSMutableArray count](self->_shareableCredentials, "count");
}

- (id)shareableCredentialsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_shareableCredentials, "objectAtIndex:", a3);
}

+ (Class)shareableCredentialsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMessageCaption
{
  return self->_messageCaption != 0;
}

- (BOOL)hasDataString
{
  return self->_dataString != 0;
}

- (BOOL)hasPolicyIdentifier
{
  return self->_policyIdentifier != 0;
}

- (BOOL)hasPassThumbnailImage
{
  return self->_passThumbnailImage != 0;
}

- (void)setIsPassInLibrary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isPassInLibrary = a3;
}

- (void)setHasIsPassInLibrary:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPassInLibrary
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
  v8.super_class = (Class)PKProtobufShareableCredentialMessage;
  -[PKProtobufShareableCredentialMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShareableCredentialMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSString *messageCaption;
  NSString *dataString;
  NSString *policyIdentifier;
  NSData *passThumbnailImage;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  if (-[NSMutableArray count](self->_shareableCredentials, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_shareableCredentials, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_shareableCredentials;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("shareableCredentials"));
  }
  messageCaption = self->_messageCaption;
  if (messageCaption)
    objc_msgSend(v3, "setObject:forKey:", messageCaption, CFSTR("messageCaption"));
  dataString = self->_dataString;
  if (dataString)
    objc_msgSend(v3, "setObject:forKey:", dataString, CFSTR("dataString"));
  policyIdentifier = self->_policyIdentifier;
  if (policyIdentifier)
    objc_msgSend(v3, "setObject:forKey:", policyIdentifier, CFSTR("policyIdentifier"));
  passThumbnailImage = self->_passThumbnailImage;
  if (passThumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", passThumbnailImage, CFSTR("passThumbnailImage"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPassInLibrary);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("isPassInLibrary"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShareableCredentialMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_shareableCredentials;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_messageCaption)
    PBDataWriterWriteStringField();
  if (self->_dataString)
    PBDataWriterWriteStringField();
  if (self->_policyIdentifier)
    PBDataWriterWriteStringField();
  if (self->_passThumbnailImage)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  _DWORD *v9;

  v9 = a3;
  v9[12] = self->_version;
  if (-[PKProtobufShareableCredentialMessage shareableCredentialsCount](self, "shareableCredentialsCount"))
  {
    objc_msgSend(v9, "clearShareableCredentials");
    v4 = -[PKProtobufShareableCredentialMessage shareableCredentialsCount](self, "shareableCredentialsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PKProtobufShareableCredentialMessage shareableCredentialsAtIndex:](self, "shareableCredentialsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addShareableCredentials:", v7);

      }
    }
  }
  if (self->_messageCaption)
    objc_msgSend(v9, "setMessageCaption:");
  v8 = v9;
  if (self->_dataString)
  {
    objc_msgSend(v9, "setDataString:");
    v8 = v9;
  }
  if (self->_policyIdentifier)
  {
    objc_msgSend(v9, "setPolicyIdentifier:");
    v8 = v9;
  }
  if (self->_passThumbnailImage)
  {
    objc_msgSend(v9, "setPassThumbnailImage:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[52] = self->_isPassInLibrary;
    v8[56] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_version;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_shareableCredentials;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addShareableCredentials:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_messageCaption, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_dataString, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_policyIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[NSData copyWithZone:](self->_passThumbnailImage, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_isPassInLibrary;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *shareableCredentials;
  NSString *messageCaption;
  NSString *dataString;
  NSString *policyIdentifier;
  NSData *passThumbnailImage;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if (self->_version != *((_DWORD *)v4 + 12))
    goto LABEL_15;
  shareableCredentials = self->_shareableCredentials;
  if ((unint64_t)shareableCredentials | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](shareableCredentials, "isEqual:"))
      goto LABEL_15;
  }
  messageCaption = self->_messageCaption;
  if ((unint64_t)messageCaption | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](messageCaption, "isEqual:"))
      goto LABEL_15;
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](dataString, "isEqual:"))
      goto LABEL_15;
  }
  policyIdentifier = self->_policyIdentifier;
  if ((unint64_t)policyIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](policyIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](passThumbnailImage, "isEqual:"))
      goto LABEL_15;
  }
  v10 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
    if (self->_isPassInLibrary)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_15;
    }
    v10 = 1;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  unsigned int version;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  version = self->_version;
  v4 = -[NSMutableArray hash](self->_shareableCredentials, "hash");
  v5 = -[NSString hash](self->_messageCaption, "hash");
  v6 = -[NSString hash](self->_dataString, "hash");
  v7 = -[NSString hash](self->_policyIdentifier, "hash");
  v8 = -[NSData hash](self->_passThumbnailImage, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_isPassInLibrary;
  else
    v9 = 0;
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ v8 ^ v9;
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
  self->_version = *((_DWORD *)v4 + 12);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 5);
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
        -[PKProtobufShareableCredentialMessage addShareableCredentials:](self, "addShareableCredentials:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[PKProtobufShareableCredentialMessage setMessageCaption:](self, "setMessageCaption:");
  if (*((_QWORD *)v4 + 1))
    -[PKProtobufShareableCredentialMessage setDataString:](self, "setDataString:");
  if (*((_QWORD *)v4 + 4))
    -[PKProtobufShareableCredentialMessage setPolicyIdentifier:](self, "setPolicyIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[PKProtobufShareableCredentialMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_isPassInLibrary = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSMutableArray)shareableCredentials
{
  return self->_shareableCredentials;
}

- (void)setShareableCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_shareableCredentials, a3);
}

- (NSString)messageCaption
{
  return self->_messageCaption;
}

- (void)setMessageCaption:(id)a3
{
  objc_storeStrong((id *)&self->_messageCaption, a3);
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void)setDataString:(id)a3
{
  objc_storeStrong((id *)&self->_dataString, a3);
}

- (NSString)policyIdentifier
{
  return self->_policyIdentifier;
}

- (void)setPolicyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_policyIdentifier, a3);
}

- (NSData)passThumbnailImage
{
  return self->_passThumbnailImage;
}

- (void)setPassThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
}

- (BOOL)isPassInLibrary
{
  return self->_isPassInLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareableCredentials, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_messageCaption, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
}

@end
