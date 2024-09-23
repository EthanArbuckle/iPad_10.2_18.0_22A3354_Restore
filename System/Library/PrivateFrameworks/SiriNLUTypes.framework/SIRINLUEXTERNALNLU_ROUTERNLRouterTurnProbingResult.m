@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult

- (BOOL)hasNlParseResponse
{
  return self->_nlParseResponse != 0;
}

- (BOOL)hasPommesResponse
{
  return self->_pommesResponse != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult;
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALNLU_ROUTERNLParseResponse *nlParseResponse;
  void *v5;
  SIRINLUEXTERNALNLU_ROUTERPommesResponse *pommesResponse;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  nlParseResponse = self->_nlParseResponse;
  if (nlParseResponse)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse dictionaryRepresentation](nlParseResponse, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nl_parse_response"));

  }
  pommesResponse = self->_pommesResponse;
  if (pommesResponse)
  {
    -[SIRINLUEXTERNALNLU_ROUTERPommesResponse dictionaryRepresentation](pommesResponse, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("pommes_response"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nlParseResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pommesResponse)
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
  if (self->_nlParseResponse)
  {
    objc_msgSend(v4, "setNlParseResponse:");
    v4 = v5;
  }
  if (self->_pommesResponse)
  {
    objc_msgSend(v5, "setPommesResponse:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse copyWithZone:](self->_nlParseResponse, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRINLUEXTERNALNLU_ROUTERPommesResponse copyWithZone:](self->_pommesResponse, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERNLParseResponse *nlParseResponse;
  SIRINLUEXTERNALNLU_ROUTERPommesResponse *pommesResponse;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((nlParseResponse = self->_nlParseResponse, !((unint64_t)nlParseResponse | v4[1]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse isEqual:](nlParseResponse, "isEqual:")))
  {
    pommesResponse = self->_pommesResponse;
    if ((unint64_t)pommesResponse | v4[2])
      v7 = -[SIRINLUEXTERNALNLU_ROUTERPommesResponse isEqual:](pommesResponse, "isEqual:");
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
  unint64_t v3;

  v3 = -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse hash](self->_nlParseResponse, "hash");
  return -[SIRINLUEXTERNALNLU_ROUTERPommesResponse hash](self->_pommesResponse, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALNLU_ROUTERNLParseResponse *nlParseResponse;
  uint64_t v6;
  SIRINLUEXTERNALNLU_ROUTERPommesResponse *pommesResponse;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  nlParseResponse = self->_nlParseResponse;
  v6 = v4[1];
  v9 = v4;
  if (nlParseResponse)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALNLU_ROUTERNLParseResponse mergeFrom:](nlParseResponse, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult setNlParseResponse:](self, "setNlParseResponse:");
  }
  v4 = v9;
LABEL_7:
  pommesResponse = self->_pommesResponse;
  v8 = v4[2];
  if (pommesResponse)
  {
    if (v8)
    {
      -[SIRINLUEXTERNALNLU_ROUTERPommesResponse mergeFrom:](pommesResponse, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult setPommesResponse:](self, "setPommesResponse:");
    goto LABEL_12;
  }

}

- (SIRINLUEXTERNALNLU_ROUTERNLParseResponse)nlParseResponse
{
  return self->_nlParseResponse;
}

- (void)setNlParseResponse:(id)a3
{
  objc_storeStrong((id *)&self->_nlParseResponse, a3);
}

- (SIRINLUEXTERNALNLU_ROUTERPommesResponse)pommesResponse
{
  return self->_pommesResponse;
}

- (void)setPommesResponse:(id)a3
{
  objc_storeStrong((id *)&self->_pommesResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pommesResponse, 0);
  objc_storeStrong((id *)&self->_nlParseResponse, 0);
}

@end
