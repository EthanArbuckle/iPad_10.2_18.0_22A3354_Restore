@implementation IFTSchemaIFTStatementOutcome

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
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)IFTSchemaIFTStatementOutcome;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v40, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTStatementOutcome success](self, "success");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTStatementOutcome deleteSuccess](self, "deleteSuccess");
  -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTStatementOutcome deleteActionConfirmation](self, "deleteActionConfirmation");
  -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTStatementOutcome deleteParameterNeedsValue](self, "deleteParameterNeedsValue");
  -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTStatementOutcome deleteParameterConfirmation](self, "deleteParameterConfirmation");
  -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IFTSchemaIFTStatementOutcome deleteParameterDisambiguation](self, "deleteParameterDisambiguation");
  -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[IFTSchemaIFTStatementOutcome deleteParameterNotAllowed](self, "deleteParameterNotAllowed");
  -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[IFTSchemaIFTStatementOutcome deleteParameterCandidatesNotFounds](self, "deleteParameterCandidatesNotFounds");
  -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[IFTSchemaIFTStatementOutcome deleteActionRequirement](self, "deleteActionRequirement");
  -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[IFTSchemaIFTStatementOutcome deleteToolDisambiguation](self, "deleteToolDisambiguation");
  -[IFTSchemaIFTStatementOutcome failure](self, "failure");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[IFTSchemaIFTStatementOutcome deleteFailure](self, "deleteFailure");
  -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[IFTSchemaIFTStatementOutcome deleteValueDisambiguation](self, "deleteValueDisambiguation");

  return v5;
}

- (void)setSuccess:(id)a3
{
  IFTSchemaIFTActionSuccess *v4;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  IFTSchemaIFTActionSuccess *success;

  v4 = (IFTSchemaIFTActionSuccess *)a3;
  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_whichOneof_Statementoutcome = v4 != 0;
  success = self->_success;
  self->_success = v4;

}

- (IFTSchemaIFTActionSuccess)success
{
  if (self->_whichOneof_Statementoutcome == 1)
    return self->_success;
  else
    return (IFTSchemaIFTActionSuccess *)0;
}

- (void)deleteSuccess
{
  IFTSchemaIFTActionSuccess *success;

  if (self->_whichOneof_Statementoutcome == 1)
  {
    self->_whichOneof_Statementoutcome = 0;
    success = self->_success;
    self->_success = 0;

  }
}

- (void)setActionConfirmation:(id)a3
{
  IFTSchemaIFTActionConfirmation *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  IFTSchemaIFTActionConfirmation *actionConfirmation;

  v4 = (IFTSchemaIFTActionConfirmation *)a3;
  success = self->_success;
  self->_success = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_whichOneof_Statementoutcome = 2 * (v4 != 0);
  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = v4;

}

- (IFTSchemaIFTActionConfirmation)actionConfirmation
{
  if (self->_whichOneof_Statementoutcome == 2)
    return self->_actionConfirmation;
  else
    return (IFTSchemaIFTActionConfirmation *)0;
}

- (void)deleteActionConfirmation
{
  IFTSchemaIFTActionConfirmation *actionConfirmation;

  if (self->_whichOneof_Statementoutcome == 2)
  {
    self->_whichOneof_Statementoutcome = 0;
    actionConfirmation = self->_actionConfirmation;
    self->_actionConfirmation = 0;

  }
}

