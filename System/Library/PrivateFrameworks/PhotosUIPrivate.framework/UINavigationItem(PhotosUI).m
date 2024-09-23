@implementation UINavigationItem(PhotosUI)

- (uint64_t)pu_shouldUpdateLeftBarButtonItems:()PhotosUI
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "leftBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_pu_shouldUpdateBarButtonItems:withNewBarButtonItems:", v5, v4);

  return v6;
}

- (uint64_t)pu_shouldUpdateRightBarButtonItems:()PhotosUI
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "rightBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_pu_shouldUpdateBarButtonItems:withNewBarButtonItems:", v5, v4);

  return v6;
}

- (uint64_t)_pu_shouldUpdateBarButtonItems:()PhotosUI withNewBarButtonItems:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_12:
    v15 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isSystemItem")
        || !objc_msgSend(v10, "isSystemItem")
        || (v11 = objc_msgSend(v9, "systemItem"), v11 != objc_msgSend(v10, "systemItem"))
        || (objc_msgSend(v9, "width"), v13 = v12, objc_msgSend(v10, "width"), v13 != v14))
      {
        if (v9 != v10)
          break;
      }

      if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_10;
    }

    goto LABEL_12;
  }
LABEL_10:
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)pu_setDefaultBackBarButtonItemWithTitle:()PhotosUI
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC34F0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTitle:style:target:action:", v5, 0, 0, 0);

  objc_msgSend(a1, "setBackBarButtonItem:", v6);
}

@end
