@implementation SIRINLUINTERNALOverrideValue

- (BOOL)hasCcqrOverrideTemplate
{
  return self->_ccqrOverrideTemplate != 0;
}

- (BOOL)hasUserParse
{
  return self->_userParse != 0;
}

- (BOOL)hasLvcOverrideValue
{
  return self->_lvcOverrideValue != 0;
}

- (BOOL)hasPlanOverrideValue
{
  return self->_planOverrideValue != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALOverrideValue;
  -[SIRINLUINTERNALOverrideValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALOverrideValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUINTERNALCCQROverrideTemplate *ccqrOverrideTemplate;
  void *v5;
  SIRINLUEXTERNALUserParse *userParse;
  void *v7;
  SIRINLUINTERNALLVCOverrideValue *lvcOverrideValue;
  void *v9;
  SIRINLUINTERNALPlanOverrideValue *planOverrideValue;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ccqrOverrideTemplate = self->_ccqrOverrideTemplate;
  if (ccqrOverrideTemplate)
  {
    -[SIRINLUINTERNALCCQROverrideTemplate dictionaryRepresentation](ccqrOverrideTemplate, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ccqr_override_template"));

  }
  userParse = self->_userParse;
  if (userParse)
  {
    -[SIRINLUEXTERNALUserParse dictionaryRepresentation](userParse, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("user_parse"));

  }
  lvcOverrideValue = self->_lvcOverrideValue;
  if (lvcOverrideValue)
  {
    -[SIRINLUINTERNALLVCOverrideValue dictionaryRepresentation](lvcOverrideValue, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("lvc_override_value"));

  }
  planOverrideValue = self->_planOverrideValue;
  if (planOverrideValue)
  {
    -[SIRINLUINTERNALPlanOverrideValue dictionaryRepresentation](planOverrideValue, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("plan_override_value"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOverrideValueReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ccqrOverrideTemplate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userParse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_lvcOverrideValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_planOverrideValue)
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
  if (self->_ccqrOverrideTemplate)
  {
    objc_msgSend(v4, "setCcqrOverrideTemplate:");
    v4 = v5;
  }
  if (self->_userParse)
  {
    objc_msgSend(v5, "setUserParse:");
    v4 = v5;
  }
  if (self->_lvcOverrideValue)
  {
    objc_msgSend(v5, "setLvcOverrideValue:");
    v4 = v5;
  }
  if (self->_planOverrideValue)
  {
    objc_msgSend(v5, "setPlanOverrideValue:");
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
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUINTERNALCCQROverrideTemplate copyWithZone:](self->_ccqrOverrideTemplate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRINLUEXTERNALUserParse copyWithZone:](self->_userParse, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[SIRINLUINTERNALLVCOverrideValue copyWithZone:](self->_lvcOverrideValue, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[SIRINLUINTERNALPlanOverrideValue copyWithZone:](self->_planOverrideValue, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALCCQROverrideTemplate *ccqrOverrideTemplate;
  SIRINLUEXTERNALUserParse *userParse;
  SIRINLUINTERNALLVCOverrideValue *lvcOverrideValue;
  SIRINLUINTERNALPlanOverrideValue *planOverrideValue;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ccqrOverrideTemplate = self->_ccqrOverrideTemplate, !((unint64_t)ccqrOverrideTemplate | v4[1]))
     || -[SIRINLUINTERNALCCQROverrideTemplate isEqual:](ccqrOverrideTemplate, "isEqual:"))
    && ((userParse = self->_userParse, !((unint64_t)userParse | v4[4]))
     || -[SIRINLUEXTERNALUserParse isEqual:](userParse, "isEqual:"))
    && ((lvcOverrideValue = self->_lvcOverrideValue, !((unint64_t)lvcOverrideValue | v4[2]))
     || -[SIRINLUINTERNALLVCOverrideValue isEqual:](lvcOverrideValue, "isEqual:")))
  {
    planOverrideValue = self->_planOverrideValue;
    if ((unint64_t)planOverrideValue | v4[3])
      v9 = -[SIRINLUINTERNALPlanOverrideValue isEqual:](planOverrideValue, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SIRINLUINTERNALCCQROverrideTemplate hash](self->_ccqrOverrideTemplate, "hash");
  v4 = -[SIRINLUEXTERNALUserParse hash](self->_userParse, "hash") ^ v3;
  v5 = -[SIRINLUINTERNALLVCOverrideValue hash](self->_lvcOverrideValue, "hash");
  return v4 ^ v5 ^ -[SIRINLUINTERNALPlanOverrideValue hash](self->_planOverrideValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUINTERNALCCQROverrideTemplate *ccqrOverrideTemplate;
  uint64_t v6;
  SIRINLUEXTERNALUserParse *userParse;
  uint64_t v8;
  SIRINLUINTERNALLVCOverrideValue *lvcOverrideValue;
  uint64_t v10;
  SIRINLUINTERNALPlanOverrideValue *planOverrideValue;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  ccqrOverrideTemplate = self->_ccqrOverrideTemplate;
  v6 = v4[1];
  v13 = v4;
  if (ccqrOverrideTemplate)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALCCQROverrideTemplate mergeFrom:](ccqrOverrideTemplate, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUINTERNALOverrideValue setCcqrOverrideTemplate:](self, "setCcqrOverrideTemplate:");
  }
  v4 = v13;
LABEL_7:
  userParse = self->_userParse;
  v8 = v4[4];
  if (userParse)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUEXTERNALUserParse mergeFrom:](userParse, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUINTERNALOverrideValue setUserParse:](self, "setUserParse:");
  }
  v4 = v13;
LABEL_13:
  lvcOverrideValue = self->_lvcOverrideValue;
  v10 = v4[2];
  if (lvcOverrideValue)
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUINTERNALLVCOverrideValue mergeFrom:](lvcOverrideValue, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[SIRINLUINTERNALOverrideValue setLvcOverrideValue:](self, "setLvcOverrideValue:");
  }
  v4 = v13;
LABEL_19:
  planOverrideValue = self->_planOverrideValue;
  v12 = v4[3];
  if (planOverrideValue)
  {
    if (v12)
    {
      -[SIRINLUINTERNALPlanOverrideValue mergeFrom:](planOverrideValue, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALOverrideValue setPlanOverrideValue:](self, "setPlanOverrideValue:");
    goto LABEL_24;
  }

}

- (SIRINLUINTERNALCCQROverrideTemplate)ccqrOverrideTemplate
{
  return self->_ccqrOverrideTemplate;
}

- (void)setCcqrOverrideTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_ccqrOverrideTemplate, a3);
}

- (SIRINLUEXTERNALUserParse)userParse
{
  return self->_userParse;
}

- (void)setUserParse:(id)a3
{
  objc_storeStrong((id *)&self->_userParse, a3);
}

- (SIRINLUINTERNALLVCOverrideValue)lvcOverrideValue
{
  return self->_lvcOverrideValue;
}

- (void)setLvcOverrideValue:(id)a3
{
  objc_storeStrong((id *)&self->_lvcOverrideValue, a3);
}

- (SIRINLUINTERNALPlanOverrideValue)planOverrideValue
{
  return self->_planOverrideValue;
}

- (void)setPlanOverrideValue:(id)a3
{
  objc_storeStrong((id *)&self->_planOverrideValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userParse, 0);
  objc_storeStrong((id *)&self->_planOverrideValue, 0);
  objc_storeStrong((id *)&self->_lvcOverrideValue, 0);
  objc_storeStrong((id *)&self->_ccqrOverrideTemplate, 0);
}

@end
