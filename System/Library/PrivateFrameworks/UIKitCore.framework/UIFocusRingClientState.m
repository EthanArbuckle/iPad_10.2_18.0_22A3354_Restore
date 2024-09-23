@implementation UIFocusRingClientState

- (UIFocusRingClientState)initWithClientID:(id)a3
{
  id v3;
  UIFocusRingClientState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIFocusRingClientState;
  v3 = a3;
  v4 = -[UIFocusRingClientState init](&v6, sel_init);
  -[UIFocusRingClientState setClientID:](v4, "setClientID:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusRingClientState clientID](self, "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusRingClientState activeFocusLayersToItems](self, "activeFocusLayersToItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, active focus layers: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIFocusItem)currentFocusItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_currentFocusItem);
}

- (void)setCurrentFocusItem:(id)a3
{
  objc_storeWeak((id *)&self->_currentFocusItem, a3);
}

- (NSMutableArray)activeFocusLayers
{
  return self->_activeFocusLayers;
}

- (void)setActiveFocusLayers:(id)a3
{
  objc_storeStrong((id *)&self->_activeFocusLayers, a3);
}

- (NSMapTable)activeFocusLayersToItems
{
  return self->_activeFocusLayersToItems;
}

- (void)setActiveFocusLayersToItems:(id)a3
{
  objc_storeStrong((id *)&self->_activeFocusLayersToItems, a3);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_activeFocusLayersToItems, 0);
  objc_storeStrong((id *)&self->_activeFocusLayers, 0);
  objc_destroyWeak((id *)&self->_currentFocusItem);
}

@end
