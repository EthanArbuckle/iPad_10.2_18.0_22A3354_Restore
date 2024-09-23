@implementation SUScriptSplitViewController

- (id)newNativeViewController
{
  SUSplitViewController *v3;

  v3 = objc_alloc_init(SUSplitViewController);
  -[SUViewController setClientInterface:](v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesSplitViewController");
}

- (SUScriptViewController)firstViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptSplitViewController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __50__SUScriptSplitViewController_firstViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __50__SUScriptSplitViewController_firstViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __50__SUScriptSplitViewController_firstViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "firstViewController"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)minimumPaneSize
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __46__SUScriptSplitViewController_minimumPaneSize__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __46__SUScriptSplitViewController_minimumPaneSize__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id v4;
  uint64_t result;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "minimumPaneSize");
  v3 = v2;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v3 > 0.00000011920929 && v3 < 1.0)
    result = objc_msgSend(v4, "initWithFormat:", CFSTR("%.0f%%"), floor(v3 * 100.0));
  else
    result = objc_msgSend(v4, "initWithFormat:", CFSTR("%.0fpx"), *(_QWORD *)&v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptViewController)secondViewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptSplitViewController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __51__SUScriptSplitViewController_secondViewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __51__SUScriptSplitViewController_secondViewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __51__SUScriptSplitViewController_secondViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "secondViewController"), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setFirstViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

uint64_t __54__SUScriptSplitViewController_setFirstViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setFirstViewController:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
}

- (void)setMinimumPaneSize:(id)a3
{
  if (+[SUSplitViewController isValidSplitPositionValue:](SUSplitViewController, "isValidSplitPositionValue:"))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __50__SUScriptSplitViewController_setMinimumPaneSize___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  float v5;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_splitViewController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(void **)(a1 + 40);
  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("px")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", objc_msgSend(*(id *)(a1 + 40), "length") - 2);
LABEL_4:
    objc_msgSend(v4, "floatValue");
    return objc_msgSend(v2, "setMinimumPaneSize:", v5);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "hasSuffix:", CFSTR("%"));
  if ((_DWORD)result)
  {
    v5 = (float)(int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", objc_msgSend(*(id *)(a1 + 40), "length") - 1), "intValue")/ 100.0;
    return objc_msgSend(v2, "setMinimumPaneSize:", v5);
  }
  return result;
}

- (void)setSecondViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

uint64_t __55__SUScriptSplitViewController_setSecondViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setSecondViewController:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
}

- (void)setSplitPosition:(id)a3
{
  if (+[SUSplitViewController isValidSplitPositionValue:](SUSplitViewController, "isValidSplitPositionValue:"))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __48__SUScriptSplitViewController_setSplitPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setSplitPositionAndLayoutTypeFromValue:", *(_QWORD *)(a1 + 40));
}

- (void)setSplitShadowColor:(id)a3
{
  SUScriptColor *v4;
  SUScriptColor *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v4 = (SUScriptColor *)a3;
  }
  v5 = v4;
  if (v4)
  {
    WebThreadRunOnMainThread();

    return;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __51__SUScriptSplitViewController_setSplitShadowColor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_splitViewController");
  v3 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  objc_msgSend(v3, "setColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
  objc_msgSend(v2, "setSplitShadow:", v3);

}

- (void)setSplitShadowOpacity:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __53__SUScriptSplitViewController_setSplitShadowOpacity___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_splitViewController");
  v4 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  objc_msgSend(v4, "setOpacity:", v3);
  objc_msgSend(v2, "setSplitShadow:", v4);

}

- (void)setSplitShadowRadius:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __52__SUScriptSplitViewController_setSplitShadowRadius___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_splitViewController");
  v4 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  objc_msgSend(v4, "setRadius:", v3);
  objc_msgSend(v2, "setSplitShadow:", v4);

}

- (void)setSplitType:(id)a3
{
  if (+[SUSplitViewController isValidSplitTypeString:](SUSplitViewController, "isValidSplitTypeString:"))
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __44__SUScriptSplitViewController_setSplitType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setSplitTypeString:", *(_QWORD *)(a1 + 40));
}

- (void)setTitle:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

uint64_t __40__SUScriptSplitViewController_setTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setMainTitle:", *(_QWORD *)(a1 + 40));
}

- (void)setUsesSharedPlaceholder:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __56__SUScriptSplitViewController_setUsesSharedPlaceholder___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "setUsesSharedPlaceholder:", *(unsigned __int8 *)(a1 + 40));
}

- (id)splitPosition
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __44__SUScriptSplitViewController_splitPosition__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __44__SUScriptSplitViewController_splitPosition__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitPositionString");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)splitShadowColor
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __47__SUScriptSplitViewController_splitShadowColor__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __47__SUScriptSplitViewController_splitShadowColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow"), "color");
  if (!v2)
    v2 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "initWithUIColor:", v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)splitShadowOpacity
{
  void *v2;
  NSNumber *v3;
  NSNumber *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __49__SUScriptSplitViewController_splitShadowOpacity__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __49__SUScriptSplitViewController_splitShadowOpacity__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  uint64_t result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow");
  v3 = objc_alloc(MEMORY[0x24BDD16E0]);
  if (v2)
  {
    objc_msgSend(v2, "opacity");
    *(float *)&v4 = v4;
  }
  else
  {
    LODWORD(v4) = 0;
  }
  result = objc_msgSend(v3, "initWithFloat:", v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)splitShadowRadius
{
  void *v2;
  NSNumber *v3;
  NSNumber *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __48__SUScriptSplitViewController_splitShadowRadius__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptSplitViewController_splitShadowRadius__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  uint64_t result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow");
  v3 = objc_alloc(MEMORY[0x24BDD16E0]);
  if (v2)
  {
    objc_msgSend(v2, "radius");
    *(float *)&v4 = v4;
  }
  else
  {
    LODWORD(v4) = 0;
  }
  result = objc_msgSend(v3, "initWithFloat:", v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)splitType
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __40__SUScriptSplitViewController_splitType__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __40__SUScriptSplitViewController_splitType__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitTypeString");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __36__SUScriptSplitViewController_title__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptSplitViewController_title__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "mainTitle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)usesSharedPlaceholder
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptSplitViewController_usesSharedPlaceholder__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "usesSharedPlaceholder");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_splitViewController
{
  UIViewController *v2;

  v2 = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_28, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSplitViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSplitViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_28, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_28 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("firstViewController"), CFSTR("minimumPaneSize"), CFSTR("minimumPaneSize"), CFSTR("secondViewController"), CFSTR("secondViewController"), CFSTR("splitPosition"), CFSTR("splitPosition"), CFSTR("splitShadowColor"), CFSTR("splitShadowColor"), CFSTR("splitShadowOpacity"), CFSTR("splitShadowOpacity"), CFSTR("splitShadowRadius"), CFSTR("splitShadowRadius"), CFSTR("splitType"), CFSTR("splitType"), CFSTR("title"), CFSTR("title"),
                        CFSTR("usesSharedPlaceholder"),
                        CFSTR("usesSharedPlaceholder"),
                        0);
}

@end
