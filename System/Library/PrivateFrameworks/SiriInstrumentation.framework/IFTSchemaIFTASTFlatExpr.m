@implementation IFTSchemaIFTASTFlatExpr

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
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)IFTSchemaIFTASTFlatExpr;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v61, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTASTFlatExpr value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTASTFlatExpr deleteValue](self, "deleteValue");
  -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTASTFlatExpr deletePrefix](self, "deletePrefix");
  -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTASTFlatExpr deleteInfix](self, "deleteInfix");
  -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTASTFlatExpr deleteDot](self, "deleteDot");
  -[IFTSchemaIFTASTFlatExpr index](self, "index");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IFTSchemaIFTASTFlatExpr deleteIndex](self, "deleteIndex");
  -[IFTSchemaIFTASTFlatExpr call](self, "call");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[IFTSchemaIFTASTFlatExpr deleteCall](self, "deleteCall");
  -[IFTSchemaIFTASTFlatExpr update](self, "update");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[IFTSchemaIFTASTFlatExpr deleteUpdate](self, "deleteUpdate");
  -[IFTSchemaIFTASTFlatExpr say](self, "say");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[IFTSchemaIFTASTFlatExpr deleteSay](self, "deleteSay");
  -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[IFTSchemaIFTASTFlatExpr deletePick](self, "deletePick");
  -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[IFTSchemaIFTASTFlatExpr deleteConfirm](self, "deleteConfirm");
  -[IFTSchemaIFTASTFlatExpr search](self, "search");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[IFTSchemaIFTASTFlatExpr deleteSearch](self, "deleteSearch");
  -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[IFTSchemaIFTASTFlatExpr deletePickOne](self, "deletePickOne");
  -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[IFTSchemaIFTASTFlatExpr deleteUndo](self, "deleteUndo");
  -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[IFTSchemaIFTASTFlatExpr deleteResolveTool](self, "deleteResolveTool");
  -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[IFTSchemaIFTASTFlatExpr deleteReject](self, "deleteReject");
  -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[IFTSchemaIFTASTFlatExpr deleteCancel](self, "deleteCancel");
  -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[IFTSchemaIFTASTFlatExpr deleteContinuePlanning](self, "deleteContinuePlanning");
  -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[IFTSchemaIFTASTFlatExpr deleteUpdateParameters](self, "deleteUpdateParameters");

  return v5;
}

- (void)setValue:(id)a3
{
  IFTSchemaASTFlatValue *v4;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  IFTSchemaASTFlatValue *value;

  v4 = (IFTSchemaASTFlatValue *)a3;
  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = v4 != 0;
  value = self->_value;
  self->_value = v4;

}

- (IFTSchemaASTFlatValue)value
{
  if (self->_whichOneof_Astflatexpr == 1)
    return self->_value;
  else
    return (IFTSchemaASTFlatValue *)0;
}

- (void)deleteValue
{
  IFTSchemaASTFlatValue *value;

  if (self->_whichOneof_Astflatexpr == 1)
  {
    self->_whichOneof_Astflatexpr = 0;
    value = self->_value;
    self->_value = 0;

  }
}

- (void)setPrefix:(id)a3
{
  IFTSchemaASTFlatExprPrefixVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  IFTSchemaASTFlatExprPrefixVariant *prefix;

  v4 = (IFTSchemaASTFlatExprPrefixVariant *)a3;
  value = self->_value;
  self->_value = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = 2 * (v4 != 0);
  prefix = self->_prefix;
  self->_prefix = v4;

}

- (IFTSchemaASTFlatExprPrefixVariant)prefix
{
  if (self->_whichOneof_Astflatexpr == 2)
    return self->_prefix;
  else
    return (IFTSchemaASTFlatExprPrefixVariant *)0;
}

- (void)deletePrefix
{
  IFTSchemaASTFlatExprPrefixVariant *prefix;

  if (self->_whichOneof_Astflatexpr == 2)
  {
    self->_whichOneof_Astflatexpr = 0;
    prefix = self->_prefix;
    self->_prefix = 0;

  }
}

