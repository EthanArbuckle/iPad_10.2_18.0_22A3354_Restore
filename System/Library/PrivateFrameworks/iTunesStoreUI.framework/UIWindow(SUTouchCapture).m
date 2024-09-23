@implementation UIWindow(SUTouchCapture)

- (SUTouchCaptureView)addTouchCaptureViewWithTag:()SUTouchCapture
{
  uint64_t v5;
  SUTouchCaptureView *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = objc_msgSend(a1, "viewWithTag:");
  if (v5)
  {
    v6 = (SUTouchCaptureView *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("View with tag exists"));
  }
  else
  {
    objc_msgSend(a1, "bounds");
    v6 = -[SUTouchCaptureView initWithFrame:]([SUTouchCaptureView alloc], "initWithFrame:", v7, v8, v9, v10);
    -[SUTouchCaptureView setTag:](v6, "setTag:", a3);
    objc_msgSend(a1, "addSubview:", v6);

  }
  return v6;
}

- (void)removeTouchCaptureViewWithTag:()SUTouchCapture
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(a1, "viewWithTag:");
  v2 = (void *)objc_msgSend(v1, "allTargets");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v1, "removeTarget:action:forControlEvents:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), 0, 0xFFFFFFFFLL);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  v7 = v1;
  objc_msgSend(v1, "removeFromSuperview");
  return v1;
}

@end
