@implementation IKImageElement(TVMLKitAdditions)

- (uint64_t)tv_associatedViewElement
{
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", objc_opt_class());
}

- (uint64_t)tv_isResource
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "tv_isResourceURL");

  return v2;
}

- (id)tv_resourceImage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "tv_isResourceURL"))
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "tv_resourceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageForResource:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_isSymbol
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "tv_isSymbolURL");

  return v2;
}

- (id)tv_symbolImage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "tv_isSymbolURL"))
  {
    v2 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v1, "tv_symbolName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "systemImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)tv_imageProxyWithLayout:()TVMLKitAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", a3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tv_urlWithLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "tv_isResourceURL")
    || (+[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decoratorSize"),
        objc_msgSend(v6, "_imageProxyForResourceURL:scaleToSize:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (!objc_msgSend(v5, "tv_isSymbolURL"))
      goto LABEL_5;
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageSymbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decoratorSize");
    objc_msgSend(v8, "_imageProxyForSymbolURL:imageSymbolConfiguration:scaleToSize:", v5, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_5:
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_imageProxyFromElement:withLayout:", a1, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        +[TVViewFactory imageProxyWithURL:](TVViewFactory, "imageProxyWithURL:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v7;
}

- (uint64_t)tv_imageProxy
{
  return objc_msgSend(a1, "tv_imageProxyWithLayout:", 0);
}

- (double)tv_imageScaleToSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;

  +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", 0, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decoratorSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(a1, "tv_urlWithLayout:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 == *MEMORY[0x24BDBF148] && v6 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    if (objc_msgSend(v7, "tv_isResourceURL"))
    {
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_resourceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageForResource:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v8, "tv_isSymbolURL"))
        goto LABEL_12;
      v13 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v8, "tv_symbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "imageSymbolConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "systemImageNamed:withConfiguration:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v12;

    if (v14)
    {
      objc_msgSend(v14, "size");
      v4 = v15;

    }
  }
LABEL_12:

  return v4;
}

- (uint64_t)tv_imageType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "elementName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("img")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("fullscreenImg")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("decorationImage")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("heroImg")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:centerGrowth:cropCode:
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v12 = a7;
  objc_msgSend(a1, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("isTemplated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length")
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v14, "BOOLValue"))
  {
    objc_msgSend(a1, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("src"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(a1, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("format"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[TVURLDescription initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:]([TVURLDescription alloc], "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v16, v12, v18, a2, a3, a4);
      objc_msgSend(v19, "setCenterGrowth:", a6);
      +[TVViewFactory imageURLWithDescription:](TVViewFactory, "imageURLWithDescription:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:
{
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cropCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tv_urlWithSize:focusSizeIncrease:centerGrowth:cropCode:", 0, v9, a2, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tv_urlWithLayout:()TVMLKitAdditions
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "decoratorSize");
  if (v5 == 0.0 || (objc_msgSend(v4, "decoratorSize"), v6 == 0.0))
  {
    v7 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      -[IKImageElement(TVMLKitAdditions) tv_urlWithLayout:].cold.1(v7);
  }
  objc_msgSend(a1, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cropCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v4, "cropCode");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v4, "decoratorSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "focusSizeIncrease");
  objc_msgSend(a1, "tv_urlWithSize:focusSizeIncrease:centerGrowth:cropCode:", objc_msgSend(v4, "centerGrowth"), v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)tv_urlWithLayout:()TVMLKitAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222D98000, log, OS_LOG_TYPE_DEBUG, "Image layout decorator size is 0", v1, 2u);
}

@end
