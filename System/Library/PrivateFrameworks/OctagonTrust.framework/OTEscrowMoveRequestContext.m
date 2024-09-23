@implementation OTEscrowMoveRequestContext

- (BOOL)hasEscrowRecordLabel
{
  return self->_escrowRecordLabel != 0;
}

- (BOOL)hasCurrentFederation
{
  return self->_currentFederation != 0;
}

- (BOOL)hasIntendedFederation
{
  return self->_intendedFederation != 0;
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
  v8.super_class = (Class)OTEscrowMoveRequestContext;
  -[OTEscrowMoveRequestContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTEscrowMoveRequestContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *escrowRecordLabel;
  NSString *currentFederation;
  NSString *intendedFederation;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  escrowRecordLabel = self->_escrowRecordLabel;
  if (escrowRecordLabel)
    objc_msgSend(v3, "setObject:forKey:", escrowRecordLabel, CFSTR("escrowRecordLabel"));
  currentFederation = self->_currentFederation;
  if (currentFederation)
    objc_msgSend(v4, "setObject:forKey:", currentFederation, CFSTR("currentFederation"));
  intendedFederation = self->_intendedFederation;
  if (intendedFederation)
    objc_msgSend(v4, "setObject:forKey:", intendedFederation, CFSTR("intendedFederation"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowMoveRequestContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_escrowRecordLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_currentFederation)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_intendedFederation)
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
  if (self->_escrowRecordLabel)
  {
    objc_msgSend(v4, "setEscrowRecordLabel:");
    v4 = v5;
  }
  if (self->_currentFederation)
  {
    objc_msgSend(v5, "setCurrentFederation:");
    v4 = v5;
  }
  if (self->_intendedFederation)
  {
    objc_msgSend(v5, "setIntendedFederation:");
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
  v6 = -[NSString copyWithZone:](self->_escrowRecordLabel, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_currentFederation, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_intendedFederation, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *escrowRecordLabel;
  NSString *currentFederation;
  NSString *intendedFederation;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((escrowRecordLabel = self->_escrowRecordLabel, !((unint64_t)escrowRecordLabel | v4[2]))
     || -[NSString isEqual:](escrowRecordLabel, "isEqual:"))
    && ((currentFederation = self->_currentFederation, !((unint64_t)currentFederation | v4[1]))
     || -[NSString isEqual:](currentFederation, "isEqual:")))
  {
    intendedFederation = self->_intendedFederation;
    if ((unint64_t)intendedFederation | v4[3])
      v8 = -[NSString isEqual:](intendedFederation, "isEqual:");
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

  v3 = -[NSString hash](self->_escrowRecordLabel, "hash");
  v4 = -[NSString hash](self->_currentFederation, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_intendedFederation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[OTEscrowMoveRequestContext setEscrowRecordLabel:](self, "setEscrowRecordLabel:");
  if (v4[1])
    -[OTEscrowMoveRequestContext setCurrentFederation:](self, "setCurrentFederation:");
  if (v4[3])
    -[OTEscrowMoveRequestContext setIntendedFederation:](self, "setIntendedFederation:");

}

- (NSString)escrowRecordLabel
{
  return self->_escrowRecordLabel;
}

- (void)setEscrowRecordLabel:(id)a3
{
  objc_storeStrong((id *)&self->_escrowRecordLabel, a3);
}

- (NSString)currentFederation
{
  return self->_currentFederation;
}

- (void)setCurrentFederation:(id)a3
{
  objc_storeStrong((id *)&self->_currentFederation, a3);
}

- (NSString)intendedFederation
{
  return self->_intendedFederation;
}

- (void)setIntendedFederation:(id)a3
{
  objc_storeStrong((id *)&self->_intendedFederation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedFederation, 0);
  objc_storeStrong((id *)&self->_escrowRecordLabel, 0);
  objc_storeStrong((id *)&self->_currentFederation, 0);
}

@end
