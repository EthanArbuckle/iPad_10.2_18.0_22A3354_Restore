@implementation SUScriptNavigationItem

- (SUScriptNavigationItem)init
{
  return -[SUScriptNavigationItem initWithNativeNavigationItem:](self, "initWithNativeNavigationItem:", 0);
}

- (SUScriptNavigationItem)initWithNativeNavigationItem:(id)a3
{
  id v4;
  SUScriptNavigationItem *v5;
  SUScriptNavigationItem *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptNavigationItem;
  v5 = -[SUScriptObject init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptObject setNativeObject:](v6, "setNativeObject:", v7);

  }
  return v6;
}

- (UINavigationItem)nativeNavigationItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SUScriptObject nativeObject](self, "nativeObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = -[SUScriptObject copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());

    +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v6);

    v4 = v5;
  }
  return (UINavigationItem *)v4;
}

- (void)tearDownUserInterface
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SUScriptObject nativeObject](self, "nativeObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_disconnectNavigationItem:scriptObject:", v4, self);
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationItem;
  -[SUScriptObject tearDownUserInterface](&v5, sel_tearDownUserInterface);

}

- (NSString)backButtonTitle
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__19;
  v8 = __Block_byref_object_dispose__19;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __41__SUScriptNavigationItem_backButtonTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backButtonTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_className
{
  return CFSTR("iTunesNavigationItem");
}

- (id)hidesBackButton
{
  id *v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __41__SUScriptNavigationItem_hidesBackButton__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "hidesBackButton");

}

- (SUScriptNavigationItem)leftItem
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptNavigationItem *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __34__SUScriptNavigationItem_leftItem__block_invoke;
  v10 = &unk_24DE7B458;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __34__SUScriptNavigationItem_leftItem__block_invoke, &unk_24DE7B458, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __34__SUScriptNavigationItem_leftItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v7, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_copyScriptObjectForButtonItem:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)leftItems
{
  void *v3;
  id v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v6, 3221225472, __35__SUScriptNavigationItem_leftItems__block_invoke, &unk_24DE7B458, self, &v8);
    v3 = (void *)v9[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__SUScriptNavigationItem_leftItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyScriptObjectForButtonItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        if (v12)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)leftItemsSupplementBackButton
{
  id *v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __55__SUScriptNavigationItem_leftItemsSupplementBackButton__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "leftItemsSupplementBackButton");

}

- (SUScriptNavigationItem)leftMostItem
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptNavigationItem *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __38__SUScriptNavigationItem_leftMostItem__block_invoke;
  v10 = &unk_24DE7B458;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __38__SUScriptNavigationItem_leftMostItem__block_invoke, &unk_24DE7B458, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __38__SUScriptNavigationItem_leftMostItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v7, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_copyScriptObjectForButtonItem:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSString)prompt
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __32__SUScriptNavigationItem_prompt__block_invoke, &unk_24DE7B430, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSString *)v4;
}

void __32__SUScriptNavigationItem_prompt__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prompt");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SUScriptNavigationItem)rightItem
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SUScriptNavigationItem *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __35__SUScriptNavigationItem_rightItem__block_invoke;
  v10 = &unk_24DE7B430;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __35__SUScriptNavigationItem_rightItem__block_invoke, &unk_24DE7B430, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);

  return (SUScriptNavigationItem *)v5;
}

void __35__SUScriptNavigationItem_rightItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "nativeNavigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_copyScriptObjectForButtonItem:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)rightItems
{
  void *v3;
  id v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v6, 3221225472, __36__SUScriptNavigationItem_rightItems__block_invoke, &unk_24DE7B458, self, &v8);
    v3 = (void *)v9[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __36__SUScriptNavigationItem_rightItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyScriptObjectForButtonItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        if (v12)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setBackButtonTitle:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_5;
    }
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __45__SUScriptNavigationItem_setBackButtonTitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackButtonTitle:", *(_QWORD *)(a1 + 40));

}

- (void)setHidesBackButton:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_5;
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __45__SUScriptNavigationItem_setHidesBackButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesBackButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

}

- (void)setLeftItem:(id)a3
{
  -[SUScriptNavigationItem setLeftItem:animated:](self, "setLeftItem:animated:", a3, 0);
}

- (void)setLeftItems:(id)a3
{
  -[SUScriptNavigationItem setLeftItems:animated:](self, "setLeftItems:animated:", a3, 0);
}

- (void)setLeftItemsSupplementBackButton:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_5;
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __59__SUScriptNavigationItem_setLeftItemsSupplementBackButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftItemsSupplementBackButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

}

