@implementation NSURL(WFPathUtilities)

- (id)wf_normalizedFileURLForROSP
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  if ((objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    objc_msgSend(a1, "scheme");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    if (v3)
      return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", CFSTR("file"));
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v30 = 0;
    v8 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v30);
    v9 = v30;
    if (v8)
    {
      v10 = a1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLsForDirectory:inDomains:", 1, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByStandardizingPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByStandardizingPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v17, "hasPrefix:", v15) & 1) != 0)
        {
          objc_msgSend(v7, "pathComponents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          v28 = v19;
          objc_msgSend(v19, "insertObject:atIndex:", CFSTR("/System"), 0);
          objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v7, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setPath:", v21);

          objc_msgSend(v20, "URL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9;
          v23 = objc_msgSend(v22, "checkResourceIsReachableAndReturnError:", &v29);
          v24 = v17;
          v25 = v15;
          v26 = v29;

          if (v23)
            v27 = v22;
          else
            v27 = a1;
          v10 = v27;

          v9 = v26;
          v15 = v25;
          v17 = v24;
          v5 = v20;
        }
        else
        {
          v10 = a1;
        }

      }
      else
      {
        v10 = a1;
      }

    }
  }
  else
  {
    v10 = a1;
  }

  return v10;
}

@end
