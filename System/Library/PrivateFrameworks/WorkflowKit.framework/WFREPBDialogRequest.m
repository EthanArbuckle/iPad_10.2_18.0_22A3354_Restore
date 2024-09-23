@implementation WFREPBDialogRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBDialogRequest;
  -[WFREPBDialogRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBDialogRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *runRequestIdentifier;
  NSData *dialogRequestData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", runRequestIdentifier, CFSTR("runRequestIdentifier"));
  dialogRequestData = self->_dialogRequestData;
  if (dialogRequestData)
    objc_msgSend(v4, "setObject:forKey:", dialogRequestData, CFSTR("dialogRequestData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBDialogRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_runRequestIdentifier)
    __assert_rtn("-[WFREPBDialogRequest writeTo:]", "WFREPBDialogRequest.m", 83, "nil != self->_runRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_dialogRequestData)
    __assert_rtn("-[WFREPBDialogRequest writeTo:]", "WFREPBDialogRequest.m", 88, "nil != self->_dialogRequestData");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *runRequestIdentifier;
  id v5;

  runRequestIdentifier = self->_runRequestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setRunRequestIdentifier:", runRequestIdentifier);
  objc_msgSend(v5, "setDialogRequestData:", self->_dialogRequestData);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_runRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_dialogRequestData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *runRequestIdentifier;
  NSData *dialogRequestData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((runRequestIdentifier = self->_runRequestIdentifier, !((unint64_t)runRequestIdentifier | v4[2]))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:")))
  {
    dialogRequestData = self->_dialogRequestData;
    if ((unint64_t)dialogRequestData | v4[1])
      v7 = -[NSData isEqual:](dialogRequestData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_runRequestIdentifier, "hash");
  return -[NSData hash](self->_dialogRequestData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[WFREPBDialogRequest setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[WFREPBDialogRequest setDialogRequestData:](self, "setDialogRequestData:");
    v4 = v5;
  }

}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)setRunRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, a3);
}

- (NSData)dialogRequestData
{
  return self->_dialogRequestData;
}

- (void)setDialogRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_dialogRequestData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogRequestData, 0);
}

@end
