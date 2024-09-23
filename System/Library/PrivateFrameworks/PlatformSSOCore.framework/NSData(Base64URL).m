@implementation NSData(Base64URL)

- (id)psso_base64URLEncodedString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("="));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)psso_initWithBase64URLEncodedString:()Base64URL
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "length") & 3;
    v6 = &stru_251503878;
    if ((_DWORD)v5 == 2)
      v6 = CFSTR("==");
    if ((_DWORD)v5 == 3)
      v7 = CFSTR("=");
    else
      v7 = v6;
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(a1, "initWithBase64EncodedString:options:", v10, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
