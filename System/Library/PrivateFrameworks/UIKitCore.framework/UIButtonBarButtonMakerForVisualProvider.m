@implementation UIButtonBarButtonMakerForVisualProvider

id ___UIButtonBarButtonMakerForVisualProvider_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
LABEL_6:
    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "buttonBarButtonClass")), "initWithVisualProvider:", *(_QWORD *)(a1 + 32));

    goto LABEL_7;
  }
  v10 = v9;
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  objc_msgSend(v10, "visualProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32));

  v14 = v11;
  if ((v13 & 1) == 0)
    goto LABEL_6;
LABEL_7:
  v15 = objc_msgSend(v8, "style");
  if (v15 != 2)
  {
    if (v15)
    {
      objc_msgSend(v14, "setAppearanceData:", 0);
      goto LABEL_14;
    }
    objc_msgSend(v7, "plainItemAppearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppearanceData:", v16);

    if (!objc_msgSend(v7, "plainItemAppearanceNeedsUpdate"))
      goto LABEL_14;
    goto LABEL_12;
  }
  objc_msgSend(v7, "doneItemAppearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAppearanceData:", v17);

  if (objc_msgSend(v7, "doneItemAppearanceNeedsUpdate"))
LABEL_12:
    objc_msgSend(v14, "setNeedsAppearanceUpdate");
LABEL_14:
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "_appearanceDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureFromBarItem:withAppearanceDelegate:", v8, v18);

  objc_msgSend(v14, "removeTarget:action:forControlEvents:", 0, 0, 0x2000);
  objc_msgSend(v7, "_targetActionForBarButtonItem:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", v7, sel__invalidateAssistant_, 0x2000);
  objc_msgSend(v14, "addTarget:action:forControlEvents:", v19, objc_msgSend(v19, "proxyAction"), 0x2000);

  return v14;
}

@end
