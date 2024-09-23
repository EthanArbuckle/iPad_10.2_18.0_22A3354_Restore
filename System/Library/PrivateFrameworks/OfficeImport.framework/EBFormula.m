@implementation EBFormula

+ (void)setupTokensInEDFormulaFromXlFormulaProcessor:(void *)a3 length:(int)a4 edFormula:(id)a5 edSheet:(id)a6
{
  uint64_t v7;
  id v9;
  XlPtg *Token;
  XlPtg *v11;
  id v12;

  v7 = *(_QWORD *)&a4;
  v12 = a5;
  v9 = a6;
  objc_msgSend(v12, "setupTokensWithTokensCount:tokensWithDataCount:extendedDataLength:extendedDataCount:", 1, 1, v7, 1);
  XlFormulaProcessor::startTokenEnum((XlFormulaParser **)a3);
  while (1)
  {
    Token = XlFormulaProcessor::nextToken((XlFormulaParser **)a3);
    v11 = Token;
    if (!Token)
      break;
    if (Token->var1 == 28)
    {
      objc_msgSend(v12, "setWarning:", 1);
      objc_msgSend(v12, "removeAllTokens");
      XlPtg::~XlPtg(v11);
      MEMORY[0x22E2DD408]();
      break;
    }
    objc_msgSend(v12, "copyTokenFromXlPtg:", Token);
    XlPtg::~XlPtg(v11);
    MEMORY[0x22E2DD408]();
  }

}

