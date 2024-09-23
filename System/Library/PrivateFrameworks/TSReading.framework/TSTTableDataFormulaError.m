@implementation TSTTableDataFormulaError

- (id)initObjectWithFormulaError:(id)a3
{
  TSTTableDataFormulaError *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataFormulaError;
  v4 = -[TSTTableDataFormulaError init](&v6, sel_init);
  if (v4)
  {
    v4->mFormulaError = (TSWPStorage *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  TSWPStorage *mFormulaError;

  v3 = -[TSWPStorage canBeStoredInAStringValueCell](self->mFormulaError, "canBeStoredInAStringValueCell");
  mFormulaError = self->mFormulaError;
  if (v3)
    mFormulaError = -[TSWPStorage string](mFormulaError, "string");
  return -[TSWPStorage hash](mFormulaError, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[TSWPStorage isEqual:](self->mFormulaError, "isEqual:", *((_QWORD *)a3 + 2));
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("refCount: %d   mFormulaError: %@"), self->super.mRefCount, self->mFormulaError);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataFormulaError;
  -[TSTTableDataFormulaError dealloc](&v3, sel_dealloc);
}

@end