- (void)setInfix:(id)a3
{
  IFTSchemaASTFlatExprInfixVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprInfixVariant *infix;

  v4 = (IFTSchemaASTFlatExprInfixVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 3;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  infix = self->_infix;
  self->_infix = v4;

}

- (IFTSchemaASTFlatExprInfixVariant)infix
{
  if (self->_whichOneof_Astflatexpr == 3)
    return self->_infix;
  else
    return (IFTSchemaASTFlatExprInfixVariant *)0;
}

- (void)deleteInfix
{
  IFTSchemaASTFlatExprInfixVariant *infix;

  if (self->_whichOneof_Astflatexpr == 3)
  {
    self->_whichOneof_Astflatexpr = 0;
    infix = self->_infix;
    self->_infix = 0;

  }
}

- (void)setDot:(id)a3
{
  IFTSchemaASTFlatExprDotVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  IFTSchemaASTFlatExprDotVariant *dot;

  v4 = (IFTSchemaASTFlatExprDotVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = 4 * (v4 != 0);
  dot = self->_dot;
  self->_dot = v4;

}

- (IFTSchemaASTFlatExprDotVariant)dot
{
  if (self->_whichOneof_Astflatexpr == 4)
    return self->_dot;
  else
    return (IFTSchemaASTFlatExprDotVariant *)0;
}

- (void)deleteDot
{
  IFTSchemaASTFlatExprDotVariant *dot;

  if (self->_whichOneof_Astflatexpr == 4)
  {
    self->_whichOneof_Astflatexpr = 0;
    dot = self->_dot;
    self->_dot = 0;

  }
}

- (void)setIndex:(id)a3
{
  IFTSchemaASTFlatExprIndexVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprIndexVariant *index;

  v4 = (IFTSchemaASTFlatExprIndexVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 5;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  index = self->_index;
  self->_index = v4;

}

- (IFTSchemaASTFlatExprIndexVariant)index
{
  if (self->_whichOneof_Astflatexpr == 5)
    return self->_index;
  else
    return (IFTSchemaASTFlatExprIndexVariant *)0;
}

- (void)deleteIndex
{
  IFTSchemaASTFlatExprIndexVariant *index;

  if (self->_whichOneof_Astflatexpr == 5)
  {
    self->_whichOneof_Astflatexpr = 0;
    index = self->_index;
    self->_index = 0;

  }
}

- (void)setCall:(id)a3
{
  IFTSchemaASTFlatExprCallVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprCallVariant *call;

  v4 = (IFTSchemaASTFlatExprCallVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 6;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  call = self->_call;
  self->_call = v4;

}

- (IFTSchemaASTFlatExprCallVariant)call
{
  if (self->_whichOneof_Astflatexpr == 6)
    return self->_call;
  else
    return (IFTSchemaASTFlatExprCallVariant *)0;
}

- (void)deleteCall
{
  IFTSchemaASTFlatExprCallVariant *call;

  if (self->_whichOneof_Astflatexpr == 6)
  {
    self->_whichOneof_Astflatexpr = 0;
    call = self->_call;
    self->_call = 0;

  }
}

- (void)setUpdate:(id)a3
{
  IFTSchemaASTFlatExprUpdateVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprUpdateVariant *update;

  v4 = (IFTSchemaASTFlatExprUpdateVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 7;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  update = self->_update;
  self->_update = v4;

}

- (IFTSchemaASTFlatExprUpdateVariant)update
{
  if (self->_whichOneof_Astflatexpr == 7)
    return self->_update;
  else
    return (IFTSchemaASTFlatExprUpdateVariant *)0;
}

- (void)deleteUpdate
{
  IFTSchemaASTFlatExprUpdateVariant *update;

  if (self->_whichOneof_Astflatexpr == 7)
  {
    self->_whichOneof_Astflatexpr = 0;
    update = self->_update;
    self->_update = 0;

  }
}

- (void)setEndOfPlan:(BOOL)a3
{
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;

  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = 8;
  self->_endOfPlan = a3;
}

- (BOOL)endOfPlan
{
  return self->_whichOneof_Astflatexpr == 8 && self->_endOfPlan;
}

- (void)deleteEndOfPlan
{
  if (self->_whichOneof_Astflatexpr == 8)
  {
    self->_whichOneof_Astflatexpr = 0;
    self->_endOfPlan = 0;
  }
}

- (void)setSay:(id)a3
{
  IFTSchemaASTFlatExprSayVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprSayVariant *say;

  v4 = (IFTSchemaASTFlatExprSayVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 9;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  say = self->_say;
  self->_say = v4;

}

- (IFTSchemaASTFlatExprSayVariant)say
{
  if (self->_whichOneof_Astflatexpr == 9)
    return self->_say;
  else
    return (IFTSchemaASTFlatExprSayVariant *)0;
}

- (void)deleteSay
{
  IFTSchemaASTFlatExprSayVariant *say;

  if (self->_whichOneof_Astflatexpr == 9)
  {
    self->_whichOneof_Astflatexpr = 0;
    say = self->_say;
    self->_say = 0;

  }
}

- (void)setPick:(id)a3
{
  IFTSchemaASTFlatExprPickVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprPickVariant *pick;

  v4 = (IFTSchemaASTFlatExprPickVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 10;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  pick = self->_pick;
  self->_pick = v4;

}

- (IFTSchemaASTFlatExprPickVariant)pick
{
  if (self->_whichOneof_Astflatexpr == 10)
    return self->_pick;
  else
    return (IFTSchemaASTFlatExprPickVariant *)0;
}

- (void)deletePick
{
  IFTSchemaASTFlatExprPickVariant *pick;

  if (self->_whichOneof_Astflatexpr == 10)
  {
    self->_whichOneof_Astflatexpr = 0;
    pick = self->_pick;
    self->_pick = 0;

  }
}

- (void)setConfirm:(id)a3
{
  IFTSchemaASTFlatExprConfirmVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprConfirmVariant *confirm;

  v4 = (IFTSchemaASTFlatExprConfirmVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 11;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  confirm = self->_confirm;
  self->_confirm = v4;

}

- (IFTSchemaASTFlatExprConfirmVariant)confirm
{
  if (self->_whichOneof_Astflatexpr == 11)
    return self->_confirm;
  else
    return (IFTSchemaASTFlatExprConfirmVariant *)0;
}

- (void)deleteConfirm
{
  IFTSchemaASTFlatExprConfirmVariant *confirm;

  if (self->_whichOneof_Astflatexpr == 11)
  {
    self->_whichOneof_Astflatexpr = 0;
    confirm = self->_confirm;
    self->_confirm = 0;

  }
}

- (void)setSearch:(id)a3
{
  IFTSchemaASTFlatExprSearchVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprSearchVariant *search;

  v4 = (IFTSchemaASTFlatExprSearchVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 12;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  search = self->_search;
  self->_search = v4;

}

- (IFTSchemaASTFlatExprSearchVariant)search
{
  if (self->_whichOneof_Astflatexpr == 12)
    return self->_search;
  else
    return (IFTSchemaASTFlatExprSearchVariant *)0;
}

- (void)deleteSearch
{
  IFTSchemaASTFlatExprSearchVariant *search;

  if (self->_whichOneof_Astflatexpr == 12)
  {
    self->_whichOneof_Astflatexpr = 0;
    search = self->_search;
    self->_search = 0;

  }
}

- (void)setPickOne:(id)a3
{
  IFTSchemaASTFlatExprPickOneVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;

  v4 = (IFTSchemaASTFlatExprPickOneVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 13;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  pickOne = self->_pickOne;
  self->_pickOne = v4;

}

- (IFTSchemaASTFlatExprPickOneVariant)pickOne
{
  if (self->_whichOneof_Astflatexpr == 13)
    return self->_pickOne;
  else
    return (IFTSchemaASTFlatExprPickOneVariant *)0;
}

- (void)deletePickOne
{
  IFTSchemaASTFlatExprPickOneVariant *pickOne;

  if (self->_whichOneof_Astflatexpr == 13)
  {
    self->_whichOneof_Astflatexpr = 0;
    pickOne = self->_pickOne;
    self->_pickOne = 0;

  }
}

- (void)setNoMatchingTool:(BOOL)a3
{
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;

  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = 14;
  self->_noMatchingTool = a3;
}

- (BOOL)noMatchingTool
{
  return self->_whichOneof_Astflatexpr == 14 && self->_noMatchingTool;
}

- (void)deleteNoMatchingTool
{
  if (self->_whichOneof_Astflatexpr == 14)
  {
    self->_whichOneof_Astflatexpr = 0;
    self->_noMatchingTool = 0;
  }
}

- (void)setUndo:(id)a3
{
  IFTSchemaASTFlatExprUndoVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprUndoVariant *undo;

  v4 = (IFTSchemaASTFlatExprUndoVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 15;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  undo = self->_undo;
  self->_undo = v4;

}

- (IFTSchemaASTFlatExprUndoVariant)undo
{
  if (self->_whichOneof_Astflatexpr == 15)
    return self->_undo;
  else
    return (IFTSchemaASTFlatExprUndoVariant *)0;
}

- (void)deleteUndo
{
  IFTSchemaASTFlatExprUndoVariant *undo;

  if (self->_whichOneof_Astflatexpr == 15)
  {
    self->_whichOneof_Astflatexpr = 0;
    undo = self->_undo;
    self->_undo = 0;

  }
}

- (void)setResolveTool:(id)a3
{
  IFTSchemaASTFlatExprResolveToolVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;

  v4 = (IFTSchemaASTFlatExprResolveToolVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_whichOneof_Astflatexpr = 16 * (v4 != 0);
  resolveTool = self->_resolveTool;
  self->_resolveTool = v4;

}

- (IFTSchemaASTFlatExprResolveToolVariant)resolveTool
{
  if (self->_whichOneof_Astflatexpr == 16)
    return self->_resolveTool;
  else
    return (IFTSchemaASTFlatExprResolveToolVariant *)0;
}

- (void)deleteResolveTool
{
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;

  if (self->_whichOneof_Astflatexpr == 16)
  {
    self->_whichOneof_Astflatexpr = 0;
    resolveTool = self->_resolveTool;
    self->_resolveTool = 0;

  }
}

- (void)setReject:(id)a3
{
  IFTSchemaASTFlatExprRejectVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprRejectVariant *reject;

  v4 = (IFTSchemaASTFlatExprRejectVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 17;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  reject = self->_reject;
  self->_reject = v4;

}

- (IFTSchemaASTFlatExprRejectVariant)reject
{
  if (self->_whichOneof_Astflatexpr == 17)
    return self->_reject;
  else
    return (IFTSchemaASTFlatExprRejectVariant *)0;
}

- (void)deleteReject
{
  IFTSchemaASTFlatExprRejectVariant *reject;

  if (self->_whichOneof_Astflatexpr == 17)
  {
    self->_whichOneof_Astflatexpr = 0;
    reject = self->_reject;
    self->_reject = 0;

  }
}

- (void)setCancel:(id)a3
{
  IFTSchemaASTFlatExprCancelVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTFlatExprCancelVariant *cancel;

  v4 = (IFTSchemaASTFlatExprCancelVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 18;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  cancel = self->_cancel;
  self->_cancel = v4;

}

- (IFTSchemaASTFlatExprCancelVariant)cancel
{
  if (self->_whichOneof_Astflatexpr == 18)
    return self->_cancel;
  else
    return (IFTSchemaASTFlatExprCancelVariant *)0;
}

- (void)deleteCancel
{
  IFTSchemaASTFlatExprCancelVariant *cancel;

  if (self->_whichOneof_Astflatexpr == 18)
  {
    self->_whichOneof_Astflatexpr = 0;
    cancel = self->_cancel;
    self->_cancel = 0;

  }
}

- (void)setContinuePlanning:(id)a3
{
  IFTSchemaASTExprContinuePlanningVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;
  unint64_t v22;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;

  v4 = (IFTSchemaASTExprContinuePlanningVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  v22 = 19;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = v4;

}

- (IFTSchemaASTExprContinuePlanningVariant)continuePlanning
{
  if (self->_whichOneof_Astflatexpr == 19)
    return self->_continuePlanning;
  else
    return (IFTSchemaASTExprContinuePlanningVariant *)0;
}

- (void)deleteContinuePlanning
{
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;

  if (self->_whichOneof_Astflatexpr == 19)
  {
    self->_whichOneof_Astflatexpr = 0;
    continuePlanning = self->_continuePlanning;
    self->_continuePlanning = 0;

  }
}

- (void)setUpdateParameters:(id)a3
{
  IFTSchemaASTFlatExprUpdateParametersVariant *v4;
  IFTSchemaASTFlatValue *value;
  IFTSchemaASTFlatExprPrefixVariant *prefix;
  IFTSchemaASTFlatExprInfixVariant *infix;
  IFTSchemaASTFlatExprDotVariant *dot;
  IFTSchemaASTFlatExprIndexVariant *index;
  IFTSchemaASTFlatExprCallVariant *call;
  IFTSchemaASTFlatExprUpdateVariant *update;
  IFTSchemaASTFlatExprSayVariant *say;
  IFTSchemaASTFlatExprPickVariant *pick;
  IFTSchemaASTFlatExprConfirmVariant *confirm;
  IFTSchemaASTFlatExprSearchVariant *search;
  IFTSchemaASTFlatExprPickOneVariant *pickOne;
  IFTSchemaASTFlatExprUndoVariant *undo;
  IFTSchemaASTFlatExprResolveToolVariant *resolveTool;
  IFTSchemaASTFlatExprRejectVariant *reject;
  IFTSchemaASTFlatExprCancelVariant *cancel;
  IFTSchemaASTExprContinuePlanningVariant *continuePlanning;
  unint64_t v22;
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;

  v4 = (IFTSchemaASTFlatExprUpdateParametersVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  v22 = 20;
  if (!v4)
    v22 = 0;
  self->_whichOneof_Astflatexpr = v22;
  updateParameters = self->_updateParameters;
  self->_updateParameters = v4;

}

- (IFTSchemaASTFlatExprUpdateParametersVariant)updateParameters
{
  if (self->_whichOneof_Astflatexpr == 20)
    return self->_updateParameters;
  else
    return (IFTSchemaASTFlatExprUpdateParametersVariant *)0;
}

- (void)deleteUpdateParameters
{
  IFTSchemaASTFlatExprUpdateParametersVariant *updateParameters;

  if (self->_whichOneof_Astflatexpr == 20)
  {
    self->_whichOneof_Astflatexpr = 0;
    updateParameters = self->_updateParameters;
    self->_updateParameters = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTASTFlatExprReadFrom(self, (uint64_t)a3);
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  -[IFTSchemaIFTASTFlatExpr value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTASTFlatExpr value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr index](self, "index");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IFTSchemaIFTASTFlatExpr index](self, "index");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr call](self, "call");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IFTSchemaIFTASTFlatExpr call](self, "call");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr update](self, "update");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IFTSchemaIFTASTFlatExpr update](self, "update");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_whichOneof_Astflatexpr == 8)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTASTFlatExpr say](self, "say");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IFTSchemaIFTASTFlatExpr say](self, "say");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr search](self, "search");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[IFTSchemaIFTASTFlatExpr search](self, "search");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (self->_whichOneof_Astflatexpr == 14)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v41;
  if (v38)
  {
    -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v39 = v41;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Astflatexpr;
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
  int endOfPlan;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int noMatchingTool;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  BOOL v100;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_95;
  whichOneof_Astflatexpr = self->_whichOneof_Astflatexpr;
  if (whichOneof_Astflatexpr != objc_msgSend(v4, "whichOneof_Astflatexpr"))
    goto LABEL_95;
  -[IFTSchemaIFTASTFlatExpr value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr value](self, "value");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTASTFlatExpr value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infix");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr index](self, "index");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IFTSchemaIFTASTFlatExpr index](self, "index");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "index");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr call](self, "call");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "call");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr call](self, "call");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[IFTSchemaIFTASTFlatExpr call](self, "call");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "call");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr update](self, "update");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "update");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr update](self, "update");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[IFTSchemaIFTASTFlatExpr update](self, "update");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "update");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_95;
  }
  else
  {

  }
  endOfPlan = self->_endOfPlan;
  if (endOfPlan != objc_msgSend(v4, "endOfPlan"))
    goto LABEL_95;
  -[IFTSchemaIFTASTFlatExpr say](self, "say");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "say");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr say](self, "say");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[IFTSchemaIFTASTFlatExpr say](self, "say");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "say");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pick");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pick");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confirm");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr search](self, "search");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "search");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr search](self, "search");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[IFTSchemaIFTASTFlatExpr search](self, "search");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "search");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickOne");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickOne");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_95;
  }
  else
  {

  }
  noMatchingTool = self->_noMatchingTool;
  if (noMatchingTool != objc_msgSend(v4, "noMatchingTool"))
    goto LABEL_95;
  -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "isEqual:", v73);

    if (!v74)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolveTool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolveTool");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if (!v79)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqual:", v88);

    if (!v89)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continuePlanning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_94;
  -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continuePlanning");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqual:", v93);

    if (!v94)
      goto LABEL_95;
  }
  else
  {

  }
  -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_94:

    goto LABEL_95;
  }
  -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
  v95 = objc_claimAutoreleasedReturnValue();
  if (!v95)
  {

LABEL_98:
    v100 = 1;
    goto LABEL_96;
  }
  v96 = (void *)v95;
  -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateParameters");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v97, "isEqual:", v98);

  if ((v99 & 1) != 0)
    goto LABEL_98;
