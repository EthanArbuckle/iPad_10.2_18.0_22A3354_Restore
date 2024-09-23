@implementation UITabBar

+ (void)load
{
  unsigned int v3;
  id v4;
  _QWORD block[5];

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {

  }
  else
  {
    v3 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");

    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000B6B4;
      block[3] = &unk_10043BAE0;
      block[4] = a1;
      if (qword_10048BC00[0] != -1)
        dispatch_once(qword_10048BC00, block);
    }
  }
}

- (CGSize)xxx_sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = (char *)objc_msgSend(v6, "orientation");

  if ((unint64_t)(v7 - 3) > 1)
  {
    -[UITabBar xxx_sizeThatFits:](self, "xxx_sizeThatFits:", width, height);
    width = v9;
  }
  else
  {
    v8 = 49.0;
  }
  v10 = width;
  result.height = v8;
  result.width = v10;
  return result;
}

@end
