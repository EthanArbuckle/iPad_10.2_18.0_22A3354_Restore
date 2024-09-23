@implementation SIRINLUINTERNALTOKENIZERTokenizerResponse

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALTOKENIZERTokenizerResponse;
  -[SIRINLUINTERNALTOKENIZERTokenizerResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALTOKENIZERTokenizerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v5;
  NSString *text;
  SIRINLUEXTERNALUUID *asrId;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("token_chain"));

  }
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  asrId = self->_asrId;
  if (asrId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](asrId, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("asrId"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTOKENIZERTokenizerResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_asrId)
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
  if (self->_tokenChain)
  {
    objc_msgSend(v4, "setTokenChain:");
    v4 = v5;
  }
  if (self->_text)
  {
    objc_msgSend(v5, "setText:");
    v4 = v5;
  }
  if (self->_asrId)
  {
    objc_msgSend(v5, "setAsrId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_asrId, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  NSString *text;
  SIRINLUEXTERNALUUID *asrId;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[3]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((text = self->_text, !((unint64_t)text | v4[2])) || -[NSString isEqual:](text, "isEqual:")))
  {
    asrId = self->_asrId;
    if ((unint64_t)asrId | v4[1])
      v8 = -[SIRINLUEXTERNALUUID isEqual:](asrId, "isEqual:");
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
  unint64_t v3;
  NSUInteger v4;

  v3 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
  v4 = -[NSString hash](self->_text, "hash") ^ v3;
  return v4 ^ -[SIRINLUEXTERNALUUID hash](self->_asrId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v6;
  SIRINLUEXTERNALUUID *asrId;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  tokenChain = self->_tokenChain;
  v6 = v4[3];
  v9 = v4;
  if (tokenChain)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setTokenChain:](self, "setTokenChain:");
  }
  v4 = v9;
LABEL_7:
  if (v4[2])
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setText:](self, "setText:");
    v4 = v9;
  }
  asrId = self->_asrId;
  v8 = v4[1];
  if (asrId)
  {
    if (v8)
    {
      -[SIRINLUEXTERNALUUID mergeFrom:](asrId, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALTOKENIZERTokenizerResponse setAsrId:](self, "setAsrId:");
    goto LABEL_14;
  }

}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (SIRINLUEXTERNALUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

@end
