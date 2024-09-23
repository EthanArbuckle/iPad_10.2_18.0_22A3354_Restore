@implementation NSMutableAttributedString(SCROAttributedStringExtras)

- (void)scrAttributedStringTrimTrailingNewlines
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  int v11;
  id v12;
  id v14;
  id v15;

  objc_msgSend(a1, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 < 1)
  {
    v12 = v2;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:", v4, 4);
      v8 = v6 == v3 - 1 && v7 == 1;
      v9 = v8;
      if (v8)
        objc_msgSend(a1, "replaceCharactersInRange:withString:", v6, v7, &stru_24CC1DB88);
      objc_msgSend(a1, "string");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v14, "length");
      v11 = v10 > 0 ? v9 : 0;
      if (v11 != 1)
        break;
      v3 = v10;
      v12 = v14;
      v2 = v14;
      if (v5++ >= 0x64)
        goto LABEL_21;
    }
    v12 = v14;
  }
LABEL_21:
  v15 = v12;

}

@end
