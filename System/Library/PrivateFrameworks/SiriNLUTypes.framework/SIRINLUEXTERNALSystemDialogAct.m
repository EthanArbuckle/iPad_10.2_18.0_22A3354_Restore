@implementation SIRINLUEXTERNALSystemDialogAct

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (BOOL)hasPrompted
{
  return self->_prompted != 0;
}

- (BOOL)hasOffered
{
  return self->_offered != 0;
}

- (BOOL)hasGaveOptions
{
  return self->_gaveOptions != 0;
}

- (BOOL)hasInformed
{
  return self->_informed != 0;
}

- (BOOL)hasReportedSuccess
{
  return self->_reportedSuccess != 0;
}

- (BOOL)hasReportedFailure
{
  return self->_reportedFailure != 0;
}

- (BOOL)hasRenderedText
{
  return self->_renderedText != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALSystemDialogAct;
  -[SIRINLUEXTERNALSystemDialogAct description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSystemDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *idA;
  void *v5;
  SIRINLUEXTERNALSystemPrompted *prompted;
  void *v7;
  SIRINLUEXTERNALSystemOffered *offered;
  void *v9;
  SIRINLUEXTERNALSystemGaveOptions *gaveOptions;
  void *v11;
  SIRINLUEXTERNALSystemInformed *informed;
  void *v13;
  SIRINLUEXTERNALSystemReportedSuccess *reportedSuccess;
  void *v15;
  SIRINLUEXTERNALSystemReportedFailure *reportedFailure;
  void *v17;
  SIRICOMMONStringValue *renderedText;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  idA = self->_idA;
  if (idA)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](idA, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("id_a"));

  }
  prompted = self->_prompted;
  if (prompted)
  {
    -[SIRINLUEXTERNALSystemPrompted dictionaryRepresentation](prompted, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("prompted"));

  }
  offered = self->_offered;
  if (offered)
  {
    -[SIRINLUEXTERNALSystemOffered dictionaryRepresentation](offered, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("offered"));

  }
  gaveOptions = self->_gaveOptions;
  if (gaveOptions)
  {
    -[SIRINLUEXTERNALSystemGaveOptions dictionaryRepresentation](gaveOptions, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("gave_options"));

  }
  informed = self->_informed;
  if (informed)
  {
    -[SIRINLUEXTERNALSystemInformed dictionaryRepresentation](informed, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("informed"));

  }
  reportedSuccess = self->_reportedSuccess;
  if (reportedSuccess)
  {
    -[SIRINLUEXTERNALSystemReportedSuccess dictionaryRepresentation](reportedSuccess, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("reported_success"));

  }
  reportedFailure = self->_reportedFailure;
  if (reportedFailure)
  {
    -[SIRINLUEXTERNALSystemReportedFailure dictionaryRepresentation](reportedFailure, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("reported_failure"));

  }
  renderedText = self->_renderedText;
  if (renderedText)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](renderedText, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rendered_text"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemDialogActReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_idA)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_prompted)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_offered)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_gaveOptions)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_informed)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reportedSuccess)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reportedFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_renderedText)
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
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    v4 = v5;
  }
  if (self->_prompted)
  {
    objc_msgSend(v5, "setPrompted:");
    v4 = v5;
  }
  if (self->_offered)
  {
    objc_msgSend(v5, "setOffered:");
    v4 = v5;
  }
  if (self->_gaveOptions)
  {
    objc_msgSend(v5, "setGaveOptions:");
    v4 = v5;
  }
  if (self->_informed)
  {
    objc_msgSend(v5, "setInformed:");
    v4 = v5;
  }
  if (self->_reportedSuccess)
  {
    objc_msgSend(v5, "setReportedSuccess:");
    v4 = v5;
  }
  if (self->_reportedFailure)
  {
    objc_msgSend(v5, "setReportedFailure:");
    v4 = v5;
  }
  if (self->_renderedText)
  {
    objc_msgSend(v5, "setRenderedText:");
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SIRINLUEXTERNALSystemPrompted copyWithZone:](self->_prompted, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[SIRINLUEXTERNALSystemOffered copyWithZone:](self->_offered, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[SIRINLUEXTERNALSystemGaveOptions copyWithZone:](self->_gaveOptions, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[SIRINLUEXTERNALSystemInformed copyWithZone:](self->_informed, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  v16 = -[SIRINLUEXTERNALSystemReportedSuccess copyWithZone:](self->_reportedSuccess, "copyWithZone:", a3);
  v17 = (void *)v5[8];
  v5[8] = v16;

  v18 = -[SIRINLUEXTERNALSystemReportedFailure copyWithZone:](self->_reportedFailure, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[SIRICOMMONStringValue copyWithZone:](self->_renderedText, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *idA;
  SIRINLUEXTERNALSystemPrompted *prompted;
  SIRINLUEXTERNALSystemOffered *offered;
  SIRINLUEXTERNALSystemGaveOptions *gaveOptions;
  SIRINLUEXTERNALSystemInformed *informed;
  SIRINLUEXTERNALSystemReportedSuccess *reportedSuccess;
  SIRINLUEXTERNALSystemReportedFailure *reportedFailure;
  SIRICOMMONStringValue *renderedText;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((idA = self->_idA, !((unint64_t)idA | v4[2])) || -[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:"))
    && ((prompted = self->_prompted, !((unint64_t)prompted | v4[5]))
     || -[SIRINLUEXTERNALSystemPrompted isEqual:](prompted, "isEqual:"))
    && ((offered = self->_offered, !((unint64_t)offered | v4[4]))
     || -[SIRINLUEXTERNALSystemOffered isEqual:](offered, "isEqual:"))
    && ((gaveOptions = self->_gaveOptions, !((unint64_t)gaveOptions | v4[1]))
     || -[SIRINLUEXTERNALSystemGaveOptions isEqual:](gaveOptions, "isEqual:"))
    && ((informed = self->_informed, !((unint64_t)informed | v4[3]))
     || -[SIRINLUEXTERNALSystemInformed isEqual:](informed, "isEqual:"))
    && ((reportedSuccess = self->_reportedSuccess, !((unint64_t)reportedSuccess | v4[8]))
     || -[SIRINLUEXTERNALSystemReportedSuccess isEqual:](reportedSuccess, "isEqual:"))
    && ((reportedFailure = self->_reportedFailure, !((unint64_t)reportedFailure | v4[7]))
     || -[SIRINLUEXTERNALSystemReportedFailure isEqual:](reportedFailure, "isEqual:")))
  {
    renderedText = self->_renderedText;
    if ((unint64_t)renderedText | v4[6])
      v13 = -[SIRICOMMONStringValue isEqual:](renderedText, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_idA, "hash");
  v4 = -[SIRINLUEXTERNALSystemPrompted hash](self->_prompted, "hash") ^ v3;
  v5 = -[SIRINLUEXTERNALSystemOffered hash](self->_offered, "hash");
  v6 = v4 ^ v5 ^ -[SIRINLUEXTERNALSystemGaveOptions hash](self->_gaveOptions, "hash");
  v7 = -[SIRINLUEXTERNALSystemInformed hash](self->_informed, "hash");
  v8 = v7 ^ -[SIRINLUEXTERNALSystemReportedSuccess hash](self->_reportedSuccess, "hash");
  v9 = v6 ^ v8 ^ -[SIRINLUEXTERNALSystemReportedFailure hash](self->_reportedFailure, "hash");
  return v9 ^ -[SIRICOMMONStringValue hash](self->_renderedText, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *idA;
  uint64_t v6;
  SIRINLUEXTERNALSystemPrompted *prompted;
  uint64_t v8;
  SIRINLUEXTERNALSystemOffered *offered;
  uint64_t v10;
  SIRINLUEXTERNALSystemGaveOptions *gaveOptions;
  uint64_t v12;
  SIRINLUEXTERNALSystemInformed *informed;
  uint64_t v14;
  SIRINLUEXTERNALSystemReportedSuccess *reportedSuccess;
  uint64_t v16;
  SIRINLUEXTERNALSystemReportedFailure *reportedFailure;
  uint64_t v18;
  SIRICOMMONStringValue *renderedText;
  uint64_t v20;
  _QWORD *v21;

  v4 = a3;
  idA = self->_idA;
  v21 = v4;
  v6 = v4[2];
  if (idA)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSystemDialogAct setIdA:](self, "setIdA:");
  }
  prompted = self->_prompted;
  v8 = v21[5];
  if (prompted)
  {
    if (v8)
      -[SIRINLUEXTERNALSystemPrompted mergeFrom:](prompted, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALSystemDialogAct setPrompted:](self, "setPrompted:");
  }
  offered = self->_offered;
  v10 = v21[4];
  if (offered)
  {
    if (v10)
      -[SIRINLUEXTERNALSystemOffered mergeFrom:](offered, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALSystemDialogAct setOffered:](self, "setOffered:");
  }
  gaveOptions = self->_gaveOptions;
  v12 = v21[1];
  if (gaveOptions)
  {
    if (v12)
      -[SIRINLUEXTERNALSystemGaveOptions mergeFrom:](gaveOptions, "mergeFrom:");
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALSystemDialogAct setGaveOptions:](self, "setGaveOptions:");
  }
  informed = self->_informed;
  v14 = v21[3];
  if (informed)
  {
    if (v14)
      -[SIRINLUEXTERNALSystemInformed mergeFrom:](informed, "mergeFrom:");
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALSystemDialogAct setInformed:](self, "setInformed:");
  }
  reportedSuccess = self->_reportedSuccess;
  v16 = v21[8];
  if (reportedSuccess)
  {
    if (v16)
      -[SIRINLUEXTERNALSystemReportedSuccess mergeFrom:](reportedSuccess, "mergeFrom:");
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALSystemDialogAct setReportedSuccess:](self, "setReportedSuccess:");
  }
  reportedFailure = self->_reportedFailure;
  v18 = v21[7];
  if (reportedFailure)
  {
    if (v18)
      -[SIRINLUEXTERNALSystemReportedFailure mergeFrom:](reportedFailure, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALSystemDialogAct setReportedFailure:](self, "setReportedFailure:");
  }
  renderedText = self->_renderedText;
  v20 = v21[6];
  if (renderedText)
  {
    if (v20)
      -[SIRICOMMONStringValue mergeFrom:](renderedText, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALSystemDialogAct setRenderedText:](self, "setRenderedText:");
  }

}

- (SIRINLUEXTERNALUUID)idA
{
  return self->_idA;
}

- (void)setIdA:(id)a3
{
  objc_storeStrong((id *)&self->_idA, a3);
}

- (SIRINLUEXTERNALSystemPrompted)prompted
{
  return self->_prompted;
}

- (void)setPrompted:(id)a3
{
  objc_storeStrong((id *)&self->_prompted, a3);
}

- (SIRINLUEXTERNALSystemOffered)offered
{
  return self->_offered;
}

- (void)setOffered:(id)a3
{
  objc_storeStrong((id *)&self->_offered, a3);
}

- (SIRINLUEXTERNALSystemGaveOptions)gaveOptions
{
  return self->_gaveOptions;
}

- (void)setGaveOptions:(id)a3
{
  objc_storeStrong((id *)&self->_gaveOptions, a3);
}

- (SIRINLUEXTERNALSystemInformed)informed
{
  return self->_informed;
}

- (void)setInformed:(id)a3
{
  objc_storeStrong((id *)&self->_informed, a3);
}

- (SIRINLUEXTERNALSystemReportedSuccess)reportedSuccess
{
  return self->_reportedSuccess;
}

- (void)setReportedSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_reportedSuccess, a3);
}

- (SIRINLUEXTERNALSystemReportedFailure)reportedFailure
{
  return self->_reportedFailure;
}

- (void)setReportedFailure:(id)a3
{
  objc_storeStrong((id *)&self->_reportedFailure, a3);
}

- (SIRICOMMONStringValue)renderedText
{
  return self->_renderedText;
}

- (void)setRenderedText:(id)a3
{
  objc_storeStrong((id *)&self->_renderedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedSuccess, 0);
  objc_storeStrong((id *)&self->_reportedFailure, 0);
  objc_storeStrong((id *)&self->_renderedText, 0);
  objc_storeStrong((id *)&self->_prompted, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_informed, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_gaveOptions, 0);
}

@end
