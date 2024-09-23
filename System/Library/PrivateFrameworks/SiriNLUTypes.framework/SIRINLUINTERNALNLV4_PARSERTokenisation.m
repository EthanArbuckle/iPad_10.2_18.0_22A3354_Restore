@implementation SIRINLUINTERNALNLV4_PARSERTokenisation

- (BOOL)hasOriginalUtterance
{
  return self->_originalUtterance != 0;
}

- (BOOL)hasNormalisedUtterance
{
  return self->_normalisedUtterance != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALNLV4_PARSERTokenisation;
  -[SIRINLUINTERNALNLV4_PARSERTokenisation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALNLV4_PARSERTokenisation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *originalUtterance;
  NSString *normalisedUtterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  originalUtterance = self->_originalUtterance;
  if (originalUtterance)
    objc_msgSend(v3, "setObject:forKey:", originalUtterance, CFSTR("original_utterance"));
  normalisedUtterance = self->_normalisedUtterance;
  if (normalisedUtterance)
    objc_msgSend(v4, "setObject:forKey:", normalisedUtterance, CFSTR("normalised_utterance"));
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("token_chain"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNLV4_PARSERTokenisationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_originalUtterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_tokenChain)
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
  if (self->_originalUtterance)
  {
    objc_msgSend(v4, "setOriginalUtterance:");
    v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    objc_msgSend(v5, "setNormalisedUtterance:");
    v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_originalUtterance, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_normalisedUtterance, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *originalUtterance;
  NSString *normalisedUtterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((originalUtterance = self->_originalUtterance, !((unint64_t)originalUtterance | v4[2]))
     || -[NSString isEqual:](originalUtterance, "isEqual:"))
    && ((normalisedUtterance = self->_normalisedUtterance, !((unint64_t)normalisedUtterance | v4[1]))
     || -[NSString isEqual:](normalisedUtterance, "isEqual:")))
  {
    tokenChain = self->_tokenChain;
    if ((unint64_t)tokenChain | v4[3])
      v8 = -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:");
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

  v3 = -[NSString hash](self->_originalUtterance, "hash");
  v4 = -[NSString hash](self->_normalisedUtterance, "hash") ^ v3;
  return v4 ^ -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setOriginalUtterance:](self, "setOriginalUtterance:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setNormalisedUtterance:](self, "setNormalisedUtterance:");
    v4 = v7;
  }
  tokenChain = self->_tokenChain;
  v6 = v4[3];
  if (tokenChain)
  {
    if (v6)
    {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation setTokenChain:](self, "setTokenChain:");
    goto LABEL_10;
  }

}

- (NSString)originalUtterance
{
  return self->_originalUtterance;
}

- (void)setOriginalUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_originalUtterance, a3);
}

- (NSString)normalisedUtterance
{
  return self->_normalisedUtterance;
}

- (void)setNormalisedUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_normalisedUtterance, a3);
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_originalUtterance, 0);
  objc_storeStrong((id *)&self->_normalisedUtterance, 0);
}

@end
