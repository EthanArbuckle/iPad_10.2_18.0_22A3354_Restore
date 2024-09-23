@implementation PKGroup

- (NSNumber)groupID
{
  return -[PKCatalogGroup groupID](self->_catalogGroup, "groupID");
}

- (unint64_t)passCount
{
  void *v2;
  unint64_t v3;

  -[PKCatalogGroup uniqueIDs](self->_catalogGroup, "uniqueIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)passAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PKCatalogGroup uniqueIDs](self->_catalogGroup, "uniqueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_passes, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)frontmostPassIndex
{
  return self->_frontmostPassIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_catalogGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)stateAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKGroup passAtIndex:](self, "passAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroup stateForPassUniqueID:](self, "stateForPassUniqueID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)passes
{
  return (id)-[NSMutableDictionary allValues](self->_passes, "allValues");
}

- (PKGroup)init
{

  return 0;
}

- (id)initWithCatalogGroup:(void *)a3 passes:(void *)a4 states:(void *)a5 accounts:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v32 = a4;
  v12 = a5;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)PKGroup;
    v13 = (id *)objc_msgSendSuper2(&v39, sel_init);
    a1 = v13;
    if (v13)
    {
      v30 = v10;
      objc_storeStrong(v13 + 3, a2);
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = a1[4];
      a1[4] = v14;

      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = a1[5];
      a1[5] = v16;

      *((_DWORD *)a1 + 4) = 0;
      objc_msgSend(a1[3], "uniqueIDs");
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v31, "copy");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKey:", v23, v30);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v24, v23);
              objc_msgSend(v32, "objectForKeyedSubscript:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v25, v23);

              v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v27 = a1[6];
              a1[6] = v26;

              if (v12 && objc_msgSend(v24, "passType") == 1)
              {
                v33[0] = MEMORY[0x1E0C809B0];
                v33[1] = 3221225472;
                v33[2] = __55__PKGroup_initWithCatalogGroup_passes_states_accounts___block_invoke;
                v33[3] = &unk_1E2ADB3F0;
                v34 = v24;
                objc_msgSend(v12, "pk_anyObjectPassingTest:", v33);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v28, v23);

              }
            }
            else
            {
              objc_msgSend(v31, "removeObject:", v23);
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v20);
      }

      v10 = v30;
    }
  }

  return a1;
}

uint64_t __55__PKGroup_initWithCatalogGroup_passes_states_accounts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "associatedAccountServiceAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKCatalogGroup groupID](self->_catalogGroup, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCatalogGroup uniqueIDs](self->_catalogGroup, "uniqueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@) %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stateForPassUniqueID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", a3);
}

- (id)associatedAccountForPassAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKGroup passAtIndex:](self, "passAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroup associatedAccountForPassUniqueID:](self, "associatedAccountForPassUniqueID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)associatedAccountForPassUniqueID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_accounts, "objectForKeyedSubscript:", a3);
}

- (void)updateAssociatedAccount:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  if (a1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "passType") == 1)
          {
            objc_msgSend(v8, "associatedAccountServiceAccountIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "accountIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v9;
            v12 = v10;
            if (v11 == v12)
            {

LABEL_20:
              v16 = *(void **)(a1 + 48);
              objc_msgSend(v8, "uniqueID", v3);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = *(void **)(a1 + 48);
              objc_msgSend(v8, "uniqueID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v28, v20);

              -[PKGroup observers](a1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v30;
                do
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v30 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                    if (v18)
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                        objc_msgSend(v26, "group:didUpdateAssociatedAccount:forPass:", a1, v28, v8);
                    }
                    else if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v26, "group:didInsertAssociatedAccount:forPass:", a1, v28, v8);
                    }
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                }
                while (v23);
              }

              v3 = v27;
              goto LABEL_33;
            }
            v13 = v12;
            if (v11)
              v14 = v12 == 0;
            else
              v14 = 1;
            if (v14)
            {

            }
            else
            {
              v15 = objc_msgSend(v11, "isEqualToString:", v12);

              if ((v15 & 1) != 0)
                goto LABEL_20;
            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_33:

  }
}

- (id)observers
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  objc_msgSend(*(id *)(a1 + 8), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_lock_unlock(v2);
  return v4;
}

- (void)_moveUniqueID:(uint64_t)a3 toIndex:(int)a4 notify:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = -[PKGroup _indexOfUniqueID:](*(void **)(a1 + 24), v7);
  if (v8 != a3)
  {
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 24), "uniqueIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", v9);
    objc_msgSend(v10, "insertObject:atIndex:", v7, a3);
    if (a4)
    {
      -[PKGroup observers](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "group:didMovePassFromIndex:toIndex:", a1, v9, a3);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }

}

- (unint64_t)indexForPassUniqueID:(id)a3
{
  PKCatalogGroup *catalogGroup;
  id v4;
  void *v5;
  unint64_t v6;

  catalogGroup = self->_catalogGroup;
  v4 = a3;
  -[PKCatalogGroup uniqueIDs](catalogGroup, "uniqueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (uint64_t)_indexOfUniqueID:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "uniqueIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v3);

  return v5;
}

uint64_t __85__PKGroup_updateWithCatalogGroup_passes_states_accounts_expiredSectionPasses_notify___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "associatedAccountServiceAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_removeUniqueID:(int)a3 notify:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a1[4], "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKGroup _indexOfUniqueID:](a1[3], v5);
  objc_msgSend(a1[4], "removeObjectForKey:", v5);
  objc_msgSend(a1[5], "removeObjectForKey:", v5);
  objc_msgSend(a1[3], "uniqueIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", v7);

  if (a3)
  {
    -[PKGroup observers]((uint64_t)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "group:didRemovePass:atIndex:", a1, v6, v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (uint64_t)containsPassesInAdditionToUniqueID:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  if (a1
    && (objc_msgSend(*(id *)(a1 + 24), "uniqueIDs"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v6 = 1;
    if (v3 && v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 24), "uniqueIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v3;
      if (v8 == v9)
      {
        v6 = 0;
      }
      else if (v8)
      {
        v6 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addGroupObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_observersLock);

}

- (void)removeGroupObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)setFrontmostPassIndex:(unint64_t)a3
{
  self->_frontmostPassIndex = a3;
}

@end
