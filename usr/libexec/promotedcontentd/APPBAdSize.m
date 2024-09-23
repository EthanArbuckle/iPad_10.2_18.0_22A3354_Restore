@implementation APPBAdSize

+ (id)options
{
  if (qword_100269658 != -1)
    dispatch_once(&qword_100269658, &stru_1002142A8);
  return (id)qword_100269650;
}

- (void)setWidthInset:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widthInset = a3;
}

- (void)setHasWidthInset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidthInset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHeightInset:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_heightInset = a3;
}

- (void)setHasHeightInset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeightInset
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLockAspectRatio:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lockAspectRatio = a3;
}

- (void)setHasLockAspectRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLockAspectRatio
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdSize;
  v3 = -[APPBAdSize description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSize dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_width));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("width"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_height));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_heightInset));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("heightInset"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_widthInset));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("widthInset"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_lockAspectRatio));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lockAspectRatio"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field(v5, self->_width, 1);
  PBDataWriterWriteInt32Field(v5, self->_height, 2);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field(v5, self->_heightInset, 4);
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field(v5, self->_widthInset, 3);
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField(v5, self->_lockAspectRatio, 5);
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[4] = self->_width;
  v4[2] = self->_height;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[3] = self->_heightInset;
    *((_BYTE *)v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[5] = self->_widthInset;
  *((_BYTE *)v4 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 24) = self->_lockAspectRatio;
    *((_BYTE *)v4 + 28) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_width;
  *((_DWORD *)result + 2) = self->_height;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_widthInset;
    *((_BYTE *)result + 28) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_heightInset;
  *((_BYTE *)result + 28) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 24) = self->_lockAspectRatio;
  *((_BYTE *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    || self->_width != *((_DWORD *)v4 + 4)
    || self->_height != *((_DWORD *)v4 + 2))
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_widthInset != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_heightInset != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
    {
LABEL_16:
      v5 = 0;
      goto LABEL_17;
    }
    if (self->_lockAspectRatio)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_16;
    }
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v2 = 2654435761 * self->_widthInset;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_heightInset;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_lockAspectRatio;
  else
    v4 = 0;
  return (2654435761 * self->_height) ^ (2654435761 * self->_width) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_width = *((_DWORD *)v4 + 4);
  self->_height = *((_DWORD *)v4 + 2);
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_heightInset = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_widthInset = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_lockAspectRatio = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)widthInset
{
  return self->_widthInset;
}

- (int)heightInset
{
  return self->_heightInset;
}

- (BOOL)lockAspectRatio
{
  return self->_lockAspectRatio;
}

@end
