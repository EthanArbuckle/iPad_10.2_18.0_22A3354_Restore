@implementation UIImage(VideosUICore)

+ (uint64_t)vuiImageWithCGImage:()VideosUICore
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:");
}

+ (id)vuiImageNamed:()VideosUICore
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vuiImageNamed:inBundle:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vuiImageNamed:inBundle:", v3, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (uint64_t)vuiImageNamed:()VideosUICore inBundle:
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:withConfiguration:", a3, a4, 0);
}

- (uint64_t)vuiTemplateImage
{
  return objc_msgSend(a1, "imageWithRenderingMode:", 2);
}

+ (id)vuiSystemImageNamed:()VideosUICore withConfiguration:accessibilityDescription:
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v9)
LABEL_3:
    objc_msgSend(v10, "setAccessibilityLabel:", v9);
LABEL_4:

  return v10;
}

- (uint64_t)vuiCGImage
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

- (NSData)vuiJPEGRepresentation
{
  return UIImageJPEGRepresentation(a1, 1.0);
}

@end
