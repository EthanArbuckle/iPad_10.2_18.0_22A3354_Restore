@implementation EDColumnInfoCollection

- (EDColumnInfoCollection)initWithResources:(id)a3 worksheet:(id)a4
{
  id v6;
  id v7;
  EDColumnInfoCollection *v8;
  EDColumnInfoCollection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDColumnInfoCollection;
  v8 = -[EDCollection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->mWorksheet, v7);
    objc_storeWeak((id *)&v9->mResources, v6);
  }

  return v9;
}

- (id)columnInfoForColumnNumber:(int)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[EDCollection count](self, "count");
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    return v8;
  }
  v6 = v5;
  v7 = 0;
  while (1)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "range");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      goto LABEL_6;
    if ((int)objc_msgSend(v9, "firstColumn") > a3)
      break;
    if ((int)objc_msgSend(v10, "lastColumn") >= a3)
      goto LABEL_9;
LABEL_6:

    if (v6 == ++v7)
      goto LABEL_7;
  }

  v10 = v8;
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)columnInfoCreateIfNilForColumnNumber:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;
  id v18;
  void *v19;

  v3 = *(_QWORD *)&a3;
  -[EDColumnInfoCollection columnInfoForColumnNumber:](self, "columnInfoForColumnNumber:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "range");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "firstColumn");
    v9 = objc_msgSend(v7, "lastColumn");
    v10 = v9;
    if ((_DWORD)v8 != (_DWORD)v3 || (_DWORD)v9 != (_DWORD)v3)
    {
      +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, v3, v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRange:", v11);

      if ((int)v8 < (int)v3)
      {
        v12 = (void *)objc_msgSend(v6, "copy");
        +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, v8, (v3 - 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRange:", v13);

        -[EDSortedCollection addObject:](self, "addObject:", v12);
      }
      if ((int)v10 > (int)v3)
      {
        v14 = (void *)objc_msgSend(v6, "copy");
        +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, (v3 + 1), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setRange:", v15);

        -[EDSortedCollection addObject:](self, "addObject:", v14);
      }
    }
    v16 = v6;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v18 = objc_loadWeakRetained((id *)&self->mWorksheet);
    +[EDColumnInfo columnInfoWithResources:worksheet:](EDColumnInfo, "columnInfoWithResources:worksheet:", WeakRetained, v18);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, v3, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRange:", v19);

    -[EDSortedCollection addObject:](self, "addObject:", v16);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorksheet);
  objc_destroyWeak((id *)&self->mResources);
}

@end
