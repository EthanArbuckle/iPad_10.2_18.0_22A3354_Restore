@implementation NLXSchemaCDMSystemDialogAct

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NLXSchemaCDMSystemDialogAct;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v31, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMSystemDialogAct id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMSystemDialogAct deleteId](self, "deleteId");
  -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMSystemDialogAct deleteLinkId](self, "deleteLinkId");
  -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaCDMSystemDialogAct deletePrompted](self, "deletePrompted");
  -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaCDMSystemDialogAct deleteOffered](self, "deleteOffered");
  -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLXSchemaCDMSystemDialogAct deleteGaveOptions](self, "deleteGaveOptions");
  -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[NLXSchemaCDMSystemDialogAct deleteInformed](self, "deleteInformed");
  -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[NLXSchemaCDMSystemDialogAct deleteReportedSuccess](self, "deleteReportedSuccess");
  -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[NLXSchemaCDMSystemDialogAct deleteReportedFailure](self, "deleteReportedFailure");

  return v5;
}

- (BOOL)hasId
{
  return self->_id != 0;
}

- (void)deleteId
{
  -[NLXSchemaCDMSystemDialogAct setId:](self, "setId:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaCDMSystemDialogAct setLinkId:](self, "setLinkId:", 0);
}

- (void)setPrompted:(id)a3
{
  NLXSchemaCDMSystemPrompted *v4;
  NLXSchemaCDMSystemOffered *offered;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;
  NLXSchemaCDMSystemInformed *informed;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;
  unint64_t v10;
  NLXSchemaCDMSystemPrompted *prompted;

  v4 = (NLXSchemaCDMSystemPrompted *)a3;
  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  v10 = 3;
  if (!v4)
    v10 = 0;
  self->_whichSystemdialogacttype = v10;
  prompted = self->_prompted;
  self->_prompted = v4;

}

- (NLXSchemaCDMSystemPrompted)prompted
{
  if (self->_whichSystemdialogacttype == 3)
    return self->_prompted;
  else
    return (NLXSchemaCDMSystemPrompted *)0;
}

- (void)deletePrompted
{
  NLXSchemaCDMSystemPrompted *prompted;

  if (self->_whichSystemdialogacttype == 3)
  {
    self->_whichSystemdialogacttype = 0;
    prompted = self->_prompted;
    self->_prompted = 0;

  }
}

- (void)setOffered:(id)a3
{
  NLXSchemaCDMSystemOffered *v4;
  NLXSchemaCDMSystemPrompted *prompted;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;
  NLXSchemaCDMSystemInformed *informed;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;
  NLXSchemaCDMSystemOffered *offered;

  v4 = (NLXSchemaCDMSystemOffered *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  self->_whichSystemdialogacttype = 4 * (v4 != 0);
  offered = self->_offered;
  self->_offered = v4;

}

- (NLXSchemaCDMSystemOffered)offered
{
  if (self->_whichSystemdialogacttype == 4)
    return self->_offered;
  else
    return (NLXSchemaCDMSystemOffered *)0;
}

- (void)deleteOffered
{
  NLXSchemaCDMSystemOffered *offered;

  if (self->_whichSystemdialogacttype == 4)
  {
    self->_whichSystemdialogacttype = 0;
    offered = self->_offered;
    self->_offered = 0;

  }
}

- (void)setGaveOptions:(id)a3
{
  NLXSchemaCDMSystemGaveOptions *v4;
  NLXSchemaCDMSystemPrompted *prompted;
  NLXSchemaCDMSystemOffered *offered;
  NLXSchemaCDMSystemInformed *informed;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;
  unint64_t v10;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;

  v4 = (NLXSchemaCDMSystemGaveOptions *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  v10 = 5;
  if (!v4)
    v10 = 0;
  self->_whichSystemdialogacttype = v10;
  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = v4;

}

- (NLXSchemaCDMSystemGaveOptions)gaveOptions
{
  if (self->_whichSystemdialogacttype == 5)
    return self->_gaveOptions;
  else
    return (NLXSchemaCDMSystemGaveOptions *)0;
}

- (void)deleteGaveOptions
{
  NLXSchemaCDMSystemGaveOptions *gaveOptions;

  if (self->_whichSystemdialogacttype == 5)
  {
    self->_whichSystemdialogacttype = 0;
    gaveOptions = self->_gaveOptions;
    self->_gaveOptions = 0;

  }
}

- (void)setInformed:(id)a3
{
  NLXSchemaCDMSystemInformed *v4;
  NLXSchemaCDMSystemPrompted *prompted;
  NLXSchemaCDMSystemOffered *offered;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;
  unint64_t v10;
  NLXSchemaCDMSystemInformed *informed;

  v4 = (NLXSchemaCDMSystemInformed *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  v10 = 6;
  if (!v4)
    v10 = 0;
  self->_whichSystemdialogacttype = v10;
  informed = self->_informed;
  self->_informed = v4;

}

- (NLXSchemaCDMSystemInformed)informed
{
  if (self->_whichSystemdialogacttype == 6)
    return self->_informed;
  else
    return (NLXSchemaCDMSystemInformed *)0;
}

- (void)deleteInformed
{
  NLXSchemaCDMSystemInformed *informed;

  if (self->_whichSystemdialogacttype == 6)
  {
    self->_whichSystemdialogacttype = 0;
    informed = self->_informed;
    self->_informed = 0;

  }
}

- (void)setReportedSuccess:(id)a3
{
  NLXSchemaCDMSystemReportedSuccess *v4;
  NLXSchemaCDMSystemPrompted *prompted;
  NLXSchemaCDMSystemOffered *offered;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;
  NLXSchemaCDMSystemInformed *informed;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;
  unint64_t v10;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;

  v4 = (NLXSchemaCDMSystemReportedSuccess *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = 0;

  v10 = 7;
  if (!v4)
    v10 = 0;
  self->_whichSystemdialogacttype = v10;
  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = v4;

}

- (NLXSchemaCDMSystemReportedSuccess)reportedSuccess
{
  if (self->_whichSystemdialogacttype == 7)
    return self->_reportedSuccess;
  else
    return (NLXSchemaCDMSystemReportedSuccess *)0;
}

- (void)deleteReportedSuccess
{
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;

  if (self->_whichSystemdialogacttype == 7)
  {
    self->_whichSystemdialogacttype = 0;
    reportedSuccess = self->_reportedSuccess;
    self->_reportedSuccess = 0;

  }
}

- (void)setReportedFailure:(id)a3
{
  NLXSchemaCDMSystemReportedFailure *v4;
  NLXSchemaCDMSystemPrompted *prompted;
  NLXSchemaCDMSystemOffered *offered;
  NLXSchemaCDMSystemGaveOptions *gaveOptions;
  NLXSchemaCDMSystemInformed *informed;
  NLXSchemaCDMSystemReportedSuccess *reportedSuccess;
  NLXSchemaCDMSystemReportedFailure *reportedFailure;

  v4 = (NLXSchemaCDMSystemReportedFailure *)a3;
  prompted = self->_prompted;
  self->_prompted = 0;

  offered = self->_offered;
  self->_offered = 0;

  gaveOptions = self->_gaveOptions;
  self->_gaveOptions = 0;

  informed = self->_informed;
  self->_informed = 0;

  reportedSuccess = self->_reportedSuccess;
  self->_reportedSuccess = 0;

  self->_whichSystemdialogacttype = 8 * (v4 != 0);
  reportedFailure = self->_reportedFailure;
  self->_reportedFailure = v4;

}

- (NLXSchemaCDMSystemReportedFailure)reportedFailure
{
  if (self->_whichSystemdialogacttype == 8)
    return self->_reportedFailure;
  else
    return (NLXSchemaCDMSystemReportedFailure *)0;
}

- (void)deleteReportedFailure
{
  NLXSchemaCDMSystemReportedFailure *reportedFailure;

  if (self->_whichSystemdialogacttype == 8)
  {
    self->_whichSystemdialogacttype = 0;
    reportedFailure = self->_reportedFailure;
    self->_reportedFailure = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSystemDialogActReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[NLXSchemaCDMSystemDialogAct id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMSystemDialogAct id](self, "id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichSystemdialogacttype;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  whichSystemdialogacttype = self->_whichSystemdialogacttype;
  if (whichSystemdialogacttype != objc_msgSend(v4, "whichSystemdialogacttype"))
    goto LABEL_43;
  -[NLXSchemaCDMSystemDialogAct id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct id](self, "id");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaCDMSystemDialogAct id](self, "id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prompted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prompted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offered");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gaveOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gaveOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "informed");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportedSuccess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_42;
  -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportedSuccess");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_43;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportedFailure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {

LABEL_46:
      v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportedFailure");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if ((v47 & 1) != 0)
      goto LABEL_46;
  }
  else
  {
LABEL_42:

  }
LABEL_43:
  v48 = 0;
LABEL_44:

  return v48;
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

  v3 = -[SISchemaUUID hash](self->_id, "hash");
  v4 = -[SISchemaUUID hash](self->_linkId, "hash") ^ v3;
  v5 = -[NLXSchemaCDMSystemPrompted hash](self->_prompted, "hash");
  v6 = v4 ^ v5 ^ -[NLXSchemaCDMSystemOffered hash](self->_offered, "hash");
  v7 = -[NLXSchemaCDMSystemGaveOptions hash](self->_gaveOptions, "hash");
  v8 = v7 ^ -[NLXSchemaCDMSystemInformed hash](self->_informed, "hash");
  v9 = v6 ^ v8 ^ -[NLXSchemaCDMSystemReportedSuccess hash](self->_reportedSuccess, "hash");
  return v9 ^ -[NLXSchemaCDMSystemReportedFailure hash](self->_reportedFailure, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_gaveOptions)
  {
    -[NLXSchemaCDMSystemDialogAct gaveOptions](self, "gaveOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("gaveOptions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("gaveOptions"));

    }
  }
  if (self->_id)
  {
    -[NLXSchemaCDMSystemDialogAct id](self, "id");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("id"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("id"));

    }
  }
  if (self->_informed)
  {
    -[NLXSchemaCDMSystemDialogAct informed](self, "informed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("informed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("informed"));

    }
  }
  if (self->_linkId)
  {
    -[NLXSchemaCDMSystemDialogAct linkId](self, "linkId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkId"));

    }
  }
  if (self->_offered)
  {
    -[NLXSchemaCDMSystemDialogAct offered](self, "offered");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("offered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("offered"));

    }
  }
  if (self->_prompted)
  {
    -[NLXSchemaCDMSystemDialogAct prompted](self, "prompted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("prompted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("prompted"));

    }
  }
  if (self->_reportedFailure)
  {
    -[NLXSchemaCDMSystemDialogAct reportedFailure](self, "reportedFailure");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("reportedFailure"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("reportedFailure"));

    }
  }
  if (self->_reportedSuccess)
  {
    -[NLXSchemaCDMSystemDialogAct reportedSuccess](self, "reportedSuccess");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("reportedSuccess"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("reportedSuccess"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMSystemDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NLXSchemaCDMSystemDialogAct)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMSystemDialogAct *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[NLXSchemaCDMSystemDialogAct initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMSystemDialogAct)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMSystemDialogAct *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  NLXSchemaCDMSystemPrompted *v11;
  void *v12;
  NLXSchemaCDMSystemOffered *v13;
  void *v14;
  NLXSchemaCDMSystemGaveOptions *v15;
  void *v16;
  NLXSchemaCDMSystemInformed *v17;
  void *v18;
  NLXSchemaCDMSystemReportedSuccess *v19;
  void *v20;
  NLXSchemaCDMSystemReportedFailure *v21;
  NLXSchemaCDMSystemDialogAct *v22;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NLXSchemaCDMSystemDialogAct;
  v5 = -[NLXSchemaCDMSystemDialogAct init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMSystemDialogAct setId:](v5, "setId:", v7);

    }
    v24 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMSystemDialogAct setLinkId:](v5, "setLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prompted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaCDMSystemPrompted initWithDictionary:]([NLXSchemaCDMSystemPrompted alloc], "initWithDictionary:", v10);
      -[NLXSchemaCDMSystemDialogAct setPrompted:](v5, "setPrompted:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offered"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLXSchemaCDMSystemOffered initWithDictionary:]([NLXSchemaCDMSystemOffered alloc], "initWithDictionary:", v12);
      -[NLXSchemaCDMSystemDialogAct setOffered:](v5, "setOffered:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaveOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLXSchemaCDMSystemGaveOptions initWithDictionary:]([NLXSchemaCDMSystemGaveOptions alloc], "initWithDictionary:", v14);
      -[NLXSchemaCDMSystemDialogAct setGaveOptions:](v5, "setGaveOptions:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[NLXSchemaCDMSystemInformed initWithDictionary:]([NLXSchemaCDMSystemInformed alloc], "initWithDictionary:", v16);
      -[NLXSchemaCDMSystemDialogAct setInformed:](v5, "setInformed:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reportedSuccess"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[NLXSchemaCDMSystemReportedSuccess initWithDictionary:]([NLXSchemaCDMSystemReportedSuccess alloc], "initWithDictionary:", v18);
      -[NLXSchemaCDMSystemDialogAct setReportedSuccess:](v5, "setReportedSuccess:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reportedFailure"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[NLXSchemaCDMSystemReportedFailure initWithDictionary:]([NLXSchemaCDMSystemReportedFailure alloc], "initWithDictionary:", v20);
      -[NLXSchemaCDMSystemDialogAct setReportedFailure:](v5, "setReportedFailure:", v21);

    }
    v22 = v5;

  }
  return v5;
}

- (unint64_t)whichSystemdialogacttype
{
  return self->_whichSystemdialogacttype;
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (void)setHasId:(BOOL)a3
{
  self->_hasId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (BOOL)hasPrompted
{
  return self->_hasPrompted;
}

- (void)setHasPrompted:(BOOL)a3
{
  self->_hasPrompted = a3;
}

- (BOOL)hasOffered
{
  return self->_hasOffered;
}

- (void)setHasOffered:(BOOL)a3
{
  self->_hasOffered = a3;
}

- (BOOL)hasGaveOptions
{
  return self->_hasGaveOptions;
}

- (void)setHasGaveOptions:(BOOL)a3
{
  self->_hasGaveOptions = a3;
}

- (BOOL)hasInformed
{
  return self->_hasInformed;
}

- (void)setHasInformed:(BOOL)a3
{
  self->_hasInformed = a3;
}

- (BOOL)hasReportedSuccess
{
  return self->_hasReportedSuccess;
}

- (void)setHasReportedSuccess:(BOOL)a3
{
  self->_hasReportedSuccess = a3;
}

- (BOOL)hasReportedFailure
{
  return self->_hasReportedFailure;
}

- (void)setHasReportedFailure:(BOOL)a3
{
  self->_hasReportedFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedFailure, 0);
  objc_storeStrong((id *)&self->_reportedSuccess, 0);
  objc_storeStrong((id *)&self->_informed, 0);
  objc_storeStrong((id *)&self->_gaveOptions, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_prompted, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
