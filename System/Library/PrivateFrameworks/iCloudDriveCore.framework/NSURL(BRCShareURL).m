@implementation NSURL(BRCShareURL)

- (id)brc_applicationName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByRemovingPercentEncoding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pages")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("keynote")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("numbers")))
    {
      objc_msgSend(v6, "capitalizedString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (__CFString)brc_applicationBundleID
{
  void *v1;
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  objc_msgSend(a1, "brc_applicationName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("pages"));

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("com.apple.Pages");
  }
  else
  {
    objc_msgSend(v1, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("keynote"));

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("com.apple.Keynote");
    }
    else
    {
      objc_msgSend(v1, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("numbers"));

      if ((v8 & 1) != 0)
        v4 = CFSTR("com.apple.Numbers");
      else
        v4 = (__CFString *)(id)*MEMORY[0x24BE17550];
    }
  }

  return v4;
}

- (const)brc_applicationContainerID
{
  void *v1;
  void *v2;
  char v3;
  const __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  objc_msgSend(a1, "brc_applicationName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("pages"));

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("com.apple.Pages");
  }
  else
  {
    objc_msgSend(v1, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("keynote"));

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("com.apple.Keynote");
    }
    else
    {
      objc_msgSend(v1, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("numbers"));

      if (v8)
        v4 = CFSTR("com.apple.Numbers");
      else
        v4 = 0;
    }
  }

  return v4;
}

- (void)brc_iWorkPathExtensions
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  objc_msgSend(a1, "brc_applicationName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("pages"));

  if ((v3 & 1) != 0)
  {
    v4 = &unk_24FEB4AE0;
  }
  else
  {
    objc_msgSend(v1, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("keynote"));

    if ((v6 & 1) != 0)
    {
      v4 = &unk_24FEB4AF8;
    }
    else
    {
      objc_msgSend(v1, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("numbers"));

      if (v8)
        v4 = &unk_24FEB4B10;
      else
        v4 = 0;
    }
  }

  return v4;
}

@end
