@implementation SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest

- (BOOL)hasJsonTranscript
{
  return self->_jsonTranscript != 0;
}

- (BOOL)hasCdmPlannerRequestIdentifier
{
  return self->_cdmPlannerRequestIdentifier != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest;
  -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *jsonTranscript;
  SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *cdmPlannerRequestIdentifier;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  jsonTranscript = self->_jsonTranscript;
  if (jsonTranscript)
    objc_msgSend(v3, "setObject:forKey:", jsonTranscript, CFSTR("json_transcript"));
  cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
  if (cdmPlannerRequestIdentifier)
  {
    -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier dictionaryRepresentation](cdmPlannerRequestIdentifier, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cdm_planner_request_identifier"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_jsonTranscript)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_cdmPlannerRequestIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_jsonTranscript)
  {
    objc_msgSend(v4, "setJsonTranscript:");
    v4 = v5;
  }
  if (self->_cdmPlannerRequestIdentifier)
  {
    objc_msgSend(v5, "setCdmPlannerRequestIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_jsonTranscript, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier copyWithZone:](self->_cdmPlannerRequestIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *jsonTranscript;
  SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *cdmPlannerRequestIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((jsonTranscript = self->_jsonTranscript, !((unint64_t)jsonTranscript | v4[2]))
     || -[NSString isEqual:](jsonTranscript, "isEqual:")))
  {
    cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
    if ((unint64_t)cdmPlannerRequestIdentifier | v4[1])
      v7 = -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier isEqual:](cdmPlannerRequestIdentifier, "isEqual:");
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

  v3 = -[NSString hash](self->_jsonTranscript, "hash");
  return -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier hash](self->_cdmPlannerRequestIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier *cdmPlannerRequestIdentifier;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest setJsonTranscript:](self, "setJsonTranscript:");
    v4 = v7;
  }
  cdmPlannerRequestIdentifier = self->_cdmPlannerRequestIdentifier;
  v6 = v4[1];
  if (cdmPlannerRequestIdentifier)
  {
    if (v6)
    {
      -[SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier mergeFrom:](cdmPlannerRequestIdentifier, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest setCdmPlannerRequestIdentifier:](self, "setCdmPlannerRequestIdentifier:");
    goto LABEL_8;
  }

}

- (NSString)jsonTranscript
{
  return self->_jsonTranscript;
}

- (void)setJsonTranscript:(id)a3
{
  objc_storeStrong((id *)&self->_jsonTranscript, a3);
}

- (SIRINLUEXTERNALCDM_PLANNERCDMPlannerRequestIdentifier)cdmPlannerRequestIdentifier
{
  return self->_cdmPlannerRequestIdentifier;
}

- (void)setCdmPlannerRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cdmPlannerRequestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonTranscript, 0);
  objc_storeStrong((id *)&self->_cdmPlannerRequestIdentifier, 0);
}

@end
