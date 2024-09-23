@implementation SecDbKeychainSerializedMetadataKey

- (void)setKeyclass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyclass = a3;
}

- (void)setHasKeyclass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyclass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setActualKeyclass:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actualKeyclass = a3;
}

- (void)setHasActualKeyclass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActualKeyclass
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaguuid
{
  return self->_baguuid != 0;
}

- (BOOL)hasAkswrappedkey
{
  return self->_akswrappedkey != 0;
}

- (BOOL)hasBackupwrappedkey
{
  return self->_backupwrappedkey != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecDbKeychainSerializedMetadataKey;
  v3 = -[SecDbKeychainSerializedMetadataKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadataKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *baguuid;
  NSData *akswrappedkey;
  NSData *backupwrappedkey;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_keyclass));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("keyclass"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_actualKeyclass));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("actualKeyclass"));

  }
  baguuid = self->_baguuid;
  if (baguuid)
    objc_msgSend(v3, "setObject:forKey:", baguuid, CFSTR("baguuid"));
  akswrappedkey = self->_akswrappedkey;
  if (akswrappedkey)
    objc_msgSend(v3, "setObject:forKey:", akswrappedkey, CFSTR("akswrappedkey"));
  backupwrappedkey = self->_backupwrappedkey;
  if (backupwrappedkey)
    objc_msgSend(v3, "setObject:forKey:", backupwrappedkey, CFSTR("backupwrappedkey"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  char v22;
  uint64_t Data;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    switch((v7 >> 3))
    {
      case 1u:
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            break;
          v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0)
            goto LABEL_39;
          v13 += 7;
          v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_41;
          }
        }
        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v15) = 0;
LABEL_41:
        v29 = 40;
        goto LABEL_46;
      case 2u:
        v19 = 0;
        v20 = 0;
        v15 = 0;
        *(_BYTE *)&self->_has |= 1u;
        break;
      case 3u:
        Data = PBReaderReadData(a3);
        v24 = objc_claimAutoreleasedReturnValue(Data);
        v25 = 32;
        goto LABEL_37;
      case 4u:
        v26 = PBReaderReadData(a3);
        v24 = objc_claimAutoreleasedReturnValue(v26);
        v25 = 16;
        goto LABEL_37;
      case 5u:
        v27 = PBReaderReadData(a3);
        v24 = objc_claimAutoreleasedReturnValue(v27);
        v25 = 24;
LABEL_37:
        v28 = *(void **)&self->PBCodable_opaque[v25];
        *(_QWORD *)&self->PBCodable_opaque[v25] = v24;

        continue;
      default:
        v18 = PBReaderSkipValueWithTag(a3);
        if (!v18)
          return v18;
        continue;
    }
    while (1)
    {
      v21 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v22 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v15 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
        goto LABEL_43;
      v19 += 7;
      v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v15) = 0;
        goto LABEL_45;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v15) = 0;
LABEL_45:
    v29 = 8;
LABEL_46:
    *(_DWORD *)&self->PBCodable_opaque[v29] = v15;
  }
  LOBYTE(v18) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSData *baguuid;
  NSData *akswrappedkey;
  NSData *backupwrappedkey;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_keyclass, 1);
    v4 = v9;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v9, self->_actualKeyclass, 2);
    v4 = v9;
  }
  baguuid = self->_baguuid;
  if (baguuid)
  {
    PBDataWriterWriteDataField(v9, baguuid, 3);
    v4 = v9;
  }
  akswrappedkey = self->_akswrappedkey;
  if (akswrappedkey)
  {
    PBDataWriterWriteDataField(v9, akswrappedkey, 4);
    v4 = v9;
  }
  backupwrappedkey = self->_backupwrappedkey;
  if (backupwrappedkey)
  {
    PBDataWriterWriteDataField(v9, backupwrappedkey, 5);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_keyclass;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_actualKeyclass;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v6 = v4;
  if (self->_baguuid)
  {
    objc_msgSend(v4, "setBaguuid:");
    v4 = v6;
  }
  if (self->_akswrappedkey)
  {
    objc_msgSend(v6, "setAkswrappedkey:");
    v4 = v6;
  }
  if (self->_backupwrappedkey)
  {
    objc_msgSend(v6, "setBackupwrappedkey:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_keyclass;
    *((_BYTE *)v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_actualKeyclass;
    *((_BYTE *)v5 + 44) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_baguuid, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = -[NSData copyWithZone:](self->_akswrappedkey, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  v12 = -[NSData copyWithZone:](self->_backupwrappedkey, "copyWithZone:", a3);
  v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *baguuid;
  NSData *akswrappedkey;
  NSData *backupwrappedkey;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_keyclass != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_actualKeyclass != *((_DWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  baguuid = self->_baguuid;
  if ((unint64_t)baguuid | *((_QWORD *)v4 + 4) && !-[NSData isEqual:](baguuid, "isEqual:"))
    goto LABEL_18;
  akswrappedkey = self->_akswrappedkey;
  if ((unint64_t)akswrappedkey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](akswrappedkey, "isEqual:"))
      goto LABEL_18;
  }
  backupwrappedkey = self->_backupwrappedkey;
  if ((unint64_t)backupwrappedkey | *((_QWORD *)v4 + 3))
    v8 = -[NSData isEqual:](backupwrappedkey, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_keyclass;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_actualKeyclass;
LABEL_6:
  v5 = v4 ^ v3 ^ (unint64_t)-[NSData hash](self->_baguuid, "hash");
  v6 = (unint64_t)-[NSData hash](self->_akswrappedkey, "hash");
  return v5 ^ v6 ^ (unint64_t)-[NSData hash](self->_backupwrappedkey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_keyclass = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_actualKeyclass = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SecDbKeychainSerializedMetadataKey setBaguuid:](self, "setBaguuid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SecDbKeychainSerializedMetadataKey setAkswrappedkey:](self, "setAkswrappedkey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SecDbKeychainSerializedMetadataKey setBackupwrappedkey:](self, "setBackupwrappedkey:");
    v4 = v6;
  }

}

- (int)keyclass
{
  return self->_keyclass;
}

- (int)actualKeyclass
{
  return self->_actualKeyclass;
}

- (NSData)baguuid
{
  return self->_baguuid;
}

- (void)setBaguuid:(id)a3
{
  objc_storeStrong((id *)&self->_baguuid, a3);
}

- (NSData)akswrappedkey
{
  return self->_akswrappedkey;
}

- (void)setAkswrappedkey:(id)a3
{
  objc_storeStrong((id *)&self->_akswrappedkey, a3);
}

- (NSData)backupwrappedkey
{
  return self->_backupwrappedkey;
}

- (void)setBackupwrappedkey:(id)a3
{
  objc_storeStrong((id *)&self->_backupwrappedkey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baguuid, 0);
  objc_storeStrong((id *)&self->_backupwrappedkey, 0);
  objc_storeStrong((id *)&self->_akswrappedkey, 0);
}

@end
