@implementation VUIAppIconImageService

+ (void)fetchIconForInstallable:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  void (**v22)(id, void *);
  id v23;
  double v24;
  double v25;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(a1, "_keyForInstallable:size:", v9, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(a1, "_cachedImageForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10[2](v10, v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB34C8];
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __66__VUIAppIconImageService_fetchIconForInstallable_size_completion___block_invoke;
      v19 = &unk_1E9FA14E0;
      v23 = a1;
      v20 = v9;
      v24 = width;
      v25 = height;
      v21 = v11;
      v22 = v10;
      objc_msgSend(v13, "blockOperationWithBlock:", &v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue", v16, v17, v18, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addOperation:", v14);

    }
  }
  else
  {
    v10[2](v10, 0);
  }

}

void __66__VUIAppIconImageService_fetchIconForInstallable_size_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 56), "_imageURLForInstallable:size:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("VUIAppIconImageService: fetching app icon for key: %@ at URL: %@"), *(_QWORD *)(a1 + 40), v5);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  v9 = CFSTR("YES");
  if (!v6)
    v9 = CFSTR("NO");
  NSLog(CFSTR("VUIAppIconImageService: fetched image: %@ error: %@"), v9, v7);
  v10 = 0;
  if (objc_msgSend(v6, "length") && !v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_cacheImage:forKey:", v10, *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (double)iconCornerRadiusForSize:(CGSize)a3
{
  double result;
  void *v5;
  double v6;
  double v7;

  if (a3.width == 60.0 && a3.height == 60.0)
  {
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continuousCornerRadius");
    v7 = v6;

    return v7;
  }
  else
  {
    VUIRoundValue();
  }
  return result;
}

+ (id)_imageURLForInstallable:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGAffineTransform v13;

  height = a4.height;
  width = a4.width;
  v6 = (void *)MEMORY[0x1E0DC3BF8];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  CGAffineTransformMakeScale(&v13, v10, v10);
  objc_msgSend(v7, "appIconURLForSize:", height * v13.c + v13.a * width, height * v13.d + v13.b * width);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_keyForInstallable:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(a1, "_imageURLForInstallable:size:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "_MD5StringForString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.png"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("VUIAppIconImageService -- did not find image URL found for installable: %@"), v7);
    v12 = 0;
  }

  return v12;
}

+ (id)_MD5StringForString:(id)a3
{
  const char *v3;
  void *v4;
  CC_LONG v5;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = (void *)v3;
  if (v3)
  {
    v5 = strlen(v3);
    CC_MD5(v4, v5, md);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 16; ++i)
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  }
  return v4;
}

+ (void)_cacheImage:(id)a3 forKey:(id)a4
{
  id v6;
  UIImage *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = (UIImage *)a3;
  objc_msgSend(a1, "_cachePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByExpandingTildeInPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  UIImagePNGRepresentation(v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v15 = objc_msgSend(v14, "writeToFile:options:error:", v13, 1, &v18);
  v16 = v18;
  v17 = v16;
  if ((v15 & 1) == 0)
    NSLog(CFSTR("VUIAppIconImageService -- failed to write image cache for key: %@ error: %@"), v6, v16);

}

+ (id)_cachedImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "_cachePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByExpandingTildeInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v11 = (void *)objc_msgSend(v9, "initWithData:scale:", v8);

  return v11;
}

+ (id)_cachePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.WatchListKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("channel-icons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
