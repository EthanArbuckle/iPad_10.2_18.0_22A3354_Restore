@implementation EBCell

+ (void)readXlCell:(XlCell *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int var2;
  _BYTE *v17;
  XlFormulaInfo *var8;
  uint64_t v19;
  _DWORD *v20;
  XlString *var6;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a5;
  v12 = a6;
  v13 = a7;
  if (a3)
  {
    v14 = objc_msgSend(a1, "convertXlCellTypeToED:", a3->var4);
    v15 = v14;
    var2 = a3->var2;
    if (var2 > 255 || (*a4)->var1 >= 0x10000)
    {
      if (!(_DWORD)v14)
        goto LABEL_19;
      v17 = (_BYTE *)+[EBCell readXlCell:edRowInfo:edRowBlock:edRowBlocks:state:]::hadOutOfBoundaryWarning();
      if (!*v17)
      {
        *v17 = 1;
        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", ECCellsOutsideLassoBoundary);
        LOWORD(var2) = a3->var2;
      }
      v15 = 4;
    }
    var8 = a3->var8;
    v19 = objc_msgSend(v28, "addCellWithColumnNumber:type:isFormulaCell:rowInfo:rowBlocks:", (__int16)var2, v15, var8 != 0, a4, v12);
    v20 = (_DWORD *)v19;
    if (v19)
    {
      setStyleIndexForEDCell(v19, a3->var3);
      switch((int)v15)
      {
        case 1:
          setBoolValueForEDCell((uint64_t)v20, a3->var9);
          break;
        case 2:
          setNumberValueForEDCell((uint64_t)v20, a3->var5);
          break;
        case 3:
          var6 = a3->var6;
          if (var6)
          {
            objc_msgSend(v13, "resources");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            v24 = *((_DWORD *)var6 + 22);
            if (v24 < 0)
            {
              objc_msgSend(v22, "strings");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)var6 + 8);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[EDString edStringWithString:](EDString, "edStringWithString:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v25, "addObject:", v27);

            }
            setStringIndexValueForEDCell(v20, v24);

          }
          break;
        case 5:
          setErrorValueForEDCell(v20, objc_msgSend(a1, "convertXlErrorEnumToED:", a3->var7));
          break;
        default:
          break;
      }
      if (var8)
        +[EBFormula readFormulaFromXlCell:edCell:edRowBlocks:state:](EBFormula, "readFormulaFromXlCell:edCell:edRowBlocks:state:", a3, v20, v12, v13);
    }
  }
LABEL_19:

}

+ (int)convertXlCellTypeToED:(int)a3
{
  unsigned int v3;
  unint64_t v4;

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 - 2;
  v3 = v4 >> 1;
  if (v3 > 7)
    return 0;
  else
    return dword_22A4C1BD0[v3];
}

+ (int)convertXlErrorEnumToED:(int)a3
{
  int result;

  result = a3;
  if (a3 <= 22)
  {
    switch(a3)
    {
      case 0:
        return result;
      case 7:
        return 1;
      case 15:
        return 2;
    }
  }
  else if (a3 > 35)
  {
    if (a3 == 36)
      return 5;
    if (a3 == 42)
      return 6;
  }
  else
  {
    if (a3 == 23)
      return 3;
    if (a3 == 29)
      return 4;
  }
  return 7;
}

+ (int)convertEDErrorValueEnumToXl:(int)a3
{
  if (a3 > 6)
    return 255;
  else
    return dword_22A4C1BF0[a3];
}

@end
