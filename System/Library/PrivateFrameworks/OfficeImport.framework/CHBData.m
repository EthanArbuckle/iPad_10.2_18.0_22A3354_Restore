@implementation CHBData

+ (id)readFrom:(const void *)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  char *v19;
  unsigned int v20;
  char v21;
  int v22;
  unsigned __int16 *v23;
  EDValue *v24;
  double v25;
  EDValue *v26;
  int v27;
  int v28;
  unsigned int v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  BOOL v35;
  id v36;
  int v37;
  const void *v39;
  void *v40;
  id v41;
  EDValue v42;
  uint64_t v43;
  CsData v44;
  uint64_t v45;

  v5 = a4;
  if (a3 && XlChartLinkedData::hasEnteredData((XlChartLinkedData *)a3))
  {
    v6 = *((unsigned int *)a3 + 12);
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHDData dataWithDataPointCount:resources:](CHDData, "dataWithDataPointCount:resources:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHDData dataWithResources:](CHDData, "dataWithResources:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      v36 = v8;
      goto LABEL_48;
    }
  }
  v10 = *((_QWORD *)a3 + 2);
  if (v10)
  {
    v11 = *((unsigned __int16 *)a3 + 12);
    v12 = objc_opt_class();
    objc_msgSend(v5, "ebReaderSheetState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[EBFormula edFormulaFromXlFmlaDefinition:withFormulaLength:formulaClass:state:](EBFormula, "edFormulaFromXlFmlaDefinition:withFormulaLength:formulaClass:state:", v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "workbook");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWorkbook:", v15);

    objc_msgSend(v5, "chart");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFormula:chart:", v14, v16);

  }
  else
  {
    v14 = 0;
  }
  if (XlChartLinkedData::hasEnteredData((XlChartLinkedData *)a3))
  {
    v40 = v14;
    v41 = v5;
    objc_msgSend(v8, "dataValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (char *)*((_QWORD *)a3 + 4);
    v39 = a3;
    v19 = (char *)a3 + 40;
    if (v18 != v19)
    {
      v20 = 0;
      v21 = 1;
      v22 = 0xFFFF;
      while (1)
      {
        v23 = (unsigned __int16 *)*((_QWORD *)v18 + 5);
        CsData::CsData(&v44);
        if ((*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)v23 + 16))(v23))
          break;
        if (!(*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)v23 + 24))(v23))
          goto LABEL_16;
        +[CHBString nsStringWithHandlingMultilevelCategoryDataFromOCText:chdFormula:state:](CHBString, "nsStringWithHandlingMultilevelCategoryDataFromOCText:chdFormula:state:", (*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)v23 + 40))(v23), v40, v41);
        v26 = (EDValue *)objc_claimAutoreleasedReturnValue();
        if (-[EDValue length](v26, "length"))
        {
          EDValue::makeWithNSString(v26, (uint64_t)&v42);
          EDValue::operator=((uint64_t)&v44, &v42.type);
          EDValue::~EDValue(&v42);

          goto LABEL_16;
        }
        v32 = (char *)*((_QWORD *)v18 + 1);
        v33 = v18;
        if (v32)
        {
          do
          {
            v34 = v32;
            v32 = *(char **)v32;
          }
          while (v32);
        }
        else
        {
          do
          {
            v34 = (char *)*((_QWORD *)v33 + 2);
            v35 = *(_QWORD *)v34 == (_QWORD)v33;
            v33 = v34;
          }
          while (!v35);
        }
        v20 = *((_DWORD *)v18 + 8);

        v18 = v34;
LABEL_29:
        EDValue::~EDValue((EDValue *)&v44);
        if (v18 == v19)
          goto LABEL_40;
      }
      v24 = (EDValue *)(*(uint64_t (**)(unsigned __int16 *))(*(_QWORD *)v23 + 32))(v23);
      EDValue::makeWithNumber(v24, v25, (uint64_t)&v42);
      EDValue::operator=((uint64_t)&v44, &v42.type);
      EDValue::~EDValue(&v42);
LABEL_16:
      v27 = v23[4];
      if (v27 == (unsigned __int16)v22)
        v28 = v22;
      else
        v28 = -1;
      if ((v21 & 1) != 0)
        v22 = v23[4];
      else
        v22 = v28;
      v43 = *((unsigned int *)v18 + 8);
      v45 = (__int16)v27;
      objc_msgSend(v17, "addDataPoint:", &v43);
      v29 = *((_DWORD *)v18 + 8);
      if (v29 <= v20)
        v29 = v20;
      objc_msgSend(v8, "setDataValueIndexCount:", v29 + 1);
      v20 = *((_DWORD *)v18 + 8);
      v30 = (char *)*((_QWORD *)v18 + 1);
      if (v30)
      {
        do
        {
          v18 = v30;
          v30 = *(char **)v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = v18;
          v18 = (char *)*((_QWORD *)v18 + 2);
        }
        while (*(char **)v18 != v31);
      }
      v21 = 0;
      goto LABEL_29;
    }
    LOWORD(v22) = -1;
LABEL_40:
    objc_msgSend(v17, "finishReading");

    v14 = v40;
    v5 = v41;
    a3 = v39;
  }
  else
  {
    LOWORD(v22) = -1;
  }
  v37 = *((unsigned __int16 *)a3 + 13);
  if (*(_BYTE *)(objc_msgSend(v5, "xlReader") + 1344))
  {
    if (v37 != 0x8000 && !*((_BYTE *)a3 + 28))
      LOWORD(v22) = v37;
  }
  else
  {
    LOWORD(v22) = v37;
  }
  objc_msgSend(v8, "setContentFormatId:", (__int16)v22);
  v36 = v8;

LABEL_48:
  return v36;
}

@end
