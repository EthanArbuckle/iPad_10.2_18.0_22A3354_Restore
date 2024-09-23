@implementation EFormula

+ (id)stringToFormula:(id)a3 formulaHelper:(id)a4 formulaClass:(Class)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a1, "singletonEFormula");
  objc_msgSend(v8, "setFormulaClass:", a5);
  objc_msgSend(v8, "setFormulaHelper:", a4);
  v9 = (void *)objc_msgSend(v8, "stringToTokens:", a3);
  objc_msgSend(v8, "setFormulaHelper:", 0);
  return v9;
}

+ (id)singletonEFormula
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  v3 = (id)objc_msgSend(v2, "objectForKey:", CFSTR("EFormula"));
  if (!v3)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("EFormula"));

  }
  return v3;
}

- (void)setFormulaClass:(Class)a3
{
  self->mFormulaClass = a3;
}

- (void)setFormulaHelper:(id)a3
{
  id v5;

  v5 = a3;

  self->mHelper = (EFHelper *)a3;
}

- (id)stringToTokens:(id)a3
{
  uint64_t v4;
  const char *v5;
  EFLexer *v6;
  NSString *mErrMsg;
  void *v8;
  void *v9;
  uint64_t v10;
  EDFormula *mFormula;
  EDFormula *v13;
  void *v14;

  v4 = objc_msgSend(a3, "UTF8String");
  if (!v4)
  {
    -[EDFormula setWarning:](self->mFormula, "setWarning:", 1);
    return 0;
  }
  v5 = (const char *)v4;
  v14 = 0;
  v6 = (EFLexer *)operator new();
  EFLexer::EFLexer(v6, v5);
  *((_QWORD *)v6 + 70) = self;
  self->mYylex = v6;
  yydebug = 0;
  yyparse(self);
  mErrMsg = self->mErrMsg;
  if (mErrMsg)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("EFSemanticException"), CFSTR("EFErrorTypeKey"), mErrMsg, CFSTR("EFErrorClassKey"), 0);
    self->mErrMsg = 0;
  }
  (*(void (**)(EFLexer *))(*(_QWORD *)v6 + 8))(v6);
  self->mYylex = 0;
  if (v14)
  {
    if (!self->mFormula)
      self->mFormula = (EDFormula *)objc_alloc_init(self->mFormulaClass);
    v8 = (void *)objc_msgSend((id)objc_msgSend(v14, "allValues"), "componentsJoinedByString:", CFSTR(" : "));
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v8, "rangeOfString:", CFSTR("Reference out of bounds")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = 10;
        goto LABEL_14;
      }
      if (objc_msgSend(v9, "rangeOfString:", CFSTR("External book reference not supported")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = 5;
        goto LABEL_14;
      }
    }
    v10 = 1;
LABEL_14:
    -[EDFormula setWarning:](self->mFormula, "setWarning:", v10);
  }
  mFormula = self->mFormula;
  if (!mFormula)
    return 0;
  v13 = mFormula;
  -[EFormula setFormula:](self, "setFormula:", 0);
  return v13;
}

- (Class)formulaClass
{
  return self->mFormulaClass;
}

- (void)setFormula:(id)a3
{
  id v5;

  v5 = a3;

  self->mFormula = (EDFormula *)a3;
}

- (id)formulaHelper
{
  return self->mHelper;
}

- (void)dealloc
{
  EFTableData *mTableData;
  objc_super v4;

  mTableData = self->mTableData;
  if (mTableData)

  v4.receiver = self;
  v4.super_class = (Class)EFormula;
  -[EFormula dealloc](&v4, sel_dealloc);
}

- (unint64_t)resolveName:(const char *)a3
{
  return -[EFHelper resolveName:](self->mHelper, "resolveName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3));
}

- (id)resolveTable:(const char *)a3 sheetIndex:(unint64_t *)a4
{
  uint64_t v6;
  void *v7;

  if (!a3)
    return 0;
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v7 = (void *)-[EFHelper resolveTable:](self->mHelper, "resolveTable:", v6);
  if (v7)
    *a4 = -[EFHelper resolveTableToSheetId:](self->mHelper, "resolveTableToSheetId:", v6);
  return v7;
}

- (unint64_t)resolveSheet:(const char *)a3 isCurrentSheet:(BOOL *)a4
{
  uint64_t v6;
  unint64_t v7;
  char v8;

  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v7 = -[EFHelper resolveSheet:](self->mHelper, "resolveSheet:", v6);
  if (v7 == -1)
    v8 = 0;
  else
    v8 = -[EFHelper isCurrentSheet:](self->mHelper, "isCurrentSheet:", v6);
  *a4 = v8;
  return v7;
}

- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4
{
  return -[EFHelper resolveFirstSheet:lastSheet:](self->mHelper, "resolveFirstSheet:lastSheet:", a3, a4);
}

- (id)tableData
{
  return self->mTableData;
}

- (void)setTableData:(id)a3
{
  id v5;

  v5 = a3;

  self->mTableData = (EFTableData *)a3;
}

@end
