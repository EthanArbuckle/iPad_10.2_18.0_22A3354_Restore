@implementation WFREPBAlertRequestResponse

- (BOOL)hasSelectedButton
{
  return self->_selectedButton != 0;
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
  v8.super_class = (Class)WFREPBAlertRequestResponse;
  -[WFREPBAlertRequestResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAlertRequestResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestIdentifier;
  NSString *selectedButton;
  WFREPBError *error;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  selectedButton = self->_selectedButton;
  if (selectedButton)
    objc_msgSend(v4, "setObject:forKey:", selectedButton, CFSTR("selectedButton"));
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
  return WFREPBAlertRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestIdentifier)
    __assert_rtn("-[WFREPBAlertRequestResponse writeTo:]", "WFREPBAlertRequestResponse.m", 116, "nil != self->_requestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_selectedButton)
    PBDataWriterWriteStringField();
  if (self->_error)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestIdentifier:", self->_requestIdentifier);
  if (self->_selectedButton)
    objc_msgSend(v4, "setSelectedButton:");
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
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_selectedButton, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[WFREPBError copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  NSString *selectedButton;
  WFREPBError *error;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((selectedButton = self->_selectedButton, !((unint64_t)selectedButton | v4[3]))
     || -[NSString isEqual:](selectedButton, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1])
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
  NSUInteger v4;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  v4 = -[NSString hash](self->_selectedButton, "hash") ^ v3;
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
  if (v4[2])
  {
    -[WFREPBAlertRequestResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[WFREPBAlertRequestResponse setSelectedButton:](self, "setSelectedButton:");
    v4 = v7;
  }
  error = self->_error;
  v6 = v4[1];
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
    -[WFREPBAlertRequestResponse setError:](self, "setError:");
    goto LABEL_10;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)selectedButton
{
  return self->_selectedButton;
}

- (void)setSelectedButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectedButton, a3);
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
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
