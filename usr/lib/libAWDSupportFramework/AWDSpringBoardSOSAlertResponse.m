@implementation AWDSpringBoardSOSAlertResponse

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardSOSAlertResponse setResponse:](self, "setResponse:", 0);
  -[AWDSpringBoardSOSAlertResponse setUUID:](self, "setUUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSOSAlertResponse;
  -[AWDSpringBoardSOSAlertResponse dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardSOSAlertResponse;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardSOSAlertResponse description](&v3, sel_description), -[AWDSpringBoardSOSAlertResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *response;
  NSString *uUID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  response = self->_response;
  if (response)
    objc_msgSend(v3, "setObject:forKey:", response, CFSTR("response"));
  uUID = self->_uUID;
  if (uUID)
    objc_msgSend(v3, "setObject:forKey:", uUID, CFSTR("UUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardSOSAlertResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_response)
    PBDataWriterWriteStringField();
  if (self->_uUID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_response)
    objc_msgSend(a3, "setResponse:");
  if (self->_uUID)
    objc_msgSend(a3, "setUUID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_response, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_uUID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *response;
  NSString *uUID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    response = self->_response;
    if (!((unint64_t)response | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](response, "isEqual:")) != 0)
    {
      uUID = self->_uUID;
      if ((unint64_t)uUID | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](uUID, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_response, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_uUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDSpringBoardSOSAlertResponse setResponse:](self, "setResponse:");
  if (*((_QWORD *)a3 + 3))
    -[AWDSpringBoardSOSAlertResponse setUUID:](self, "setUUID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
