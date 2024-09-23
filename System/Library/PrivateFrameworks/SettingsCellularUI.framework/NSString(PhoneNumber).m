@implementation NSString(PhoneNumber)

- (id)unformattedPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("+() -"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", &stru_24D5028C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToPhoneNumber:()PhoneNumber
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqualToString:", v4) & 1) == 0)
  {
    objc_msgSend(a1, "unformattedPhoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unformattedPhoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && (v8 = objc_msgSend(v6, "length"), v8 <= objc_msgSend(v7, "length")))
    {
      v10 = v7;
      v11 = v6;
    }
    else
    {
      if (!objc_msgSend(v7, "length") || (v9 = objc_msgSend(v7, "length"), v9 >= objc_msgSend(v6, "length")))
      {
        v5 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v10 = v6;
      v11 = v7;
    }
    v5 = objc_msgSend(v10, "rangeOfString:", v11) != 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

@end
