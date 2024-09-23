@implementation INImage(WFImage)

- (id)wf_image
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(a1, "_isSystem"))
  {
    v2 = (void *)MEMORY[0x1E0DC7B70];
    objc_msgSend(a1, "_name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "glyphNamed:pointSize:", v3, 17.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithWhite:alpha:", 1.0, 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageWithTintColor:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
LABEL_6:
    v11 = objc_msgSend(a1, "_renderingMode");
    if (v11 == 2)
      v12 = 2;
    else
      v12 = v11 == 1;
    if (v12 != objc_msgSend(v4, "renderingMode"))
    {
      objc_msgSend(v4, "imageWithRenderingMode:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v13;
    }
    return v4;
  }
  objc_msgSend(a1, "_imageData");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v4 = 0;
    return v4;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0DC7B70], "imageWithDeviceScreenScaleImageData:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_6;
  return v4;
}

+ (id)imageWithWFImage:()WFImage
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "PNGRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithImageData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sizeInPoints");
  v8 = v7;
  objc_msgSend(v4, "sizeInPoints");
  objc_msgSend(v6, "_setImageSize:", v8);
  v9 = objc_msgSend(v4, "renderingMode");

  if (v9 == 2)
    v10 = 2;
  else
    v10 = v9 == 1;
  objc_msgSend(v6, "_setRenderingMode:", v10);
  return v6;
}

@end
