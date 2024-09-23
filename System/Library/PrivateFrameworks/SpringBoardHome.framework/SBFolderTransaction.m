@implementation SBFolderTransaction

- (NSSet)removedIcons
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (self->_removedIcons)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMapTable keyEnumerator](self->_removedIcons, "keyEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        objc_msgSend(v3, "addObject:", v6);
        objc_msgSend(v4, "nextObject");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      while (v7);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)movedIcons
{
  return &self->_movedIcons->super;
}

- (NSSet)addedIcons
{
  return &self->_addedIcons->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceChangesAssertions, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_movedIcons, 0);
  objc_storeStrong((id *)&self->_addedIcons, 0);
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet **p_addedIcons;
  NSMutableSet *movedIcons;
  NSMutableSet *v11;
  NSMutableSet *v12;
  NSMutableSet *addedIcons;
  id v14;

  v14 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_removedIcons, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    addedIcons = self->_addedIcons;
    p_addedIcons = &self->_addedIcons;
    v8 = addedIcons;
    if (addedIcons)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[NSMapTable removeObjectForKey:](self->_removedIcons, "removeObjectForKey:", v6);
  if (v7 != v14)
  {
    movedIcons = self->_movedIcons;
    p_addedIcons = &self->_movedIcons;
    v8 = movedIcons;
    if (movedIcons)
    {
LABEL_5:
      -[NSMutableSet addObject:](v8, "addObject:", v6);
      goto LABEL_6;
    }
LABEL_4:
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = *p_addedIcons;
    *p_addedIcons = v11;

    v8 = *p_addedIcons;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v6;
  NSMapTable *removedIcons;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[NSMutableSet containsObject:](self->_addedIcons, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_addedIcons, "removeObject:", v6);
  }
  else
  {
    removedIcons = self->_removedIcons;
    if (!removedIcons)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_removedIcons;
      self->_removedIcons = v8;

      removedIcons = self->_removedIcons;
    }
    -[NSMapTable setObject:forKey:](removedIcons, "setObject:forKey:", v10, v6);
  }

}

- (void)addAssertion:(id)a3
{
  id v4;
  NSPointerArray *coalesceChangesAssertions;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  coalesceChangesAssertions = self->_coalesceChangesAssertions;
  v8 = v4;
  if (!coalesceChangesAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_coalesceChangesAssertions;
    self->_coalesceChangesAssertions = v6;

    v4 = v8;
    coalesceChangesAssertions = self->_coalesceChangesAssertions;
  }
  -[NSPointerArray addPointer:](coalesceChangesAssertions, "addPointer:", v4);

}

- (void)removeAssertion:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = -[NSPointerArray count](self->_coalesceChangesAssertions, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_coalesceChangesAssertions, "pointerAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_coalesceChangesAssertions, "removePointerAtIndex:", v6);

  }
LABEL_7:

}

- (unint64_t)assertionCount
{
  return -[NSPointerArray count](self->_coalesceChangesAssertions, "count");
}

- (id)description
{
  return -[SBFolderTransaction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolderTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolderTransaction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[SBFolderTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderTransaction addedIcons](self, "addedIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("addedIcons"));

  -[SBFolderTransaction removedIcons](self, "removedIcons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("removedIcons"));

  -[SBFolderTransaction movedIcons](self, "movedIcons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("movedIcons"));

  -[NSPointerArray allObjects](self->_coalesceChangesAssertions, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bs_compactMap:", &__block_literal_global_802);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("reasons"));
  return v4;
}

uint64_t __61__SBFolderTransaction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason");
}

@end
