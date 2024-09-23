@implementation EBNameTable

+ (void)readFromState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  XlNameTable *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  OcText v14;

  v4 = a3;
  objc_msgSend(v4, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (XlNameTable *)objc_msgSend(v4, "xlNameTable");
  v8 = *((_QWORD *)v7 + 2) - *((_QWORD *)v7 + 1);
  if ((v8 & 0x7FFFFFFF8) != 0)
  {
    v9 = 0;
    v10 = (v8 >> 3);
    do
    {
      v11 = *((_QWORD *)v7 + 1);
      if (v9 >= ((unint64_t)(*((_QWORD *)v7 + 2) - v11) >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v12 = *(_QWORD *)(v11 + 8 * v9);
      XlNameTable::getName(v7, v9, &v14);
      objc_msgSend(a1, "edNameFromXlName:name:state:", v12, &v14, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      OcText::~OcText(&v14);
      objc_msgSend(v6, "addObject:", v13);

      ++v9;
    }
    while (v10 != v9);
  }

}

+ (id)edNameFromXlName:(XlName *)a3 name:(OcText *)a4 state:(id)a5
{
  id v7;
  EDName *v8;
  void *v9;
  XlString *var2;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  if (a3)
  {
    v8 = objc_alloc_init(EDName);
    -[EDName setSheetIndex:](v8, "setSheetIndex:", a3->var10);
    if (a3->var19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDString edStringWithString:](EDString, "edStringWithString:", v9);
    }
    else
    {
      var2 = a3->var2;
      objc_msgSend(v7, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", var2, v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDName setNameString:](v8, "setNameString:", v11);
    +[EBFormula edFormulaFromXlFmlaDefinition:withTokenLength:formulaLength:formulaClass:edSheet:state:](EBFormula, "edFormulaFromXlFmlaDefinition:withTokenLength:formulaLength:formulaClass:edSheet:state:", a3->var7, a3->var9, a3->var8, objc_opt_class(), 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EDName isInternalFunction](v8, "isInternalFunction"))
      objc_msgSend(v12, "setWarning:", 0);
    objc_msgSend(v7, "workbook");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDName setFormula:workbook:](v8, "setFormula:workbook:", v12, v13);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)createXlNameTableFromNamesCollection:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void **v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = (void **)operator new();
  XlNameTable::XlNameTable((XlNameTable *)v8);
  v9 = objc_msgSend(v6, "count");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(a1, "xlNameFromEDName:state:", v11, v7);

      v14 = v12;
      CsSimpleHeapVector<XlRecord>::pushBack(v8 + 1, &v14);
      if (v14)
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
    }
  }

  return v8;
}

+ (XlName)xlNameFromEDName:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  XlFormulaInfo *v10;
  unsigned int var4;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  v7 = operator new();
  XlName::XlName((XlName *)v7);
  objc_msgSend(v5, "nameString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  XlChartPlot::takeChartFormat(v7, (uint64_t)+[EBString xlStringFromEDString:state:](EBString, "xlStringFromEDString:state:", v8, v6));

  *(_WORD *)(v7 + 68) = objc_msgSend(v5, "sheetIndex");
  objc_msgSend(v5, "formula");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[EBFormula xlFormulaInfoFromEDFormula:state:](EBFormula, "xlFormulaInfoFromEDFormula:state:", v9, v6);

  if (v10)
  {
    var4 = v10->var4;
    v12 = (void *)operator new[]();
    memcpy(v12, v10->var3, (__int16)var4);
    (*((void (**)(XlFormulaInfo *))v10->var0 + 1))(v10);
    XlName::setFormula((XlName *)v7, (char *)v12, var4);
    *(_WORD *)(v7 + 66) = var4;
  }
  v13 = objc_msgSend(v5, "isInternalFunction");
  *(_BYTE *)(v7 + 74) = v13;
  *(_BYTE *)(v7 + 75) = v13;
  *(_BYTE *)(v7 + 76) = 0;
  *(_BYTE *)(v7 + 77) = v13;
  *(_WORD *)(v7 + 78) = 0;
  *(_BYTE *)(v7 + 80) = 0;

  return (XlName *)v7;
}

@end
