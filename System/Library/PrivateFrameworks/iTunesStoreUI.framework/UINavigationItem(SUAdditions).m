@implementation UINavigationItem(SUAdditions)

- (uint64_t)fadeInTitleView
{
  _QWORD v3[5];

  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "setAlpha:", 0.0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__UINavigationItem_SUAdditions__fadeInTitleView__block_invoke;
  v3[3] = &unk_24DE7AF90;
  v3[4] = a1;
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v3, 0.35);
}

- (void)fadeOutTitleView
{
  CGFloat v2;
  CGFloat v3;
  UIImage *ImageFromCurrentImageContext;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  CGSize v8;

  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "bounds");
  v8.width = v2;
  v8.height = v3;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_titleView"), "layer"), "renderInContext:", UIGraphicsGetCurrentContext());
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", ImageFromCurrentImageContext);
  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_titleView"), "superview"), "addSubview:", v5);
  v6[4] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke;
  v7[3] = &unk_24DE7AF90;
  v7[4] = v5;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke_2;
  v6[3] = &unk_24DE7B7E8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v7, v6, 0.35);

}

- (uint64_t)mergeValuesFromItem:()SUAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((void *)result != a3)
  {
    v4 = (void *)result;
    v5 = objc_msgSend(a3, "backBarButtonItem");
    if (v5)
    {
      objc_msgSend(v4, "setBackBarButtonItem:", v5);
      objc_msgSend(a3, "setBackBarButtonItem:", 0);
    }
    v6 = objc_msgSend(a3, "leftBarButtonItem");
    if (v6)
    {
      objc_msgSend(v4, "setLeftBarButtonItem:", v6);
      objc_msgSend(a3, "setLeftBarButtonItem:", 0);
    }
    v7 = objc_msgSend(a3, "prompt");
    if (v7)
    {
      objc_msgSend(v4, "setPrompt:", v7);
      objc_msgSend(a3, "setPrompt:", 0);
    }
    v8 = objc_msgSend(a3, "rightBarButtonItem");
    if (v8)
    {
      objc_msgSend(v4, "setRightBarButtonItem:", v8);
      objc_msgSend(a3, "setRightBarButtonItem:", 0);
    }
    v9 = objc_msgSend(a3, "title");
    if (v9)
    {
      objc_msgSend(v4, "setTitle:", v9);
      objc_msgSend(a3, "setTitle:", 0);
    }
    v10 = objc_msgSend(a3, "titleView");
    if (v10)
    {
      objc_msgSend(v4, "setTitleView:", v10);
      objc_msgSend(a3, "setTitleView:", 0);
    }
    result = objc_msgSend(a3, "hidesBackButton");
    if ((_DWORD)result)
      return objc_msgSend(v4, "setHidesBackButton:", 1);
  }
  return result;
}

- (uint64_t)resetAllValues
{
  uint64_t result;

  objc_msgSend(a1, "setBackBarButtonItem:", 0);
  objc_msgSend(a1, "setHidesBackButton:", 0);
  objc_msgSend(a1, "setLeftBarButtonItem:", 0);
  objc_msgSend(a1, "setPrompt:", 0);
  objc_msgSend(a1, "setRightBarButtonItem:", 0);
  objc_msgSend(a1, "setTitle:", 0);
  objc_msgSend(a1, "titleView");
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a1, "titleView");
    if (result)
      return objc_msgSend(a1, "setTitleView:", 0);
  }
  return result;
}

- (uint64_t)setTitleView:()SUAdditions animated:
{
  if (!a4)
    return objc_msgSend(a1, "setTitleView:", a3);
  objc_msgSend(a1, "fadeOutTitleView");
  objc_msgSend(a1, "setTitleView:", a3);
  return objc_msgSend(a1, "fadeInTitleView");
}

@end
