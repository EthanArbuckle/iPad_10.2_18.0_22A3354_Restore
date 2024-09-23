@implementation WFMenu

- (WFMenu)initWithElements:(id)a3
{
  return -[WFMenu initWithTitle:elements:](self, "initWithTitle:elements:", 0, a3);
}

- (WFMenu)initWithTitle:(id)a3 elements:(id)a4
{
  id v6;
  id v7;
  WFMenu *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSArray *elements;
  WFMenu *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFMenu;
  v8 = -[WFMenu init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    elements = v8->_elements;
    v8->_elements = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)elements
{
  return self->_elements;
}

- (BOOL)shouldDisplayInFixedOrder
{
  return self->_shouldDisplayInFixedOrder;
}

- (void)setShouldDisplayInFixedOrder:(BOOL)a3
{
  self->_shouldDisplayInFixedOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)uiMenuElementForWFMenuElement:(id)a3 shouldShowState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, void *, uint64_t);
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(id *, void *);
  void *v34;
  __CFString *v35;
  id v36;
  void (**v37)(void *, void *, uint64_t);
  _QWORD aBlock[5];
  BOOL v39;
  void *v40;
  _QWORD v41[2];

  v4 = a4;
  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke;
    aBlock[3] = &unk_24EF60680;
    v39 = v4;
    aBlock[4] = self;
    v9 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    v10 = v6;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "shouldCollapse");
        objc_msgSend(v10, "menuElements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v12, v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if ((_DWORD)v11)
        {
          v14 = (void *)MEMORY[0x24BEBD748];
          objc_msgSend(v10, "title");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = (const __CFString *)v15;
          else
            v17 = &stru_24EF60C48;
          objc_msgSend(v14, "menuWithTitle:children:", v17, v13);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "menuElements");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          WFMenuCollapsedSubtitleForMenuElements(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setSubtitle:](v18, "setSubtitle:", v20);

          v41[0] = v18;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFMenu buildMenuWithTitle:children:](self, "buildMenuWithTitle:children:", &stru_24EF60C48, v21);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if ((objc_msgSend(v10, "onlyDisplayTitleWhenCollapsed") & 1) != 0
            || (objc_msgSend(v10, "title"), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, !v29))
          {
            v18 = &stru_24EF60C48;
          }
          else
          {
            objc_msgSend(v10, "title");
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          -[WFMenu buildMenuWithTitle:children:](self, "buildMenuWithTitle:children:", v18, v13);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_19;
      }

      v22 = (__CFString *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BEBD528];
        v31 = v8;
        v32 = 3221225472;
        v33 = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_2;
        v34 = &unk_24EF606D0;
        v35 = v22;
        v36 = v23;
        v37 = v9;
        v25 = v22;
        v13 = v23;
        objc_msgSend(v24, "elementWithProvider:", &v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString title](v25, "title", v31, v32, v33, v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFMenu buildMenuWithTitle:children:](self, "buildMenuWithTitle:children:", v27, v28);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v35;
LABEL_19:

        goto LABEL_20;
      }
    }
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v6, "menuElementRepresentationShowingStatus:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v7;
}

- (UIMenu)platformMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFMenu elements](self, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_634);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFMenu elements](self, "elements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[WFMenu uiMenuElementForWFMenuElement:shouldShowState:](self, "uiMenuElementForWFMenuElement:shouldShowState:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v5 != 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x24BEBD748];
  -[WFMenu title](self, "title");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_24EF60C48;
  objc_msgSend(v12, "menuWithTitle:children:", v15, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v16;
}

- (id)buildMenuWithTitle:(id)a3 children:(id)a4
{
  if (!a3)
    a3 = &stru_24EF60C48;
  return (id)objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", a3, 0, 0, 1, a4);
}

id __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)objc_opt_new();
  if ((a3 & 1) != 0 || !*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v5, "if_firstObjectPassingTest:", &__block_literal_global_634);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  else
  {
    v7 = 1;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "uiMenuElementForWFMenuElement:shouldShowState:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

void __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_2(id *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "itemProvider");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_3;
  v7[3] = &unk_24EF606A8;
  v8 = a1[4];
  v10 = a1[6];
  v9 = a1[5];
  v11 = v3;
  v5 = (void (*)(_QWORD *, _QWORD *))v4[2];
  v6 = v3;
  v5(v4, v7);

}

void __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  dispatch_time_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4 = objc_msgSend(*(id *)(a1 + 32), "shouldCollapse");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BEBD748];
    objc_msgSend(*(id *)(a1 + 32), "title");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_24EF60C48;
    objc_msgSend(v6, "menuWithTitle:children:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WFMenuCollapsedSubtitleForMenuElements(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubtitle:", v11);

    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v15 = 0.25 - v14;

  v16 = fmax(v15, 0.0);
  if (v16 == 0.0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_4;
    v19[3] = &unk_24EF60788;
    v21 = *(id *)(a1 + 56);
    v20 = v5;
    v18 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_after(v17, MEMORY[0x24BDAC9B8], v19);

  }
}

uint64_t __63__WFMenu_UIKit__uiMenuElementForWFMenuElement_shouldShowState___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