- (void)setParameterNeedsValue:(id)a3
{
  IFTSchemaIFTParameterNeedsValue *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;

  v4 = (IFTSchemaIFTParameterNeedsValue *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 3;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = v4;

}

- (IFTSchemaIFTParameterNeedsValue)parameterNeedsValue
{
  if (self->_whichOneof_Statementoutcome == 3)
    return self->_parameterNeedsValue;
  else
    return (IFTSchemaIFTParameterNeedsValue *)0;
}

- (void)deleteParameterNeedsValue
{
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;

  if (self->_whichOneof_Statementoutcome == 3)
  {
    self->_whichOneof_Statementoutcome = 0;
    parameterNeedsValue = self->_parameterNeedsValue;
    self->_parameterNeedsValue = 0;

  }
}

- (void)setParameterConfirmation:(id)a3
{
  IFTSchemaIFTParameterConfirmation *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;

  v4 = (IFTSchemaIFTParameterConfirmation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_whichOneof_Statementoutcome = 4 * (v4 != 0);
  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = v4;

}

- (IFTSchemaIFTParameterConfirmation)parameterConfirmation
{
  if (self->_whichOneof_Statementoutcome == 4)
    return self->_parameterConfirmation;
  else
    return (IFTSchemaIFTParameterConfirmation *)0;
}

- (void)deleteParameterConfirmation
{
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;

  if (self->_whichOneof_Statementoutcome == 4)
  {
    self->_whichOneof_Statementoutcome = 0;
    parameterConfirmation = self->_parameterConfirmation;
    self->_parameterConfirmation = 0;

  }
}

- (void)setParameterDisambiguation:(id)a3
{
  IFTSchemaIFTParameterDisambiguation *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;

  v4 = (IFTSchemaIFTParameterDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 5;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = v4;

}

- (IFTSchemaIFTParameterDisambiguation)parameterDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 5)
    return self->_parameterDisambiguation;
  else
    return (IFTSchemaIFTParameterDisambiguation *)0;
}

- (void)deleteParameterDisambiguation
{
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;

  if (self->_whichOneof_Statementoutcome == 5)
  {
    self->_whichOneof_Statementoutcome = 0;
    parameterDisambiguation = self->_parameterDisambiguation;
    self->_parameterDisambiguation = 0;

  }
}

- (void)setParameterNotAllowed:(id)a3
{
  IFTSchemaIFTParameterNotAllowed *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;

  v4 = (IFTSchemaIFTParameterNotAllowed *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 6;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = v4;

}

- (IFTSchemaIFTParameterNotAllowed)parameterNotAllowed
{
  if (self->_whichOneof_Statementoutcome == 6)
    return self->_parameterNotAllowed;
  else
    return (IFTSchemaIFTParameterNotAllowed *)0;
}

- (void)deleteParameterNotAllowed
{
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;

  if (self->_whichOneof_Statementoutcome == 6)
  {
    self->_whichOneof_Statementoutcome = 0;
    parameterNotAllowed = self->_parameterNotAllowed;
    self->_parameterNotAllowed = 0;

  }
}

- (void)setParameterCandidatesNotFounds:(id)a3
{
  IFTSchemaIFTParameterCandidatesNotFound *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;

  v4 = (IFTSchemaIFTParameterCandidatesNotFound *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 7;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = v4;

}

- (IFTSchemaIFTParameterCandidatesNotFound)parameterCandidatesNotFounds
{
  if (self->_whichOneof_Statementoutcome == 7)
    return self->_parameterCandidatesNotFounds;
  else
    return (IFTSchemaIFTParameterCandidatesNotFound *)0;
}

- (void)deleteParameterCandidatesNotFounds
{
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;

  if (self->_whichOneof_Statementoutcome == 7)
  {
    self->_whichOneof_Statementoutcome = 0;
    parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
    self->_parameterCandidatesNotFounds = 0;

  }
}

- (void)setActionRequirement:(id)a3
{
  IFTSchemaIFTActionRequirement *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  IFTSchemaIFTActionRequirement *actionRequirement;

  v4 = (IFTSchemaIFTActionRequirement *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  self->_whichOneof_Statementoutcome = 8 * (v4 != 0);
  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = v4;

}

- (IFTSchemaIFTActionRequirement)actionRequirement
{
  if (self->_whichOneof_Statementoutcome == 8)
    return self->_actionRequirement;
  else
    return (IFTSchemaIFTActionRequirement *)0;
}

- (void)deleteActionRequirement
{
  IFTSchemaIFTActionRequirement *actionRequirement;

  if (self->_whichOneof_Statementoutcome == 8)
  {
    self->_whichOneof_Statementoutcome = 0;
    actionRequirement = self->_actionRequirement;
    self->_actionRequirement = 0;

  }
}

- (void)setToolDisambiguation:(id)a3
{
  IFTSchemaIFTToolDisambiguation *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTActionFailure *failure;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;

  v4 = (IFTSchemaIFTToolDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  failure = self->_failure;
  self->_failure = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 9;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = v4;

}

- (IFTSchemaIFTToolDisambiguation)toolDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 9)
    return self->_toolDisambiguation;
  else
    return (IFTSchemaIFTToolDisambiguation *)0;
}

- (void)deleteToolDisambiguation
{
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;

  if (self->_whichOneof_Statementoutcome == 9)
  {
    self->_whichOneof_Statementoutcome = 0;
    toolDisambiguation = self->_toolDisambiguation;
    self->_toolDisambiguation = 0;

  }
}

- (void)setFailure:(id)a3
{
  IFTSchemaIFTActionFailure *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;
  unint64_t v15;
  IFTSchemaIFTActionFailure *failure;

  v4 = (IFTSchemaIFTActionFailure *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = 0;

  v15 = 10;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  failure = self->_failure;
  self->_failure = v4;

}

- (IFTSchemaIFTActionFailure)failure
{
  if (self->_whichOneof_Statementoutcome == 10)
    return self->_failure;
  else
    return (IFTSchemaIFTActionFailure *)0;
}

- (void)deleteFailure
{
  IFTSchemaIFTActionFailure *failure;

  if (self->_whichOneof_Statementoutcome == 10)
  {
    self->_whichOneof_Statementoutcome = 0;
    failure = self->_failure;
    self->_failure = 0;

  }
}

- (void)setValueDisambiguation:(id)a3
{
  IFTSchemaIFTValueDisambiguation *v4;
  IFTSchemaIFTActionSuccess *success;
  IFTSchemaIFTActionConfirmation *actionConfirmation;
  IFTSchemaIFTParameterNeedsValue *parameterNeedsValue;
  IFTSchemaIFTParameterConfirmation *parameterConfirmation;
  IFTSchemaIFTParameterDisambiguation *parameterDisambiguation;
  IFTSchemaIFTParameterNotAllowed *parameterNotAllowed;
  IFTSchemaIFTParameterCandidatesNotFound *parameterCandidatesNotFounds;
  IFTSchemaIFTActionRequirement *actionRequirement;
  IFTSchemaIFTToolDisambiguation *toolDisambiguation;
  IFTSchemaIFTActionFailure *failure;
  unint64_t v15;
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;

  v4 = (IFTSchemaIFTValueDisambiguation *)a3;
  success = self->_success;
  self->_success = 0;

  actionConfirmation = self->_actionConfirmation;
  self->_actionConfirmation = 0;

  parameterNeedsValue = self->_parameterNeedsValue;
  self->_parameterNeedsValue = 0;

  parameterConfirmation = self->_parameterConfirmation;
  self->_parameterConfirmation = 0;

  parameterDisambiguation = self->_parameterDisambiguation;
  self->_parameterDisambiguation = 0;

  parameterNotAllowed = self->_parameterNotAllowed;
  self->_parameterNotAllowed = 0;

  parameterCandidatesNotFounds = self->_parameterCandidatesNotFounds;
  self->_parameterCandidatesNotFounds = 0;

  actionRequirement = self->_actionRequirement;
  self->_actionRequirement = 0;

  toolDisambiguation = self->_toolDisambiguation;
  self->_toolDisambiguation = 0;

  failure = self->_failure;
  self->_failure = 0;

  v15 = 11;
  if (!v4)
    v15 = 0;
  self->_whichOneof_Statementoutcome = v15;
  valueDisambiguation = self->_valueDisambiguation;
  self->_valueDisambiguation = v4;

}

- (IFTSchemaIFTValueDisambiguation)valueDisambiguation
{
  if (self->_whichOneof_Statementoutcome == 11)
    return self->_valueDisambiguation;
  else
    return (IFTSchemaIFTValueDisambiguation *)0;
}

- (void)deleteValueDisambiguation
{
  IFTSchemaIFTValueDisambiguation *valueDisambiguation;

  if (self->_whichOneof_Statementoutcome == 11)
  {
    self->_whichOneof_Statementoutcome = 0;
    valueDisambiguation = self->_valueDisambiguation;
    self->_valueDisambiguation = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTStatementOutcomeReadFrom(self, (uint64_t)a3);
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[IFTSchemaIFTStatementOutcome success](self, "success");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTStatementOutcome success](self, "success");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome failure](self, "failure");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[IFTSchemaIFTStatementOutcome failure](self, "failure");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Statementoutcome;
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
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  BOOL v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  whichOneof_Statementoutcome = self->_whichOneof_Statementoutcome;
  if (whichOneof_Statementoutcome != objc_msgSend(v4, "whichOneof_Statementoutcome"))
    goto LABEL_58;
  -[IFTSchemaIFTStatementOutcome success](self, "success");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "success");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome success](self, "success");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTStatementOutcome success](self, "success");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "success");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionConfirmation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionConfirmation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterNeedsValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterNeedsValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterConfirmation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterConfirmation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterDisambiguation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterDisambiguation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterNotAllowed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterNotAllowed");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterCandidatesNotFounds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterCandidatesNotFounds");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionRequirement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionRequirement");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolDisambiguation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolDisambiguation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome failure](self, "failure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[IFTSchemaIFTStatementOutcome failure](self, "failure");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[IFTSchemaIFTStatementOutcome failure](self, "failure");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failure");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_58;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueDisambiguation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {

