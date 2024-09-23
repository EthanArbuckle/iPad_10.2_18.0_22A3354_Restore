@implementation EBReaderState

- (void)xlReader
{
  return self->mXlReader;
}

- (id)oaState
{
  return self->mOAState;
}

- (void)readGlobalXlObjects
{
  _QWORD *v3;
  _QWORD *v4;
  XlNameTable *v5;
  _QWORD *v6;
  void *v7;

  if (self->mXlReader)
  {
    v3 = (_QWORD *)operator new();
    v3[4] = 0;
    v3[2] = 0;
    v3[3] = 0;
    *v3 = &off_24F3AFD68;
    v3[1] = 0;
    self->mXlSheetInfoTable = v3;
    (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->mXlReader + 232))(self->mXlReader, v3);
    v4 = (_QWORD *)operator new();
    *v4 = &off_24F3AF8F8;
    v4[1] = &off_24F3AF888;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = 0;
    *((_BYTE *)v4 + 16) = 1;
    v4[7] = 0;
    v4[8] = 0;
    self->super.mXlLinkTable = v4;
    (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->mXlReader + 200))(self->mXlReader, v4);
    v5 = (XlNameTable *)operator new();
    XlNameTable::XlNameTable(v5);
    self->super.mXlNameTable = v5;
    (*(void (**)(void *, XlNameTable *))(*(_QWORD *)self->mXlReader + 192))(self->mXlReader, v5);
    v6 = (_QWORD *)operator new();
    v6[2] = 0;
    *v6 = 0;
    v6[1] = 0;
    self->super.mSheetNames = v6;
    XlBinaryReader::getSheetNames((uint64_t)self->mXlReader, v6);
    if (self->super.mXlNameTable)
    {
      if (self->super.mSheetNames)
      {
        if (self->super.mXlLinkTable)
        {
          v7 = (void *)operator new();
          XlFormulaProcessor::XlFormulaProcessor((uint64_t)v7, (uint64_t)self->super.mXlNameTable, (uint64_t)self->super.mSheetNames, (uint64_t)self->super.mXlLinkTable);
          self->super.mXlFormulaProcessor = v7;
          XlFormulaProcessor::init((XlFormulaProcessor *)v7, *((_BYTE *)self->mXlReader + 1320));
        }
      }
    }
  }
}

- (void)xlSheetInfoTable
{
  return self->mXlSheetInfoTable;
}

- (void)pauseReading
{
  id v2;

  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreHostEshFactory");

}

- (void)resumeReading
{
  id v3;

  +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceHostEshFactoryWith:", self->mXlEshObjectFactory);

}

- (id)columnWidthConvertor
{
  ECColumnWidthConvertor *mColumnWidthConvertor;
  ECColumnWidthConvertor *v4;
  ECColumnWidthConvertor *v5;
  ECColumnWidthConvertor *v6;
  void *v7;
  void *v8;
  void *v9;

  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    v4 = objc_alloc_init(ECColumnWidthConvertor);
    v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    v6 = self->mColumnWidthConvertor;
    -[EDResources styles](self->super.mResources, "styles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultWorkbookStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECColumnWidthConvertor setupWithEDFont:state:](v6, "setupWithEDFont:state:", v9, 0);

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (void)dealloc
{
  void *mXlSheetInfoTable;
  XlEshObjectFactory *mXlEshObjectFactory;
  objc_super v5;

  mXlSheetInfoTable = self->mXlSheetInfoTable;
  if (mXlSheetInfoTable)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlSheetInfoTable + 8))(mXlSheetInfoTable, a2);
  self->mXlSheetInfoTable = 0;
  mXlEshObjectFactory = self->mXlEshObjectFactory;
  if (mXlEshObjectFactory)
    (*((void (**)(XlEshObjectFactory *, SEL))mXlEshObjectFactory->var0 + 1))(mXlEshObjectFactory, a2);
  self->mXlEshObjectFactory = 0;
  v5.receiver = self;
  v5.super_class = (Class)EBReaderState;
  -[EBState dealloc](&v5, sel_dealloc);
}

- (void)reportWarning:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDWorkbook warnings](self->super.mWorkbook, "warnings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWarning:", v5);

}

- (EBReaderState)initWithXlReader:(void *)a3 cancelDelegate:(id)a4
{
  id v6;
  EBReaderState *v7;
  EBReaderState *v8;
  XlEshObjectFactory *v9;
  void *v10;
  EBOfficeArtReaderState *v11;
  OABReaderState *mOAState;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EBReaderState;
  v7 = -[EBState initWithCancelDelegate:](&v14, sel_initWithCancelDelegate_, v6);
  v8 = v7;
  if (v7)
  {
    v7->mXlReader = a3;
    v7->mXlSheetInfoTable = 0;
    v9 = (XlEshObjectFactory *)operator new(0x10uLL);
    XlEshObjectFactory::XlEshObjectFactory(v9);
    v8->mXlEshObjectFactory = v9;
    +[ESDObjectFactory threadLocalFactory](ESDObjectFactory, "threadLocalFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replaceHostEshFactoryWith:", v8->mXlEshObjectFactory);

    v11 = -[EBOfficeArtReaderState initWithReaderState:]([EBOfficeArtReaderState alloc], "initWithReaderState:", v8);
    mOAState = v8->mOAState;
    v8->mOAState = &v11->super;

    v8->mImportCSV = 0;
  }

  return v8;
}

- (BOOL)importCSV
{
  return self->mImportCSV;
}

- (void)setImportCSV:(BOOL)a3
{
  self->mImportCSV = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOAState, 0);
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
}

@end
