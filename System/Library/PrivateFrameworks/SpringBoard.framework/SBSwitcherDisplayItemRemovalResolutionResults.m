@implementation SBSwitcherDisplayItemRemovalResolutionResults

- (NSArray)displayItems
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_displayItemToActions, "allKeys");
}

- (id)actionsForDisplayItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_displayItemToActions, "objectForKey:", a3);
}

- (void)setActions:(id)a3 forDisplayItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *displayItemToActions;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  displayItemToActions = self->_displayItemToActions;
  if (v13)
  {
    if (!displayItemToActions)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v11 = self->_displayItemToActions;
      self->_displayItemToActions = v10;

      v7 = v13;
      displayItemToActions = self->_displayItemToActions;
    }
    -[NSMutableDictionary setObject:forKey:](displayItemToActions, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](displayItemToActions, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](self->_displayItemToActions, "count"))
    {
      v12 = self->_displayItemToActions;
      self->_displayItemToActions = 0;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItemToActions, 0);
}

@end
