@implementation SearchUIButtonItem

- (Class)searchUI_viewControllerClass
{
  void *v3;
  void *v4;
  objc_class *v5;
  objc_super v7;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)(id)objc_msgSend(v4, "searchUI_viewControllerClass");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItem;
    v5 = -[SFButtonItem searchUI_viewControllerClass](&v7, sel_searchUI_viewControllerClass);
  }

  return v5;
}

- (SearchUIButtonItem)initWithSFButtonItem:(id)a3
{
  SearchUIButtonItem *v4;
  SearchUIButtonItem *v5;
  SearchUIButtonItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SearchUIButtonItem *v11;
  objc_super v13;

  v4 = (SearchUIButtonItem *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUIButtonItem;
    v5 = -[SearchUIButtonItem init](&v13, sel_init);
    if (v5)
    {
      -[SearchUIButtonItem setUniqueId:](v5, "setUniqueId:", -[SearchUIButtonItem uniqueId](v4, "uniqueId"));
      -[SearchUIButtonItem setSfButtonItem:](v5, "setSfButtonItem:", v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v4;
        -[SearchUIButtonItem command](v6, "command");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIButtonItem setCommand:](v5, "setCommand:", v7);

        -[SearchUIButtonItem image](v6, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIButtonItem setImage:](v5, "setImage:", v8);

        -[SearchUIButtonItem title](v6, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIButtonItem setTitle:](v5, "setTitle:", v9);

        -[SearchUIButtonItem previewButtonItems](v6, "previewButtonItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[SearchUIButtonItem setPreviewButtonItems:](v5, "setPreviewButtonItems:", v10);
      }
    }
    self = v5;
  }
  v11 = v5;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SearchUIButtonItem title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v37 = 0;
    }
    else
    {
      -[SearchUIButtonItem title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      v37 = v10 ^ 1;
    }

    -[SearchUIButtonItem image](self, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v17 = 0;
    }
    else
    {
      -[SearchUIButtonItem image](self, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "image");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      v17 = v16 ^ 1;
    }

    -[SearchUIButtonItem command](self, "command");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "command");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19)
    {
      v23 = 0;
    }
    else
    {
      -[SearchUIButtonItem command](self, "command");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "command");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      v23 = v22 ^ 1;
    }

    -[SearchUIButtonItem previewButtonItems](self, "previewButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v25)
    {
      v29 = 0;
    }
    else
    {
      -[SearchUIButtonItem previewButtonItems](self, "previewButtonItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "previewButtonItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToArray:", v27);

      v29 = v28 ^ 1;
    }

    v30 = -[SearchUIButtonItem showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction");
    v31 = objc_msgSend(v5, "showsMenuAsPrimaryAction");
    v11 = 0;
    if (((v37 | v17 | v23) & 1) == 0 && (v29 & 1) == 0 && ((v30 ^ v31) & 1) == 0)
    {
      -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sfButtonItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 == v33)
      {
        v11 = 1;
      }
      else
      {
        -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sfButtonItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v34, "isEqual:", v35);

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[SearchUIButtonItem title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUIButtonItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SearchUIButtonItem command](self, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SearchUIButtonItem previewButtonItems](self, "previewButtonItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SearchUIButtonItem showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (id)offStateTitle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem title](&v3, sel_title);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)onStateTitle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem title](&v3, sel_title);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)title
{
  unint64_t v3;
  void *v4;
  NSObject *v5;

  v3 = -[SearchUIButtonItem status](self, "status");
  if (v3)
  {
    if (v3 == 1)
    {
      -[SearchUIButtonItem onStateTitle](self, "onStateTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SearchUIButtonItemLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SearchUIButtonItem title].cold.1();

      v4 = 0;
    }
  }
  else
  {
    -[SearchUIButtonItem offStateTitle](self, "offStateTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)defaultSymbolNameForCommand
{
  void *v2;
  void *v3;

  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", self, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSymbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)useDefaultSymbolFillStyle
{
  return 1;
}

- (id)offStateImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem image](&v3, sel_image);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)onStateImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem image](&v3, sel_image);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)image
{
  unint64_t v3;
  void *v4;
  NSObject *v5;

  v3 = -[SearchUIButtonItem status](self, "status");
  if (v3)
  {
    if (v3 == 1)
    {
      -[SearchUIButtonItem onStateImage](self, "onStateImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SearchUIButtonItemLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SearchUIButtonItem image].cold.1();

      v4 = 0;
    }
  }
  else
  {
    -[SearchUIButtonItem offStateImage](self, "offStateImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fallbackImage
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  SearchUISymbolImage *v6;

  v3 = -[SearchUIButtonItem status](self, "status");
  if (v3)
  {
    if (v3 != 1)
    {
      SearchUIButtonItemLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SearchUIButtonItem image].cold.1();
      v6 = 0;
      goto LABEL_10;
    }
    -[SearchUIButtonItem onStateSymbolName](self, "onStateSymbolName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUIButtonItem offStateSymbolName](self, "offStateSymbolName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!v4)
  {
    v6 = 0;
    return v6;
  }
  v6 = -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", v4);
LABEL_10:

  return v6;
}

- (id)offStateCommand
{
  return -[SearchUIButtonItem commandForStatus:](self, "commandForStatus:", 0);
}

- (id)onStateCommand
{
  return -[SearchUIButtonItem commandForStatus:](self, "commandForStatus:", 1);
}

- (id)command
{
  unint64_t v3;
  void *v4;
  NSObject *v5;

  v3 = -[SearchUIButtonItem status](self, "status");
  if (v3)
  {
    if (v3 == 1)
    {
      -[SearchUIButtonItem onStateCommand](self, "onStateCommand");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SearchUIButtonItemLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SearchUIButtonItem command].cold.1();

      v4 = 0;
    }
  }
  else
  {
    -[SearchUIButtonItem offStateCommand](self, "offStateCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)commandForStatus:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem command](&v4, sel_command, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)previewMenu
{
  return 0;
}

- (id)buttonAppearance
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIButtonItem;
  -[SearchUIButtonItem buttonAppearance](&v8, sel_buttonAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonAppearance");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)allowsContextMenu
{
  return 1;
}

- (SFButtonItem)sfButtonItem
{
  return self->_sfButtonItem;
}

- (void)setSfButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_sfButtonItem, a3);
}

- (BOOL)isOverflowButton
{
  return self->_isOverflowButton;
}

- (void)setIsOverflowButton:(BOOL)a3
{
  self->_isOverflowButton = a3;
}

- (BOOL)showsMenuAsPrimaryAction
{
  return self->_showsMenuAsPrimaryAction;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  self->_showsMenuAsPrimaryAction = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (SearchUIButtonItemDelegate)delegate
{
  return (SearchUIButtonItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sfButtonItem, 0);
}

- (void)title
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, v0, v1, "Unsupported state for button title: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)image
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, v0, v1, "Unsupported state for button image: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)command
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, v0, v1, "Unsupported state for button command: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
