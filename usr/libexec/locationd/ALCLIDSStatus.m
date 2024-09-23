@implementation ALCLIDSStatus

- (void)dealloc
{
  objc_super v3;

  -[ALCLIDSStatus setPairedModelId:](self, "setPairedModelId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALCLIDSStatus;
  -[ALCLIDSStatus dealloc](&v3, "dealloc");
}

- (BOOL)hasPairedModelId
{
  return self->_pairedModelId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLIDSStatus;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLIDSStatus description](&v3, "description"), -[ALCLIDSStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  NSString *pairedModelId;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connectionStatus), CFSTR("connectionStatus"));
  pairedModelId = self->_pairedModelId;
  if (pairedModelId)
    objc_msgSend(v3, "setObject:forKey:", pairedModelId, CFSTR("pairedModelId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A47210((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *pairedModelId;

  PBDataWriterWriteUint32Field(a3, self->_connectionStatus, 1);
  pairedModelId = self->_pairedModelId;
  if (pairedModelId)
    PBDataWriterWriteStringField(a3, pairedModelId, 2);
}

- (void)copyTo:(id)a3
{
  NSString *pairedModelId;

  *((_DWORD *)a3 + 2) = self->_connectionStatus;
  pairedModelId = self->_pairedModelId;
  if (pairedModelId)
    objc_msgSend(a3, "setPairedModelId:", pairedModelId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)v5 + 2) = self->_connectionStatus;

  *((_QWORD *)v5 + 2) = -[NSString copyWithZone:](self->_pairedModelId, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *pairedModelId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_connectionStatus == *((_DWORD *)a3 + 2))
    {
      pairedModelId = self->_pairedModelId;
      if ((unint64_t)pairedModelId | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSString isEqual:](pairedModelId, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_connectionStatus;
  return -[NSString hash](self->_pairedModelId, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_connectionStatus = *((_DWORD *)a3 + 2);
  if (*((_QWORD *)a3 + 2))
    -[ALCLIDSStatus setPairedModelId:](self, "setPairedModelId:");
}

- (unsigned)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(unsigned int)a3
{
  self->_connectionStatus = a3;
}

- (NSString)pairedModelId
{
  return self->_pairedModelId;
}

- (void)setPairedModelId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
