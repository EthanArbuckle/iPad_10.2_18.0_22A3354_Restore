@implementation CAMLLoader

- (CAMLLoader)init
{
  CAMLLoader *v2;
  NSCache *v3;
  NSCache *resourceCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLLoader;
  v2 = -[CAMLLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    resourceCache = v2->_resourceCache;
    v2->_resourceCache = v3;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_resourceCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  }
  return v2;
}

- (id)loadCAMLFile:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0C99D50];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContentsOfURL:options:error:", v5, 1, 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1);
  v7 = objc_alloc_init(MEMORY[0x1E0CD27B8]);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v9);

  objc_msgSend(v7, "parseData:", v6);
  objc_msgSend(v7, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  return v10;
}

- (id)CAMLParser:(id)a3 resourceForURL:(id)a4
{
  id v5;
  CGImage *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFData *v14;
  CGImageSource *v15;
  CGImageRef ImageAtIndex;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSCache objectForKey:](self->_resourceCache, "objectForKey:", v5);
  v6 = (CGImage *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasSuffix:", CFSTR(".heic"));

    if (v8)
    {
      objc_msgSend(v5, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WUBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLForResource:withExtension:subdirectory:", v10, v12, CFSTR("Mica"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
      v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v15 = CGImageSourceCreateWithData(v14, 0);
      v21 = *MEMORY[0x1E0CBD250];
      v22[0] = MEMORY[0x1E0C9AAB0];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
      CFRelease(v15);
      v6 = ImageAtIndex;
      if (v6)
      {
        -[NSCache setObject:forKey:](self->_resourceCache, "setObject:forKey:", v6, v5);
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Asset is missing: %@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      CGImageRelease(v6);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5
{
  -[NSCache setObject:forKey:](self->_resourceCache, "setObject:forKey:", a4, a5);
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = a4;
  v5 = (void *)ClassSubstitutions___classSubstitutions;
  if (!ClassSubstitutions___classSubstitutions)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "initWithObjectsAndKeys:", v19, CFSTR("LKState"), v18, CFSTR("LKEventHandler"), v6, CFSTR("LKStateAddAnimation"), v7, CFSTR("LKStateAddElement"), v8, CFSTR("LKStateElement"), v9, CFSTR("LKStateRemoveAnimation"), v10, CFSTR("LKStateRemoveElement"), v11, CFSTR("LKStateSetValue"), v12,
            CFSTR("LKStateSetProperty"),
            v13,
            CFSTR("LKStateTransition"),
            objc_opt_class(),
            CFSTR("LKStateTransitionElement"),
            0);
    v15 = (void *)ClassSubstitutions___classSubstitutions;
    ClassSubstitutions___classSubstitutions = v14;

    v5 = (void *)ClassSubstitutions___classSubstitutions;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v16;
}

- (NSCache)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceCache, 0);
}

@end
