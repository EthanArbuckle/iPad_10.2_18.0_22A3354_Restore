@implementation TSTFilteredTableDynamicContentDelegate

- (TSTFilteredTableDynamicContentDelegate)initWithTableModel:(id)a3
{
  TSTFilteredTableDynamicContentDelegate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTFilteredTableDynamicContentDelegate;
  v4 = -[TSTFilteredTableDynamicContentDelegate init](&v6, sel_init);
  if (v4)
    v4->mTableModel = (TSTTableModel *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTFilteredTableDynamicContentDelegate;
  -[TSTFilteredTableDynamicContentDelegate dealloc](&v3, sel_dealloc);
}

- (BOOL)cell:(id *)a3 forCellID:(id)a4
{
  TSTCell *v6;
  NSString *v7;
  int mPrivate;
  NSString *mString;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  TSTCellStyle *v16;
  TSTCellStyle *v17;
  TSTCellStyle *v18;
  _QWORD *v19;
  TSWPParagraphStyle *v20;
  TSWPParagraphStyle *v21;
  TSWPParagraphStyle *v22;

  v6 = objc_alloc_init(TSTCell);
  *a3 = v6;
  v7 = (NSString *)objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("No rows match the filter conditions."), &stru_24D82FEB0, CFSTR("TSTables"));
  if (!v6 || (mPrivate = (int)v6->mPrivate, (mPrivate & 0xFF00) == 0))
  {
    TSTCellClearValue((uint64_t)v6);
    *((_BYTE *)&v6->mPrivate + 1) = 3;
    mPrivate = (int)v6->mPrivate;
  }
  if ((mPrivate & 0xFF00) == 0x300)
  {
    mString = v6->mPrivate.mValue.mString.mString;
    if (mString != v7)
    {

      v6->mPrivate.mValue.mString.mString = v7;
      v10 = HIWORD(*(_DWORD *)&v6->mPrivate);
      v11 = -[NSString rangeOfCharacterFromSet:](v7, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet"));
      v12 = v10 | 1;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = v10 & 0xFFFE;
      *((_WORD *)&v6->mPrivate + 1) = v12;
      v6->mPrivate.mValue.mString.mID = 0;
    }
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSTCellSetStringValueClearingID(TSTCell *, NSString *, BOOL)");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1003, CFSTR("can't set string on non-string cell: %p"), v6);
  }
  v15 = *a3;
  v16 = -[TSTTableModel headerRowCellStyle](self->mTableModel, "headerRowCellStyle");
  v17 = (TSTCellStyle *)v15[5];
  if (v17 != v16)
  {
    v18 = v16;

    v15[5] = v18;
    *((_DWORD *)v15 + 8) = 0;
  }
  v19 = *a3;
  v20 = -[TSTTableModel headerRowTextStyle](self->mTableModel, "headerRowTextStyle");
  v21 = (TSWPParagraphStyle *)v19[7];
  if (v21 != v20)
  {
    v22 = v20;

    v19[7] = v22;
    *((_DWORD *)v19 + 12) = 0;
  }
  return 1;
}

- (BOOL)dynamicContentMustDrawOnMainThread
{
  return 0;
}

@end
