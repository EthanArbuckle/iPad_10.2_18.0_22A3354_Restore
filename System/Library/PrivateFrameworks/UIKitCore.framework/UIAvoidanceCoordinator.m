@implementation UIAvoidanceCoordinator

- (UIAvoidanceCoordinator)init
{
  UIAvoidanceCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *blockades;
  uint64_t v5;
  NSMutableSet *clients;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAvoidanceCoordinator;
  v2 = -[UIAvoidanceCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    blockades = v2->_blockades;
    v2->_blockades = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)releaseAll:(id)a3 withType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __46__UIAvoidanceCoordinator_releaseAll_withType___block_invoke;
        v13[3] = &unk_1E16B4C10;
        v13[4] = self;
        ForPropertiesMatchingType(a4, v12, v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

uint64_t __46__UIAvoidanceCoordinator_releaseAll_withType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[UIAvoidanceCoordinator releaseAll:withType:](self, "releaseAll:withType:", self->_blockades, 1);
  -[UIAvoidanceCoordinator releaseAll:withType:](self, "releaseAll:withType:", self->_clients, 2);
  v3.receiver = self;
  v3.super_class = (Class)UIAvoidanceCoordinator;
  -[UIAvoidanceCoordinator dealloc](&v3, sel_dealloc);
}

- (void)setGroupOfBlockades:(id)a3 forBlockadeIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_blockades, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A blockade already exists with the name '%@', unable to create group"), v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Expected NSArray, got %@"), objc_opt_class());
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blockades, "setObject:forKeyedSubscript:", v8, v6);
  }
  else if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Blockade name '%@' is not a group"), v6);
    -[NSMutableDictionary removeObjectForKey:](self->_blockades, "removeObjectForKey:", v6);
  }

}

- (void)addAvoidanceObject:(id)a3
{
  id v4;
  uint64_t Type;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSMutableDictionary *blockades;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSMutableDictionary *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = a3;
  Type = FindType(v4);
  v6 = Type;
  v7 = MEMORY[0x1E0C809B0];
  if (Type)
  {
    if ((Type & 1) != 0)
    {
      v8 = v4;
      blockades = self->_blockades;
      objc_msgSend(v8, "blockadeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](blockades, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke;
        v20[3] = &unk_1E16B4C10;
        v20[4] = self;
        ForPropertiesMatchingType(1, v11, v20);
      }
      objc_msgSend(v8, "blockadeIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12
        && (v13 = (void *)v12,
            objc_msgSend(v8, "blockadeIdentifier"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E16EDF20),
            v14,
            v13,
            (v15 & 1) == 0))
      {
        v16 = self->_blockades;
        objc_msgSend(v8, "blockadeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v8, v17);

      }
      else
      {
        v6 &= 2u;
      }

    }
    if ((v6 & 2) != 0)
    {
      if (-[NSMutableSet containsObject:](self->_clients, "containsObject:", v4))
      {
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_2;
        v19[3] = &unk_1E16B4C10;
        v19[4] = self;
        ForPropertiesMatchingType(2, v4, v19);
      }
      else
      {
        -[NSMutableSet addObject:](self->_clients, "addObject:", v4);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Object %@ must conform to at least one of UIAvoidanceBlockade, UIAvoidanceClient"), v4);
  }
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_3;
  v18[3] = &unk_1E16B4C10;
  v18[4] = self;
  ForPropertiesMatchingType(v6, v4, v18);

}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), a3, a4);
}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), a3, a4);
}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), a3, 7, a4);
}

- (void)removeAvoidanceObject:(id)a3
{
  id v4;
  uint64_t Type;
  uint64_t v6;
  id v7;
  NSMutableDictionary *blockades;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  Type = FindType(v4);
  v6 = Type;
  if ((Type & 1) != 0)
  {
    v7 = v4;
    blockades = self->_blockades;
    objc_msgSend(v7, "blockadeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](blockades, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = self->_blockades;
      objc_msgSend(v7, "blockadeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    }
    else
    {
      v6 &= 2u;
    }

    if ((v6 & 2) == 0)
    {
LABEL_3:
      if (!v6)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else if ((Type & 2) == 0)
  {
    goto LABEL_3;
  }
  if (-[NSMutableSet containsObject:](self->_clients, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v4);
  }
  else
  {
    v6 &= ~2uLL;
    if (!v6)
      goto LABEL_14;
  }
LABEL_12:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__UIAvoidanceCoordinator_removeAvoidanceObject___block_invoke;
  v15[3] = &unk_1E16B4C10;
  v15[4] = self;
  ForPropertiesMatchingType(v6, v4, v15);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "blockadeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAvoidanceCoordinator findClientsForBlockade:](self, "findClientsForBlockade:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAvoidanceCoordinator updateClients:](self, "updateClients:", v14);

  }
LABEL_14:

}

uint64_t __48__UIAvoidanceCoordinator_removeAvoidanceObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (id)findNamesForBlockade:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = 0;
  v17 = v6;
  while (2)
  {
    v8 = v7;
    v7 = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_blockades;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[NSMutableDictionary objectForKey:](self->_blockades, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CDE58) & 1) == 0
          && (objc_msgSend(v15, "containsObject:", v7) & 1) != 0)
        {
          break;
        }

        if (v11 == ++v13)
        {
          v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_14;
        }
      }
      objc_msgSend(v5, "addObject:", v14);
      v6 = v14;

      if (v6)
        continue;
    }
    else
    {
LABEL_14:

    }
    break;
  }

  return v5;
}

