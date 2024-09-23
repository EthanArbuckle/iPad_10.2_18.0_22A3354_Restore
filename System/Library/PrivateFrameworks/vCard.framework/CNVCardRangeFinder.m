@implementation CNVCardRangeFinder

+ (id)allRangesInData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  objc_msgSend(a1, "rangesInData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "allObjects:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:right:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)rangesInData:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))();
  v5 = (void *)MEMORY[0x1E0D13AE8];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__CNVCardRangeFinder_rangesInData___block_invoke;
    v8[3] = &unk_1E956F9B8;
    v9 = v3;
    objc_msgSend(v5, "observableWithBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __35__CNVCardRangeFinder_rangesInData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "length");
  v5 = +[CNVCardDataAnalyzer analyzeData:](CNVCardDataAnalyzer, "analyzeData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(CFSTR("BEGIN:VCARD"), "dataUsingEncoding:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("END:VCARD"), "dataUsingEncoding:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\r"), "dataUsingEncoding:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = 0;
    do
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v6, 0, v10, v4);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v13 = v11;
      v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v7, 0, v11 + v12, objc_msgSend(*(id *)(a1 + 32), "length") - (v11 + v12));
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      do
      {
        do
        {
          v10 = v14 + v15;
          v16 = objc_msgSend(*(id *)(a1 + 32), "length");
          v4 = v16 - v10;
          v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v8, 2, v10, v16 - v10);
        }
        while (v14 != 0x7FFFFFFFFFFFFFFFLL);
        v14 = objc_msgSend(*(id *)(a1 + 32), "rangeOfData:options:range:", v9, 2, v10, v4);
      }
      while (v14 != 0x7FFFFFFFFFFFFFFFLL);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v13, v10 - v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "observerDidReceiveResult:", v17);

    }
    while (v4);
  }
  objc_msgSend(v3, "observerDidComplete");
  v18 = objc_alloc_init(MEMORY[0x1E0D139B8]);

  return v18;
}

@end
