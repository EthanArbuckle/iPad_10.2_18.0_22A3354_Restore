@implementation PICaptureDebugUtilities

+ (id)captureDebugDirectoryForComposition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  if (NUIsAppleInternal())
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "definition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "image");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "sourceDefinitions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Media/PhotoData/CaptureDebug/"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      if (v13)
      {
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v13, 1);
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v15;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
