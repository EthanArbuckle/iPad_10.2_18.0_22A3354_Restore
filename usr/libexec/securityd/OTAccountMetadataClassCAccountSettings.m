@implementation OTAccountMetadataClassCAccountSettings

- (void)setW:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_w = a3;
}

- (void)setHasW:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasW
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWebAccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_webAccess = a3;
}

- (void)setHasWebAccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWebAccess
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
  v8.super_class = (Class)OTAccountMetadataClassCAccountSettings;
  v3 = -[OTAccountMetadataClassCAccountSettings description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountMetadataClassCAccountSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_w));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("w"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_webAccess));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("webAccess"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int *v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  char v23;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      if ((v7 >> 3) == 2)
        break;
      if ((v7 >> 3) == 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_37;
          }
          v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0)
            break;
          v13 += 7;
          v18 = v14++ > 8;
          if (v18)
          {
            v15 = 0;
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_40;
          }
        }
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
LABEL_38:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v15 = 0;
LABEL_40:
        self->PBCodable_opaque[*v19] = v15 != 0;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_41:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v20 = 0;
    v21 = 0;
    v15 = 0;
    *(_BYTE *)&self->_has |= 2u;
    while (1)
    {
      v22 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v15 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0)
      {
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_38;
      }
      v20 += 7;
      v18 = v21++ > 8;
      if (v18)
      {
        v15 = 0;
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_40;
      }
    }
    v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
LABEL_37:
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_w, 1);
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_webAccess, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_w;
    v4[12] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[9] = self->_webAccess;
    v4[12] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_w;
    *((_BYTE *)result + 12) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_webAccess;
    *((_BYTE *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_12;
    if (self->_w)
    {
      if (!v4[8])
        goto LABEL_12;
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_12;
  }
  v5 = (v4[12] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_webAccess)
      {
        if (!v4[9])
          goto LABEL_12;
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_w;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_webAccess;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[12];
  if (v5)
  {
    self->_w = v4[8];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[12];
  }
  if ((v5 & 2) != 0)
  {
    self->_webAccess = v4[9];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (BOOL)w
{
  return self->_w;
}

- (BOOL)webAccess
{
  return self->_webAccess;
}

@end
