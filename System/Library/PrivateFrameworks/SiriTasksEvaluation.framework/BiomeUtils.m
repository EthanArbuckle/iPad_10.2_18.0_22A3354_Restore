@implementation BiomeUtils

+ (id)getEventsFromStream:(id)a3 startingAt:(id)a4 until:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x24BDBCEB8];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(v10, "publisherFromStartTime:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Publisher looks like this: %@"), v14);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __51__BiomeUtils_getEventsFromStream_startingAt_until___block_invoke_2;
  v21[3] = &unk_24CF87248;
  v22 = v7;
  v15 = v11;
  v23 = v15;
  v16 = v7;
  v17 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global, v21);
  v18 = v23;
  v19 = v15;

  return v19;
}

void __51__BiomeUtils_getEventsFromStream_startingAt_until___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_QWORD *)(a1 + 32)
    || (objc_msgSend(v3, "timestamp"),
        v5 = v4,
        objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate"),
        v6 = v8,
        v5 < v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    v6 = v8;
  }

}

+ (id)getEventsFromPublisher:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  NSLog(CFSTR("Publisher looks like this: %@"), v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__BiomeUtils_getEventsFromPublisher___block_invoke_2;
  v8[3] = &unk_24CF87290;
  v5 = v4;
  v9 = v5;
  v6 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", &__block_literal_global_3, v8);

  return v5;
}

uint64_t __37__BiomeUtils_getEventsFromPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
