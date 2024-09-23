@implementation EXRow

+ (void)readRowsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  OCXSStream *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const xmlChar *v14;
  char *Attribute;
  char *v16;
  uint64_t v17;
  xmlChar *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  id v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;

  v6 = a4;
  if (!xmlTextReaderIsEmptyElement(a3))
  {
    objc_msgSend(v6, "currentSheet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rowBlocks");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sheetDimension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lastRow");

    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read rows"), (double)((v9 & ~(v9 >> 31)) + 1), 1.0);
    v32 = a1;
    v10 = objc_alloc_init(OCXSStream);
    v11 = xmlTextReaderDepth(a3);
    -[OCXSStream pushLevel:name:](v10, "pushLevel:name:", v11, xmlTextReaderConstLocalName(a3));
    v12 = 0;
    v33 = 0;
    v13 = 0;
    while (+[OCXStreamUtility readStream:streamState:](OCXStreamUtility, "readStream:streamState:", a3, v10))
    {
      objc_msgSend(v6, "setCurrentRowMinColumnIndex:", 0);
      objc_msgSend(v6, "setCurrentRowMaxColumnIndex:", 0);
      v14 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v14, (const xmlChar *)"row"))
      {
        v37 = v12;
        v35 = v13;
        Attribute = (char *)xmlTextReaderGetAttribute(a3, (const xmlChar *)"r");
        v16 = Attribute;
        if (Attribute && sfaxmlXmlCharToLong(Attribute, &v37))
          v17 = v37--;
        else
          v17 = v12 + 1;
        ((void (*)(char *))*MEMORY[0x24BEDE758])(v16);
        v34 = v17;
        v18 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"spans");
        if (v18
          && (objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:", v18),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              (v20 = v19) != 0))
        {
          v22 = objc_msgSend(v19, "rangeOfString:", CFSTR(":"));
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v23 = 0;
          }
          else
          {
            v25 = v21;
            objc_msgSend(v20, "substringToIndex:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v26, "intValue");

            objc_msgSend(v20, "substringFromIndex:", v22 + v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v23, "intValue");

            if (v31)
              objc_msgSend(v6, "setCurrentRowMinColumnIndex:", (v31 - 1));
            LODWORD(v23) = vcvtpd_u64_f64((double)(v27 - v31) * 0.25);
            if (v27)
              objc_msgSend(v6, "setCurrentRowMaxColumnIndex:", (v27 - 1));
          }
          v24 = v20;
        }
        else
        {
          v23 = 0;
          v24 = 0;
        }
        ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v18);
        if (v37 < 0)
        {

          v12 = v34;
          v13 = v35;
        }
        else
        {
          objc_msgSend(v36, "rowBlockForRowNumber:currentRowBlock:createIfNil:");
          v12 = v34;
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "addRowInfoWithRowNumber:cellCountHint:", v37, v23);
          if (v29)
            objc_msgSend(v32, "edRowFrom:edRowInfo:edRowBlock:edRowBlocks:state:", a3, v29, v28, v36, v6);
          +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
          ++v33;
          HIDWORD(v30) = -1030792151 * v33;
          LODWORD(v30) = -1030792151 * v33;
          if ((v30 >> 1) <= 0x51EB851)
          {
            if (objc_msgSend(v6, "isCancelled"))
              +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
          }

          v13 = v28;
        }
      }
    }

    objc_msgSend(v36, "unlock");
    +[TCProgressContext endStage](TCProgressContext, "endStage");

  }
}

