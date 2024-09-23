@implementation SXComponentDependencyResolver

- (_QWORD)initWithComponentIdentifiers:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)SXComponentDependencyResolver;
    a1 = objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)a1[2];
      a1[2] = v4;

      v22[0] = &unk_24D6FF1C0;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = &unk_24D6FF1D8;
      v23[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[3];
      a1[3] = v8;

      -[SXComponentDependencyResolver createComponentNodesForComponentIdentifiers:](a1, v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            -[SXComponentDependencyResolver addComponentNode:]((uint64_t)a1, *(_QWORD **)(*((_QWORD *)&v16 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v12);
      }

    }
  }

  return a1;
}

- (id)createComponentNodesForComponentIdentifiers:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          v10 = -[SXComponentNode initWithComponentIdentifier:andAttribute:]([SXComponentNode alloc], v9, 1);
          objc_msgSend(a1, "addObject:", v10, (_QWORD)v13);
          v11 = -[SXComponentNode initWithComponentIdentifier:andAttribute:]([SXComponentNode alloc], v9, 2);
          objc_msgSend(a1, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  return a1;
}

- (void)addComponentNode:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = a2[2];
    v6 = a2;
    objc_msgSend(v4, "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[SXFullscreenCaption text]((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v8);

    objc_msgSend(*(id *)(a1 + 16), "addObject:", v6);
  }
}

- (void)addDependency:(uint64_t)a1
{
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;
    v4 = a2;

    -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](a1, *((void **)v4 + 1), *((_QWORD *)v4 + 3));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponentNode addComponentDependency:]((uint64_t)v5, v4);

  }
}

- (id)componentNodeForComponentIdentifier:(uint64_t)a3 andAttribute:
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a2;
    objc_msgSend(v5, "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)solvableOrder
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (uint64_t)a1;
    if (!a1[1])
    {
      v2 = a1[2];
      -[SXComponentDependencyResolver solvedOrderForComponentNodes:](v1, v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(v1 + 8);
      *(_QWORD *)(v1 + 8) = v3;

    }
    v5 = *(void **)(v1 + 8);
    if (!v5)
      v5 = (void *)MEMORY[0x24BDBD1A8];
    a1 = v5;
  }
  return a1;
}

- (id)solvedOrderForComponentNodes:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
          -[SXComponentDependencyResolver resolveStack:withSolvedNodes:](a1, v4, v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)componentNodesDependentOnComponentNode:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (-[SXComponentNode hasDependencyToComponentIdentifier:attribute:](v10, *((void **)v3 + 1), *((_QWORD *)v3 + 2)))objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)resolveStack:(void *)a3 withSolvedNodes:
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id *v13;
  uint64_t v14;
  char v15;
  void *v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1 && objc_msgSend(v5, "count"))
  {
    v16 = v5;
    do
    {
      objc_msgSend(v5, "lastObject", v16);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[SXComponentNode dependencies](v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v17 = v7;
        v10 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v8);
            -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](a1, *(void **)(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 16), *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 32));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v6, "indexOfObjectIdenticalTo:", v12) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v5 = v16;
              LOBYTE(v9) = objc_msgSend(v16, "containsObject:", v12);
              if ((v9 & 1) == 0)
                objc_msgSend(v16, "addObject:", v12);

              goto LABEL_16;
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            continue;
          break;
        }
        v5 = v16;
LABEL_16:
        v7 = v17;
      }

      objc_msgSend(v5, "lastObject");
      v13 = (id *)objc_claimAutoreleasedReturnValue();

      if (v7 == v13)
      {
        objc_msgSend(v5, "removeLastObject");
        if (objc_msgSend(v6, "indexOfObjectIdenticalTo:", v7) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v6, "addObject:", v7);
      }

      v14 = objc_msgSend(v5, "count");
      v15 = v9 ^ 1;
      if (!v14)
        v15 = 0;
    }
    while ((v15 & 1) != 0);
  }

}

- (id)debugDescription
{
  void *v3;
  NSMutableArray *componentNodes;
  uint64_t i;
  id *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\n----------- Dependency Graph -----------\n\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (self)
    componentNodes = self->_componentNodes;
  else
    componentNodes = 0;
  obj = componentNodes;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v6 = *(id **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (-[SXFullscreenCaption caption]((uint64_t)v6) == 2)
          v7 = CFSTR("size");
        else
          v7 = CFSTR("position");
        v8 = v7;
        -[SXFullscreenCaption text]((uint64_t)v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("The %@ of %@ depends on:\n"), v8, v9);

        -[SXComponentNode dependencies](v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v25 = v8;
          v26 = i;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          -[SXComponentNode dependencies](v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                if (-[SXAnimatedImageFrame index](v17) == 2)
                  v18 = CFSTR("size");
                else
                  v18 = CFSTR("position");
                v19 = v18;
                -[SXFullscreenCaption caption](v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendFormat:", CFSTR(" - the %@ of component %@\n"), v19, v20);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v14);
          }

          v8 = v25;
          i = v26;
        }
        else
        {
          objc_msgSend(v3, "appendString:", CFSTR(" - none\n"));
        }
        objc_msgSend(v3, "appendString:", CFSTR("\n"));

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n----------- End of Dependency Graph -----------"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedComponentNodes, 0);
  objc_storeStrong((id *)&self->_componentNodes, 0);
  objc_storeStrong((id *)&self->_solvedComponentNodes, 0);
}

@end
