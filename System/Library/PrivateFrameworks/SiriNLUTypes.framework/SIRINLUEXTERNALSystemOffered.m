@implementation SIRINLUEXTERNALSystemOffered

- (BOOL)hasOfferedAct
{
  return self->_offeredAct != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSystemOffered;
  -[SIRINLUEXTERNALSystemOffered description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSystemOffered dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUserDialogAct *offeredAct;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  offeredAct = self->_offeredAct;
  if (offeredAct)
  {
    -[SIRINLUEXTERNALUserDialogAct dictionaryRepresentation](offeredAct, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("offered_act"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemOfferedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_offeredAct)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUEXTERNALUserDialogAct *offeredAct;

  offeredAct = self->_offeredAct;
  if (offeredAct)
    objc_msgSend(a3, "setOfferedAct:", offeredAct);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUserDialogAct copyWithZone:](self->_offeredAct, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUserDialogAct *offeredAct;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    offeredAct = self->_offeredAct;
    if ((unint64_t)offeredAct | v4[1])
      v6 = -[SIRINLUEXTERNALUserDialogAct isEqual:](offeredAct, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SIRINLUEXTERNALUserDialogAct hash](self->_offeredAct, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUserDialogAct *offeredAct;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  offeredAct = self->_offeredAct;
  v6 = v4[1];
  if (offeredAct)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUEXTERNALUserDialogAct mergeFrom:](offeredAct, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUEXTERNALSystemOffered setOfferedAct:](self, "setOfferedAct:");
    goto LABEL_6;
  }

}

- (SIRINLUEXTERNALUserDialogAct)offeredAct
{
  return self->_offeredAct;
}

- (void)setOfferedAct:(id)a3
{
  objc_storeStrong((id *)&self->_offeredAct, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offeredAct, 0);
}

@end
