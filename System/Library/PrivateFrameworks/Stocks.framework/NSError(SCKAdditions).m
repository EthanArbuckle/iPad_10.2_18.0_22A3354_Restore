@implementation NSError(SCKAdditions)

- (uint64_t)sck_hasUnderlyingErrorCode:()SCKAdditions
{
  void *v5;
  int v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  if (!v6)
    return 0;
  if (objc_msgSend(a1, "code") != a3)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EE8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __52__NSError_SCKAdditions__sck_hasUnderlyingErrorCode___block_invoke;
      v14[3] = &__block_descriptor_40_e24_B32__0__NSError_8Q16_B24l;
      v14[4] = a3;
      objc_msgSend(v10, "indexesOfObjectsPassingTest:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "count");
      v7 = v12 == objc_msgSend(v9, "count");

      return v7;
    }
    return 0;
  }
  return 1;
}

@end
