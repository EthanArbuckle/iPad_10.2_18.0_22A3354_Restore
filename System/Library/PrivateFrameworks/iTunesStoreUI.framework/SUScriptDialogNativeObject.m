@implementation SUScriptDialogNativeObject

- (void)dismiss
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)show
{
  SUScriptObject *v3;
  id v4;
  id i;
  void *v6;

  v3 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  if (!-[SUScriptNativeObject object](self, "object") && v3)
  {
    v4 = -[SUScriptDialogNativeObject _makeAlertControllerForDialog:style:](self, "_makeAlertControllerForDialog:style:", v3, 1);
    -[SUScriptNativeObject setObject:](self, "setObject:", v4);
    for (i = -[SUScriptObject parentViewController](v3, "parentViewController");
          ;
          i = (id)objc_msgSend(v6, "presentedViewController"))
    {
      v6 = i;
      if (!objc_msgSend(i, "presentedViewController"))
        break;
    }
    objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);
  }
}

- (void)showFromRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  SUScriptObject *v10;
  id v11;
  void *v12;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  if (!-[SUScriptNativeObject object](self, "object") && v10)
  {
    v11 = -[SUScriptDialogNativeObject _makeAlertControllerForDialog:style:](self, "_makeAlertControllerForDialog:style:", v10, 0);
    -[SUScriptNativeObject setObject:](self, "setObject:", v11);
    objc_msgSend(-[SUScriptObject parentViewController](v10, "parentViewController"), "presentViewController:animated:completion:", v11, 1, 0);
    v12 = (void *)objc_msgSend(v11, "popoverPresentationController");
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "setSourceRect:", x, y, width, height);
      objc_msgSend(v13, "setSourceView:", a4);
      objc_msgSend(v13, "setPermittedArrowDirections:", 15);
    }
  }
}

- (void)showSheet
{
  SUScriptObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  v4 = -[SUScriptNativeObject object](self, "object");
  v5 = -[SUScriptObject parentViewController](v3, "parentViewController");
  v6 = objc_msgSend((id)objc_msgSend(v5, "view"), "window");
  if (!v4)
  {
    if (v3)
    {
      v7 = v6;
      if (v6)
      {
        do
        {
          v8 = v5;
          v5 = (id)objc_msgSend(v5, "parentViewController");
        }
        while (v5);
        -[SUScriptDialogNativeObject _showSheetInView:fromViewController:](self, "_showSheetInView:fromViewController:", v7, v8);
      }
    }
  }
}

- (void)showSheetInViewController:(id)a3
{
  SUScriptObject *v5;

  v5 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  if (!-[SUScriptNativeObject object](self, "object"))
  {
    if (v5)
      -[SUScriptDialogNativeObject _showSheetInView:fromViewController:](self, "_showSheetInView:fromViewController:", objc_msgSend(a3, "view"), a3);
  }
}

- (id)_makeAlertControllerForDialog:(id)a3 style:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  SUScriptDialogAlertController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "title");
  if (a4)
    v8 = objc_msgSend(a3, "body");
  else
    v8 = 0;
  v9 = +[SUScriptDialogAlertController alertControllerWithTitle:message:preferredStyle:](SUScriptDialogAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v8, a4);
  v10 = (void *)objc_msgSend(a3, "buttons");
  v11 = (void *)objc_msgSend(a3, "cancelButtonIndex");
  v32 = a3;
  v12 = (void *)objc_msgSend(a3, "destructiveButtonIndex");
  v35 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v14 = MEMORY[0x24BDAC760];
  if (v13)
  {
    v15 = v13;
    v16 = 0;
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        v18 = v14;
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v19, "title");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = 0;
        else
          v20 = objc_msgSend(v19, "title");
        v21 = v16 + i;
        if (v11)
        {
          v22 = objc_msgSend(v11, "integerValue");
          v23 = v21 == v22;
          if (v21 == v22 || !v12)
            goto LABEL_19;
LABEL_17:
          v23 = 2 * (v21 == objc_msgSend(v12, "integerValue"));
          goto LABEL_19;
        }
        if (v12)
          goto LABEL_17;
        v23 = 0;
LABEL_19:
        if (v20)
          v24 = (const __CFString *)v20;
        else
          v24 = &stru_24DE83F60;
        v14 = v18;
        v41[0] = v18;
        v41[1] = 3221225472;
        v41[2] = __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke;
        v41[3] = &unk_24DE7C4F8;
        v41[4] = v35;
        v41[5] = v16 + i;
        -[SUScriptDialogAlertController addAction:](v9, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v24, v23, v41));
        objc_msgSend(v19, "setShouldPerformDefaultAction:", 0);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      v16 += i;
    }
    while (v15);
  }
  v25 = (void *)objc_msgSend(v32, "textFields");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        v36[0] = v14;
        v36[1] = 3221225472;
        v36[2] = __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke_2;
        v36[3] = &unk_24DE7C520;
        v36[4] = v30;
        -[SUScriptDialogAlertController addTextFieldWithConfigurationHandler:](v9, "addTextFieldWithConfigurationHandler:", v36);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v27);
  }
  return v9;
}

uint64_t __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_tearDownForDismissWithButtonIndex:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "configureFromScriptTextField:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setNativeObjectWithTextField:", a2);
}

- (void)_showSheetInView:(id)a3 fromViewController:(id)a4
{
  SUScriptObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v16;
  double MinY;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v7 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  if (!-[SUScriptNativeObject object](self, "object") && v7)
  {
    v8 = -[SUScriptDialogNativeObject _makeAlertControllerForDialog:style:](self, "_makeAlertControllerForDialog:style:", v7, 0);
    -[SUScriptNativeObject setObject:](self, "setObject:", v8);
    objc_msgSend(a4, "presentViewController:animated:completion:", v8, 1, 0);
    v9 = objc_msgSend(v8, "popoverPresentationController");
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(a3, "bounds");
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      MinX = CGRectGetMinX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v16 = MinX + floor(CGRectGetWidth(v19) * 0.5);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      MinY = CGRectGetMinY(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      objc_msgSend(v10, "setSourceRect:", v16, MinY + floor(CGRectGetHeight(v21) * 0.5), 1.0, 1.0);
      objc_msgSend(v10, "setSourceView:", a3);
      objc_msgSend(v10, "setPermittedArrowDirections:", 0);
    }
  }
}

- (void)_tearDownForDismissWithButtonIndex:(int64_t)a3
{
  SUScriptObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[SUScriptNativeObject scriptObject](self, "scriptObject");
  v6 = (void *)-[SUScriptObject buttons](v5, "buttons");
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = v6;
    if (objc_msgSend(v6, "count") > (unint64_t)a3)
    {
      v8 = (void *)objc_msgSend(v7, "objectAtIndex:", a3);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, v5, 0);
      objc_msgSend(v8, "performActionWithArguments:", v9);

    }
  }
  -[SUScriptNativeObject destroyNativeObject](self, "destroyNativeObject");
}

@end
