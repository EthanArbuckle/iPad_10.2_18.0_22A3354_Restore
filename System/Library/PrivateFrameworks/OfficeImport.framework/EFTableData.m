@implementation EFTableData

- (EFTableData)initWith:(EFStrTok *)a3
{
  EFTableData *v4;
  void *var1;
  unint64_t var0;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EFTableData;
  v4 = -[EFTableData init](&v9, sel_init);
  if (v4)
  {
    var0 = a3->var2.var0.var0;
    var1 = a3->var2.var1.var1;
    v7 = (void *)objc_msgSend(var1, "tableRange");
    *(_QWORD *)&v4->mRefTok.type = 0xA0000003BLL;
    *(_WORD *)v4->mRefTok.data = var0;
    v4->mTable = (EDTable *)var1;
    v4->mReference = (EDReference *)v7;
    v4->mMakeups = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EFTableData;
  -[EFTableData dealloc](&v3, sel_dealloc);
}

- (const)refTok
{
  return &self->mRefTok;
}

- (unsigned)ptgData
{
  return (unsigned __int16 *)self->mRefTok.data;
}

- (id)table
{
  return self->mTable;
}

- (id)reference
{
  return self->mReference;
}

- (void)makeup:(id)a3 with:(int)a4
{
  unsigned __int16 v4;
  unsigned __int16 *v7;
  int mMakeups;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;

  v4 = a4;
  ++self->mMakeups;
  v7 = -[EFTableData ptgData](self, "ptgData");
  mMakeups = self->mMakeups;
  if (mMakeups == 2)
  {
    if (!objc_msgSend(a3, "compare:", CFSTR("#Data")))
      goto LABEL_16;
    if (objc_msgSend(a3, "compare:", CFSTR("#Totals")))
      return;
  }
  else
  {
    if (mMakeups != 1)
      return;
    if (objc_msgSend(a3, "compare:", CFSTR("#All")))
    {
      if (!objc_msgSend(a3, "compare:", CFSTR("#Headers")))
      {
        v7[1] = -[EDReference firstRow](self->mReference, "firstRow");
        v9 = -[EDReference firstRow](self->mReference, "firstRow");
        v4 = -[EDTable headerRowCount](self->mTable, "headerRowCount") + v9 - 1;
        goto LABEL_17;
      }
      if (objc_msgSend(a3, "compare:", CFSTR("#Data")))
      {
        if (objc_msgSend(a3, "compare:", CFSTR("#Totals")))
        {
          if (objc_msgSend(a3, "compare:", CFSTR("#This Row")))
            return;
          v7[1] = v4;
          goto LABEL_17;
        }
        v12 = -[EDReference lastRow](self->mReference, "lastRow");
        v7[1] = v12 - -[EDTable totalsRowCount](self->mTable, "totalsRowCount") + 1;
        goto LABEL_13;
      }
      v10 = -[EDReference firstRow](self->mReference, "firstRow");
      v7[1] = -[EDTable headerRowCount](self->mTable, "headerRowCount") + v10;
LABEL_16:
      v11 = -[EDReference lastRow](self->mReference, "lastRow");
      v4 = v11 - -[EDTable totalsRowCount](self->mTable, "totalsRowCount");
      goto LABEL_17;
    }
    v7[1] = -[EDReference firstRow](self->mReference, "firstRow");
  }
LABEL_13:
  v4 = -[EDReference lastRow](self->mReference, "lastRow");
LABEL_17:
  v7[2] = v4;
}

@end
