@implementation UIImageView(VideosUICore)

+ (id)vui_imageViewWithFrame:()VideosUICore
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", a1, a2, a3, a4);
}

+ (id)vui_imageViewWithImage:()VideosUICore
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CEA658];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = a3;
  objc_msgSend(v3, "vui_imageViewWithFrame:", v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  return v9;
}

@end
