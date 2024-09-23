@implementation ECFormulaProcessor

- (ECFormulaProcessor)init
{
  ECFormulaProcessor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ECFormulaProcessor;
  result = -[ECFormulaProcessor init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->mXlSheetNames = 0u;
    *(_OWORD *)&result->mXlNameTable = 0u;
    *(_OWORD *)&result->mXlFormulaProcessorLasso = 0u;
  }
  return result;
}

- (void)dealloc
{
  void *mXlFormulaProcessorLasso;
  void *mXlFormulaProcessorXl;
  void *mXlNameTable;
  void *mLassoSheetNames;
  void *mXlSheetNames;
  void *mXlLinkTable;
  objc_super v9;
  void **v10;

  mXlFormulaProcessorLasso = self->mXlFormulaProcessorLasso;
  if (mXlFormulaProcessorLasso)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlFormulaProcessorLasso + 8))(mXlFormulaProcessorLasso, a2);
  self->mXlFormulaProcessorLasso = 0;
  mXlFormulaProcessorXl = self->mXlFormulaProcessorXl;
  if (mXlFormulaProcessorXl)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlFormulaProcessorXl + 8))(mXlFormulaProcessorXl, a2);
  self->mXlFormulaProcessorXl = 0;
  mXlNameTable = self->mXlNameTable;
  if (mXlNameTable)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlNameTable + 8))(mXlNameTable, a2);
  self->mXlNameTable = 0;
  mLassoSheetNames = self->mLassoSheetNames;
  if (mLassoSheetNames)
  {
    v10 = (void **)self->mLassoSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x22E2DD408](mLassoSheetNames, 0x20C40960023A9);
  }
  self->mLassoSheetNames = 0;
  mXlSheetNames = self->mXlSheetNames;
  if (mXlSheetNames)
  {
    v10 = (void **)self->mXlSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x22E2DD408](mXlSheetNames, 0x20C40960023A9);
  }
  self->mXlSheetNames = 0;
  mXlLinkTable = self->mXlLinkTable;
  if (mXlLinkTable)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlLinkTable + 8))(mXlLinkTable, a2);
  self->mXlLinkTable = 0;
  v9.receiver = self;
  v9.super_class = (Class)ECFormulaProcessor;
  -[ECFormulaProcessor dealloc](&v9, sel_dealloc);
}

- (void)setupWithWorkbook:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "names");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mXlNameTable = +[EBNameTable createXlNameTableFromNamesCollection:state:](EBNameTable, "createXlNameTableFromNamesCollection:state:", v5, 0);

  objc_msgSend(v4, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->mXlLinkTable = +[EBLinkTable createXlLinkTableFromLinksCollection:workbook:state:](EBLinkTable, "createXlLinkTableFromLinksCollection:workbook:state:", v6, v8, 0);

  objc_msgSend(v8, "mappingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->mLassoSheetNames = (void *)objc_msgSend(v7, "mappedSheetNames");

  self->mXlSheetNames = -[ECFormulaProcessor sheetNamesFromWorkbook:](self, "sheetNamesFromWorkbook:", v8);
  self->mXlFormulaProcessorLasso = -[ECFormulaProcessor setupWithWorkbook:xlNameTable:sheetNames:xlLinkTable:lassoSyntax:](self, "setupWithWorkbook:xlNameTable:sheetNames:xlLinkTable:lassoSyntax:", v8, self->mXlNameTable, self->mLassoSheetNames, self->mXlLinkTable, 1);
  self->mXlFormulaProcessorXl = -[ECFormulaProcessor setupWithWorkbook:xlNameTable:sheetNames:xlLinkTable:lassoSyntax:](self, "setupWithWorkbook:xlNameTable:sheetNames:xlLinkTable:lassoSyntax:", v8, self->mXlNameTable, self->mXlSheetNames, self->mXlLinkTable, 0);

}

- (void)xlFormulaProcessorLasso
{
  return self->mXlFormulaProcessorLasso;
}

- (void)xlFormulaProcessorXl
{
  return self->mXlFormulaProcessorXl;
}

+ (id)formulaStringForEDFormula:(id)a3 edWorksheet:(id)a4 xlFormulaProcessor:(void *)a5
{
  id v7;
  id v8;
  __int16 v9;
  __int16 v10;
  id v11;
  void *v12;
  void **v13;
  OcText *v14;
  void *v15;
  void **v17;

  v7 = a3;
  v8 = a4;
  if (!a5)
    goto LABEL_9;
  if (objc_msgSend(v7, "isSharedFormula") && (objc_msgSend(v7, "isBaseFormula") & 1) == 0)
  {
    v11 = v7;
    v9 = objc_msgSend(v11, "rowBaseOrOffset");
    v10 = objc_msgSend(v11, "columnBaseOrOffset");
    objc_msgSend(v8, "rowBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "baseFormulaWithRowBlocks:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "unlock");
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v13 = (void **)objc_msgSend(v7, "xlPtgs");
  v17 = v13;
  if (v13 && (v14 = XlFormulaProcessor::toString((uint64_t)a5, (uint64_t *)v13, v9, v10), clearXlPtgs(&v17), v14))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(OcText *))v14->var0 + 1))(v14);
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  return v15;
}

- (void)setupWithWorkbook:(id)a3 xlNameTable:(void *)a4 sheetNames:(void *)a5 xlLinkTable:(void *)a6 lassoSyntax:(BOOL)a7
{
  XlFormulaProcessor *v11;

  v11 = (XlFormulaProcessor *)operator new();
  XlFormulaProcessor::XlFormulaProcessor((uint64_t)v11, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  XlFormulaProcessor::init(v11, 9);
  *((_BYTE *)v11 + 160) = a7;
  return v11;
}

- (void)sheetNamesFromWorkbook:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  OcText v13;

  v3 = a3;
  v4 = operator new();
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  v5 = objc_msgSend(v3, "sheetCount");
  if (v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "sheetAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        OcText::OcText(&v13);
        objc_msgSend(v9, "copyToOcText:", &v13);
        v10 = *(_QWORD *)(v4 + 8);
        if (v10 >= *(_QWORD *)(v4 + 16))
        {
          v11 = std::vector<OcText,ChAllocator<OcText>>::__push_back_slow_path<OcText const&>((uint64_t *)v4, &v13);
        }
        else
        {
          OcText::OcText(*(OcText **)(v4 + 8), &v13);
          v11 = v10 + 48;
          *(_QWORD *)(v4 + 8) = v10 + 48;
        }
        *(_QWORD *)(v4 + 8) = v11;
        OcText::~OcText(&v13);
      }

      ++v6;
    }
    while (v5 != v6);
  }

  return (void *)v4;
}

@end
