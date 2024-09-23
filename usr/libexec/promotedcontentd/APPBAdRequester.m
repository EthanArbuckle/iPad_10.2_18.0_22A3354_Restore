@implementation APPBAdRequester

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setHeight:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setContextJSON:(id)a3
{
  objc_storeStrong((id *)&self->_contextJSON, a3);
}

- (int)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contextJSON, 0);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;
  void *v7;
  void *v8;
  NSString *contextJSON;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_width));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("width"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_height));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("height"));

  }
  contextJSON = self->_contextJSON;
  if (contextJSON)
    objc_msgSend(v4, "setObject:forKey:", contextJSON, CFSTR("contextJSON"));
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  NSString *contextJSON;
  id v8;

  v4 = a3;
  identifier = self->_identifier;
  v8 = v4;
  if (identifier)
  {
    PBDataWriterWriteStringField(v4, identifier, 1);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_width, 10);
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_height, 11);
    v4 = v8;
  }
  contextJSON = self->_contextJSON;
  if (contextJSON)
  {
    PBDataWriterWriteStringField(v8, contextJSON, 21);
    v4 = v8;
  }

}

+ (id)options
{
  if (qword_1002699A0 != -1)
    dispatch_once(&qword_1002699A0, &stru_100215448);
  return (id)qword_100269998;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContextJSON
{
  return self->_contextJSON != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdRequester;
  v3 = -[APPBAdRequester description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdRequester dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdRequesterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_width;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_height;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_contextJSON)
  {
    objc_msgSend(v6, "setContextJSON:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_width;
    *((_BYTE *)v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_height;
    *((_BYTE *)v5 + 36) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_contextJSON, "copyWithZone:", a3);
  v10 = (void *)v5[1];
  v5[1] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *contextJSON;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_16;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_width != *((_DWORD *)v4 + 8))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_16;
  }
  contextJSON = self->_contextJSON;
  if ((unint64_t)contextJSON | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](contextJSON, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_width;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_contextJSON, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_contextJSON, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBAdRequester setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_width = v4[8];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_height = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[APPBAdRequester setContextJSON:](self, "setContextJSON:");
    v4 = v6;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contextJSON
{
  return self->_contextJSON;
}

@end
