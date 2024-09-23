@implementation NSString(WFPathUtilities)

- (const)wf_bestGuessURL
{
  __CFString *v1;
  uint64_t v2;
  void *v3;
  int v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  const __CFURL *v21;
  const __CFURL *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  v1 = (__CFString *)objc_msgSend(a1, "copy");
  if (-[__CFString hasPrefix:](v1, "hasPrefix:", CFSTR("~")))
  {
    -[__CFString stringByExpandingTildeInPath](v1, "stringByExpandingTildeInPath");
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (__CFString *)v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v1);

  if (v4)
  {
    v5 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, -[__CFString hasSuffix:](v1, "hasSuffix:", CFSTR("/")));
    v6 = v5;
    if (v5 && CFURLCanBeDecomposed(v5))
      goto LABEL_18;

  }
  if (-[__CFString hasPrefix:](v1, "hasPrefix:", CFSTR("feeds:")))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFURLCreateWithString(0, v1, 0);
    v8 = v7;
    if (v7 && CFURLCanBeDecomposed(v7))
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v10;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v11;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v12;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPasswordAllowedCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29[4] = v13;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLUserAllowedCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[5] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __44__NSString_WFPathUtilities__wf_bestGuessURL__block_invoke;
      v27 = &unk_1E7AED1B8;
      v18 = v17;
      v28 = v18;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v24);
      objc_msgSend(v18, "addCharactersInString:", CFSTR(":/"), v24, v25, v26, v27);
      v19 = (void *)objc_msgSend(v18, "copy");
      -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v1, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
      v21 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21 && CFURLCanBeDecomposed(v21))
        v6 = v22;
      else
        v6 = 0;

    }
  }
LABEL_18:

  return v6;
}

- (id)wf_normalizedPathForROSP
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (!objc_msgSend(a1, "length"))
    return a1;
  objc_msgSend(a1, "wf_bestGuessURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "wf_normalizedFileURLForROSP");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v3))
    {
      v5 = a1;
    }
    else
    {
      v7 = (void *)objc_msgSend(a1, "mutableCopy");
      v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("/Applications"));
      if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
        objc_msgSend(v7, "replaceCharactersInRange:withString:", v8, v9, CFSTR("/System/Applications"));
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (v13 = 0, objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v13)))
        v12 = (id)objc_msgSend(v7, "copy");
      else
        v12 = a1;
      v5 = v12;

    }
  }
  else
  {
    v5 = a1;
  }

  return v5;
}

- (id)wf_expandingTildeInPath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "wf_realHomeDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