- (void)setLeftMostItem:(id)a3
{
  -[SUScriptNavigationItem setLeftMostItem:animated:](self, "setLeftMostItem:animated:", a3, 0);
}

- (void)setPrompt:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_5;
    }
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __36__SUScriptNavigationItem_setPrompt___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrompt:", *(_QWORD *)(a1 + 40));

}

- (void)setRightItem:(id)a3
{
  -[SUScriptNavigationItem setRightItem:animated:](self, "setRightItem:animated:", a3, 0);
}

- (void)setRightItems:(id)a3
{
  -[SUScriptNavigationItem setRightItems:animated:](self, "setRightItems:animated:", a3, 0);
}

- (void)setTitle:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_5;
    }
  }
  v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __35__SUScriptNavigationItem_setTitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", *(_QWORD *)(a1 + 40));

}

- (void)setTitleView:(id)a3
{
  -[SUScriptNavigationItem setTitleView:animated:](self, "setTitleView:animated:", a3, 0);
}

- (NSString)title
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __31__SUScriptNavigationItem_title__block_invoke, &unk_24DE7B430, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSString *)v4;
}

void __31__SUScriptNavigationItem_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)titleView
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__19;
  v8 = __Block_byref_object_dispose__19;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __35__SUScriptNavigationItem_titleView__block_invoke(uint64_t a1)
{
  void *v2;
  SUScriptSegmentedControl *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(SUScriptSegmentedControl);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setNativeSegmentedControl:", v6);
  }

}

- (void)setLeftItem:(id)a3 animated:(BOOL)a4
{
  id v5;
  char v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v5 = 0;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  if (!v5)
    goto LABEL_4;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_2551CCDD0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_8;
  }
  v6 = 0;
LABEL_5:
  v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);

LABEL_8:
}

void __47__SUScriptNavigationItem_setLeftItem_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "tag") != 424242)
  {
    v3 = *(void **)(a1 + 40);
    if (v2)
      v4 = v3 == 0;
    else
      v4 = 1;
    if (!v4)
    {
      if (!SUScriptNavigationItemIsFlagged(v2))
      {
        objc_msgSend(v8, "leftBarButtonItems");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v6, "mutableCopy");

        objc_msgSend(*(id *)(a1 + 40), "buttonItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

        objc_msgSend(v8, "setLeftBarButtonItems:animated:", v5, *(unsigned __int8 *)(a1 + 48));
        goto LABEL_10;
      }
      v3 = *(void **)(a1 + 40);
    }
    objc_msgSend(v3, "buttonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:animated:", v5, *(unsigned __int8 *)(a1 + 48));
LABEL_10:

  }
}

- (void)setLeftItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
    v5 = 0;
  }
  else if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_11;
    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v5, "copyArrayValueWithValidator:context:", SUConformsValidator, &unk_2551CCDD0);
  v8 = (void *)v7;
  if (!v6 || v7)
  {
    if (v7)
      -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v7);
    v9 = v8;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

LABEL_11:
}

void __48__SUScriptNavigationItem_setLeftItems_animated___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "buttonItem", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "nativeNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItems:animated:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)setLeftMostItem:(id)a3 animated:(BOOL)a4
{
  id v5;
  char v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v5 = 0;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  if (!v5)
    goto LABEL_4;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_2551CCDD0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_8;
  }
  v6 = 0;
LABEL_5:
  v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);

LABEL_8:
}

void __51__SUScriptNavigationItem_setLeftMostItem_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "buttonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:animated:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)setRightItem:(id)a3 animated:(BOOL)a4
{
  id v5;
  char v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v5 = 0;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  if (!v5)
    goto LABEL_4;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_2551CCDD0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_8;
  }
  v6 = 0;
LABEL_5:
  v5 = v5;
  WebThreadRunOnMainThread();
  if ((v6 & 1) == 0)
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);

LABEL_8:
}

void __48__SUScriptNavigationItem_setRightItem_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nativeNavigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "buttonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:animated:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)setRightItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v6 = 0;
    v5 = 0;
  }
  else if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_11;
    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v5, "copyArrayValueWithValidator:context:", SUConformsValidator, &unk_2551CCDD0);
  v8 = (void *)v7;
  if (!v6 || v7)
  {
    if (v7)
      -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v7);
    v9 = v8;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

LABEL_11:
}

void __49__SUScriptNavigationItem_setRightItems_animated___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "buttonItem", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "nativeNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItems:animated:", v2, *(unsigned __int8 *)(a1 + 48));

}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  v5 = v4;
  WebThreadRunOnMainThread();

}

