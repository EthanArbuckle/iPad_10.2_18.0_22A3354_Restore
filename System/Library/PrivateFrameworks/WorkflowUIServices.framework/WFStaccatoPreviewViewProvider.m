@implementation WFStaccatoPreviewViewProvider

+ (id)leadingViewForConfiguredAction:(id)a3
{
  return (id)objc_msgSend(a3, "leadingApertureView");
}

+ (id)trailingViewForConfiguredAction:(id)a3
{
  return (id)objc_msgSend(a3, "trailingApertureView");
}

+ (id)primarySymbolForConfiguredAction:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  v3 = a3;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Accessibility"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("accessibility.fill");
  }
  else
  {
    objc_msgSend(v3, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Camera"));

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("camera.fill");
    }
    else
    {
      objc_msgSend(v3, "sectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Magnifier"));

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("plus.magnifyingglass");
      }
      else
      {
        objc_msgSend(v3, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Translate"));

        if (v12)
          v6 = CFSTR("translate");
        else
          v6 = 0;
      }
    }
  }

  return (id)v6;
}

+ (id)secondarySymbolForConfiguredAction:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Accessibility"));

  if (v5)
  {
    v6 = v3;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "intent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serializedParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKey:", CFSTR("feature"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v12 = v10;

      objc_msgSend(v12, "objectForKey:", CFSTR("symbol"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("systemName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v11 = v15;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
