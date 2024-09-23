@implementation LSResourceProxy(UIKitPrivate)

+ (double)_applicationIconCanvasSize
{
  int v0;
  UIUserInterfaceIdiom v1;
  double v2;
  double v3;

  v0 = _LSResourceProxyGetDeviceType_sDeviceType;
  if (_LSResourceProxyGetDeviceType_sDeviceType == -1)
  {
    v1 = -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom");
    if (v1)
    {
      if (v1 == UIUserInterfaceIdiomPad)
      {
        -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
        if (v2 == 1.0)
          v0 = 4;
        else
          v0 = 8;
      }
      else
      {
        v0 = 0;
      }
    }
    else
    {
      -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
      if (v3 == 1.0)
        v0 = 1;
      else
        v0 = 2;
    }
    _LSResourceProxyGetDeviceType_sDeviceType = v0;
  }
  switch(v0)
  {
    case 2:
      return 120.0;
    case 8:
      return 152.0;
    case 4:
      return 76.0;
  }
  return 57.0;
}

+ (uint64_t)_compareApplicationIconCanvasSize:()UIKitPrivate withSize:
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CA5910], "_applicationIconCanvasSize");
  v10 = vabdd_f64(a1, v8);
  v11 = vabdd_f64(a2, v9);
  v12 = vabdd_f64(a3, v8);
  v13 = vabdd_f64(a4, v9);
  v14 = v11 < v13 && v10 < v12;
  v15 = 1;
  if (!v14)
    v15 = -1;
  v16 = a2 <= v9 || a1 <= v8;
  v17 = 1;
  if (v16)
    v17 = -1;
  if (a2 == a4 && a1 == a3)
    v17 = 0;
  if (v10 == v12 && v11 == v13)
    return v17;
  else
    return v15;
}

@end
