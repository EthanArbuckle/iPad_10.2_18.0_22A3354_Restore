@implementation EXCell

+ (void)edCellFromXmlCellElement:(_xmlNode *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  CXNamespace *v21;
  uint64_t v22;
  CXNamespace *v23;
  NSString *v24;
  int v25;
  _BYTE *v26;
  CXNamespace *v27;
  uint64_t v28;
  EDCellHeader *v29;
  double v30;
  EDResources *v31;
  id v32;
  void *v33;
  char v35;
  __int16 v36;
  unint64_t v37[2];
  id v38;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (a3)
  {
    v38 = 0;
    v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"r", &v38);
    v15 = v38;
    if (v14)
    {
      if (+[EXReference edAreaReferenceFromXmlReference:areaReference:](EXReference, "edAreaReferenceFromXmlReference:areaReference:", v15, v37))
      {
        v16 = HIDWORD(v37[0]);
        if ((v37[0] & 0x8000000000000000) != 0)
        {
          v17 = objc_msgSend(v13, "currentRowMinColumnIndex");
          if (v17 <= objc_msgSend(v13, "currentRowMaxColumnIndex"))
            v16 = objc_msgSend(v13, "currentRowMinColumnIndex");
        }
        objc_msgSend(v13, "setCurrentRowMinColumnIndex:", (v16 + 1));
      }
      else
      {
        v16 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      v16 = objc_msgSend(v13, "currentRowMinColumnIndex");
      objc_msgSend(v13, "setCurrentRowMinColumnIndex:", (v16 + 1));
    }
    v36 = 0;
    v35 = 0;
    v18 = objc_msgSend(a1, "edCellTypeFromXmlCellElement:isDate:isFmlaStr:stringIndex:", a3, (char *)&v36 + 1, &v35, &v36);
    v19 = v18;
    if ((int)v16 <= 255 && (*a4)->var1 < 0x10000)
    {
      v32 = v15;
      v33 = v11;
      v20 = 0;
    }
    else
    {
      if (!(_DWORD)v18)
      {
LABEL_40:

        goto LABEL_41;
      }
      v32 = v15;
      v33 = v11;
      v19 = 4;
      v20 = 1;
    }
    objc_msgSend(v13, "EXSpreadsheetMLNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(a3, v21, "v");

    if (!v22 && (_DWORD)v19 == 3)
    {
      objc_msgSend(v13, "EXSpreadsheetMLNamespace");
      v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v22 = OCXFindChild(a3, v23, "is");

    }
    if (v22)
    {
      v24 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v22);
      if ((_DWORD)v19)
        v25 = v20;
      else
        v25 = 0;
      if (v25 == 1)
      {
        v26 = (_BYTE *)+[EXCell edCellFromXmlCellElement:edRowInfo:edRowBlock:edRowBlocks:state:]::hadOutOfBoundaryWarning();
        if (!*v26)
        {
          *v26 = 1;
          +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", ECCellsOutsideLassoBoundary);
        }
      }
    }
    else
    {
      v24 = 0;
      v19 = 0;
    }
    objc_msgSend(v13, "EXSpreadsheetMLNamespace");
    v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v28 = OCXFindChild(a3, v27, "f");

    v29 = (EDCellHeader *)objc_msgSend(v33, "addCellWithColumnNumber:type:isFormulaCell:rowInfo:rowBlocks:", v16, v19, v28 != 0, a4, v12);
    if (!v29)
    {
LABEL_39:

      v15 = v32;
      v11 = v33;
      goto LABEL_40;
    }
    if (v24)
    {
      if ((_DWORD)v19 == 1)
      {
        setBoolValueForEDCell((uint64_t)v29, objc_msgSend(a1, "edBoolFromXmlBoolString:", v24));
      }
      else
      {
        if ((_DWORD)v19 != 2 || HIBYTE(v36))
        {
          if ((_DWORD)v19 != 2 || !HIBYTE(v36))
          {
            if ((_DWORD)v19 == 5)
            {
              setErrorValueForEDCell(v29, objc_msgSend(a1, "edErrorFromXmlErrorString:", v24));
            }
            else if ((_DWORD)v19 == 3 && (_BYTE)v36)
            {
              setStringIndexValueForEDCell(v29, -[NSString intValue](v24, "intValue"));
            }
            else if ((_DWORD)v19 == 3 && !(_BYTE)v36)
            {
              objc_msgSend(v13, "resources");
              v31 = (EDResources *)objc_claimAutoreleasedReturnValue();
              setInlineNSStringValueForEDCell(v29, v24, v31);

            }
            goto LABEL_37;
          }
          objc_msgSend(a1, "dateTimeNumberFromXmlDateString:state:", v24, v13);
        }
        else
        {
          -[NSString doubleValue](v24, "doubleValue");
        }
        setNumberValueForEDCell((uint64_t)v29, v30);
      }
    }
LABEL_37:
    v37[0] = 0;
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"s", (uint64_t *)v37);
    setStyleIndexForEDCell((uint64_t)v29, v37[0]);
    if (v28)
      +[EXFormula readFrom:rowNumber:columnNumber:edCell:edRowBlocks:state:](EXFormula, "readFrom:rowNumber:columnNumber:edCell:edRowBlocks:state:", v28, (*a4)->var1, v16, v29, v12, v13);
    goto LABEL_39;
  }
LABEL_41:

}

+ (BOOL)edBoolFromXmlBoolString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = objc_msgSend(v3, "intValue");
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (v5 != 1)
  {
LABEL_5:
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    goto LABEL_6;
  }
  v6 = 1;