LABEL_61:
      v63 = 1;
      goto LABEL_59;
    }
    v59 = (void *)v58;
    -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueDisambiguation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if ((v62 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
LABEL_57:

  }
LABEL_58:
  v63 = 0;
LABEL_59:

  return v63;
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
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[IFTSchemaIFTActionSuccess hash](self->_success, "hash");
  v4 = -[IFTSchemaIFTActionConfirmation hash](self->_actionConfirmation, "hash") ^ v3;
  v5 = -[IFTSchemaIFTParameterNeedsValue hash](self->_parameterNeedsValue, "hash");
  v6 = v4 ^ v5 ^ -[IFTSchemaIFTParameterConfirmation hash](self->_parameterConfirmation, "hash");
  v7 = -[IFTSchemaIFTParameterDisambiguation hash](self->_parameterDisambiguation, "hash");
  v8 = v7 ^ -[IFTSchemaIFTParameterNotAllowed hash](self->_parameterNotAllowed, "hash");
  v9 = v6 ^ v8 ^ -[IFTSchemaIFTParameterCandidatesNotFound hash](self->_parameterCandidatesNotFounds, "hash");
  v10 = -[IFTSchemaIFTActionRequirement hash](self->_actionRequirement, "hash");
  v11 = v10 ^ -[IFTSchemaIFTToolDisambiguation hash](self->_toolDisambiguation, "hash");
  v12 = v11 ^ -[IFTSchemaIFTActionFailure hash](self->_failure, "hash");
  return v9 ^ v12 ^ -[IFTSchemaIFTValueDisambiguation hash](self->_valueDisambiguation, "hash");
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionConfirmation)
  {
    -[IFTSchemaIFTStatementOutcome actionConfirmation](self, "actionConfirmation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionConfirmation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionConfirmation"));

    }
  }
  if (self->_actionRequirement)
  {
    -[IFTSchemaIFTStatementOutcome actionRequirement](self, "actionRequirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionRequirement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("actionRequirement"));

    }
  }
  if (self->_failure)
  {
    -[IFTSchemaIFTStatementOutcome failure](self, "failure");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failure"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failure"));

    }
  }
  if (self->_parameterCandidatesNotFounds)
  {
    -[IFTSchemaIFTStatementOutcome parameterCandidatesNotFounds](self, "parameterCandidatesNotFounds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("parameterCandidatesNotFounds"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("parameterCandidatesNotFounds"));

    }
  }
  if (self->_parameterConfirmation)
  {
    -[IFTSchemaIFTStatementOutcome parameterConfirmation](self, "parameterConfirmation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("parameterConfirmation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("parameterConfirmation"));

    }
  }
  if (self->_parameterDisambiguation)
  {
    -[IFTSchemaIFTStatementOutcome parameterDisambiguation](self, "parameterDisambiguation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("parameterDisambiguation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("parameterDisambiguation"));

    }
  }
  if (self->_parameterNeedsValue)
  {
    -[IFTSchemaIFTStatementOutcome parameterNeedsValue](self, "parameterNeedsValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("parameterNeedsValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("parameterNeedsValue"));

    }
  }
  if (self->_parameterNotAllowed)
  {
    -[IFTSchemaIFTStatementOutcome parameterNotAllowed](self, "parameterNotAllowed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("parameterNotAllowed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("parameterNotAllowed"));

    }
  }
  if (self->_success)
  {
    -[IFTSchemaIFTStatementOutcome success](self, "success");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("success"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("success"));

    }
  }
  if (self->_toolDisambiguation)
  {
    -[IFTSchemaIFTStatementOutcome toolDisambiguation](self, "toolDisambiguation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("toolDisambiguation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("toolDisambiguation"));

    }
  }
  if (self->_valueDisambiguation)
  {
    -[IFTSchemaIFTStatementOutcome valueDisambiguation](self, "valueDisambiguation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("valueDisambiguation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("valueDisambiguation"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTStatementOutcome dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTStatementOutcome)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTStatementOutcome *v5;
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
    self = -[IFTSchemaIFTStatementOutcome initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTStatementOutcome)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTStatementOutcome *v5;
  uint64_t v6;
  IFTSchemaIFTActionSuccess *v7;
  uint64_t v8;
  IFTSchemaIFTActionConfirmation *v9;
  uint64_t v10;
  IFTSchemaIFTParameterNeedsValue *v11;
  uint64_t v12;
  IFTSchemaIFTParameterConfirmation *v13;
  uint64_t v14;
  IFTSchemaIFTParameterDisambiguation *v15;
  void *v16;
  IFTSchemaIFTParameterNotAllowed *v17;
  void *v18;
  IFTSchemaIFTParameterCandidatesNotFound *v19;
  void *v20;
  IFTSchemaIFTActionRequirement *v21;
  void *v22;
  void *v23;
  IFTSchemaIFTToolDisambiguation *v24;
  void *v25;
  IFTSchemaIFTActionFailure *v26;
  void *v27;
  IFTSchemaIFTValueDisambiguation *v28;
  IFTSchemaIFTStatementOutcome *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)IFTSchemaIFTStatementOutcome;
  v5 = -[IFTSchemaIFTStatementOutcome init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("success"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTActionSuccess initWithDictionary:]([IFTSchemaIFTActionSuccess alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTStatementOutcome setSuccess:](v5, "setSuccess:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionConfirmation"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTActionConfirmation initWithDictionary:]([IFTSchemaIFTActionConfirmation alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTStatementOutcome setActionConfirmation:](v5, "setActionConfirmation:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterNeedsValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTParameterNeedsValue initWithDictionary:]([IFTSchemaIFTParameterNeedsValue alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTStatementOutcome setParameterNeedsValue:](v5, "setParameterNeedsValue:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterConfirmation"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTParameterConfirmation initWithDictionary:]([IFTSchemaIFTParameterConfirmation alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTStatementOutcome setParameterConfirmation:](v5, "setParameterConfirmation:", v13);

    }
    v32 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterDisambiguation"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IFTSchemaIFTParameterDisambiguation initWithDictionary:]([IFTSchemaIFTParameterDisambiguation alloc], "initWithDictionary:", v14);
      -[IFTSchemaIFTStatementOutcome setParameterDisambiguation:](v5, "setParameterDisambiguation:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterNotAllowed"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[IFTSchemaIFTParameterNotAllowed initWithDictionary:]([IFTSchemaIFTParameterNotAllowed alloc], "initWithDictionary:", v16);
      -[IFTSchemaIFTStatementOutcome setParameterNotAllowed:](v5, "setParameterNotAllowed:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterCandidatesNotFounds"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[IFTSchemaIFTParameterCandidatesNotFound initWithDictionary:]([IFTSchemaIFTParameterCandidatesNotFound alloc], "initWithDictionary:", v18);
      -[IFTSchemaIFTStatementOutcome setParameterCandidatesNotFounds:](v5, "setParameterCandidatesNotFounds:", v19);

    }
    v33 = (void *)v10;
    v34 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionRequirement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[IFTSchemaIFTActionRequirement initWithDictionary:]([IFTSchemaIFTActionRequirement alloc], "initWithDictionary:", v20);
      -[IFTSchemaIFTStatementOutcome setActionRequirement:](v5, "setActionRequirement:", v21);

    }
    v22 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolDisambiguation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[IFTSchemaIFTToolDisambiguation initWithDictionary:]([IFTSchemaIFTToolDisambiguation alloc], "initWithDictionary:", v23);
      -[IFTSchemaIFTStatementOutcome setToolDisambiguation:](v5, "setToolDisambiguation:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failure"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[IFTSchemaIFTActionFailure initWithDictionary:]([IFTSchemaIFTActionFailure alloc], "initWithDictionary:", v25);
      -[IFTSchemaIFTStatementOutcome setFailure:](v5, "setFailure:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueDisambiguation"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[IFTSchemaIFTValueDisambiguation initWithDictionary:]([IFTSchemaIFTValueDisambiguation alloc], "initWithDictionary:", v27);
      -[IFTSchemaIFTStatementOutcome setValueDisambiguation:](v5, "setValueDisambiguation:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Statementoutcome
{
  return self->_whichOneof_Statementoutcome;
}

- (BOOL)hasSuccess
{
  return self->_hasSuccess;
}

- (void)setHasSuccess:(BOOL)a3
{
  self->_hasSuccess = a3;
}

- (BOOL)hasActionConfirmation
{
  return self->_hasActionConfirmation;
}

- (void)setHasActionConfirmation:(BOOL)a3
{
  self->_hasActionConfirmation = a3;
}

- (BOOL)hasParameterNeedsValue
{
  return self->_hasParameterNeedsValue;
}

- (void)setHasParameterNeedsValue:(BOOL)a3
{
  self->_hasParameterNeedsValue = a3;
}

- (BOOL)hasParameterConfirmation
{
  return self->_hasParameterConfirmation;
}

- (void)setHasParameterConfirmation:(BOOL)a3
{
  self->_hasParameterConfirmation = a3;
}

- (BOOL)hasParameterDisambiguation
{
  return self->_hasParameterDisambiguation;
}

- (void)setHasParameterDisambiguation:(BOOL)a3
{
  self->_hasParameterDisambiguation = a3;
}

- (BOOL)hasParameterNotAllowed
{
  return self->_hasParameterNotAllowed;
}

- (void)setHasParameterNotAllowed:(BOOL)a3
{
  self->_hasParameterNotAllowed = a3;
}

- (BOOL)hasParameterCandidatesNotFounds
{
  return self->_hasParameterCandidatesNotFounds;
}

- (void)setHasParameterCandidatesNotFounds:(BOOL)a3
{
  self->_hasParameterCandidatesNotFounds = a3;
}

- (BOOL)hasActionRequirement
{
  return self->_hasActionRequirement;
}

- (void)setHasActionRequirement:(BOOL)a3
{
  self->_hasActionRequirement = a3;
}

- (BOOL)hasToolDisambiguation
{
  return self->_hasToolDisambiguation;
}

- (void)setHasToolDisambiguation:(BOOL)a3
{
  self->_hasToolDisambiguation = a3;
}

- (BOOL)hasFailure
{
  return self->_hasFailure;
}

- (void)setHasFailure:(BOOL)a3
{
  self->_hasFailure = a3;
}

- (BOOL)hasValueDisambiguation
{
  return self->_hasValueDisambiguation;
}

- (void)setHasValueDisambiguation:(BOOL)a3
{
  self->_hasValueDisambiguation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDisambiguation, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_toolDisambiguation, 0);
  objc_storeStrong((id *)&self->_actionRequirement, 0);
  objc_storeStrong((id *)&self->_parameterCandidatesNotFounds, 0);
  objc_storeStrong((id *)&self->_parameterNotAllowed, 0);
  objc_storeStrong((id *)&self->_parameterDisambiguation, 0);
  objc_storeStrong((id *)&self->_parameterConfirmation, 0);
  objc_storeStrong((id *)&self->_parameterNeedsValue, 0);
  objc_storeStrong((id *)&self->_actionConfirmation, 0);
  objc_storeStrong((id *)&self->_success, 0);
}

@end
