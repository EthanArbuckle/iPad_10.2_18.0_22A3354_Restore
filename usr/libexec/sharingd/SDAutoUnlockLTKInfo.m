@implementation SDAutoUnlockLTKInfo

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

- (BOOL)hasLtk
{
  return self->_ltk != 0;
}

- (BOOL)hasLtkID
{
  return self->_ltkID != 0;
}

- (void)setSignout:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signout = a3;
}

- (void)setHasSignout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignout
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
  v8.super_class = (Class)SDAutoUnlockLTKInfo;
  v3 = -[SDAutoUnlockLTKInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLTKInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *ltk;
  NSData *ltkID;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  ltk = self->_ltk;
  if (ltk)
    objc_msgSend(v3, "setObject:forKey:", ltk, CFSTR("ltk"));
  ltkID = self->_ltkID;
  if (ltkID)
    objc_msgSend(v3, "setObject:forKey:", ltkID, CFSTR("ltkID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_signout));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("signout"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *ltk;
  NSData *ltkID;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v6, self->_version, 1);
  ltk = self->_ltk;
  if (ltk)
    PBDataWriterWriteDataField(v6, ltk, 2);
  ltkID = self->_ltkID;
  if (ltkID)
    PBDataWriterWriteDataField(v6, ltkID, 3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField(v6, self->_signout, 4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_ltk)
  {
    objc_msgSend(v4, "setLtk:");
    v4 = v5;
  }
  if (self->_ltkID)
  {
    objc_msgSend(v5, "setLtkID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_signout;
    *((_BYTE *)v4 + 32) |= 2u;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[6] = self->_version;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_ltk, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSData copyWithZone:](self->_ltkID, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 28) = self->_signout;
    *((_BYTE *)v6 + 32) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *ltk;
  NSData *ltkID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_13;
  }
  ltk = self->_ltk;
  if ((unint64_t)ltk | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](ltk, "isEqual:"))
    goto LABEL_13;
  ltkID = self->_ltkID;
  if ((unint64_t)ltkID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltkID, "isEqual:"))
      goto LABEL_13;
  }
  v8 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
    {
LABEL_13:
      v8 = 0;
      goto LABEL_14;
    }
    if (self->_signout)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_13;
    }
    v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_ltk, "hash");
  v5 = (unint64_t)-[NSData hash](self->_ltkID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_signout;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SDAutoUnlockLTKInfo setLtk:](self, "setLtk:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockLTKInfo setLtkID:](self, "setLtkID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_signout = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)version
{
  return self->_version;
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

- (BOOL)signout
{
  return self->_signout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkID, 0);
  objc_storeStrong((id *)&self->_ltk, 0);
}

@end
