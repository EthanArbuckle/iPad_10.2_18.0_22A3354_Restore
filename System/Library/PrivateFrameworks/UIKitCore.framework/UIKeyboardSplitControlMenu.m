@implementation UIKeyboardSplitControlMenu

+ (id)activeInstance
{
  if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
    return (id)gSharedSplitControlMenu;
  else
    return 0;
}

- (UIKeyboardSplitControlMenu)initWithFrame:(CGRect)a3
{
  UIKeyboardSplitControlMenu *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSArray *items;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  UIKeyboardSplitControlMenu *v19;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _OWORD v28[3];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)UIKeyboardSplitControlMenu;
  v3 = -[UIKeyboardMenuView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v29[4] = objc_opt_class();
    v4 = 0;
    v29[5] = objc_opt_class();
    memset(v28, 0, sizeof(v28));
    do
    {
      v5 = objc_alloc_init((Class)v29[v4]);
      v6 = *(void **)((char *)v28 + v4 * 8);
      *(_QWORD *)((char *)v28 + v4 * 8) = v5;

      ++v4;
    }
    while (v4 != 6);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
    v7 = objc_claimAutoreleasedReturnValue();
    items = v3->_items;
    v3->_items = (NSArray *)v7;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v3->_items;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      v13 = 175.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "label", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardMenuView font](v3, "font");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_legacy_sizeWithFont:", v16);
          v18 = v17;

          if (v18 + 48.0 > v13)
            v13 = v18 + 48.0;
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 175.0;
    }

    v3->m_preferredSize.width = v13;
    v3->m_preferredSize.height = 100.0;
    v19 = v3;
    for (j = 40; j != -8; j -= 8)

  }
  return v3;
}

+ (id)sharedInstance
{
  void *v2;
  UIKeyboardSplitControlMenu *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (+[UIKeyboardImpl rivenTranslationPreference](UIKeyboardImpl, "rivenTranslationPreference"))
  {
    v2 = (void *)gSharedSplitControlMenu;
    if (!gSharedSplitControlMenu)
    {
      v3 = [UIKeyboardSplitControlMenu alloc];
      v4 = -[UIKeyboardSplitControlMenu initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v5 = (void *)gSharedSplitControlMenu;
      gSharedSplitControlMenu = v4;

      v2 = (void *)gSharedSplitControlMenu;
    }
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)actionForItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "label", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          objc_msgSend(v10, "actionForMenu:", self);
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (unint64_t)numberOfItems
{
  return -[UIKeyboardSplitControlMenu visibleItemForIndex:](self, "visibleItemForIndex:", -1);
}

- (CGSize)preferredSize
{
  CGFloat width;
  double v3;
  double v4;
  CGSize result;

  width = self->m_preferredSize.width;
  v3 = (double)-[UIKeyboardSplitControlMenu numberOfItems](self, "numberOfItems") * 50.0;
  v4 = width;
  result.height = v3;
  result.width = v4;
  return result;
}

- (unint64_t)defaultSelectedIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int)visibleItemForIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v6 + v8;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "visible", (_QWORD)v13))
        {
          if (v7 == a3)
          {
            LODWORD(v7) = v8 + v10;
            goto LABEL_14;
          }
          ++v7;
        }
        ++v10;
      }
      while (v6 != v10);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }
LABEL_14:

  return v7;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", -[UIKeyboardSplitControlMenu visibleItemForIndex:](self, "visibleItemForIndex:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  return 1;
}

- (void)setSplitAndUndocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = a3;
  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit") != a3)
    UIKeyboardSetSplit(v3);
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUndocked");

  if (v6 != v3)
  {
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit") == v3)
    {
      UIKeyboardSetUndocked(v3);
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__UIKeyboardSplitControlMenu_setSplitAndUndocked___block_invoke;
      v7[3] = &__block_descriptor_33_e5_v8__0l;
      v8 = v3;
      -[UIKeyboardSplitControlMenu setFinishSplitTransitionBlock:](self, "setFinishSplitTransitionBlock:", v7);
    }
  }
}

void __50__UIKeyboardSplitControlMenu_setSplitAndUndocked___block_invoke(uint64_t a1)
{
  UIKeyboardSetUndocked(*(unsigned __int8 *)(a1 + 32));
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  id v5;

  -[UIKeyboardMenuView hide](self, "hide");
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", -[UIKeyboardSplitControlMenu visibleItemForIndex:](self, "visibleItemForIndex:", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionForMenu:", self);

}

- (void)didFinishSplitTransition
{
  void *v3;
  void (**v4)(void);

  -[UIKeyboardSplitControlMenu finishSplitTransitionBlock](self, "finishSplitTransitionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardSplitControlMenu finishSplitTransitionBlock](self, "finishSplitTransitionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[UIKeyboardSplitControlMenu setFinishSplitTransitionBlock:](self, "setFinishSplitTransitionBlock:", 0);
  }
}

- (id)finishSplitTransitionBlock
{
  return self->_finishSplitTransitionBlock;
}

- (void)setFinishSplitTransitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishSplitTransitionBlock, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

void __53__UIKeyboardSplitControlMenu_Floating_actionForMenu___block_invoke()
{
  void *v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setSplit:animated:", 0, 0);

  UIKeyboardSetUndocked(1);
}

void __49__UIKeyboardSplitControlMenu_Dock_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setFinishSplitTransitionBlock:", 0);
  if (a2)
  {
    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetUndocked(0);
  }
}

void __50__UIKeyboardSplitControlMenu_Split_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;

  if (a2)
  {
    +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:", 1.0);
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetSplit(1);
    objc_msgSend(*(id *)(a1 + 32), "setFinishSplitTransitionBlock:", 0);
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isUndocked");

    if ((v4 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setFinishSplitTransitionBlock:", &__block_literal_global_402);
  }
}

void __50__UIKeyboardSplitControlMenu_Split_actionForMenu___block_invoke_2()
{
  UIKeyboardSetUndocked(1);
}

void __57__UIKeyboardSplitControlMenu_DockAndMerge_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;

  if (a2)
  {
    +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:", 0.0);
    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetSplit(0);
    objc_msgSend(*(id *)(a1 + 32), "setFinishSplitTransitionBlock:", 0);
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isUndocked");

    if (v4)
      +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(*(id *)(a1 + 32), "setFinishSplitTransitionBlock:", &__block_literal_global_409);
  }
}

void __57__UIKeyboardSplitControlMenu_DockAndMerge_actionForMenu___block_invoke_2()
{
  UIKeyboardSetUndocked(0);
}

@end
