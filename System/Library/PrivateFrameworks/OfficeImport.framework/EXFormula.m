@implementation EXFormula

+ (void)applyArrayedFormulasToSheet:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "arrayedFormulas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "first");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "second");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "applyArrayedFormula:edReference:edWorksheet:state:", v12, v13, v14, v7);

        ++v10;
      }
      while (v9 != v10);
    }
    objc_msgSend(v8, "removeAllObjects");

  }
}

+ (void)readFrom:(_xmlNode *)a3 rowNumber:(int)a4 columnNumber:(int)a5 edCell:(EDCellHeader *)a6 edRowBlocks:(id)a7 state:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v16 = a7;
  v14 = a8;
  v15 = (id)objc_msgSend(a1, "readFrom:formulaClass:rowNumber:columnNumber:edCell:edRowBlocks:state:", a3, objc_msgSend(a1, "formulaClassFromXmlFormulaElement:state:", a3, v14), v11, v10, a6, v16, v14);

}

+ (Class)formulaClassFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4
{
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v12;
  id v13;

  v13 = 0;
  v5 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v13);
  v6 = v13;
  v7 = v6;
  if (!v5)
  {
    v12 = v6;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"t", &v12);
    v8 = v12;

    v7 = v8;
  }
  v9 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("shared")))
    v9 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("array")))
  {
    v9 = (void *)objc_opt_class();
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dataTable")) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", CFSTR("table")))
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

+ (id)readFrom:(_xmlNode *)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 edCell:(EDCellHeader *)a7 edRowBlocks:(id)a8 state:(id)a9
{
  uint64_t v10;
  uint64_t v11;
  id v15;
  EDFormula *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  EDFormula *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  void *v29;
  EDRowBlocks *v30;
  uint64_t v31;
  id v32;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v30 = (EDRowBlocks *)a8;
  v15 = a9;
  v16 = 0;
  if (a3 && a4)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", a3);
    if (v29 && objc_msgSend(v29, "length"))
    {
      objc_msgSend(CFSTR("="), "stringByAppendingString:", v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      objc_msgSend(v15, "currentSheet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "workbook");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "edTokensForFormulaString:formulaClass:rowNumber:columnNumber:sheet:workbook:", v17, a4, v11, v10, v18, v19);
      v16 = (EDFormula *)objc_claimAutoreleasedReturnValue();

      v15 = v27;
      if (!a7)
        goto LABEL_19;
    }
    else
    {
      -[objc_class formula](a4, "formula");
      v16 = (EDFormula *)objc_claimAutoreleasedReturnValue();
      if (!a7)
        goto LABEL_19;
    }
    if (((v10 | v11) & 0x80000000) == 0)
    {
      setFormulaForEDCell(a7, v16, v30);
      v28 = v15;
      v32 = 0;
      CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v32);
      v20 = v32;
      if ((Class)objc_opt_class() == a4)
      {
        v21 = v16;
        v31 = -1;
        CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"si", &v31);
        if (v20)
        {
          -[EDFormula setRowBaseOrOffset:](v21, "setRowBaseOrOffset:", v11);
          -[EDFormula setColumnBaseOrOffset:](v21, "setColumnBaseOrOffset:", v10);
          v24 = formulaIndexForEDCell(a7);
          objc_msgSend(v15, "addSharedBaseFormulaIndex:withIndex:", v24, v31);
        }
        else
        {
          -[EDFormula setBaseFormulaIndex:](v21, "setBaseFormulaIndex:", objc_msgSend(v15, "sharedBaseFormulaIndexWithIndex:", v31));
          -[EDFormula baseFormulaWithRowBlocks:](v21, "baseFormulaWithRowBlocks:", v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[EDFormula setRowBaseOrOffset:](v21, "setRowBaseOrOffset:", v11 - objc_msgSend(v25, "rowBaseOrOffset"));
            -[EDFormula setColumnBaseOrOffset:](v21, "setColumnBaseOrOffset:", v10 - objc_msgSend(v25, "columnBaseOrOffset"));
          }

        }
      }
      else
      {
        if ((Class)objc_opt_class() != a4)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v15, "arrayedFormulas");
        v21 = (EDFormula *)objc_claimAutoreleasedReturnValue();
        +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUPair pairWithFirst:second:](OITSUPair, "pairWithFirst:second:", v16, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDFormula addObject:](v21, "addObject:", v23);

        v15 = v28;
      }

      goto LABEL_18;
    }
LABEL_19:

  }
  return v16;
}

+ (id)edTokensForFormulaString:(id)a3 formulaClass:(Class)a4 rowNumber:(int)a5 columnNumber:(int)a6 sheet:(id)a7 workbook:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  EDFormulaHelper *v18;
  void *v19;

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = a7;
  v15 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;
  v18 = -[EDFormulaHelper initWithWorkbook:worksheet:rowNumber:columnNumber:]([EDFormulaHelper alloc], "initWithWorkbook:worksheet:rowNumber:columnNumber:", v15, v17, v11, v10);
  +[EFormula stringToFormula:formulaHelper:formulaClass:](EFormula, "stringToFormula:formulaHelper:formulaClass:", v13, v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOriginalFormulaString:", v13);

  return v19;
}

