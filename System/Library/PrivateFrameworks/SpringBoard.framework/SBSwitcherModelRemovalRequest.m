@implementation SBSwitcherModelRemovalRequest

- (NSArray)appLayouts
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_appLayoutToAction, "allKeys");
}

- (id)actionForAppLayout:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_appLayoutToAction, "objectForKey:", a3);
}

- (void)setAction:(id)a3 forAppLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *appLayoutToAction;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  appLayoutToAction = self->_appLayoutToAction;
  if (v13)
  {
    if (!appLayoutToAction)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v11 = self->_appLayoutToAction;
      self->_appLayoutToAction = v10;

      v7 = v13;
      appLayoutToAction = self->_appLayoutToAction;
    }
    -[NSMutableDictionary setObject:forKey:](appLayoutToAction, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](appLayoutToAction, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](self->_appLayoutToAction, "count"))
    {
      v12 = self->_appLayoutToAction;
      self->_appLayoutToAction = 0;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutToAction, 0);
}

@end
