@implementation WFREPBAlertRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAlertRequest;
  -[WFREPBAlertRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAlertRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *associatedRunRequestIdentifier;
  WFREPBAlert *alert;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  if (associatedRunRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", associatedRunRequestIdentifier, CFSTR("associatedRunRequestIdentifier"));
  alert = self->_alert;
  if (alert)
  {
    -[WFREPBAlert dictionaryRepresentation](alert, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("alert"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_associatedRunRequestIdentifier)
    __assert_rtn("-[WFREPBAlertRequest writeTo:]", "WFREPBAlertRequest.m", 97, "nil != self->_associatedRunRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_alert)
    __assert_rtn("-[WFREPBAlertRequest writeTo:]", "WFREPBAlertRequest.m", 102, "self->_alert != nil");
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  NSString *associatedRunRequestIdentifier;
  id v5;

  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setAssociatedRunRequestIdentifier:", associatedRunRequestIdentifier);
  objc_msgSend(v5, "setAlert:", self->_alert);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_associatedRunRequestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[WFREPBAlert copyWithZone:](self->_alert, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *associatedRunRequestIdentifier;
  WFREPBAlert *alert;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier,
         !((unint64_t)associatedRunRequestIdentifier | v4[2]))
     || -[NSString isEqual:](associatedRunRequestIdentifier, "isEqual:")))
  {
    alert = self->_alert;
    if ((unint64_t)alert | v4[1])
      v7 = -[WFREPBAlert isEqual:](alert, "isEqual:");
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

  v3 = -[NSString hash](self->_associatedRunRequestIdentifier, "hash");
  return -[WFREPBAlert hash](self->_alert, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  WFREPBAlert *alert;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[WFREPBAlertRequest setAssociatedRunRequestIdentifier:](self, "setAssociatedRunRequestIdentifier:");
    v4 = v7;
  }
  alert = self->_alert;
  v6 = v4[1];
  if (alert)
  {
    if (v6)
    {
      -[WFREPBAlert mergeFrom:](alert, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[WFREPBAlertRequest setAlert:](self, "setAlert:");
    goto LABEL_8;
  }

}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (void)setAssociatedRunRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, a3);
}

- (WFREPBAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
