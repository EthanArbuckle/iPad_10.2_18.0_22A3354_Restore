@implementation VCPBSpotlightPair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPBSpotlightPair;
  -[VCPBSpotlightPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPBSpotlightPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *workflowID;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  workflowID = self->_workflowID;
  if (workflowID)
    objc_msgSend(v3, "setObject:forKey:", workflowID, CFSTR("workflowID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_spotlightHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("spotlightHash"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VCPBSpotlightPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_workflowID)
    __assert_rtn("-[VCPBSpotlightPair writeTo:]", "VCPBSpotlightPair.m", 79, "nil != self->_workflowID");
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  NSString *workflowID;
  _QWORD *v5;

  workflowID = self->_workflowID;
  v5 = a3;
  objc_msgSend(v5, "setWorkflowID:", workflowID);
  v5[1] = self->_spotlightHash;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_workflowID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_spotlightHash;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *workflowID;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((workflowID = self->_workflowID, !((unint64_t)workflowID | v4[2]))
     || -[NSString isEqual:](workflowID, "isEqual:"))
    && self->_spotlightHash == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_spotlightHash) ^ -[NSString hash](self->_workflowID, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[VCPBSpotlightPair setWorkflowID:](self, "setWorkflowID:");
    v4 = v5;
  }
  self->_spotlightHash = v4[1];

}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (void)setWorkflowID:(id)a3
{
  objc_storeStrong((id *)&self->_workflowID, a3);
}

- (unint64_t)spotlightHash
{
  return self->_spotlightHash;
}

- (void)setSpotlightHash:(unint64_t)a3
{
  self->_spotlightHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowID, 0);
}

@end
