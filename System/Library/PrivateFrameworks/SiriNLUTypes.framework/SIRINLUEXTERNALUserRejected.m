@implementation SIRINLUEXTERNALUserRejected

- (BOOL)hasOfferId
{
  return self->_offerId != 0;
}

- (BOOL)hasReference
{
  return self->_reference != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALUserRejected;
  -[SIRINLUEXTERNALUserRejected description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUserRejected dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *offerId;
  void *v5;
  SIRINLUEXTERNALUsoGraph *reference;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  offerId = self->_offerId;
  if (offerId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](offerId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("offer_id"));

  }
  reference = self->_reference;
  if (reference)
  {
    -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](reference, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reference"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserRejectedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_offerId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reference)
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
  if (self->_offerId)
  {
    objc_msgSend(v4, "setOfferId:");
    v4 = v5;
  }
  if (self->_reference)
  {
    objc_msgSend(v5, "setReference:");
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
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_offerId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_reference, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *offerId;
  SIRINLUEXTERNALUsoGraph *reference;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((offerId = self->_offerId, !((unint64_t)offerId | v4[1]))
     || -[SIRINLUEXTERNALUUID isEqual:](offerId, "isEqual:")))
  {
    reference = self->_reference;
    if ((unint64_t)reference | v4[2])
      v7 = -[SIRINLUEXTERNALUsoGraph isEqual:](reference, "isEqual:");
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

  v3 = -[SIRINLUEXTERNALUUID hash](self->_offerId, "hash");
  return -[SIRINLUEXTERNALUsoGraph hash](self->_reference, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *offerId;
  uint64_t v6;
  SIRINLUEXTERNALUsoGraph *reference;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  offerId = self->_offerId;
  v6 = v4[1];
  v9 = v4;
  if (offerId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUUID mergeFrom:](offerId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUserRejected setOfferId:](self, "setOfferId:");
  }
  v4 = v9;
LABEL_7:
  reference = self->_reference;
  v8 = v4[2];
  if (reference)
  {
    if (v8)
    {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](reference, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUserRejected setReference:](self, "setReference:");
    goto LABEL_12;
  }

}

- (SIRINLUEXTERNALUUID)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_offerId, a3);
}

- (SIRINLUEXTERNALUsoGraph)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
}

@end
