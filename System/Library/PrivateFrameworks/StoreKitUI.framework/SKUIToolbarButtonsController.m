@implementation SKUIToolbarButtonsController

- (SKUIToolbarButtonsController)initWithToolbarViewElement:(id)a3
{
  id v5;
  SKUIToolbarButtonsController *v6;
  SKUIToolbarButtonsController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToolbarButtonsController initWithToolbarViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIToolbarButtonsController;
  v6 = -[SKUIToolbarButtonsController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_toolbarElement, a3);

  return v7;
}

- (id)addButtonItemWithButtonViewElement:(id)a3
{
  id v4;
  id v5;
  NSMapTable *buttonItemElements;
  NSMapTable *v7;
  NSMapTable *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v5, "setAction:", sel__buttonAction_);
  objc_msgSend(v5, "setTarget:", self);
  -[SKUIToolbarButtonsController _updateButtonItem:withButtonViewElement:](self, "_updateButtonItem:withButtonViewElement:", v5, v4);
  buttonItemElements = self->_buttonItemElements;
  if (!buttonItemElements)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v8 = self->_buttonItemElements;
    self->_buttonItemElements = v7;

    buttonItemElements = self->_buttonItemElements;
  }
  -[NSMapTable setObject:forKey:](buttonItemElements, "setObject:forKey:", v4, v5);

  return v5;
}

- (void)disconnectAllButtons
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_buttonItemElements;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setTarget:", 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_buttonItemElements, "removeAllObjects");
}

- (void)_buttonAction:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_buttonItemElements, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  objc_msgSend(v9, "setStyle:", 2 * (objc_msgSend(v5, "buttonViewType") == 8));
  objc_msgSend(v5, "buttonImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSLog(CFSTR("Toolbar buttons with images are unsupported at this time."));
  }
  else
  {
    objc_msgSend(v5, "buttonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarElement, 0);
  objc_storeStrong((id *)&self->_buttonItemElements, 0);
}

- (void)initWithToolbarViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToolbarButtonsController initWithToolbarViewElement:]";
}

@end
