@implementation SXComponentInteractionHandlerManager

- (SXComponentInteractionHandlerManager)initWithViewport:(id)a3
{
  id v5;
  SXComponentInteractionHandlerManager *v6;
  uint64_t v7;
  NSMapTable *interactionHandlers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXComponentInteractionHandlerManager;
  v6 = -[SXComponentInteractionHandlerManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    interactionHandlers = v6->_interactionHandlers;
    v6->_interactionHandlers = (NSMapTable *)v7;

    objc_storeStrong((id *)&v6->_viewport, a3);
  }

  return v6;
}

- (void)addInteractionHandler:(id)a3 componentView:(id)a4 types:(unint64_t)a5
{
  id v8;
  SXComponentInteraction *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (v13 && v8)
  {
    v9 = -[SXComponentInteraction initWithComponentView:handler:types:]([SXComponentInteraction alloc], "initWithComponentView:handler:types:", v8, v13, a5);
    if (-[SXComponentInteraction handlesType:](v9, "handlesType:", 8)
      && (objc_msgSend(v13, "conformsToProtocol:", &unk_254EFA100) & 1) != 0
      || !-[SXComponentInteraction handlesType:](v9, "handlesType:", 8))
    {
      -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v8);

      }
      objc_msgSend(v11, "addObject:", v9);
      -[SXComponentInteractionHandlerManager updateUserInteractionForComponentView:](self, "updateUserInteractionForComponentView:", v8);

    }
  }

}

- (void)removeInteractionHandler:(id)a3 componentView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (void *)objc_msgSend(v10, "copy", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v16, "handler");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17 == v6)
            objc_msgSend(v10, "removeObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    -[SXComponentInteractionHandlerManager updateUserInteractionForComponentView:](self, "updateUserInteractionForComponentView:", v8);
  }

}

- (id)componentViewForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  id v16;
  CGPoint v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    while (1)
    {
      objc_msgSend(v9, "absoluteFrame");
      v18.x = x;
      v18.y = y;
      if (CGRectContainsPoint(v20, v18))
      {
        -[SXComponentInteractionHandlerManager viewport](self, "viewport");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
        v12 = v11;
        v14 = v13;

        objc_msgSend(v9, "interactionFrame");
        v19.x = v12;
        v19.y = v14;
        if (CGRectContainsPoint(v21, v19))
          break;
      }
      objc_msgSend(v7, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
      if (!v15)
        goto LABEL_6;
    }
    v16 = v9;
  }
  else
  {
LABEL_6:
    v16 = 0;
  }

  return v16;
}

- (id)interactionsForComponentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v9;

  return v11;
}

- (id)interactionsForComponentView:(id)a3 type:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "handlesType:", 2, (_QWORD)v24);
        if ((v4 & 2) != 0 && v19)
          objc_msgSend(v12, "addObject:", v18);
        v20 = objc_msgSend(v18, "handlesType:", 4);
        if ((v4 & 4) != 0 && v20)
          objc_msgSend(v12, "addObject:", v18);
        v21 = objc_msgSend(v18, "handlesType:", 8);
        if ((v4 & 8) != 0 && v21)
          objc_msgSend(v12, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(v12, "copy");
  return v22;
}

- (void)updateUserInteractionForComponentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXComponentInteractionHandlerManager interactionHandlers](self, "interactionHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "handlesType:", 2) & 1) != 0 || (objc_msgSend(v11, "handlesType:", 4) & 1) != 0)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v12 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_13:

  objc_msgSend(v4, "setUserInteractionEnabled:", v12);
}

- (NSMapTable)interactionHandlers
{
  return self->_interactionHandlers;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_interactionHandlers, 0);
}

@end
