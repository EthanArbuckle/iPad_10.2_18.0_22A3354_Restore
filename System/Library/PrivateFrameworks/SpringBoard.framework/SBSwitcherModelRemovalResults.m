@implementation SBSwitcherModelRemovalResults

- (SBSwitcherModelRemovalResults)init
{
  SBSwitcherModelRemovalResults *v2;
  NSMutableSet *v3;
  NSMutableSet *appLayouts;
  uint64_t v5;
  NSMutableDictionary *appLayoutToAction;
  uint64_t v7;
  NSMutableDictionary *displayItemToHide;
  uint64_t v9;
  NSMutableDictionary *appLayoutToReplacement;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherModelRemovalResults;
  v2 = -[SBSwitcherModelRemovalResults init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    appLayouts = v2->_appLayouts;
    v2->_appLayouts = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    appLayoutToAction = v2->_appLayoutToAction;
    v2->_appLayoutToAction = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    displayItemToHide = v2->_displayItemToHide;
    v2->_displayItemToHide = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    appLayoutToReplacement = v2->_appLayoutToReplacement;
    v2->_appLayoutToReplacement = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (NSArray)appLayouts
{
  return (NSArray *)-[NSMutableSet allObjects](self->_appLayouts, "allObjects");
}

- (void)setAction:(id)a3 forAppLayout:(id)a4
{
  id v7;
  NSMutableDictionary *appLayoutToAction;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModelRemovalResults.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  appLayoutToAction = self->_appLayoutToAction;
  v9 = (void *)MEMORY[0x1D17E5550]();
  -[NSMutableDictionary setObject:forKey:](appLayoutToAction, "setObject:forKey:", v9, v7);

  -[NSMutableSet addObject:](self->_appLayouts, "addObject:", v7);
}

- (void)removeAppLayout:(id)a3
{
  -[NSMutableSet removeObject:](self->_appLayouts, "removeObject:", a3);
}

- (void)setHide:(BOOL)a3 forDisplayItem:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *displayItemToHide;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  displayItemToHide = self->_displayItemToHide;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](displayItemToHide, "setObject:forKey:", v8, v7);

}

- (void)setReplacementAppLayout:(id)a3 forAppLayout:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_appLayoutToReplacement, "setObject:forKey:", a3, a4);
}

- (void)executeActionForAppLayout:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_appLayoutToAction, "objectForKey:");
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_appLayoutToAction, "removeObjectForKey:", v5);
    v4[2](v4);
  }

}

- (BOOL)willHideDisplayItem:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKey:](self->_displayItemToHide, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)replacementAppLayoutForAppLayout:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_appLayoutToReplacement, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutToReplacement, 0);
  objc_storeStrong((id *)&self->_displayItemToHide, 0);
  objc_storeStrong((id *)&self->_appLayoutToAction, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
}

@end
