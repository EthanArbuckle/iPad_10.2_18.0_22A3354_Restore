@implementation WFParentDirectoryUtilities

+ (id)commonRootForFileURLs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 2)
      {
        v8 = 1;
        do
        {
          objc_msgSend(v3, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pathComponents");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v5, "count");
          if (objc_msgSend(v10, "count") < v11)
            v11 = objc_msgSend(v10, "count");
          v12 = 0;
          if (v11)
          {
            while (1)
            {
              objc_msgSend(v5, "objectAtIndex:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectAtIndex:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToString:", v14);

              if (!v15)
                break;
              if (v11 == ++v12)
              {
                v12 = v11;
                break;
              }
            }
          }
          if (v12 < objc_msgSend(v5, "count"))
          {
            objc_msgSend(v5, "subarrayWithRange:", 0, v12);
            v16 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v16;
          }
          v17 = objc_msgSend(v5, "count");

          if (!v17)
            break;
          ++v8;
        }
        while (v8 < objc_msgSend(v3, "count"));
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