+ (void)edRowFrom:(_xmlTextReader *)a3 edRowInfo:(EDRowInfo *)a4 edRowBlock:(id)a5 edRowBlocks:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  id v13;
  xmlChar *Attribute;
  xmlChar *v15;
  void (**v16)(xmlChar *);
  int v17;
  int v18;
  xmlChar *v19;
  xmlChar *v20;
  xmlChar *v21;
  xmlChar *v22;
  double v23;
  xmlChar *v24;
  xmlChar *v25;
  char v26;
  xmlChar *v27;
  xmlChar *v28;
  xmlChar *v29;
  xmlChar *v30;
  OCXSStream *v31;
  uint64_t v32;
  const xmlChar *v33;
  char v34;
  char v35;
  double v36;
  unint64_t v37;
  char v38;
  EDRowInfo *v39;

  v39 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v38 = 0;
  Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"customFormat");
  v15 = Attribute;
  v16 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
  if (Attribute)
  {
    v17 = sfaxmlXmlCharToBool(Attribute, &v38);
    v18 = v38 ? v17 : 0;
    if (v18 == 1)
    {
      v37 = 0;
      v19 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"s");
      v20 = v19;
      if (v19 && sfaxmlXmlCharToUnsignedLong((const char *)v19, &v37))
        setStyleIndexForEDRowInfo(a4, v37);
      (*v16)(v20);
    }
  }
  (*v16)(v15);
  v37 = 0;
  v21 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"outlineLevel");
  v22 = v21;
  if (v21 && sfaxmlXmlCharToUnsignedLong((const char *)v21, &v37))
    a4->var6 = v37;
  (*v16)(v22);
  objc_msgSend(v13, "defaultRowHeight");
  v36 = v23;
  v24 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"ht");
  v25 = v24;
  if (v24 && sfaxmlXmlCharToDouble((uint64_t)v24, &v36))
  {
    v36 = v36 * 20.0;
    v26 = 1;
  }
  else
  {
    v26 = 0;
  }
  (*v16)(v25);
  a4->var5 = (int)v36;
  *((_BYTE *)a4 + 23) = *((_BYTE *)a4 + 23) & 0xFE | v26;
  v35 = 0;
  v27 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"customHeight");
  v28 = v27;
  if (v27 && sfaxmlXmlCharToBool(v27, &v35))
    *((_BYTE *)a4 + 23) = *((_BYTE *)a4 + 23) & 0xFE | v35;
  (*v16)(v28);
  v34 = 0;
  v29 = xmlTextReaderGetAttribute(a3, (const xmlChar *)"hidden");
  v30 = v29;
  if (v29 && sfaxmlXmlCharToBool(v29, &v34))
    *((_BYTE *)a4 + 23) = *((_BYTE *)a4 + 23) & 0xFD | (2 * v34);
  (*v16)(v30);
  if (!xmlTextReaderIsEmptyElement(a3))
  {
    v31 = objc_alloc_init(OCXSStream);
    v32 = xmlTextReaderDepth(a3);
    -[OCXSStream pushLevel:name:](v31, "pushLevel:name:", v32, xmlTextReaderConstLocalName(a3));
    while (+[OCXStreamUtility readStream:streamState:](OCXStreamUtility, "readStream:streamState:", a3, v31))
    {
      v33 = xmlTextReaderConstLocalName(a3);
      if (xmlStrEqual(v33, (const xmlChar *)"c"))
        +[EXCell edCellFromXmlCellElement:edRowInfo:edRowBlock:edRowBlocks:state:](EXCell, "edCellFromXmlCellElement:edRowInfo:edRowBlock:edRowBlocks:state:", xmlTextReaderExpand(a3), &v39, v11, v12, v13);
    }

  }
}

+ (id)createFormulaReferenceRangeForRowBlocks:(id)a3
{
  EDRowBlocks *v3;
  void *v4;
  unsigned int i;
  void *v6;
  uint64_t j;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EDCellHeader *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  EDReference *v20;
  EDReference *v21;
  id v22;
  unsigned int k;
  void *v24;
  unint64_t v25;
  EDReference *v26;
  unsigned int v28;
  _QWORD v29[3];
  void **v30;

  v3 = (EDRowBlocks *)a3;
  -[EDRowBlocks formulas](v3, "formulas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<EDReference * {__strong}>::vector(v29, objc_msgSend(v4, "count"));

  if (v3)
  {
    for (i = 0; -[EDRowBlocks rowBlockCount](v3, "rowBlockCount") > i; i = v28 + 1)
    {
      v28 = i;
      -[EDRowBlocks rowBlockAtIndex:](v3, "rowBlockAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend(v6, "rowCount"); j = (j + 1))
      {
        v8 = objc_msgSend(v6, "rowInfoAtIndex:", j);
        v9 = v8;
        if (*(_DWORD *)(v8 + 8))
        {
          v10 = 0;
          v11 = *(unsigned int *)(v8 + 4);
          do
          {
            v12 = (EDCellHeader *)objc_msgSend(v6, "cellAtIndex:rowInfo:", v10, v9);
            if (isFormulaCell(v12))
            {
              v13 = formulaIndexForEDCell(v12);
              v14 = columnNumberForEDCell(v12);
              if (v13 != -1)
              {
                v15 = v14;
                formulaForEDCell(v12, v3);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "isSharedFormula"))
                {
                  if ((objc_msgSend(v16, "isBaseFormula") & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v17 = v16;
                      v13 = objc_msgSend(v17, "baseFormulaIndex");

                    }
                  }
                }
                v18 = *(void **)(v29[0] + 8 * v13);
                if (v18)
                {
                  v19 = v18;
                  v20 = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:]([EDReference alloc], "initWithFirstRow:lastRow:firstColumn:lastColumn:", v11, v11, v15, v15);
                  objc_msgSend(v19, "unionWithReference:", v20);

                }
                else
                {
                  v21 = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:]([EDReference alloc], "initWithFirstRow:lastRow:firstColumn:lastColumn:", v11, v11, v15, v15);
                  v19 = *(id *)(v29[0] + 8 * v13);
                  *(_QWORD *)(v29[0] + 8 * v13) = v21;
                }

              }
            }
            v10 = (v10 + 1);
          }
          while (v10 < *(_DWORD *)(v9 + 8));
        }
      }

    }
  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (k = 0; ; ++k)
  {
    -[EDRowBlocks formulas](v3, "formulas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25 <= k)
      break;
    if (*(_QWORD *)(v29[0] + 8 * k))
    {
      objc_msgSend(v22, "addObject:");
    }
    else
    {
      v26 = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:]([EDReference alloc], "initWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
      objc_msgSend(v22, "addObject:", v26);

    }
  }
  v30 = (void **)v29;
  std::vector<OADTableCell * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v22;
}

@end
