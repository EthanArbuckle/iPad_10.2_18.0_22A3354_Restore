@implementation WBSReaderNavigationPolicyDecider

+ (BOOL)readerPageWithURL:(id)a3 canLoadFrameWithURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "safari_isHTTPFamilyURL"))
  {
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v5, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v7);

      if ((v9 & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(.+\\.)?(youtube(-nocookie)?\\.com|vimeo\\.com|dailymotion\\.com|soundcloud\\.com|mixcloud\\.com|embedly\\.com|embed\\.ly)\\.?$"), 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v10 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(.+\\.)?(twitter\\.com)\\.?$"), 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v14 != 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

@end
