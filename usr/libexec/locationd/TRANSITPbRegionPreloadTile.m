@implementation TRANSITPbRegionPreloadTile

- (void)setTileType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_tileType = a3;
}

- (void)setHasTileType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTileType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTileX:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTileX
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTileY:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTileY
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsAllowOverCellular:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isAllowOverCellular = a3;
}

- (void)setHasIsAllowOverCellular:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAllowOverCellular
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)secKey
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_secKey;
  else
    return -1;
}

- (void)setSecKey:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secKey = a3;
}

- (void)setHasSecKey:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecKey
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadTile;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbRegionPreloadTile description](&v3, "description"), -[TRANSITPbRegionPreloadTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileType), CFSTR("tileType"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileX), CFSTR("tileX"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAllowOverCellular), CFSTR("isAllowOverCellular"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tileY), CFSTR("tileY"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_secKey), CFSTR("secKey"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1005119C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_tileType, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(a3, self->_tileX, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteUint32Field(a3, self->_tileY, 3);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint64Field(a3, self->_secKey, 5);
    return;
  }
LABEL_10:
  PBDataWriterWriteBOOLField(a3, self->_isAllowOverCellular, 4);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_tileType;
    *((_BYTE *)a3 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_tileX;
  *((_BYTE *)a3 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 6) = self->_tileY;
  *((_BYTE *)a3 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return;
LABEL_11:
    *((_QWORD *)a3 + 1) = self->_secKey;
    *((_BYTE *)a3 + 32) |= 1u;
    return;
  }
LABEL_10:
  *((_BYTE *)a3 + 28) = self->_isAllowOverCellular;
  *((_BYTE *)a3 + 32) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_tileType;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_tileX;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_tileY;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 28) = self->_isAllowOverCellular;
  *((_BYTE *)result + 32) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 1) = self->_secKey;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_tileType != *((_DWORD *)a3 + 4))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 5))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 6))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 32) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 0x10) == 0 || self->_isAllowOverCellular != *((unsigned __int8 *)a3 + 28))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_secKey != *((_QWORD *)a3 + 1))
        goto LABEL_26;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_tileType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_tileX;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_tileY;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_isAllowOverCellular;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_secKey;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_tileType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_tileY = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      return;
LABEL_11:
    self->_secKey = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_10:
  self->_isAllowOverCellular = *((_BYTE *)a3 + 28);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
    goto LABEL_11;
}

- (unsigned)tileType
{
  return self->_tileType;
}

- (unsigned)tileX
{
  return self->_tileX;
}

- (unsigned)tileY
{
  return self->_tileY;
}

- (BOOL)isAllowOverCellular
{
  return self->_isAllowOverCellular;
}

@end
