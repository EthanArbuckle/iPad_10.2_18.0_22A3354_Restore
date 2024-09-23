@implementation UIImage(VideosExtras)

+ (id)imageForPlaceholderURL:()VideosExtras
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (imageForPlaceholderURL__onceToken != -1)
    dispatch_once(&imageForPlaceholderURL__onceToken, &__block_literal_global_118);
  objc_msgSend((id)imageForPlaceholderURL____resourceNameMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "vui_videosUIImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