- (id)findClientsForBlockade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", &stru_1E16EDF20))
  {
    v17 = v5;
    -[UIAvoidanceCoordinator findNamesForBlockade:](self, "findNamesForBlockade:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_clients;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE0CDEB8))
          {
            objc_msgSend(v13, "blockades");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v7, "intersectsSet:", v14);

            if (v15)
              objc_msgSend(v6, "addObject:", v13);
          }
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v5 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)findBlockadesForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");
    -[NSMutableDictionary objectForKey:](self->_blockades, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0CDE58))
      objc_msgSend(v5, "addObject:", v8);
    else
      objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  return v5;
}

- (void)updateClients:(id)a3
{
  id v4;
  int recurseCount;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  UIAvoidanceCoordinator *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  recurseCount = self->_recurseCount;
  if (recurseCount <= 10)
  {
    self->_recurseCount = recurseCount + 1;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v4;
    v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v42;
      v24 = *MEMORY[0x1E0C99778];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(obj);
          v29 = v6;
          v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v28 = v7;
          objc_msgSend(v7, "blockades");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v8)
          {
            v9 = v8;
            v31 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v38 != v31)
                  objc_enumerationMutation(v30);
                v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                v12 = self;
                -[UIAvoidanceCoordinator findBlockadesForName:](self, "findBlockadesForName:", v11);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                v15 = v13;
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v34;
                  do
                  {
                    for (j = 0; j != v17; ++j)
                    {
                      if (*(_QWORD *)v34 != v18)
                        objc_enumerationMutation(v15);
                      objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "blockadeShapes");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "unionSet:", v20);

                    }
                    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  }
                  while (v17);
                }

                objc_msgSend(v32, "setObject:forKey:", v14, v11);
                self = v12;
              }
              v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v9);
          }

          objc_msgSend(v28, "avoidanceApplicator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v24, CFSTR("Client %@ needs an applicator"), v28);
          objc_msgSend(v28, "avoidanceController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "avoid:forClient:withCoordinator:", v32, v28, self);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "updateClient:toPosition:", v28, v23);

          v6 = v29 + 1;
        }
        while (v29 + 1 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v27);
    }
    --self->_recurseCount;
    v4 = obj;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v24 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if ((char *)a6 - 3 >= (char *)4)
  {
    if (a6 != (void *)1)
    {
      if (a6 != (void *)2)
      {
        NSLog(CFSTR("Unknown context %p"), a6, v24);
        goto LABEL_20;
      }
      objc_msgSend(v10, "blockadeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAvoidanceCoordinator findClientsForBlockade:](self, "findClientsForBlockade:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAvoidanceCoordinator updateClients:](self, "updateClients:", v15);
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UIAvoidanceCoordinator findClientsForBlockade:](self, "findClientsForBlockade:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_blockades, "removeObjectForKey:", v16);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[UIAvoidanceCoordinator findClientsForBlockade:](self, "findClientsForBlockade:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blockades, "setObject:forKeyedSubscript:", v10, v17);
      v19 = v15;
      v20 = v18;
      v21 = v20;
      if (!v19)
      {
        v23 = v20;
        goto LABEL_18;
      }
      if (v20)
      {
        v22 = (void *)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v22, "intersectSet:", v21);
        v23 = (id)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v23, "unionSet:", v21);
        objc_msgSend(v23, "minusSet:", v22);

LABEL_18:
        -[UIAvoidanceCoordinator updateClients:](self, "updateClients:", v23);

        goto LABEL_19;
      }
    }
    else if (!v15)
    {
      v21 = 0;
      v23 = 0;
      goto LABEL_18;
    }
    v23 = v15;
    v21 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAvoidanceCoordinator updateClients:](self, "updateClients:", v13);

LABEL_20:
}

- (CGRect)avoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avoidanceFrame.origin.x;
  y = self->_avoidanceFrame.origin.y;
  width = self->_avoidanceFrame.size.width;
  height = self->_avoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvoidanceFrame:(CGRect)a3
{
  self->_avoidanceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_blockades, 0);
}

@end
