@implementation TSTFindReplace

+ (void)searchInfo:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  unint64_t v6;
  TSTCellIterator *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[4];
  unsigned int v20;
  uint64_t v21;

  v11 = -[TSTCellIterator initWithTableModel:]([TSTCellIterator alloc], "initWithTableModel:", objc_msgSend(a3, "tableModel"));
  if (-[TSTCellIterator getNext:](v11, "getNext:", v19))
  {
    do
    {
      if (!v21 || *(_DWORD *)(v21 + 104) != 267 && *(unsigned __int8 *)(v21 + 9) << 8 != 2304)
      {
        v12 = (void *)NSStringFromNativeTSTCell(v21);
        if (v12)
        {
          v13 = v12;
          v17 = 0;
          v18 = 0;
          v17 = objc_msgSend(v12, "tsu_range");
          v18 = v14;
          while (v18)
          {
            v15 = objc_msgSend(v13, "rangeOfString:searchOptions:updatingSearchRange:", a4, a5, &v17);
            if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v6 = v6 & 0xFFFFFFFF00000000 | v20;
              (*((void (**)(id, TSTSearchReference *))a6 + 2))(a6, +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", a3, v6, v15, v16));
            }
          }
        }
      }
    }
    while (-[TSTCellIterator getNext:](v11, "getNext:", v19));
  }

}

+ (void)searchLayout:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  unint64_t v6;
  TSTLayoutCellIterator *v11;
  int *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  TSTSearchReference *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[4];
  unsigned int v23;
  uint64_t v24;

  v19 = objc_msgSend(a3, "tableInfo");
  v11 = -[TSTLayoutCellIterator initWithLayout:range:flags:]([TSTLayoutCellIterator alloc], "initWithLayout:range:flags:", a3, TSTLayoutGetPartitionRange(a3), 337);
  while (-[TSTCellIterator getNext:](v11, "getNext:", v22, v19, v20))
  {
    if (v24)
      v12 = (int *)(v24 + 104);
    else
      v12 = &TSUInvalidFormat;
    if (*v12 != 267)
    {
      v13 = (void *)NSStringFromNativeTSTCell(v24);
      if (v13)
      {
        v14 = v13;
        v20 = 0;
        v21 = 0;
        v20 = objc_msgSend(v13, "tsu_range");
        v21 = v15;
        while (v21)
        {
          v16 = objc_msgSend(v14, "rangeOfString:searchOptions:updatingSearchRange:", a4, a5, &v20);
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v6 = v6 & 0xFFFFFFFF00000000 | v23;
            v18 = +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", v19, v6, v16, v17);
            objc_msgSend(a3, "calculatePointFromSearchReference:", v18);
            -[TSTSearchReference setSearchReferencePoint:](v18, "setSearchReferencePoint:");
            (*((void (**)(id, TSTSearchReference *))a6 + 2))(a6, v18);
          }
        }
      }
    }
  }

}

+ (void)searchInfo:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
  objc_msgSend(a1, "p_searchInfo:layout:forAnnotationsWithHitBlock:", a3, 0, a4);
}

+ (void)searchLayout:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
  objc_msgSend(a1, "p_searchInfo:layout:forAnnotationsWithHitBlock:", objc_msgSend(a3, "tableInfo"), a3, a4);
}

@end
