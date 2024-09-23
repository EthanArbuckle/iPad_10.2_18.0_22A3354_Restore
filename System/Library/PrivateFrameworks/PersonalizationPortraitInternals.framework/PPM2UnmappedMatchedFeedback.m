@implementation PPM2UnmappedMatchedFeedback

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
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
  v8.super_class = (Class)PPM2UnmappedMatchedFeedback;
  -[PPM2UnmappedMatchedFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2UnmappedMatchedFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientId;
  NSString *mappingId;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("clientId"));
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v4, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v4, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2UnmappedMatchedFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activeTreatments)
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
  if (self->_clientId)
  {
    objc_msgSend(v4, "setClientId:");
    v4 = v5;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v5, "setMappingId:");
    v4 = v5;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v5, "setActiveTreatments:");
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
  v6 = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientId;
  NSString *mappingId;
  NSString *activeTreatments;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((clientId = self->_clientId, !((unint64_t)clientId | v4[2]))
     || -[NSString isEqual:](clientId, "isEqual:"))
    && ((mappingId = self->_mappingId, !((unint64_t)mappingId | v4[3]))
     || -[NSString isEqual:](mappingId, "isEqual:")))
  {
    activeTreatments = self->_activeTreatments;
    if ((unint64_t)activeTreatments | v4[1])
      v8 = -[NSString isEqual:](activeTreatments, "isEqual:");
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

  v3 = -[NSString hash](self->_clientId, "hash");
  v4 = -[NSString hash](self->_mappingId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[PPM2UnmappedMatchedFeedback setClientId:](self, "setClientId:");
  if (v4[3])
    -[PPM2UnmappedMatchedFeedback setMappingId:](self, "setMappingId:");
  if (v4[1])
    -[PPM2UnmappedMatchedFeedback setActiveTreatments:](self, "setActiveTreatments:");

}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
