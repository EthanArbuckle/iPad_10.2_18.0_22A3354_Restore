@implementation EXConditionalFormattingRule

+ (id)timePeriodEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_22, 0, &dword_22A0CC000);
  }
  if (+[EXConditionalFormattingRule timePeriodEnumMap]::once != -1)
    dispatch_once(&+[EXConditionalFormattingRule timePeriodEnumMap]::once, &__block_literal_global_73);
  return (id)+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap;
}

void __48__EXConditionalFormattingRule_timePeriodEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodStructs, 11, 1);
  v1 = (void *)+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap;
  +[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap = (uint64_t)v0;

}

+ (id)operatorStringEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_46_0, 0, &dword_22A0CC000);
  }
  if (+[EXConditionalFormattingRule operatorStringEnumMap]::once != -1)
    dispatch_once(&+[EXConditionalFormattingRule operatorStringEnumMap]::once, &__block_literal_global_47);
  return (id)+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap;
}

void __52__EXConditionalFormattingRule_operatorStringEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringStructs, 13, 1);
  v1 = (void *)+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap;
  +[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap = (uint64_t)v0;

}

+ (id)conditionalFormattingRuleTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_78, 0, &dword_22A0CC000);
  }
  if (+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::once != -1)
    dispatch_once(&+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::once, &__block_literal_global_79_0);
  return (id)+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap;
}

void __67__EXConditionalFormattingRule_conditionalFormattingRuleTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeStructs, 19, 1);
  v1 = (void *)+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap;
  +[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap = (uint64_t)v0;

}

+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 edConditionalFormatting:(id)a5 edReference:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  CXNamespace *v21;
  char *v22;
  _xmlNode *Child;
  char v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  _BOOL4 v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  id v48;
  id v49;

  v40 = a4;
  v11 = a5;
  v41 = a6;
  v12 = a7;
  v13 = v12;
  if (!a3)
    goto LABEL_47;
  objc_msgSend(v12, "resources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDConditionalFormattingRule conditionalFormattingRuleWithResources:](EDConditionalFormattingRule, "conditionalFormattingRuleWithResources:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addRule:", v15);
  v49 = 0;
  CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v49);
  v16 = v49;
  v17 = objc_msgSend(a1, "edRuleTypeFromXmlRuleTypeString:", v16);
  objc_msgSend(v15, "setType:", v17);
  if (!(_DWORD)v17)
    goto LABEL_46;
  v39 = v11;
  v48 = 0;
  v37 = v16;
  v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"operator", &v48);
  v19 = v48;
  if (v18)
  {
    v20 = objc_msgSend(a1, "edOperatorFromXmlOperatorString:", v19);
  }
  else if ((int)v17 > 10)
  {
    if ((_DWORD)v17 == 11)
    {
      v20 = 12;
    }
    else
    {
      if ((_DWORD)v17 != 15)
        goto LABEL_6;
      v20 = 13;
    }
  }
  else if ((_DWORD)v17 == 4)
  {
    v20 = 10;
  }
  else
  {
    if ((_DWORD)v17 != 8)
      goto LABEL_6;
    v20 = 11;
  }
  objc_msgSend(v15, "setOperatorEnum:", v20);
LABEL_6:
  v47 = 0;
  v38 = v19;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"priority", &v47))
    objc_msgSend(v15, "setPriority:", v47);
  v46 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"stopIfTrue", &v46))
    objc_msgSend(v15, "setStopIfTrue:", v46);
  v36 = a1;
  if (v40)
  {
    v21 = (CXNamespace *)(id)EXMainNamespace;
    v22 = "f";
  }
  else
  {
    objc_msgSend(v13, "EXSpreadsheetMLNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = "formula";
  }
  Child = (_xmlNode *)OCXFindChild(a3, v21, v22);
  v24 = 1;
  while (1)
  {
    v25 = v24;
    if (Child)
      break;
LABEL_23:
    v24 = 0;
    if ((v25 & 1) == 0)
      goto LABEL_24;
  }
  v26 = objc_opt_class();
  +[EXFormula edFormulaFromXmlFormulaElement:formulaClass:state:](EXFormula, "edFormulaFromXmlFormulaElement:formulaClass:state:", Child, objc_opt_class(), v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v26, (uint64_t)v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "setRowBaseOrOffset:", objc_msgSend(v41, "firstRow"));
    objc_msgSend(v28, "setColumnBaseOrOffset:", objc_msgSend(v41, "firstColumn"));
    objc_msgSend(v28, "setForceNonBaseFormula:", 1);
    objc_msgSend(v28, "convertTokensToShared");
    objc_msgSend(v13, "currentSheet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addFormula:worksheet:", v28, v29);

  }
  if ((v25 & 1) != 0)
  {
    Child = OCXFindNextChild(Child, v21, (xmlChar *)v22);
    goto LABEL_23;
  }
LABEL_24:
  if (v40)
  {
    v16 = v37;
    v30 = v38;
    +[EXDifferentialStyle edDifferentialStyleFromXmlDifferentialStyleElement:state:](EXDifferentialStyle, "edDifferentialStyleFromXmlDifferentialStyleElement:state:", OCXFindChild(a3, (CXNamespace *)EXXL2010Namespace, "dxf"), v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDifferentialStyle:", v31);

  }
  else
  {
    v45 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dxfId", (uint64_t *)&v45))
      objc_msgSend(v15, "setDifferentialStyleIndex:", v45);
    v16 = v37;
    v30 = v38;
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"aboveAverage", &v46))
    objc_msgSend(v15, "setAboveAverage:", v46);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v46))
    objc_msgSend(v15, "setBottom:", v46);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"equalAverage", &v46))
    objc_msgSend(v15, "setEqualAverage:", v46);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"percent", &v46))
    objc_msgSend(v15, "setPercent:", v46);
  v45 = 0;
  if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rank", &v45))
    objc_msgSend(v15, "setRank:", v45);
  v44 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"stdDev", &v44))
    objc_msgSend(v15, "setStdDev:", v44);
  v43 = 0;
  v32 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"text", &v43);
  v33 = v43;
  if (v32)
    objc_msgSend(v15, "setText:", v33);
  v42 = 0;
  v34 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"timePeriod", &v42);
  v35 = v42;
  if (v34)
    objc_msgSend(v15, "setTimePeriod:", objc_msgSend(v36, "edTimePeriodFromXmlTimePeriodString:", v35));

  v11 = v39;
LABEL_46:

LABEL_47:
}

+ (int)edRuleTypeFromXmlRuleTypeString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v9;
  int v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "conditionalFormattingRuleTypeEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == 9 || v6 == 5 || v6 == 12)
      v9 = 0;
    else
      v9 = v6;
    if (v6 == -130883970)
      v10 = 0;
    else
      v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int)edOperatorFromXmlOperatorString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "operatorStringEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == -130883970)
      v7 = 1;
    else
      v7 = v6;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (int)edTimePeriodFromXmlTimePeriodString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "timePeriodEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == -130883970)
      v7 = 1;
    else
      v7 = v6;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
