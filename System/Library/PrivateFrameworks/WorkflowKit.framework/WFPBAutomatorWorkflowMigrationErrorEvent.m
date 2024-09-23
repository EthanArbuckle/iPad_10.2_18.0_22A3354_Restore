@implementation WFPBAutomatorWorkflowMigrationErrorEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("AutomatorWorkflowMigrationErrorEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasAutomatorActionIdentifier
{
  return self->_automatorActionIdentifier != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)WFPBAutomatorWorkflowMigrationErrorEvent;
  -[WFPBAutomatorWorkflowMigrationErrorEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBAutomatorWorkflowMigrationErrorEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSString *automatorActionIdentifier;
  NSString *errorDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  automatorActionIdentifier = self->_automatorActionIdentifier;
  if (automatorActionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", automatorActionIdentifier, CFSTR("automatorActionIdentifier"));
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAutomatorWorkflowMigrationErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_automatorActionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorDescription)
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
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_automatorActionIdentifier)
  {
    objc_msgSend(v5, "setAutomatorActionIdentifier:");
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
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
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_automatorActionIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *automatorActionIdentifier;
  NSString *errorDescription;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((automatorActionIdentifier = self->_automatorActionIdentifier,
         !((unint64_t)automatorActionIdentifier | v4[1]))
     || -[NSString isEqual:](automatorActionIdentifier, "isEqual:")))
  {
    errorDescription = self->_errorDescription;
    if ((unint64_t)errorDescription | v4[2])
      v8 = -[NSString isEqual:](errorDescription, "isEqual:");
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

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_automatorActionIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[WFPBAutomatorWorkflowMigrationErrorEvent setKey:](self, "setKey:");
  if (v4[1])
    -[WFPBAutomatorWorkflowMigrationErrorEvent setAutomatorActionIdentifier:](self, "setAutomatorActionIdentifier:");
  if (v4[2])
    -[WFPBAutomatorWorkflowMigrationErrorEvent setErrorDescription:](self, "setErrorDescription:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)automatorActionIdentifier
{
  return self->_automatorActionIdentifier;
}

- (void)setAutomatorActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_automatorActionIdentifier, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
}

@end
