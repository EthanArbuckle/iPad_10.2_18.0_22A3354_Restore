@implementation UIScrollView(SUAdditions)

- (uint64_t)setTopExtensionViewColor:()SUAdditions
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v12;

  v5 = (void *)objc_msgSend(a1, "viewWithTag:", 800);
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      objc_msgSend(a1, "sendSubviewToBack:", v5);
    }
    else
    {
      v7 = *MEMORY[0x24BDBF090];
      v12 = *MEMORY[0x24BDBF148];
      if (SUGradientColorIsPatternColor(a3, &v12))
      {
        v8 = *((double *)&v12 + 1);
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
        v8 = v9;
      }
      objc_msgSend(a1, "frame");
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v7, -v8, v10, v8);
      objc_msgSend(v6, "setAutoresizingMask:", 2);
      objc_msgSend(v6, "setTag:", 800);
      objc_msgSend(a1, "insertSubview:atIndex:", v6, 0);

    }
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");
    v6 = 0;
  }
  return objc_msgSend(v6, "setBackgroundColor:", a3);
}

- (uint64_t)topExtensionViewColor
{
  return objc_msgSend((id)objc_msgSend(a1, "viewWithTag:", 800), "backgroundColor");
}

@end
