@implementation NSURL(VCSUtilities)

+ (uint64_t)VCS_URLForMail:()VCSUtilities
{
  return objc_msgSend(a1, "VCS_URLForAddress:scheme:noAddress:", a3, CFSTR("mailto"), CFSTR("invalid:nomail"));
}

+ (id)VCS_URLForAddress:()VCSUtilities scheme:noAddress:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(a1, "VCS_isValidURI:", v8) & 1) == 0)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("mailto"))
        && (objc_msgSend(v8, "rangeOfString:", CFSTR("@")), v11)
        || objc_msgSend(v9, "isEqualToString:", CFSTR("tel"))
        && objc_msgSend(v8, "VCS_isPhoneNumber"))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@:%@"), v9, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        v8 = v13;
      }
      else
      {
        v17 = v10;
      }

      v8 = v17;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)VCS_isValidURI:()VCSUtilities
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
    v4 = v5 != 0;
  }

  return v4;
}

@end
