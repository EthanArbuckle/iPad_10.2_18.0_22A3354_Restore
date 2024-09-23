@implementation NSAttributedString

void __94__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnMultipleAttributesWithLimit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
  if (objc_msgSend(*(id *)(a1 + 40), "count") >= (unint64_t)(*(_QWORD *)(a1 + 56) - 1))
    *a5 = 1;

}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcSplitBasedOnAttribute_limit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
  if (objc_msgSend(*(id *)(a1 + 40), "count") >= (unint64_t)(*(_QWORD *)(a1 + 56) - 1))
    *a5 = 1;

}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v9 = a2;
  v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke_2;
  v12[3] = &unk_24CB25668;
  v11 = v9;
  v13 = v11;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  v17 = a3;
  v18 = a4;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (objc_msgSend(*(id *)(a1 + 48), "count") >= (unint64_t)(*(_QWORD *)(a1 + 56) - 1))
    *a5 = 1;

}

void __82__NSAttributedString_SCRCAttributedStringExtras__scrcIndexSetForAttributes_limit___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = objc_claimAutoreleasedReturnValue();
    if ((id)v10 == v5)
    {

    }
    else
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(v5, "isEqual:", v6);

      if ((v12 & 1) != 0)
        goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v15, v17);

    objc_msgSend(*(id *)(a1 + 48), "addIndex:", *(_QWORD *)(a1 + 64));
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, v17);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", v8);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v14, v17);

    v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
LABEL_10:

}

@end