LABEL_95:
  v100 = 0;
LABEL_96:

  return v100;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v22 = -[IFTSchemaASTFlatValue hash](self->_value, "hash");
  v21 = -[IFTSchemaASTFlatExprPrefixVariant hash](self->_prefix, "hash");
  v20 = -[IFTSchemaASTFlatExprInfixVariant hash](self->_infix, "hash");
  v19 = -[IFTSchemaASTFlatExprDotVariant hash](self->_dot, "hash");
  v18 = -[IFTSchemaASTFlatExprIndexVariant hash](self->_index, "hash");
  v3 = -[IFTSchemaASTFlatExprCallVariant hash](self->_call, "hash");
  v4 = -[IFTSchemaASTFlatExprUpdateVariant hash](self->_update, "hash");
  if (self->_whichOneof_Astflatexpr == 8)
    v5 = 2654435761 * self->_endOfPlan;
  else
    v5 = 0;
  v6 = -[IFTSchemaASTFlatExprSayVariant hash](self->_say, "hash");
  v7 = -[IFTSchemaASTFlatExprPickVariant hash](self->_pick, "hash");
  v8 = -[IFTSchemaASTFlatExprConfirmVariant hash](self->_confirm, "hash");
  v9 = -[IFTSchemaASTFlatExprSearchVariant hash](self->_search, "hash");
  v10 = -[IFTSchemaASTFlatExprPickOneVariant hash](self->_pickOne, "hash");
  if (self->_whichOneof_Astflatexpr == 14)
    v11 = 2654435761 * self->_noMatchingTool;
  else
    v11 = 0;
  v12 = v9 ^ v10 ^ v11 ^ -[IFTSchemaASTFlatExprUndoVariant hash](self->_undo, "hash");
  v13 = v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ -[IFTSchemaASTFlatExprResolveToolVariant hash](self->_resolveTool, "hash");
  v14 = -[IFTSchemaASTFlatExprRejectVariant hash](self->_reject, "hash");
  v15 = v14 ^ -[IFTSchemaASTFlatExprCancelVariant hash](self->_cancel, "hash");
  v16 = v15 ^ -[IFTSchemaASTExprContinuePlanningVariant hash](self->_continuePlanning, "hash");
  return v13 ^ v16 ^ -[IFTSchemaASTFlatExprUpdateParametersVariant hash](self->_updateParameters, "hash");
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_call)
  {
    -[IFTSchemaIFTASTFlatExpr call](self, "call");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("call"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("call"));

    }
  }
  if (self->_cancel)
  {
    -[IFTSchemaIFTASTFlatExpr cancel](self, "cancel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cancel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cancel"));

    }
  }
  if (self->_confirm)
  {
    -[IFTSchemaIFTASTFlatExpr confirm](self, "confirm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("confirm"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("confirm"));

    }
  }
  if (self->_continuePlanning)
  {
    -[IFTSchemaIFTASTFlatExpr continuePlanning](self, "continuePlanning");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("continuePlanning"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("continuePlanning"));

    }
  }
  if (self->_dot)
  {
    -[IFTSchemaIFTASTFlatExpr dot](self, "dot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("dot"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("dot"));

    }
  }
  if (self->_whichOneof_Astflatexpr == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTASTFlatExpr endOfPlan](self, "endOfPlan"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("endOfPlan"));

  }
  if (self->_index)
  {
    -[IFTSchemaIFTASTFlatExpr index](self, "index");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("index"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("index"));

    }
  }
  if (self->_infix)
  {
    -[IFTSchemaIFTASTFlatExpr infix](self, "infix");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("infix"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("infix"));

    }
  }
  if (self->_whichOneof_Astflatexpr == 14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTASTFlatExpr noMatchingTool](self, "noMatchingTool"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("noMatchingTool"));

  }
  if (self->_pick)
  {
    -[IFTSchemaIFTASTFlatExpr pick](self, "pick");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("pick"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("pick"));

    }
  }
  if (self->_pickOne)
  {
    -[IFTSchemaIFTASTFlatExpr pickOne](self, "pickOne");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("pickOne"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("pickOne"));

    }
  }
  if (self->_prefix)
  {
    -[IFTSchemaIFTASTFlatExpr prefix](self, "prefix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("prefix"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("prefix"));

    }
  }
  if (self->_reject)
  {
    -[IFTSchemaIFTASTFlatExpr reject](self, "reject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("reject"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("reject"));

    }
  }
  if (self->_resolveTool)
  {
    -[IFTSchemaIFTASTFlatExpr resolveTool](self, "resolveTool");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("resolveTool"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("resolveTool"));

    }
  }
  if (self->_say)
  {
    -[IFTSchemaIFTASTFlatExpr say](self, "say");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("say"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("say"));

    }
  }
  if (self->_search)
  {
    -[IFTSchemaIFTASTFlatExpr search](self, "search");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("search"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("search"));

    }
  }
  if (self->_undo)
  {
    -[IFTSchemaIFTASTFlatExpr undo](self, "undo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("undo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("undo"));

    }
  }
  if (self->_update)
  {
    -[IFTSchemaIFTASTFlatExpr update](self, "update");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("update"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("update"));

    }
  }
  if (self->_updateParameters)
  {
    -[IFTSchemaIFTASTFlatExpr updateParameters](self, "updateParameters");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("updateParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("updateParameters"));

    }
  }
  if (self->_value)
  {
    -[IFTSchemaIFTASTFlatExpr value](self, "value");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("value"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTASTFlatExpr dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTASTFlatExpr)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTASTFlatExpr *v5;
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
    self = -[IFTSchemaIFTASTFlatExpr initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTASTFlatExpr)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTASTFlatExpr *v5;
  uint64_t v6;
  IFTSchemaASTFlatValue *v7;
  uint64_t v8;
  IFTSchemaASTFlatExprPrefixVariant *v9;
  uint64_t v10;
  IFTSchemaASTFlatExprInfixVariant *v11;
  uint64_t v12;
  IFTSchemaASTFlatExprDotVariant *v13;
  uint64_t v14;
  IFTSchemaASTFlatExprIndexVariant *v15;
  uint64_t v16;
  IFTSchemaASTFlatExprCallVariant *v17;
  uint64_t v18;
  IFTSchemaASTFlatExprUpdateVariant *v19;
  void *v20;
  uint64_t v21;
  IFTSchemaASTFlatExprSayVariant *v22;
  uint64_t v23;
  IFTSchemaASTFlatExprPickVariant *v24;
  uint64_t v25;
  IFTSchemaASTFlatExprConfirmVariant *v26;
  uint64_t v27;
  IFTSchemaASTFlatExprSearchVariant *v28;
  uint64_t v29;
  IFTSchemaASTFlatExprPickOneVariant *v30;
  void *v31;
  void *v32;
  IFTSchemaASTFlatExprUndoVariant *v33;
  void *v34;
  IFTSchemaASTFlatExprResolveToolVariant *v35;
  void *v36;
  IFTSchemaASTFlatExprRejectVariant *v37;
  void *v38;
  IFTSchemaASTFlatExprCancelVariant *v39;
  void *v40;
  IFTSchemaASTExprContinuePlanningVariant *v41;
  void *v42;
  IFTSchemaASTFlatExprUpdateParametersVariant *v43;
  IFTSchemaIFTASTFlatExpr *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)IFTSchemaIFTASTFlatExpr;
  v5 = -[IFTSchemaIFTASTFlatExpr init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaASTFlatValue initWithDictionary:]([IFTSchemaASTFlatValue alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTASTFlatExpr setValue:](v5, "setValue:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefix"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaASTFlatExprPrefixVariant initWithDictionary:]([IFTSchemaASTFlatExprPrefixVariant alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTASTFlatExpr setPrefix:](v5, "setPrefix:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("infix"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaASTFlatExprInfixVariant initWithDictionary:]([IFTSchemaASTFlatExprInfixVariant alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTASTFlatExpr setInfix:](v5, "setInfix:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dot"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaASTFlatExprDotVariant initWithDictionary:]([IFTSchemaASTFlatExprDotVariant alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTASTFlatExpr setDot:](v5, "setDot:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IFTSchemaASTFlatExprIndexVariant initWithDictionary:]([IFTSchemaASTFlatExprIndexVariant alloc], "initWithDictionary:", v14);
      -[IFTSchemaIFTASTFlatExpr setIndex:](v5, "setIndex:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("call"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[IFTSchemaASTFlatExprCallVariant initWithDictionary:]([IFTSchemaASTFlatExprCallVariant alloc], "initWithDictionary:", v16);
      -[IFTSchemaIFTASTFlatExpr setCall:](v5, "setCall:", v17);

    }
    v54 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("update"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[IFTSchemaASTFlatExprUpdateVariant initWithDictionary:]([IFTSchemaASTFlatExprUpdateVariant alloc], "initWithDictionary:", v18);
      -[IFTSchemaIFTASTFlatExpr setUpdate:](v5, "setUpdate:", v19);

    }
    v48 = (void *)v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endOfPlan"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTASTFlatExpr setEndOfPlan:](v5, "setEndOfPlan:", objc_msgSend(v20, "BOOLValue"));
    v47 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("say"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = (void *)v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[IFTSchemaASTFlatExprSayVariant initWithDictionary:]([IFTSchemaASTFlatExprSayVariant alloc], "initWithDictionary:", v21);
      -[IFTSchemaIFTASTFlatExpr setSay:](v5, "setSay:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pick"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = (void *)v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[IFTSchemaASTFlatExprPickVariant initWithDictionary:]([IFTSchemaASTFlatExprPickVariant alloc], "initWithDictionary:", v23);
      -[IFTSchemaIFTASTFlatExpr setPick:](v5, "setPick:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirm"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = (void *)v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[IFTSchemaASTFlatExprConfirmVariant initWithDictionary:]([IFTSchemaASTFlatExprConfirmVariant alloc], "initWithDictionary:", v25);
      -[IFTSchemaIFTASTFlatExpr setConfirm:](v5, "setConfirm:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("search"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = (void *)v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[IFTSchemaASTFlatExprSearchVariant initWithDictionary:]([IFTSchemaASTFlatExprSearchVariant alloc], "initWithDictionary:", v27);
      -[IFTSchemaIFTASTFlatExpr setSearch:](v5, "setSearch:", v28);

    }
    v51 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pickOne"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[IFTSchemaASTFlatExprPickOneVariant initWithDictionary:]([IFTSchemaASTFlatExprPickOneVariant alloc], "initWithDictionary:", v29);
      -[IFTSchemaIFTASTFlatExpr setPickOne:](v5, "setPickOne:", v30);

    }
    v46 = (void *)v29;
    v50 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noMatchingTool"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTASTFlatExpr setNoMatchingTool:](v5, "setNoMatchingTool:", objc_msgSend(v31, "BOOLValue"));
    v49 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("undo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[IFTSchemaASTFlatExprUndoVariant initWithDictionary:]([IFTSchemaASTFlatExprUndoVariant alloc], "initWithDictionary:", v32);
      -[IFTSchemaIFTASTFlatExpr setUndo:](v5, "setUndo:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolveTool"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[IFTSchemaASTFlatExprResolveToolVariant initWithDictionary:]([IFTSchemaASTFlatExprResolveToolVariant alloc], "initWithDictionary:", v34);
      -[IFTSchemaIFTASTFlatExpr setResolveTool:](v5, "setResolveTool:", v35);

    }
    v53 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reject"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[IFTSchemaASTFlatExprRejectVariant initWithDictionary:]([IFTSchemaASTFlatExprRejectVariant alloc], "initWithDictionary:", v36);
      -[IFTSchemaIFTASTFlatExpr setReject:](v5, "setReject:", v37);

    }
    v52 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[IFTSchemaASTFlatExprCancelVariant initWithDictionary:]([IFTSchemaASTFlatExprCancelVariant alloc], "initWithDictionary:", v38);
      -[IFTSchemaIFTASTFlatExpr setCancel:](v5, "setCancel:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("continuePlanning"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[IFTSchemaASTExprContinuePlanningVariant initWithDictionary:]([IFTSchemaASTExprContinuePlanningVariant alloc], "initWithDictionary:", v40);
      -[IFTSchemaIFTASTFlatExpr setContinuePlanning:](v5, "setContinuePlanning:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updateParameters"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[IFTSchemaASTFlatExprUpdateParametersVariant initWithDictionary:]([IFTSchemaASTFlatExprUpdateParametersVariant alloc], "initWithDictionary:", v42);
      -[IFTSchemaIFTASTFlatExpr setUpdateParameters:](v5, "setUpdateParameters:", v43);

    }
    v44 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Astflatexpr
{
  return self->_whichOneof_Astflatexpr;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (BOOL)hasPrefix
{
  return self->_hasPrefix;
}

- (void)setHasPrefix:(BOOL)a3
{
  self->_hasPrefix = a3;
}

- (BOOL)hasInfix
{
  return self->_hasInfix;
}

- (void)setHasInfix:(BOOL)a3
{
  self->_hasInfix = a3;
}

- (BOOL)hasDot
{
  return self->_hasDot;
}

- (void)setHasDot:(BOOL)a3
{
  self->_hasDot = a3;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (BOOL)hasCall
{
  return self->_hasCall;
}

- (void)setHasCall:(BOOL)a3
{
  self->_hasCall = a3;
}

- (BOOL)hasUpdate
{
  return self->_hasUpdate;
}

- (void)setHasUpdate:(BOOL)a3
{
  self->_hasUpdate = a3;
}

- (BOOL)hasEndOfPlan
{
  return self->_hasEndOfPlan;
}

- (void)setHasEndOfPlan:(BOOL)a3
{
  self->_hasEndOfPlan = a3;
}

- (BOOL)hasSay
{
  return self->_hasSay;
}

- (void)setHasSay:(BOOL)a3
{
  self->_hasSay = a3;
}

- (BOOL)hasPick
{
  return self->_hasPick;
}

- (void)setHasPick:(BOOL)a3
{
  self->_hasPick = a3;
}

- (BOOL)hasConfirm
{
  return self->_hasConfirm;
}

- (void)setHasConfirm:(BOOL)a3
{
  self->_hasConfirm = a3;
}

- (BOOL)hasSearch
{
  return self->_hasSearch;
}

- (void)setHasSearch:(BOOL)a3
{
  self->_hasSearch = a3;
}

- (BOOL)hasPickOne
{
  return self->_hasPickOne;
}

- (void)setHasPickOne:(BOOL)a3
{
  self->_hasPickOne = a3;
}

- (BOOL)hasNoMatchingTool
{
  return self->_hasNoMatchingTool;
}

- (void)setHasNoMatchingTool:(BOOL)a3
{
  self->_hasNoMatchingTool = a3;
}

- (BOOL)hasUndo
{
  return self->_hasUndo;
}

- (void)setHasUndo:(BOOL)a3
{
  self->_hasUndo = a3;
}

- (BOOL)hasResolveTool
{
  return self->_hasResolveTool;
}

- (void)setHasResolveTool:(BOOL)a3
{
  self->_hasResolveTool = a3;
}

- (BOOL)hasReject
{
  return self->_hasReject;
}

- (void)setHasReject:(BOOL)a3
{
  self->_hasReject = a3;
}

- (BOOL)hasCancel
{
  return self->_hasCancel;
}

- (void)setHasCancel:(BOOL)a3
{
  self->_hasCancel = a3;
}

- (BOOL)hasContinuePlanning
{
  return self->_hasContinuePlanning;
}

- (void)setHasContinuePlanning:(BOOL)a3
{
  self->_hasContinuePlanning = a3;
}

- (BOOL)hasUpdateParameters
{
  return self->_hasUpdateParameters;
}

- (void)setHasUpdateParameters:(BOOL)a3
{
  self->_hasUpdateParameters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_continuePlanning, 0);
  objc_storeStrong((id *)&self->_cancel, 0);
  objc_storeStrong((id *)&self->_reject, 0);
  objc_storeStrong((id *)&self->_resolveTool, 0);
  objc_storeStrong((id *)&self->_undo, 0);
  objc_storeStrong((id *)&self->_pickOne, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_confirm, 0);
  objc_storeStrong((id *)&self->_pick, 0);
  objc_storeStrong((id *)&self->_say, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_dot, 0);
  objc_storeStrong((id *)&self->_infix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
