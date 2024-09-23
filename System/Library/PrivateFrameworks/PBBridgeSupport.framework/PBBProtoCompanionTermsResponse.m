@implementation PBBProtoCompanionTermsResponse

- (void)setTermsAccepted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_termsAccepted = a3;
}

- (void)setHasTermsAccepted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTermsAccepted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (void)setIsExistingAccountTerms:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isExistingAccountTerms = a3;
}

- (void)setHasIsExistingAccountTerms:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExistingAccountTerms
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasResponseData
{
  return self->_responseData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoCompanionTermsResponse;
  -[PBBProtoCompanionTermsResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoCompanionTermsResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *userAgent;
  void *v6;
  NSString *responseData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_termsAccepted);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("termsAccepted"));

  }
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v3, "setObject:forKey:", userAgent, CFSTR("userAgent"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExistingAccountTerms);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isExistingAccountTerms"));

  }
  responseData = self->_responseData;
  if (responseData)
    objc_msgSend(v3, "setObject:forKey:", responseData, CFSTR("responseData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoCompanionTermsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_responseData)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[25] = self->_termsAccepted;
    v4[28] |= 2u;
  }
  v5 = v4;
  if (self->_userAgent)
  {
    objc_msgSend(v4, "setUserAgent:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_isExistingAccountTerms;
    v4[28] |= 1u;
  }
  if (self->_responseData)
  {
    objc_msgSend(v5, "setResponseData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_termsAccepted;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v6 + 24) = self->_isExistingAccountTerms;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_responseData, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *userAgent;
  char v7;
  NSString *responseData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_17;
    if (self->_termsAccepted)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:"))
      goto LABEL_17;
    has = (char)self->_has;
  }
  if ((has & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_23;
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*((_BYTE *)v4 + 28) & 1) == 0)
    goto LABEL_17;
  if (!self->_isExistingAccountTerms)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_23;
    goto LABEL_17;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_17;
LABEL_23:
  responseData = self->_responseData;
  if ((unint64_t)responseData | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](responseData, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_termsAccepted;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_userAgent, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isExistingAccountTerms;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_responseData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[28] & 2) != 0)
  {
    self->_termsAccepted = v4[25];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PBBProtoCompanionTermsResponse setUserAgent:](self, "setUserAgent:");
    v4 = v5;
  }
  if ((v4[28] & 1) != 0)
  {
    self->_isExistingAccountTerms = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PBBProtoCompanionTermsResponse setResponseData:](self, "setResponseData:");
    v4 = v5;
  }

}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (BOOL)isExistingAccountTerms
{
  return self->_isExistingAccountTerms;
}

- (NSString)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
