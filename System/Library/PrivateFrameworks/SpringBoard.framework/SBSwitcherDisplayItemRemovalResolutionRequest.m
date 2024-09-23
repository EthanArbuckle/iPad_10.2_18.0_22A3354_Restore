@implementation SBSwitcherDisplayItemRemovalResolutionRequest

- (NSArray)displayItems
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_displayItemToRemovalIntentType, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)removalIntentTypeForDisplayItem:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMapTable objectForKey:](self->_displayItemToRemovalIntentType, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setRemovalIntentType:(int64_t)a3 forDisplayItem:(id)a4
{
  id v6;
  NSMapTable *displayItemToRemovalIntentType;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v6 = a4;
  displayItemToRemovalIntentType = self->_displayItemToRemovalIntentType;
  v11 = v6;
  if (a3)
  {
    if (!displayItemToRemovalIntentType)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayItemToRemovalIntentType;
      self->_displayItemToRemovalIntentType = v8;

      displayItemToRemovalIntentType = self->_displayItemToRemovalIntentType;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](displayItemToRemovalIntentType, "setObject:forKey:", v10, v11);
  }
  else
  {
    -[NSMapTable removeObjectForKey:](displayItemToRemovalIntentType, "removeObjectForKey:", v6);
    if (-[NSMapTable count](self->_displayItemToRemovalIntentType, "count"))
      goto LABEL_7;
    v10 = self->_displayItemToRemovalIntentType;
    self->_displayItemToRemovalIntentType = 0;
  }

LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItemToRemovalIntentType, 0);
}

@end
