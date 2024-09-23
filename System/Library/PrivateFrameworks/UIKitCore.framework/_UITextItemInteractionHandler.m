@implementation _UITextItemInteractionHandler

- (_UITextItemInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4
{
  id v6;
  id v7;
  _UITextItemInteractionHandler *v8;
  _UITextItemInteractionHandler *v9;
  void *v10;
  NSUInteger v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextItemInteractionHandler;
  v8 = -[_UITextItemInteractionHandler init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    objc_storeWeak((id *)&v9->_textContentView, v7);
    objc_msgSend(v6, "range");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_range.location = objc_msgSend(v10, "asRange");
    v9->_range.length = v11;

  }
  return v9;
}

- (id)contextMenuConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  id v23;

  -[_UITextItemInteractionHandler _defaultContextMenuConfiguration](self, "_defaultContextMenuConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextItemInteractionHandler _defaultMenuForInteractableItem](self, "_defaultMenuForInteractableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "actionProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, MEMORY[0x1E0C9AA60]);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[_UITextItemInteractionHandler _preparedMenuConfigurationWithDefaultMenu:](self, "_preparedMenuConfigurationWithDefaultMenu:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v17 = 0;
    goto LABEL_13;
  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke;
  aBlock[3] = &unk_1E16B2BC0;
  v11 = v8;
  v22 = v11;
  v23 = v4;
  v12 = _Block_copy(aBlock);
  objc_msgSend(v3, "previewProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_previewView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke_2;
    v19[3] = &unk_1E16B2BE8;
    v20 = v15;
    v16 = _Block_copy(v19);

    v13 = v20;
LABEL_8:

    v13 = v16;
    goto LABEL_9;
  }
  objc_msgSend(v11, "preview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_8;
LABEL_9:
  if (v3)
  {
    objc_msgSend(v3, "setPreviewProvider:", v13);
    objc_msgSend(v3, "setActionProvider:", v12);
  }
  else
  {
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v13, v12);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v3;

  v17 = v3;
LABEL_13:

  return v17;
}

- (id)_editMenuConfiguration
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[_UITextItemInteractionHandler item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v4 = v3;
  v6 = v5;

  return +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v4, v6);
}

- (id)_defaultContextMenuConfiguration
{
  return 0;
}

- (id)primaryAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[_UITextItemInteractionHandler _defaultPrimaryActionForInteractableItem](self, "_defaultPrimaryActionForInteractableItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextItemInteractionHandler item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preparedPrimaryActionWithDefaultAction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (-[_UITextItemInteractionHandler _canPresentMenuWithoutPrimaryAction](self, "_canPresentMenuWithoutPrimaryAction"))
    {
      -[_UITextItemInteractionHandler _menuForInteractableItem](self, "_menuForInteractableItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __46___UITextItemInteractionHandler_primaryAction__block_invoke;
        v7[3] = &unk_1E16B2C10;
        v7[4] = self;
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, 0, CFSTR("_UITextItemInteractionHandler.presentMenu.action"), v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_preparedMenuConfigurationWithDefaultMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_UITextItemInteractionHandler item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preparedMenuConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!v4)
    {
      -[_UITextItemInteractionHandler _defaultMenuForInteractableItem](self, "_defaultMenuForInteractableItem");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[_UITextItemInteractionHandler item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareMenuConfigurationWithDefaultMenu:", v4);

  }
  -[_UITextItemInteractionHandler item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preparedMenuConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_menuForInteractableItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UITextItemInteractionHandler _preparedMenuConfigurationWithDefaultMenu:](self, "_preparedMenuConfigurationWithDefaultMenu:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[_UITextItemInteractionHandler _defaultMenuForInteractableItem](self, "_defaultMenuForInteractableItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)_canPresentMenuWithoutPrimaryAction
{
  return 1;
}

- (id)_defaultMenuForInteractableItem
{
  return 0;
}

- (id)_defaultPrimaryActionForInteractableItem
{
  return 0;
}

- (_UITextInteractableItem)item
{
  return (_UITextInteractableItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (_UITextContent)textContentView
{
  return (_UITextContent *)objc_loadWeakRetained((id *)&self->_textContentView);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textContentView);
  objc_destroyWeak((id *)&self->_item);
}

@end