LABEL_7:

  return v6;
}

+ (int)edErrorFromXmlErrorString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "xmlErrorStringValueEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == -130883970)
      v7 = 7;
    else
      v7 = v6;
  }
  else
  {
    v7 = 7;
  }

  return v7;
}

+ (id)xmlErrorStringValueEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_21, 0, &dword_22A0CC000);
  }
  if (+[EXCell xmlErrorStringValueEnumMap]::once != -1)
    dispatch_once(&+[EXCell xmlErrorStringValueEnumMap]::once, &__block_literal_global_72);
  return (id)+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap;
}

void __36__EXCell_xmlErrorStringValueEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueStructs, 8, 1);
  v1 = (void *)+[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap;
  +[EXCell xmlErrorStringValueEnumMap]::sXmlErrorStringValueEnumMap = (uint64_t)v0;

}

+ (int)edCellTypeFromXmlCellElement:(_xmlNode *)a3 isDate:(BOOL *)a4 isFmlaStr:(BOOL *)a5 stringIndex:(BOOL *)a6
{
  BOOL v9;
  id v10;
  void *v11;
  int v12;
  id v14;

  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  v14 = 0;
  v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"t", &v14);
  v10 = v14;
  v11 = v10;
  if (!v9)
    goto LABEL_5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v12 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("n")) & 1) != 0)
  {
LABEL_5:
    v12 = 2;
    goto LABEL_6;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("e")) & 1) != 0)
  {
    v12 = 5;
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("str")))
  {
    *a5 = 1;
LABEL_11:
    v12 = 3;
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("d")))
  {
    *a4 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("s")))
  {
    *a6 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("inlineStr")))
    v12 = 3;
  else
    v12 = 0;
LABEL_6:

  return v12;
}

+ (double)dateTimeNumberFromXmlDateString:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v5);
    v28 = 0;
    v29 = 0;
    v27 = 0;
    if (objc_msgSend(v7, "scanInteger:", &v29)
      && objc_msgSend(v7, "scanString:intoString:", CFSTR("-"), 0)
      && objc_msgSend(v7, "scanInteger:", &v28)
      && objc_msgSend(v7, "scanString:intoString:", CFSTR("-"), 0))
    {
      v25 = 0;
      v26 = 0;
      v23 = 0.0;
      v24 = 0;
      if (objc_msgSend(v7, "scanInteger:", &v27)
        && objc_msgSend(v7, "scanString:intoString:", CFSTR("T"), 0)
        && objc_msgSend(v7, "scanInteger:", &v26)
        && objc_msgSend(v7, "scanString:intoString:", CFSTR(":"), 0)
        && objc_msgSend(v7, "scanInteger:", &v25)
        && objc_msgSend(v7, "scanString:intoString:", CFSTR(":"), 0)
        && objc_msgSend(v7, "scanInteger:", &v24))
      {
        objc_msgSend(v7, "scanDouble:", &v23);
      }
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v23 = 0.0;
      v24 = 0;
    }
    v8 = objc_msgSend(v7, "scanString:intoString:", CFSTR("P"), 0);
    if (v8)
    {
      LOBYTE(v9) = 0;
      v22 = 0;
      while ((objc_msgSend(v7, "isAtEnd", v22) & 1) == 0)
      {
        v9 = (v9 & 1) != 0 ? 1 : objc_msgSend(v7, "scanString:intoString:", CFSTR("T"), 0);
        if (!objc_msgSend(v7, "scanInteger:", &v22))
          break;
        if (v9)
        {
          if (objc_msgSend(v7, "scanString:intoString:", CFSTR("H"), 0))
          {
            v26 = v22;
          }
          else if (objc_msgSend(v7, "scanString:intoString:", CFSTR("M"), 0))
          {
            v25 = v22;
          }
          else
          {
            if (objc_msgSend(v7, "scanString:intoString:", CFSTR("."), 0))
              objc_msgSend(v7, "scanDouble:", &v23);
            if (!objc_msgSend(v7, "scanString:intoString:", CFSTR("S"), 0))
              break;
            v24 = v22;
          }
        }
        else if (objc_msgSend(v7, "scanString:intoString:", CFSTR("Y"), 0))
        {
          v29 = v22;
        }
        else if (objc_msgSend(v7, "scanString:intoString:", CFSTR("M"), 0))
        {
          v28 = v22;
        }
        else
        {
          if (!objc_msgSend(v7, "scanString:intoString:", CFSTR("D"), 0))
            break;
          v27 = v22;
        }
      }
    }
    v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v10, "setYear:", v29);
    objc_msgSend(v10, "setMonth:", v28);
    objc_msgSend(v10, "setDay:", v27);
    objc_msgSend(v10, "setHour:", v26);
    objc_msgSend(v10, "setMinute:", v25);
    objc_msgSend(v10, "setSecond:", v24);
    v11 = objc_alloc(MEMORY[0x24BDBCE48]);
    v12 = (void *)objc_msgSend(v11, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimeZone:", v13);

    if (v8)
    {
      objc_msgSend(v6, "workbook");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateBaseDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v10, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "dateFromComponents:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "dateByAddingTimeInterval:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "workbook");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ECUtils dateTimeNumberFromNSDate:edWorkbook:](ECUtils, "dateTimeNumberFromNSDate:edWorkbook:", v18, v19);
    v17 = v20;

  }
  else
  {
    v17 = 0.0;
  }

  return v17;
}

@end
