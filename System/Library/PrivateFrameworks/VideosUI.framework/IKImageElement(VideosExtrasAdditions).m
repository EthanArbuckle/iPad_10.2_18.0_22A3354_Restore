@implementation IKImageElement(VideosExtrasAdditions)

- (id)bestURL
{
  void *v2;
  void *v3;
  _OWORD v5[4];
  _BYTE v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "srcset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v5, 0, sizeof(v5));
    if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v5, v6, 16))
    {
      objc_msgSend(v3, "objectForKey:", **((_QWORD **)&v5[0] + 1));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)cachePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bestURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E9FF3598);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)accessoryType
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "bestURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("arrow"));
  return v4;
}

- (id)resourceImage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "bestURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("video")))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", CFSTR("ExtrasPlayGlyph"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
