@implementation VUIMediaTagsImageHelper

uint64_t __37__VUIMediaTagsImageHelper_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)imageCache;
  imageCache = v0;

  objc_msgSend((id)imageCache, "setCountLimit:", 20);
  return objc_msgSend((id)imageCache, "setName:", CFSTR("MediaTagsImageHelperCache"));
}

+ (void)initialize
{
  if (initialize_onceToken_4 != -1)
    dispatch_once(&initialize_onceToken_4, &__block_literal_global_83);
}

+ (id)imageWithName:(id)a3 flatten:(BOOL)a4 accessibilityDescription:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend((id)imageCache, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DC69B0], "imageForResource:accessibilityDescription:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      if (v6)
      {
        objc_msgSend(v10, "vuiTemplateImage");
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      objc_msgSend((id)imageCache, "setObject:forKey:", v9, v7);
    }
  }

  return v9;
}

@end
