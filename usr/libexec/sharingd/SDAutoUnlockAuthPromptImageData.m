@implementation SDAutoUnlockAuthPromptImageData

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

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (void)setFinalMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_finalMessage = a3;
}

- (void)setHasFinalMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFinalMessage
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
  v8.super_class = (Class)SDAutoUnlockAuthPromptImageData;
  v3 = -[SDAutoUnlockAuthPromptImageData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *imageData;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v3, "setObject:forKey:", imageData, CFSTR("imageData"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_finalMessage));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("finalMessage"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptImageDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *imageData;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v6;
  }
  imageData = self->_imageData;
  if (imageData)
  {
    PBDataWriterWriteDataField(v6, imageData, 2);
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_finalMessage, 3);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_imageData)
  {
    v5 = v4;
    objc_msgSend(v4, "setImageData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 20) = self->_finalMessage;
    *((_BYTE *)v4 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[4] = self->_version;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 20) = self->_finalMessage;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSData *imageData;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_12;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_12;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:"))
      goto LABEL_12;
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_finalMessage)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_12;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_12;
      }
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_imageData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_finalMessage;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[SDAutoUnlockAuthPromptImageData setImageData:](self, "setImageData:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    self->_finalMessage = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (BOOL)finalMessage
{
  return self->_finalMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
