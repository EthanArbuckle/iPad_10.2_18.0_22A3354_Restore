@implementation RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock

void ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_2;
  v13[3] = &unk_24C4359D0;
  v10 = *(id *)(a1 + 40);
  v14 = v9;
  v15 = v10;
  v11 = v9;
  v12 = (id)objc_msgSend(v6, "addAction:", v13);

}

uint64_t ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v9;
  }
  v8 = v7;
  _RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock(v5, v7, *(_QWORD *)(a1 + 40));

}

@end
