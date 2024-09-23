@implementation EBConditionalFormat

+ (void)readXlConditionalFormat:(void *)a3 toEDConditionalFormatting:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  XlCondFmt *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t CellRange;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  EDConditionalFormattingRule *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  id v29;

  v29 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "resources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (XlCondFmt *)*((_QWORD *)a3 + 4);
    if (v11)
    {
      v12 = (*((_QWORD *)v11 + 5) - *((_QWORD *)v11 + 4)) >> 3;
      if ((_DWORD)v12)
      {
        v13 = 0;
        do
        {
          CellRange = XlCondFmt::getCellRange(v11, v13);
          if (CellRange)
          {
            +[EBReference edReferenceFromXlRef:](EBReference, "edReferenceFromXlRef:", CellRange);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addRange:", v15);

          }
          ++v13;
        }
        while ((_DWORD)v12 != v13);
      }
    }
    v28 = (char *)a3 + 8;
    v16 = *((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1);
    if ((v16 & 0x7FFFFFFF8) != 0)
    {
      v17 = 0;
      v18 = (v16 >> 3);
      do
      {
        v19 = *((_QWORD *)a3 + 1);
        if (v17 >= ((unint64_t)(*((_QWORD *)a3 + 2) - v19) >> 3))
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        v20 = *(_QWORD *)(v19 + 8 * v17);
        v21 = -[EDConditionalFormattingRule initWithResources:]([EDConditionalFormattingRule alloc], "initWithResources:", v10);
        -[EDConditionalFormattingRule setStopIfTrue:](v21, "setStopIfTrue:", 1);
        v22 = objc_msgSend(a1, "convertXlConditionalFmtTypeEnumToED:", *(unsigned int *)(v20 + 16));
        -[EDConditionalFormattingRule setType:](v21, "setType:", v22);
        if ((_DWORD)v22 == 2)
          -[EDConditionalFormattingRule setOperatorEnum:](v21, "setOperatorEnum:", objc_msgSend(a1, "convertXlConditionalFmtOperatorEnumToED:", *(unsigned int *)(v20 + 20)));
        if (*(__int16 *)(v20 + 24) >= 1)
        {
          +[EBFormula edFormulaFromXlFmlaDefinition:withFormulaLength:state:](EBFormula, "edFormulaFromXlFmlaDefinition:withFormulaLength:state:", *(_QWORD *)(v20 + 40), *(unsigned __int16 *)(v20 + 24), v9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "edSheet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDConditionalFormattingRule addFormula:worksheet:](v21, "addFormula:worksheet:", v23, v24);

        }
        if (*(__int16 *)(v20 + 26) >= 1)
        {
          +[EBFormula edFormulaFromXlFmlaDefinition:withFormulaLength:state:](EBFormula, "edFormulaFromXlFmlaDefinition:withFormulaLength:state:", *(_QWORD *)(v20 + 48), *(unsigned __int16 *)(v20 + 26), v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "edSheet");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDConditionalFormattingRule addFormula:worksheet:](v21, "addFormula:worksheet:", v25, v26);

        }
        +[EBDifferentialStyle edDifferentialStyleFromXlDXf:edResources:](EBDifferentialStyle, "edDifferentialStyleFromXlDXf:edResources:", *(_QWORD *)(v20 + 32), v10, v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDConditionalFormattingRule setDifferentialStyle:](v21, "setDifferentialStyle:", v27);

        objc_msgSend(v29, "addRule:", v21);
        ++v17;
      }
      while (v18 != v17);
    }

  }
}

+ (int)convertXlConditionalFmtTypeEnumToED:(int)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2;
}

+ (int)convertXlConditionalFmtOperatorEnumToED:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return *(_DWORD *)&asc_22A4C1C1C[4 * a3 - 4];
}

+ (BOOL)validXlCf:(XlCf *)a3
{
  int var4;
  _BOOL4 v4;
  int var5;
  int v6;
  int var3;

  if (!a3)
    return 0;
  var4 = a3->var4;
  v4 = var4 > 0;
  var5 = a3->var5;
  if (var4 <= 0)
    v6 = 1;
  else
    v6 = 2;
  if (var5 > 0)
    v4 = v6;
  if (a3->var2 == 2)
    return v4;
  var3 = a3->var3;
  if ((var3 - 3) < 6)
    return v4;
  if ((var3 - 1) >= 2)
  {
    if (!var3)
      return !v4;
    return 0;
  }
  return var5 > 0 && var4 > 0;
}

+ (int)convertEDConditionalFmtTypeEnumToXl:(int)a3
{
  if (a3 == 1)
    return 2;
  else
    return 1;
}

+ (int)convertEDConditionalFmtOperatorEnumToXl:(int)a3
{
  if ((a3 - 2) > 7)
    return 0;
  else
    return dword_22A4C1C3C[a3 - 2];
}

@end
