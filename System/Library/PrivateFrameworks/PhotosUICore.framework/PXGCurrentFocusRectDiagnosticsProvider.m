@implementation PXGCurrentFocusRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, const __CFString *, _BYTE *, double, double, double, double);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  char v25;

  v5 = a3;
  v6 = (void (**)(id, void *, const __CFString *, _BYTE *, double, double, double, double))a4;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enableCurrentFocusRectDiagnostics");

  if (v8)
  {
    objc_msgSend(v5, "rootLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusedItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      objc_msgSend(v13, "axContainingGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "containingLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v13, "axFrame");
        objc_msgSend(v9, "convertRect:fromLayout:", v15);
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = 0;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v24, CFSTR("Current Item"), &v25, v17, v19, v21, v23);

      }
    }

  }
}

@end