void __48__SUScriptNavigationItem_setTitleView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "nativeSegmentedControl");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (_UIApplicationUsesLegacyUI())
      objc_msgSend(v3, "setSegmentedControlStyle:", 2);
    objc_msgSend(v3, "sizeToFitUserInterfaceIdiom");
    objc_msgSend(*(id *)(a1 + 40), "nativeNavigationItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTitleView:animated:", v3, *(unsigned __int8 *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "nativeNavigationItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:animated:", 0, *(unsigned __int8 *)(a1 + 48));
  }

}

+ (void)_disconnectNavigationItem:(id)a3 scriptObject:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a1;
  objc_msgSend(a1, "_rootScriptObjectForObject:", a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (SUScriptNavigationItemIsFlagged(v14))
        {
          objc_msgSend(v14, "target");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(v15, "scriptObject"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v29, "_rootScriptObjectForObject:", v16),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v17,
                v16,
                v30 != v17))
          {
            objc_msgSend(v8, "addObject:", v14);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setLeftBarButtonItems:", v8);
  objc_msgSend(v6, "rightBarButtonItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (SUScriptNavigationItemIsFlagged(v25))
        {
          objc_msgSend(v25, "target");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(v26, "scriptObject"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v29, "_rootScriptObjectForObject:", v27),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                v28,
                v27,
                v30 != v28))
          {
            objc_msgSend(v19, "addObject:", v25);
          }

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(v6, "setRightBarButtonItems:", v19);
}

+ (id)_rootScriptObjectForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "parentScriptObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v3;
  if (v4)
  {
    v6 = v3;
    do
    {
      objc_msgSend(v6, "parentScriptObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "parentScriptObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v5;
    }
    while (v7);
  }

  return v5;
}

- (id)_copyScriptButtonForButtonItem:(id)a3
{
  id v3;
  void *v4;
  SUScriptButton *v5;

  v3 = a3;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SUScriptNavigationItemIsFlagged(v3)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(v4, "scriptObject"), (v5 = (SUScriptButton *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = objc_alloc_init(SUScriptButton);
    -[SUScriptButton setNativeButton:](v5, "setNativeButton:", v3);
  }

  return v5;
}

- (id)_copyScriptObjectForButtonItem:(id)a3
{
  id v4;
  void *v5;
  SUScriptTextField *v6;

  v4 = a3;
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_alloc_init(SUScriptTextField);
      -[SUScriptTextField setNativeObjectWithTextField:](v6, "setNativeObjectWithTextField:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[SUScriptTextField initWithTextFieldStyle:]([SUScriptTextField alloc], "initWithTextFieldStyle:", CFSTR("search"));
        -[SUScriptTextField setNativeObjectWithSearchBar:](v6, "setNativeObjectWithSearchBar:", v5);
      }
      else
      {
        v6 = 0;
      }
    }
  }
  else
  {
    v6 = -[SUScriptNavigationItem _copyScriptButtonForButtonItem:](self, "_copyScriptButtonForButtonItem:", v4);
  }

  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_33, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationItem;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_27, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationItem;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationItem;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_33, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_27 = (uint64_t)sel_setHidesBackButton_;
    *(_QWORD *)algn_255186738 = CFSTR("setHidesBackButton");
    qword_255186740 = (uint64_t)sel_setLeftItem_animated_;
    unk_255186748 = CFSTR("setLeftItem");
    qword_255186750 = (uint64_t)sel_setLeftItems_animated_;
    unk_255186758 = CFSTR("setLeftItems");
    qword_255186760 = (uint64_t)sel_setLeftMostItem_animated_;
    unk_255186768 = CFSTR("setLeftMostItem");
    qword_255186770 = (uint64_t)sel_setRightItem_animated_;
    unk_255186778 = CFSTR("setRightItem");
    qword_255186780 = (uint64_t)sel_setRightItems_animated_;
    unk_255186788 = CFSTR("setRightItems");
    qword_255186790 = (uint64_t)sel_setTitleView_animated_;
    unk_255186798 = CFSTR("setTitleView");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backButtonTitle"), CFSTR("hidesBackButton"), CFSTR("hidesBackButton"), CFSTR("leftItem"), CFSTR("leftItem"), CFSTR("leftItems"), CFSTR("leftItems"), CFSTR("leftItemsSupplementBackButton"), CFSTR("leftItemsSupplementBackButton"), CFSTR("leftMostItem"), CFSTR("leftMostItem"), CFSTR("prompt"), CFSTR("prompt"), CFSTR("rightItem"), CFSTR("rightItem"), CFSTR("rightItems"), CFSTR("rightItems"),
           CFSTR("title"),
           CFSTR("title"),
           CFSTR("titleView"),
           CFSTR("titleView"),
           0);
    v3 = (void *)__KeyMapping_33;
    __KeyMapping_33 = v2;

  }
}

@end