+ (void)readFormulaFromXlCell:(XlCell *)a3 edCell:(EDCellHeader *)a4 edRowBlocks:(id)a5 state:(id)a6
{
  EDRowBlocks *v10;
  id v11;
  XlFormulaInfo *var8;
  int var1;
  void *v14;
  EDFormula *v15;
  void *v16;
  XlFormulaProcessor *v17;
  _BOOL4 v18;
  EDFormula *v19;
  _BOOL4 v20;
  EDFormula *v21;
  uint64_t var4;
  void *v23;
  uint64_t v25;
  _BOOL4 v26;
  __int16 v27;
  unsigned __int16 v28;

  v10 = (EDRowBlocks *)a5;
  v11 = a6;
  if (!a3)
    goto LABEL_21;
  var8 = a3->var8;
  if (!var8)
    goto LABEL_21;
  var1 = var8->var1;
  v14 = (void *)objc_opt_class();
  if (var1 == 1)
    v14 = (void *)objc_opt_class();
  objc_msgSend(v14, "formula");
  v15 = (EDFormula *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readerState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (XlFormulaProcessor *)objc_msgSend(v16, "xlFormulaProcessor");

  if (var8->var6)
    v18 = 1;
  else
    v18 = var8->var7 != 0;
  v28 = -1;
  v27 = -1;
  if (var1 != 1)
    goto LABEL_11;
  XlFormulaProcessor::getShareBase(v17, var8, &v28, &v27);
  v19 = v15;
  v20 = v18;
  v21 = v19;
  v26 = v20;
  if (v20)
  {
    -[EDFormula setRowBaseOrOffset:](v19, "setRowBaseOrOffset:", v28);
    -[EDFormula setColumnBaseOrOffset:](v21, "setColumnBaseOrOffset:", v27);

    v18 = v26;
LABEL_11:
    XlFormulaProcessor::setFormula((SsrwOOStream **)v17, (void **)var8->var3, var8->var5, (void **)var8->var4);
    if (var1 == 1)
      XlFormulaProcessor::convertToRegularFormula(v17, var8, a3->var1, (unsigned __int16)a3->var2);
    var4 = var8->var4;
    objc_msgSend(v11, "edSheet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupTokensInEDFormulaFromXlFormulaProcessor:length:edFormula:edSheet:", v17, var4, v15, v23);

    XlFormulaProcessor::releaseFormula((XlFormulaParser **)v17);
    goto LABEL_15;
  }
  -[EDFormula setBaseFormulaIndex:](v19, "setBaseFormulaIndex:", objc_msgSend(v11, "sharedFormulaIndexForRowCol:", v27 | (v28 << 16)));
  -[EDFormula setRowBaseOrOffset:](v21, "setRowBaseOrOffset:", a3->var1 - v28);
  -[EDFormula setColumnBaseOrOffset:](v21, "setColumnBaseOrOffset:", (a3->var2 - v27));

  v18 = 0;
LABEL_15:
  setFormulaForEDCell(a4, v15, v10);
  if (var1 == 1 && v18)
  {
    v25 = formulaIndexForEDCell(a4);
    objc_msgSend(v11, "setSharedFormulaIndex:forRowCol:", v25, v27 | (v28 << 16));
  }

LABEL_21:
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 state:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  objc_msgSend(a1, "edFormulaFromXlFmlaDefinition:withFormulaLength:formulaClass:state:", a3, v5, objc_opt_class(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withFormulaLength:(int)a4 formulaClass:(Class)a5 state:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  objc_msgSend(v10, "edSheet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "readerState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "edFormulaFromXlFmlaDefinition:withTokenLength:formulaLength:formulaClass:edSheet:state:", a3, v7, v7, a5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)edFormulaFromXlFmlaDefinition:(const void *)a3 withTokenLength:(int)a4 formulaLength:(int)a5 formulaClass:(Class)a6 edSheet:(id)a7 state:(id)a8
{
  void **v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  SsrwOOStream **v18;

  v10 = *(void ***)&a5;
  v14 = a7;
  v15 = a8;
  v16 = v15;
  v17 = 0;
  if ((int)v10 >= a4 && a3 && a4 >= 1 && (int)v10 >= 1)
  {
    v18 = (SsrwOOStream **)objc_msgSend(v15, "xlFormulaProcessor");
    XlFormulaProcessor::setFormula(v18, (void **)a3, a4, v10);
    -[objc_class formula](a6, "formula");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupTokensInEDFormulaFromXlFormulaProcessor:length:edFormula:edSheet:", v18, v10, v17, v14);
    XlFormulaProcessor::releaseFormula((XlFormulaParser **)v18);
  }

  return v17;
}

+ (XlFormulaInfo)xlFormulaInfoFromEDFormula:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t *v9;
  XlFormulaInfo *v10;
  char *v11;
  unsigned int v13;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "warning");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &ECUnsupportedExportFormula;
    if (!v7)
      v9 = &ECUnsupportedImportFormula;
    +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", *v9);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v6, "tokenCount"))
    {
      v10 = (XlFormulaInfo *)operator new();
      XlFormulaInfo::XlFormulaInfo(v10);
      v10->var10 = 1;
      v10->var12 = 0;
      v10->var1 = 0;
      v13 = 0;
      v11 = (char *)objc_msgSend(a1, "edFormulaToParsedExpression:tokenLength:formulaLength:state:", v6, (char *)&v13 + 2, &v13, v7);
      XlFormulaInfo::takeFormula(v10, v11, (unsigned __int16)v13, SHIWORD(v13));
      goto LABEL_11;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = (XlFormulaInfo *)objc_msgSend(a1, "xlFormulaInfoFromEDSharedFormula:state:", v6, v7);
LABEL_11:

  return v10;
}

+ (char)edFormulaToParsedExpression:(id)a3 tokenLength:(unsigned __int16 *)a4 formulaLength:(unsigned __int16 *)a5 state:(id)a6
{
  id v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  __int16 v14;
  unsigned __int16 v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  void (**v22)(XlFormulaProcessor::XLFormulaInfoStream *__hidden);
  int v23;
  void (**v24)(XlFormulaProcessor::XLFormulaInfoStream *__hidden);
  int v25;

  v10 = a3;
  v11 = a6;
  *a4 = 0;
  *a5 = 0;
  v12 = objc_msgSend(v10, "tokenCount");
  if (!v12)
    goto LABEL_8;
  v13 = 0;
  v24 = &off_24F3A7C00;
  v25 = 0;
  v22 = &off_24F3A7C00;
  v23 = 0;
  do
    LODWORD(v13) = v13
                 + objc_msgSend(a1, "writeToken:tokenIndex:tokenStream:extendedStream:state:", v10, v13, &v24, &v22, v11)+ 1;
  while (v13 < v12);
  v14 = v25;
  *a4 = v25;
  v15 = v23 + v14;
  *a5 = v15;
  if (v15)
  {
    v16 = (char *)operator new[](v15);
    v17 = 0;
    v21[0] = &off_24F3A7C98;
    v21[1] = v16;
    v18 = &v16[*a4];
    v20[0] = &off_24F3A7C98;
    v20[1] = v18;
    do
      LODWORD(v17) = v17
                   + objc_msgSend(a1, "writeToken:tokenIndex:tokenStream:extendedStream:state:", v10, v17, v21, v20, v11)+ 1;
    while (v17 < v12);
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

+ (unsigned)writeToken:(id)a3 tokenIndex:(unsigned int)a4 tokenStream:(XLFormulaStream *)a5 extendedStream:(XLFormulaStream *)a6 state:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  char *LastExtendedData;
  uint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  __int16 v19;
  uint64_t v20;
  unsigned __int16 *v21;
  XlPtg v23;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a7;
  if (objc_msgSend(v12, "tokenCount") <= v10)
  {
    v18 = 0;
  }
  else
  {
    XlPtg::XlPtg(&v23);
    objc_msgSend(v12, "populateXlPtg:index:", &v23, v10);
    if (v23.var1 == 38 || v23.var1 == 102 || v23.var1 == 70)
    {
      (*((void (**)(XLFormulaStream *, uint64_t))a5->var0 + 2))(a5, 4);
      LastExtendedData = XlPtg::getLastExtendedData(&v23);
      v15 = (*((uint64_t (**)(XLFormulaStream *))a5->var0 + 8))(a5);
      (*((void (**)(XLFormulaStream *, uint64_t))a5->var0 + 2))(a5, 2);
      v16 = *(unsigned __int16 *)LastExtendedData;
      if (*(_WORD *)LastExtendedData)
      {
        v17 = *(unsigned __int16 *)LastExtendedData;
        do
        {
          v10 = (v10 + 1);
          objc_msgSend(a1, "writeToken:tokenIndex:tokenStream:extendedStream:state:", v12, v10, a5, a6, v13);
          --v17;
        }
        while (v17);
        v18 = v16 + 1;
      }
      else
      {
        v18 = 1;
      }
      v19 = (*(uint64_t (**)(uint64_t, XLFormulaStream *))(*(_QWORD *)v15 + 72))(v15, a5);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v15 + 32))(v15, (unsigned __int16)(v19 - 2));
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
      objc_msgSend(a1, "writeToken:tokenIndex:tokenStream:extendedStream:state:", v12, (v10 + 1), a5, a6, v13);
      v20 = *((unsigned __int16 *)LastExtendedData + 1);
      (*((void (**)(XLFormulaStream *, uint64_t))a6->var0 + 4))(a6, v20);
      if ((_DWORD)v20)
      {
        v21 = (unsigned __int16 *)(LastExtendedData + 10);
        do
        {
          (*((void (**)(XLFormulaStream *, _QWORD))a6->var0 + 4))(a6, *(v21 - 3));
          (*((void (**)(XLFormulaStream *, _QWORD))a6->var0 + 4))(a6, *(v21 - 2));
          (*((void (**)(XLFormulaStream *, _QWORD))a6->var0 + 4))(a6, *(v21 - 1));
          (*((void (**)(XLFormulaStream *, _QWORD))a6->var0 + 4))(a6, *v21);
          v21 += 4;
          --v20;
        }
        while (v20);
      }
    }
    else
    {
      v18 = 0;
    }
    XlPtg::XlPtg(&v23);
    XlPtg::~XlPtg(&v23);
  }

  return v18;
}

+ (XlFormulaInfo)xlFormulaInfoFromEDSharedFormula:(id)a3 state:(id)a4
{
  return 0;
}

@end
