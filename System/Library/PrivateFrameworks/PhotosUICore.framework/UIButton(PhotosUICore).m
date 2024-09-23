@implementation UIButton(PhotosUICore)

- (void)px_updateTitleUsingBlock:()PhotosUICore
{
  void *v4;
  id v5;

  (*(void (**)(uint64_t))(a3 + 16))(a3);
  objc_msgSend(a1, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

}

- (void)px_setTitle:()PhotosUICore orAttributedTitle:forState:
{
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v9 = a4;
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIButton+PhotosUICore.m"), 43, CFSTR("can't set both title and attributed title on a button"));

    }
    objc_msgSend(a1, "setTitle:forState:", 0, a5);
    objc_msgSend(a1, "setAttributedTitle:forState:", v9, a5);
  }
  else
  {
    objc_msgSend(a1, "setAttributedTitle:forState:", 0, a5);
    objc_msgSend(a1, "setTitle:forState:", v11, a5);
  }

}

+ (id)px_buttonWithPXType:()PhotosUICore color:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentEdgeInsets:", 6.0, 16.0, 6.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", a3, v5, 0, 6.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImage:forState:", v7, 0);

  if (a3)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(v6, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(v6, "setTitleColor:forState:", v9, 0);
  return v6;
}

+ (id)px_buttonBackgroundImageForType:()PhotosUICore color:cornerRadius:controlState:
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double height;
  double y;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CGSize v20;
  CGRect v21;
  CGRect v22;

  v9 = a5;
  if (px_buttonBackgroundImageForType_color_cornerRadius_controlState__onceToken != -1)
    dispatch_once(&px_buttonBackgroundImageForType_color_cornerRadius_controlState__onceToken, &__block_literal_global_257407);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u-%p-%u"), a4, v9, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)px_buttonBackgroundImageForType_color_cornerRadius_controlState__cachedBackgroundImages, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = ceil(a1 * 1.528665);
    height = v12 * 2.0 + 1.0;
    y = 0.0;
    v20.width = height;
    v20.height = height;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend(v9, "set");
    if (a4 == 1)
    {
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.width = v12 * 2.0 + 1.0;
      v21.size.height = v21.size.width;
      v22 = CGRectInset(v21, 0.5, 0.5);
      y = v22.origin.y;
      height = v22.size.height;
      a1 = a1 + -0.5;
    }
    else
    {
      v22.size.width = v12 * 2.0 + 1.0;
      v22.origin.x = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, y, v22.size.width, height, a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a4)
    {
      if (a4 == 1)
        objc_msgSend(v15, "stroke");
    }
    else
    {
      objc_msgSend(v15, "fill");
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v17, "resizableImageWithCapInsets:", v12, v12, v12, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
    {
      objc_msgSend(v11, "imageWithRenderingMode:", 2);
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v18;
    }
    objc_msgSend((id)px_buttonBackgroundImageForType_color_cornerRadius_controlState__cachedBackgroundImages, "setObject:forKeyedSubscript:", v11, v10);

  }
  return v11;
}

@end
