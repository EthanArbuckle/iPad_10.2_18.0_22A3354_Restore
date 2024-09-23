@implementation SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent

- (BOOL)hasProtoEncoding
{
  return self->_protoEncoding != 0;
}

- (BOOL)hasRuntimeEncoding
{
  return self->_runtimeEncoding != 0;
}

- (BOOL)hasEventDescription
{
  return self->_eventDescription != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent;
  -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *protoEncoding;
  NSData *runtimeEncoding;
  NSString *eventDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  protoEncoding = self->_protoEncoding;
  if (protoEncoding)
    objc_msgSend(v3, "setObject:forKey:", protoEncoding, CFSTR("proto_encoding"));
  runtimeEncoding = self->_runtimeEncoding;
  if (runtimeEncoding)
    objc_msgSend(v4, "setObject:forKey:", runtimeEncoding, CFSTR("runtime_encoding"));
  eventDescription = self->_eventDescription;
  if (eventDescription)
    objc_msgSend(v4, "setObject:forKey:", eventDescription, CFSTR("event_description"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_protoEncoding)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_runtimeEncoding)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_eventDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_protoEncoding)
  {
    objc_msgSend(v4, "setProtoEncoding:");
    v4 = v5;
  }
  if (self->_runtimeEncoding)
  {
    objc_msgSend(v5, "setRuntimeEncoding:");
    v4 = v5;
  }
  if (self->_eventDescription)
  {
    objc_msgSend(v5, "setEventDescription:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_protoEncoding, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_runtimeEncoding, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_eventDescription, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *protoEncoding;
  NSData *runtimeEncoding;
  NSString *eventDescription;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((protoEncoding = self->_protoEncoding, !((unint64_t)protoEncoding | v4[2]))
     || -[NSData isEqual:](protoEncoding, "isEqual:"))
    && ((runtimeEncoding = self->_runtimeEncoding, !((unint64_t)runtimeEncoding | v4[3]))
     || -[NSData isEqual:](runtimeEncoding, "isEqual:")))
  {
    eventDescription = self->_eventDescription;
    if ((unint64_t)eventDescription | v4[1])
      v8 = -[NSString isEqual:](eventDescription, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_protoEncoding, "hash");
  v4 = -[NSData hash](self->_runtimeEncoding, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_eventDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setProtoEncoding:](self, "setProtoEncoding:");
  if (v4[3])
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setRuntimeEncoding:](self, "setRuntimeEncoding:");
  if (v4[1])
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setEventDescription:](self, "setEventDescription:");

}

- (NSData)protoEncoding
{
  return self->_protoEncoding;
}

- (void)setProtoEncoding:(id)a3
{
  objc_storeStrong((id *)&self->_protoEncoding, a3);
}

- (NSData)runtimeEncoding
{
  return self->_runtimeEncoding;
}

- (void)setRuntimeEncoding:(id)a3
{
  objc_storeStrong((id *)&self->_runtimeEncoding, a3);
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setEventDescription:(id)a3
{
  objc_storeStrong((id *)&self->_eventDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeEncoding, 0);
  objc_storeStrong((id *)&self->_protoEncoding, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
}

@end
