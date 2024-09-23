@implementation SIRINLUINTERNALCCQROverrideTemplate

- (BOOL)hasRewriteMessage
{
  return self->_rewriteMessage != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALCCQROverrideTemplate;
  -[SIRINLUINTERNALCCQROverrideTemplate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCCQROverrideTemplate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALRewriteMessage *rewriteMessage;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  rewriteMessage = self->_rewriteMessage;
  if (rewriteMessage)
  {
    -[SIRINLUEXTERNALRewriteMessage dictionaryRepresentation](rewriteMessage, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rewrite_message"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCCQROverrideTemplateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_rewriteMessage)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SIRINLUEXTERNALRewriteMessage *rewriteMessage;

  rewriteMessage = self->_rewriteMessage;
  if (rewriteMessage)
    objc_msgSend(a3, "setRewriteMessage:", rewriteMessage);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALRewriteMessage copyWithZone:](self->_rewriteMessage, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRewriteMessage *rewriteMessage;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    rewriteMessage = self->_rewriteMessage;
    if ((unint64_t)rewriteMessage | v4[1])
      v6 = -[SIRINLUEXTERNALRewriteMessage isEqual:](rewriteMessage, "isEqual:");
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
  return -[SIRINLUEXTERNALRewriteMessage hash](self->_rewriteMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRewriteMessage *rewriteMessage;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  rewriteMessage = self->_rewriteMessage;
  v6 = v4[1];
  if (rewriteMessage)
  {
    if (v6)
    {
      v7 = v4;
      -[SIRINLUEXTERNALRewriteMessage mergeFrom:](rewriteMessage, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SIRINLUINTERNALCCQROverrideTemplate setRewriteMessage:](self, "setRewriteMessage:");
    goto LABEL_6;
  }

}

- (SIRINLUEXTERNALRewriteMessage)rewriteMessage
{
  return self->_rewriteMessage;
}

- (void)setRewriteMessage:(id)a3
{
  objc_storeStrong((id *)&self->_rewriteMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteMessage, 0);
}

@end
