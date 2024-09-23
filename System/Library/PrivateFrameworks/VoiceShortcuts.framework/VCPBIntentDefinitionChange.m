@implementation VCPBIntentDefinitionChange

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7AA6648[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DELETED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasIntentDefinition
{
  return self->_intentDefinition != 0;
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
  v8.super_class = (Class)VCPBIntentDefinitionChange;
  -[VCPBIntentDefinitionChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPBIntentDefinitionChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *associatedBundleID;
  VCPBIntentDefinition *intentDefinition;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_changeType - 1;
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E7AA6648[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("changeType"));

  associatedBundleID = self->_associatedBundleID;
  if (associatedBundleID)
    objc_msgSend(v3, "setObject:forKey:", associatedBundleID, CFSTR("associatedBundleID"));
  intentDefinition = self->_intentDefinition;
  if (intentDefinition)
  {
    -[VCPBIntentDefinition dictionaryRepresentation](intentDefinition, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("intentDefinition"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPBIntentDefinitionChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_associatedBundleID)
    __assert_rtn("-[VCPBIntentDefinitionChange writeTo:]", "VCPBIntentDefinitionChange.m", 120, "nil != self->_associatedBundleID");
  PBDataWriterWriteStringField();
  if (self->_intentDefinition)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  id v5;

  v4 = a3;
  v4[4] = self->_changeType;
  v5 = v4;
  objc_msgSend(v4, "setAssociatedBundleID:", self->_associatedBundleID);
  if (self->_intentDefinition)
    objc_msgSend(v5, "setIntentDefinition:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_changeType;
  v6 = -[NSString copyWithZone:](self->_associatedBundleID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[VCPBIntentDefinition copyWithZone:](self->_intentDefinition, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *associatedBundleID;
  VCPBIntentDefinition *intentDefinition;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_changeType == *((_DWORD *)v4 + 4)
    && ((associatedBundleID = self->_associatedBundleID, !((unint64_t)associatedBundleID | v4[1]))
     || -[NSString isEqual:](associatedBundleID, "isEqual:")))
  {
    intentDefinition = self->_intentDefinition;
    if ((unint64_t)intentDefinition | v4[3])
      v7 = -[VCPBIntentDefinition isEqual:](intentDefinition, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;

  v3 = 2654435761 * self->_changeType;
  v4 = -[NSString hash](self->_associatedBundleID, "hash");
  return v4 ^ -[VCPBIntentDefinition hash](self->_intentDefinition, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  VCPBIntentDefinition *intentDefinition;
  uint64_t v6;
  _DWORD *v7;

  v4 = a3;
  self->_changeType = v4[4];
  v7 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[VCPBIntentDefinitionChange setAssociatedBundleID:](self, "setAssociatedBundleID:");
    v4 = v7;
  }
  intentDefinition = self->_intentDefinition;
  v6 = *((_QWORD *)v4 + 3);
  if (intentDefinition)
  {
    if (v6)
    {
      -[VCPBIntentDefinition mergeFrom:](intentDefinition, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[VCPBIntentDefinitionChange setIntentDefinition:](self, "setIntentDefinition:");
    goto LABEL_8;
  }

}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedBundleID, a3);
}

- (VCPBIntentDefinition)intentDefinition
{
  return self->_intentDefinition;
}

- (void)setIntentDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_intentDefinition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDefinition, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
}

@end
