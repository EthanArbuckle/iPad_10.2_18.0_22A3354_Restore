@implementation UIAXApplyPhoneContextTokenToString

void __UIAXApplyPhoneContextTokenToString_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v9, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 32)) == 0x7FFFFFFFFFFFFFFFLL;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

void __UIAXApplyPhoneContextTokenToString_block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "length");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  LODWORD(v8) = objc_msgSend(v6, "BOOLValue");
  if ((_DWORD)v8)
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, objc_msgSend(*(id *)(a1 + 32), "length") - v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (*(_QWORD *)(a1 + 56) - 1 > a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
}

@end
