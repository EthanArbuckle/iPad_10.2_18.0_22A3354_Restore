@implementation IKTextBadgeAttachment(TVMLKitAdditions)

- (id)tv_imageProxy
{
  return objc_getAssociatedObject(a1, sel_tv_imageProxy);
}

- (void)tv_setImageProxy:()TVMLKitAdditions
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "tv_imageProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_imageProxy, value, (void *)1);
    v5 = value;
  }

}

- (uint64_t)tv_isResolving
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_tv_isResolving);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)tv_setResolving:()TVMLKitAdditions
{
  id v5;

  if (objc_msgSend(a1, "tv_isResolving") != (_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, sel_tv_isResolving, v5, (void *)0x301);

  }
}

- (id)tv_highlightColor
{
  return objc_getAssociatedObject(a1, sel_tv_highlightColor);
}

- (void)tv_setHighlightColor:()TVMLKitAdditions
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "tv_highlightColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_highlightColor, value, (void *)1);
    v5 = value;
  }

}

- (id)tv_currentTintColor
{
  return objc_getAssociatedObject(a1, sel_tv_currentTintColor);
}

- (void)tv_setCurrentTintColor:()TVMLKitAdditions
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "tv_currentTintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_currentTintColor, value, (void *)1);
    v5 = value;
  }

}

- (void)tv_setImage:()TVMLKitAdditions
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  objc_msgSend(a1, "tv_currentTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "tv_currentTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_flatImageWithColor:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v24;
  }

  objc_msgSend(a1, "badge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tv_margin");
  v16 = v15;

  objc_msgSend(v9, "tv_width");
  if (v17 > 0.0)
  {
    objc_msgSend(v9, "tv_height");
    if (v18 > 0.0)
    {
      objc_msgSend(v9, "tv_width");
      v11 = v19;
      objc_msgSend(v9, "tv_height");
LABEL_10:
      v13 = v20;
      goto LABEL_11;
    }
  }
  objc_msgSend(v8, "width");
  if (v21 > 0.0)
  {
    objc_msgSend(v8, "height");
    if (v22 > 0.0)
    {
      objc_msgSend(v8, "width");
      v11 = v23;
      objc_msgSend(v8, "height");
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(a1, "setBounds:", 0.0, v16, v11, v13);
  objc_msgSend(a1, "setImage:", v7);

}

- (void)tv_resolveWithTextLayoutDirection:()TVMLKitAdditions layoutObserver:
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  id v19;
  id location;

  v6 = a4;
  if ((objc_msgSend(a1, "tv_isResolving") & 1) == 0)
  {
    objc_msgSend(a1, "tv_setResolving:", 1);
    objc_msgSend(a1, "badge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "tv_isResourceURL"))
    {
      objc_msgSend(v8, "tv_resourceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageForResource:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "imageAsset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "imageAsset");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithLayoutDirection:", a3 == 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "imageWithTraitCollection:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v15;
        }
        objc_msgSend(a1, "tv_setImage:", v11);
        objc_msgSend(a1, "tv_setResolving:", 0);
        if (v6)
          v6[2](v6);
      }

    }
    else
    {
      objc_initWeak(&location, a1);
      objc_msgSend(v7, "tv_imageProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImageDirection:", a3);
      objc_msgSend(a1, "tv_setImageProxy:", v16);
      objc_msgSend(v16, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
      objc_msgSend(v16, "setLoadSynchronouslyIfCached:", 1);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __92__IKTextBadgeAttachment_TVMLKitAdditions__tv_resolveWithTextLayoutDirection_layoutObserver___block_invoke;
      v17[3] = &unk_24EB85200;
      objc_copyWeak(&v19, &location);
      v18 = v6;
      objc_msgSend(v16, "setCompletionHandler:", v17);
      objc_msgSend(v16, "load");

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }

  }
}

@end
