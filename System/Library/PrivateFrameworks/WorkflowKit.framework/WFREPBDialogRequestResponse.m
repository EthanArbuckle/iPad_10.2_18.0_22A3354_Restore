@implementation WFREPBDialogRequestResponse

- (BOOL)hasDialogRequestResponseData
{
  return self->_dialogRequestResponseData != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
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
  v8.super_class = (Class)WFREPBDialogRequestResponse;
  -[WFREPBDialogRequestResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBDialogRequestResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *originatingRequestIdentifier;
  NSData *dialogRequestResponseData;
  WFREPBError *error;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  originatingRequestIdentifier = self->_originatingRequestIdentifier;
  if (originatingRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", originatingRequestIdentifier, CFSTR("originatingRequestIdentifier"));
  dialogRequestResponseData = self->_dialogRequestResponseData;
  if (dialogRequestResponseData)
    objc_msgSend(v4, "setObject:forKey:", dialogRequestResponseData, CFSTR("dialogRequestResponseData"));
  error = self->_error;
  if (error)
  {
    -[WFREPBError dictionaryRepresentation](error, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("error"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBDialogRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_originatingRequestIdentifier)
    __assert_rtn("-[WFREPBDialogRequestResponse writeTo:]", "WFREPBDialogRequestResponse.m", 116, "nil != self->_originatingRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_dialogRequestResponseData)
    PBDataWriterWriteDataField();
  if (self->_error)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setOriginatingRequestIdentifier:", self->_originatingRequestIdentifier);
  if (self->_dialogRequestResponseData)
    objc_msgSend(v4, "setDialogRequestResponseData:");
  if (self->_error)
    objc_msgSend(v4, "setError:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_originatingRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSData copyWithZone:](self->_dialogRequestResponseData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[WFREPBError copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *originatingRequestIdentifier;
  NSData *dialogRequestResponseData;
  WFREPBError *error;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((originatingRequestIdentifier = self->_originatingRequestIdentifier,
         !((unint64_t)originatingRequestIdentifier | v4[3]))
     || -[NSString isEqual:](originatingRequestIdentifier, "isEqual:"))
    && ((dialogRequestResponseData = self->_dialogRequestResponseData,
         !((unint64_t)dialogRequestResponseData | v4[1]))
     || -[NSData isEqual:](dialogRequestResponseData, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2])
      v8 = -[WFREPBError isEqual:](error, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_originatingRequestIdentifier, "hash");
  v4 = -[NSData hash](self->_dialogRequestResponseData, "hash") ^ v3;
  return v4 ^ -[WFREPBError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  WFREPBError *error;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[WFREPBDialogRequestResponse setOriginatingRequestIdentifier:](self, "setOriginatingRequestIdentifier:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[WFREPBDialogRequestResponse setDialogRequestResponseData:](self, "setDialogRequestResponseData:");
    v4 = v7;
  }
  error = self->_error;
  v6 = v4[2];
  if (error)
  {
    if (v6)
    {
      -[WFREPBError mergeFrom:](error, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[WFREPBDialogRequestResponse setError:](self, "setError:");
    goto LABEL_10;
  }

}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (void)setOriginatingRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, a3);
}

- (NSData)dialogRequestResponseData
{
  return self->_dialogRequestResponseData;
}

- (void)setDialogRequestResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_dialogRequestResponseData, a3);
}

- (WFREPBError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialogRequestResponseData, 0);
}

@end
