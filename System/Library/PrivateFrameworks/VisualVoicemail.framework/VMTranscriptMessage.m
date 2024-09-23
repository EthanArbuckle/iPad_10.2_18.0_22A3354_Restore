@implementation VMTranscriptMessage

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtocolVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTranscriptionData
{
  return self->_transcriptionData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)VMTranscriptMessage;
  -[VMTranscriptMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMTranscriptMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *transcriptionData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_protocolVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("protocolVersion"));

  }
  transcriptionData = self->_transcriptionData;
  if (transcriptionData)
    objc_msgSend(v3, "setObject:forKey:", transcriptionData, CFSTR("transcriptionData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VMTranscriptMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_transcriptionData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_protocolVersion;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_transcriptionData)
  {
    v5 = v4;
    objc_msgSend(v4, "setTranscriptionData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_protocolVersion;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_transcriptionData, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *transcriptionData;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  transcriptionData = self->_transcriptionData;
  if ((unint64_t)transcriptionData | *((_QWORD *)v4 + 2))
    v6 = -[NSData isEqual:](transcriptionData, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_protocolVersion;
  else
    v2 = 0;
  return -[NSData hash](self->_transcriptionData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_protocolVersion = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[VMTranscriptMessage setTranscriptionData:](self, "setTranscriptionData:");
    v4 = v5;
  }

}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (NSData)transcriptionData
{
  return self->_transcriptionData;
}

- (void)setTranscriptionData:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionData, 0);
}

@end
