@implementation SDAutoUnlockLTKRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocalID
{
  return self->_localID != 0;
}

- (BOOL)hasLtk
{
  return self->_ltk != 0;
}

- (BOOL)hasLtkID
{
  return self->_ltkID != 0;
}

- (void)setCheckViewState:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_checkViewState = a3;
}

- (void)setHasCheckViewState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCheckViewState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasRemoteDeviceID
{
  return self->_remoteDeviceID != 0;
}

- (void)setNeedsLTK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_needsLTK = a3;
}

- (void)setHasNeedsLTK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNeedsLTK
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRemoteNeedsLTK:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_remoteNeedsLTK = a3;
}

- (void)setHasRemoteNeedsLTK:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRemoteNeedsLTK
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockLTKRequest;
  v3 = -[SDAutoUnlockLTKRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *localID;
  NSData *ltk;
  NSData *ltkID;
  void *v8;
  NSString *remoteDeviceID;
  char has;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  localID = self->_localID;
  if (localID)
    objc_msgSend(v3, "setObject:forKey:", localID, CFSTR("localID"));
  ltk = self->_ltk;
  if (ltk)
    objc_msgSend(v3, "setObject:forKey:", ltk, CFSTR("ltk"));
  ltkID = self->_ltkID;
  if (ltkID)
    objc_msgSend(v3, "setObject:forKey:", ltkID, CFSTR("ltkID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_checkViewState));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("checkViewState"));

  }
  remoteDeviceID = self->_remoteDeviceID;
  if (remoteDeviceID)
    objc_msgSend(v3, "setObject:forKey:", remoteDeviceID, CFSTR("remoteDeviceID"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_needsLTK));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("needsLTK"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_remoteNeedsLTK));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("remoteNeedsLTK"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *localID;
  NSData *ltk;
  NSData *ltkID;
  NSString *remoteDeviceID;
  char has;
  id v9;

  v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v9, self->_version, 1);
  localID = self->_localID;
  if (localID)
    PBDataWriterWriteStringField(v9, localID, 2);
  ltk = self->_ltk;
  if (ltk)
    PBDataWriterWriteDataField(v9, ltk, 3);
  ltkID = self->_ltkID;
  if (ltkID)
    PBDataWriterWriteDataField(v9, ltkID, 4);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField(v9, self->_checkViewState, 5);
  remoteDeviceID = self->_remoteDeviceID;
  if (remoteDeviceID)
    PBDataWriterWriteStringField(v9, remoteDeviceID, 6);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v9, self->_needsLTK, 7);
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField(v9, self->_remoteNeedsLTK, 8);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_version;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v6 = v4;
  if (self->_localID)
  {
    objc_msgSend(v4, "setLocalID:");
    v4 = v6;
  }
  if (self->_ltk)
  {
    objc_msgSend(v6, "setLtk:");
    v4 = v6;
  }
  if (self->_ltkID)
  {
    objc_msgSend(v6, "setLtkID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_checkViewState;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (self->_remoteDeviceID)
  {
    objc_msgSend(v6, "setRemoteDeviceID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 45) = self->_needsLTK;
    *((_BYTE *)v4 + 48) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 46) = self->_remoteNeedsLTK;
    *((_BYTE *)v4 + 48) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[10] = self->_version;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_localID, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSData copyWithZone:](self->_ltk, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSData copyWithZone:](self->_ltkID, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 44) = self->_checkViewState;
    *((_BYTE *)v6 + 48) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_remoteDeviceID, "copyWithZone:", a3);
  v14 = (void *)v6[4];
  v6[4] = v13;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v6 + 45) = self->_needsLTK;
    *((_BYTE *)v6 + 48) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_BYTE *)v6 + 46) = self->_remoteNeedsLTK;
    *((_BYTE *)v6 + 48) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *localID;
  NSData *ltk;
  NSData *ltkID;
  char has;
  NSString *remoteDeviceID;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_34;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_34;
  }
  localID = self->_localID;
  if ((unint64_t)localID | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](localID, "isEqual:"))
    goto LABEL_34;
  ltk = self->_ltk;
  if ((unint64_t)ltk | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltk, "isEqual:"))
      goto LABEL_34;
  }
  ltkID = self->_ltkID;
  if ((unint64_t)ltkID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](ltkID, "isEqual:"))
      goto LABEL_34;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_34;
    if (self->_checkViewState)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_34;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_34;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_34;
  }
  remoteDeviceID = self->_remoteDeviceID;
  if ((unint64_t)remoteDeviceID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](remoteDeviceID, "isEqual:"))
      goto LABEL_34;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0)
      goto LABEL_34;
    if (self->_needsLTK)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_34;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_34;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_34;
  }
  v11 = (*((_BYTE *)v4 + 48) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) != 0)
    {
      if (self->_remoteNeedsLTK)
      {
        if (!*((_BYTE *)v4 + 46))
          goto LABEL_34;
      }
      else if (*((_BYTE *)v4 + 46))
      {
        goto LABEL_34;
      }
      v11 = 1;
      goto LABEL_35;
    }
LABEL_34:
    v11 = 0;
  }
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_localID, "hash");
  v5 = (unint64_t)-[NSData hash](self->_ltk, "hash");
  v6 = (unint64_t)-[NSData hash](self->_ltkID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_checkViewState;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_remoteDeviceID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = 2654435761 * self->_needsLTK;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_11:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_9:
  v10 = 2654435761 * self->_remoteNeedsLTK;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAutoUnlockLTKRequest setLocalID:](self, "setLocalID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockLTKRequest setLtk:](self, "setLtk:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAutoUnlockLTKRequest setLtkID:](self, "setLtkID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    self->_checkViewState = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SDAutoUnlockLTKRequest setRemoteDeviceID:](self, "setRemoteDeviceID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_needsLTK = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 8) != 0)
  {
    self->_remoteNeedsLTK = *((_BYTE *)v4 + 46);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSString)localID
{
  return self->_localID;
}

- (void)setLocalID:(id)a3
{
  objc_storeStrong((id *)&self->_localID, a3);
}

- (NSData)ltk
{
  return self->_ltk;
}

- (void)setLtk:(id)a3
{
  objc_storeStrong((id *)&self->_ltk, a3);
}

- (NSData)ltkID
{
  return self->_ltkID;
}

- (void)setLtkID:(id)a3
{
  objc_storeStrong((id *)&self->_ltkID, a3);
}

- (BOOL)checkViewState
{
  return self->_checkViewState;
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void)setRemoteDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceID, a3);
}

- (BOOL)needsLTK
{
  return self->_needsLTK;
}

- (BOOL)remoteNeedsLTK
{
  return self->_remoteNeedsLTK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceID, 0);
  objc_storeStrong((id *)&self->_ltkID, 0);
  objc_storeStrong((id *)&self->_ltk, 0);
  objc_storeStrong((id *)&self->_localID, 0);
}

@end
