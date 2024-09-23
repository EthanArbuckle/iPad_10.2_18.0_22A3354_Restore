@implementation SDAutoUnlockLTKResponse

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

- (BOOL)hasLtkData
{
  return self->_ltkData != 0;
}

- (void)setViewState:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_viewState = a3;
}

- (void)setHasViewState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasViewState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_needsUnlock = a3;
}

- (void)setHasNeedsUnlock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNeedsUnlock
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCurrentlySyncing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currentlySyncing = a3;
}

- (void)setHasCurrentlySyncing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentlySyncing
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockLTKResponse;
  v3 = -[SDAutoUnlockLTKResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *ltkData;
  char has;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  ltkData = self->_ltkData;
  if (ltkData)
    objc_msgSend(v3, "setObject:forKey:", ltkData, CFSTR("ltkData"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_needsUnlock));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("needsUnlock"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_viewState));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("viewState"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_currentlySyncing));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("currentlySyncing"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *ltkData;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
  ltkData = self->_ltkData;
  if (ltkData)
    PBDataWriterWriteDataField(v6, ltkData, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField(v6, self->_needsUnlock, 4);
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField(v6, self->_viewState, 3);
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField(v6, self->_currentlySyncing, 5);
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_ltkData)
  {
    v6 = v4;
    objc_msgSend(v4, "setLtkData:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v4 + 21) = self->_needsUnlock;
    *((_BYTE *)v4 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v4 + 22) = self->_viewState;
  *((_BYTE *)v4 + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 20) = self->_currentlySyncing;
    *((_BYTE *)v4 + 24) |= 2u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[4] = self->_version;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_ltkData, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_BYTE *)v6 + 21) = self->_needsUnlock;
    *((_BYTE *)v6 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v6;
    goto LABEL_6;
  }
  *((_BYTE *)v6 + 22) = self->_viewState;
  *((_BYTE *)v6 + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_BYTE *)v6 + 20) = self->_currentlySyncing;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *ltkData;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_28;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_28;
  }
  ltkData = self->_ltkData;
  if ((unint64_t)ltkData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](ltkData, "isEqual:"))
      goto LABEL_28;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0)
      goto LABEL_28;
    if (self->_viewState)
    {
      if (!*((_BYTE *)v4 + 22))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 22))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_28;
    if (self->_needsUnlock)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_28;
  }
  v8 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_currentlySyncing)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_28;
      }
      v8 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v8 = 0;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_ltkData, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_viewState;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_needsUnlock;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_currentlySyncing;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[SDAutoUnlockLTKResponse setLtkData:](self, "setLtkData:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_7;
LABEL_11:
    self->_needsUnlock = *((_BYTE *)v4 + 21);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_viewState = *((_BYTE *)v4 + 22);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 2) != 0)
  {
LABEL_8:
    self->_currentlySyncing = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_9:

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)ltkData
{
  return self->_ltkData;
}

- (void)setLtkData:(id)a3
{
  objc_storeStrong((id *)&self->_ltkData, a3);
}

- (BOOL)viewState
{
  return self->_viewState;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (BOOL)currentlySyncing
{
  return self->_currentlySyncing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkData, 0);
}

@end
