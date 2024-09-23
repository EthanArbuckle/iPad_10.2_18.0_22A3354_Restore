@implementation EBColumnTable

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t ColumnFirst;
  uint64_t ColumnLast;
  uint64_t v12;
  EDColumnInfo *v13;
  void (**v14)(XlCollection *__hidden);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  v14 = &off_24F3A7B40;
  v4 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlCollection *__hidden)))(*(_QWORD *)v4 + 392))(v4, &v14);
  objc_msgSend(v3, "edSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v16 - (_QWORD)v15) & 0x7FFFFFFF8) != 0)
  {
    v8 = 0;
    v9 = ((unint64_t)(v16 - (_QWORD)v15) >> 3);
    do
    {
      ColumnFirst = XlColumnTable::getColumnFirst((XlColumnTable *)&v14, v8);
      ColumnLast = XlColumnTable::getColumnLast((XlColumnTable *)&v14, v8);
      if (ColumnFirst <= 0xFF)
      {
        v12 = ColumnLast;
        if ((ColumnLast & 0x80000000) == 0 && (int)ColumnLast <= 255)
        {
          v13 = -[EDColumnInfo initWithResources:worksheet:]([EDColumnInfo alloc], "initWithResources:worksheet:", v7, v5);
          -[EDColumnInfo setWidthInXlUnits:](v13, "setWidthInXlUnits:", XlColumnTable::getWidth((XlColumnTable *)&v14, v8));
          -[EDColumnInfo setHidden:](v13, "setHidden:", XlColumnTable::isHidden((XlColumnTable *)&v14, v8));
          -[EDColumnInfo setRangeWithFirstColumn:lastColumn:](v13, "setRangeWithFirstColumn:lastColumn:", ColumnFirst, v12);
          if (XlColumnTable::getCellFormat((XlColumnTable *)&v14, v8) != -1)
            -[EDColumnInfo setStyleIndex:](v13, "setStyleIndex:", (int)XlColumnTable::getCellFormat((XlColumnTable *)&v14, v8));
          if (v8 >= ((unint64_t)(v16 - (_QWORD)v15) >> 3))
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          -[EDColumnInfo setOutlineLevel:](v13, "setOutlineLevel:", *(unsigned __int8 *)(v15[v8] + 28));
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      ++v8;
    }
    while (v9 != v8);
  }

  v14 = &off_24F3A7B20;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v15);

}

@end
