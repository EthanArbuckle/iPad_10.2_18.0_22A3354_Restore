@implementation EBState

- (void)setWorkbook:(id)a3
{
  objc_storeStrong((id *)&self->mWorkbook, a3);
}

- (void)setResources:(id)a3
{
  EDResources *v5;
  EDResources **p_mResources;
  EDResources *mResources;
  EDResources *v8;

  v5 = (EDResources *)a3;
  mResources = self->mResources;
  p_mResources = &self->mResources;
  if (mResources != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mResources, a3);
    v5 = v8;
  }

}

- (id)resources
{
  return self->mResources;
}

- (void)xlLinkTable
{
  return self->mXlLinkTable;
}

- (void)xlNameTable
{
  return self->mXlNameTable;
}

- (BOOL)isCancelled
{
  return -[TCCancelDelegate isCancelled](self->mCancelDelegate, "isCancelled");
}

- (id)workbook
{
  return self->mWorkbook;
}

- (void)xlFormulaProcessor
{
  return self->mXlFormulaProcessor;
}

- (void)dealloc
{
  void *mXlLinkTable;
  void *mXlNameTable;
  void *mXlFormulaProcessor;
  void *mSheetNames;
  objc_super v7;
  void **v8;

  mXlLinkTable = self->mXlLinkTable;
  if (mXlLinkTable)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlLinkTable + 8))(mXlLinkTable, a2);
  self->mXlLinkTable = 0;
  mXlNameTable = self->mXlNameTable;
  if (mXlNameTable)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlNameTable + 8))(mXlNameTable, a2);
  self->mXlNameTable = 0;
  mXlFormulaProcessor = self->mXlFormulaProcessor;
  if (mXlFormulaProcessor)
    (*(void (**)(void *, SEL))(*(_QWORD *)mXlFormulaProcessor + 8))(mXlFormulaProcessor, a2);
  self->mXlFormulaProcessor = 0;
  mSheetNames = self->mSheetNames;
  if (mSheetNames)
  {
    v8 = (void **)self->mSheetNames;
    std::vector<OcText,ChAllocator<OcText>>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x22E2DD408](mSheetNames, 0x20C40960023A9);
  }
  self->mSheetNames = 0;
  v7.receiver = self;
  v7.super_class = (Class)EBState;
  -[EBState dealloc](&v7, sel_dealloc);
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (EBState)initWithCancelDelegate:(id)a3
{
  id v5;
  char *v6;
  EBState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EBState;
  v6 = -[EBState init](&v9, sel_init);
  v7 = (EBState *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
    objc_storeStrong((id *)v6 + 7, a3);
  }

  return v7;
}

- (void)sheetNames
{
  return self->mSheetNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
}

@end
