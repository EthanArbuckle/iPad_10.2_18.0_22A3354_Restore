@implementation WAUIFormattedTimeString

void __WAUIFormattedTimeString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a3, a4);
      goto LABEL_8;
    }

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("a"));
  v13 = 48;
  if (v12)
    v13 = 40;
  v11 = *(id *)(a1 + v13);
  v15 = *MEMORY[0x24BDF65F8];
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v14, a3, a4);

LABEL_8:
}

@end