+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 formulaClass:(Class)a4 state:(id)a5
{
  objc_msgSend(a1, "readFrom:formulaClass:rowNumber:columnNumber:edCell:edRowBlocks:state:", a3, a4, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)applyArrayedFormula:(id)a3 edReference:(id)a4 edWorksheet:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  EDCellHeader *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  int v29;
  char v30;
  double v31;
  int v32;
  int v33;
  EDCellHeader *v34;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  unint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  unsigned int v48;
  unsigned int i;
  int v50;
  uint64_t v51;

  v9 = a3;
  v40 = a4;
  v10 = a5;
  v35 = a6;
  v37 = v9;
  v38 = v10;
  objc_msgSend(v9, "originalFormulaString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v40)
    {
      if (v39)
      {
        v43 = objc_msgSend(v40, "firstRow");
        v11 = objc_msgSend(v40, "lastRow");
        v50 = objc_msgSend(v40, "firstColumn");
        v12 = objc_msgSend(v40, "lastColumn");
        if (v43 <= 0x10000 && v50 <= 256)
        {
          v13 = v11 >= 0x10000 ? 0x10000 : v11;
          v14 = v12 >= 256 ? 256 : v12;
          v48 = v14;
          v42 = v13;
          if (v43 <= v13)
          {
            objc_msgSend(v10, "rowBlocks");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "formulas");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v16, "indexOfObject:", v9);

            v17 = objc_msgSend(v15, "expectedIndexOfRowBlockForRowNumber:", v43);
            v36 = objc_msgSend(v15, "expectedIndexOfRowBlockForRowNumber:", v42);
            if (v17 <= v36)
            {
              v46 = v15;
              do
              {
                v41 = v17;
                objc_msgSend(v15, "rowBlockAtIndex:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18;
                if (v18)
                {
                  v44 = objc_msgSend(v18, "rowCount");
                  if (v44)
                  {
                    v20 = 0;
                    v47 = v19;
                    do
                    {
                      v51 = 0;
                      v21 = objc_msgSend(v19, "rowInfoAtIndex:", v20);
                      v51 = v21;
                      if (v21)
                      {
                        v22 = *(_DWORD *)(v21 + 4);
                        if (v22 >= v43)
                        {
                          if (v22 > v42)
                            break;
                          v23 = *(_DWORD *)(v21 + 8);
                          v24 = objc_msgSend(v19, "expectedIndexOfCellWithColumnNumber:rowInfo:", v50);
                          for (i = v23; v24 < i; v24 = (v24 + 1))
                          {
                            v25 = (EDCellHeader *)objc_msgSend(v19, "cellAtIndex:rowInfo:", v24, v51);
                            v26 = columnNumberForEDCell(v25);
                            v27 = v26;
                            if (v26 >= v50)
                            {
                              if (v26 > v48)
                                break;
                              if ((isFormulaCell(v25) & 1) == 0)
                              {
                                v28 = typeForEDCell(v25);
                                v29 = styleIndexForEDCell(v25);
                                v30 = 0;
                                v31 = 0.0;
                                v32 = -1;
                                v33 = 0;
                                switch((int)v28)
                                {
                                  case 1:
                                    v30 = BOOLValueForEDCell((_BOOL8)v25);
                                    goto LABEL_30;
                                  case 2:
                                    v31 = numberValueForEDCell(v25);
                                    goto LABEL_29;
                                  case 3:
                                    v32 = stringIndexValueForEDCell(v25);
LABEL_29:
                                    v30 = 0;
LABEL_30:
                                    v33 = 0;
                                    break;
                                  case 4:
                                    break;
                                  case 5:
                                    v33 = errorValueForEDCell(v25);
                                    v30 = 0;
                                    break;
                                  default:
                                    v33 = 0;
                                    break;
                                }
                                v34 = (EDCellHeader *)objc_msgSend(v47, "addCellWithColumnNumber:type:isFormulaCell:rowInfo:rowBlocks:", v27, v28, 1, &v51, v46);
                                v25 = v34;
                                switch((int)v28)
                                {
                                  case 1:
                                    setBoolValueForEDCell((uint64_t)v34, v30);
                                    break;
                                  case 2:
                                    setNumberValueForEDCell((uint64_t)v34, v31);
                                    break;
                                  case 3:
                                    setStringIndexValueForEDCell(v34, v32);
                                    break;
                                  case 5:
                                    setErrorValueForEDCell(v34, v33);
                                    break;
                                  default:
                                    break;
                                }
                                setStyleIndexForEDCell((uint64_t)v25, v29);
                              }
                              v15 = v46;
                              v19 = v47;
                              setFormulaIndexForEDCell((uint64_t)v25, v45);
                              if ((_DWORD)v27 == v48)
                                break;
                            }
                          }
                        }
                      }
                      v20 = (v20 + 1);
                    }
                    while ((_DWORD)v20 != v44);
                  }
                }

                v17 = v41 + 1;
              }
              while (v41 + 1 <= v36);
            }
            objc_msgSend(v15, "unlock");

          }
        }
      }
    }
  }

}

+ (id)edFormulaFromXmlFormulaElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "edFormulaFromXmlFormulaElement:formulaClass:state:", a3, objc_msgSend(a1, "formulaClassFromXmlFormulaElement:state:", a3, v6), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)edTokensForFormulaString:(id)a3 sheet:(id)a4 workbook:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "edTokensForFormulaString:formulaClass:rowNumber:columnNumber:sheet:workbook:", v8, objc_opt_class(), 0xFFFFFFFFLL, 0xFFFFFFFFLL, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
