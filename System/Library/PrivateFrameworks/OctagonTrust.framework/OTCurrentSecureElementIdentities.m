@implementation OTCurrentSecureElementIdentities

- (BOOL)hasLocalPeerIdentity
{
  return self->_localPeerIdentity != 0;
}

- (void)clearTrustedPeerSecureElementIdentities
{
  -[NSMutableArray removeAllObjects](self->_trustedPeerSecureElementIdentities, "removeAllObjects");
}

- (void)addTrustedPeerSecureElementIdentities:(id)a3
{
  id v4;
  NSMutableArray *trustedPeerSecureElementIdentities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  v8 = v4;
  if (!trustedPeerSecureElementIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_trustedPeerSecureElementIdentities;
    self->_trustedPeerSecureElementIdentities = v6;

    v4 = v8;
    trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  }
  -[NSMutableArray addObject:](trustedPeerSecureElementIdentities, "addObject:", v4);

}

- (unint64_t)trustedPeerSecureElementIdentitiesCount
{
  return -[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count");
}

- (id)trustedPeerSecureElementIdentitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_trustedPeerSecureElementIdentities, "objectAtIndex:", a3);
}

- (BOOL)hasPendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity != 0;
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
  v8.super_class = (Class)OTCurrentSecureElementIdentities;
  -[OTCurrentSecureElementIdentities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTCurrentSecureElementIdentities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  OTSecureElementPeerIdentity *localPeerIdentity;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  OTSecureElementPeerIdentity *pendingLocalPeerIdentity;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localPeerIdentity = self->_localPeerIdentity;
  if (localPeerIdentity)
  {
    -[OTSecureElementPeerIdentity dictionaryRepresentation](localPeerIdentity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("localPeerIdentity"));

  }
  if (-[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_trustedPeerSecureElementIdentities;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("trustedPeerSecureElementIdentities"));
  }
  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  if (pendingLocalPeerIdentity)
  {
    -[OTSecureElementPeerIdentity dictionaryRepresentation](pendingLocalPeerIdentity, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("pendingLocalPeerIdentity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTCurrentSecureElementIdentitiesReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_localPeerIdentity)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_trustedPeerSecureElementIdentities;
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

  if (self->_pendingLocalPeerIdentity)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_localPeerIdentity)
    objc_msgSend(v8, "setLocalPeerIdentity:");
  if (-[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesCount](self, "trustedPeerSecureElementIdentitiesCount"))
  {
    objc_msgSend(v8, "clearTrustedPeerSecureElementIdentities");
    v4 = -[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesCount](self, "trustedPeerSecureElementIdentitiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesAtIndex:](self, "trustedPeerSecureElementIdentitiesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTrustedPeerSecureElementIdentities:", v7);

      }
    }
  }
  if (self->_pendingLocalPeerIdentity)
    objc_msgSend(v8, "setPendingLocalPeerIdentity:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OTSecureElementPeerIdentity copyWithZone:](self->_localPeerIdentity, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_trustedPeerSecureElementIdentities;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addTrustedPeerSecureElementIdentities:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[OTSecureElementPeerIdentity copyWithZone:](self->_pendingLocalPeerIdentity, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  OTSecureElementPeerIdentity *localPeerIdentity;
  NSMutableArray *trustedPeerSecureElementIdentities;
  OTSecureElementPeerIdentity *pendingLocalPeerIdentity;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((localPeerIdentity = self->_localPeerIdentity, !((unint64_t)localPeerIdentity | v4[1]))
     || -[OTSecureElementPeerIdentity isEqual:](localPeerIdentity, "isEqual:"))
    && ((trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities,
         !((unint64_t)trustedPeerSecureElementIdentities | v4[3]))
     || -[NSMutableArray isEqual:](trustedPeerSecureElementIdentities, "isEqual:")))
  {
    pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
    if ((unint64_t)pendingLocalPeerIdentity | v4[2])
      v8 = -[OTSecureElementPeerIdentity isEqual:](pendingLocalPeerIdentity, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[OTSecureElementPeerIdentity hash](self->_localPeerIdentity, "hash");
  v4 = -[NSMutableArray hash](self->_trustedPeerSecureElementIdentities, "hash") ^ v3;
  return v4 ^ -[OTSecureElementPeerIdentity hash](self->_pendingLocalPeerIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  OTSecureElementPeerIdentity *localPeerIdentity;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  OTSecureElementPeerIdentity *pendingLocalPeerIdentity;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  localPeerIdentity = self->_localPeerIdentity;
  v6 = *((_QWORD *)v4 + 1);
  if (localPeerIdentity)
  {
    if (v6)
      -[OTSecureElementPeerIdentity mergeFrom:](localPeerIdentity, "mergeFrom:");
  }
  else if (v6)
  {
    -[OTCurrentSecureElementIdentities setLocalPeerIdentity:](self, "setLocalPeerIdentity:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[OTCurrentSecureElementIdentities addTrustedPeerSecureElementIdentities:](self, "addTrustedPeerSecureElementIdentities:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  v13 = *((_QWORD *)v4 + 2);
  if (pendingLocalPeerIdentity)
  {
    if (v13)
      -[OTSecureElementPeerIdentity mergeFrom:](pendingLocalPeerIdentity, "mergeFrom:");
  }
  else if (v13)
  {
    -[OTCurrentSecureElementIdentities setPendingLocalPeerIdentity:](self, "setPendingLocalPeerIdentity:");
  }

}

- (OTSecureElementPeerIdentity)localPeerIdentity
{
  return self->_localPeerIdentity;
}

- (void)setLocalPeerIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_localPeerIdentity, a3);
}

- (NSMutableArray)trustedPeerSecureElementIdentities
{
  return self->_trustedPeerSecureElementIdentities;
}

- (void)setTrustedPeerSecureElementIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_trustedPeerSecureElementIdentities, a3);
}

- (OTSecureElementPeerIdentity)pendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity;
}

- (void)setPendingLocalPeerIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLocalPeerIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedPeerSecureElementIdentities, 0);
  objc_storeStrong((id *)&self->_pendingLocalPeerIdentity, 0);
  objc_storeStrong((id *)&self->_localPeerIdentity, 0);
}

+ (Class)trustedPeerSecureElementIdentitiesType
{
  return (Class)objc_opt_class();
}

@end
