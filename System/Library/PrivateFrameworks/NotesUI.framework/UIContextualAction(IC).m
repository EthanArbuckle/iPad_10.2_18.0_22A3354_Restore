@implementation UIContextualAction(IC)

+ (uint64_t)ic_deleteContextualActionWithBlock:()IC
{
  return objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", CFSTR("trash.fill"), 1, 0, a3);
}

+ (uint64_t)ic_removeContextualActionWithBlock:()IC
{
  return objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", CFSTR("minus.circle"), 1, 0, a3);
}

+ (id)ic_moveContextualActionWithBlock:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "ICMoveActionBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", CFSTR("folder.fill"), 0, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ic_passwordProtectContextualActionWithPasswordProtected:()IC passwordProtectBlock:
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = CFSTR("lock.fill");
  if (a3)
    v6 = CFSTR("lock.slash.fill");
  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = v6;
  v9 = a4;
  objc_msgSend(v7, "ICPasswordProtectActionColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", v8, 0, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ic_pinContextualActionWithPinned:()IC pinBlock:
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = CFSTR("pin.fill");
  if (a3)
    v6 = CFSTR("pin.slash.fill");
  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = v6;
  v9 = a4;
  objc_msgSend(v7, "ICPinActionColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", v8, 0, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ic_shareContextualActionWithShareImageName:()IC shareBlock:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "ICShareActionBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", v8, 0, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_replyContextualActionWithBlock:()IC
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "ICShareActionBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextualActionWithSystemImageNamed:style:color:actionBlock:", CFSTR("arrowshape.turn.up.left"), 0, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contextualActionWithSystemImageNamed:()IC style:color:actionBlock:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a6;
  v10 = (void *)MEMORY[0x1E0DC36C8];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke;
  v18[3] = &unk_1E5C20418;
  v19 = v9;
  v11 = v9;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "contextualActionWithStyle:title:handler:", a4, 0, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:textStyle:scale:", v13, *MEMORY[0x1E0DC4B60], 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_imageThatSuppressesAccessibilityHairlineThickening");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v16);

  objc_msgSend(v14, "setBackgroundColor:", v12);
  return v14;
}

@end
