@implementation SXDragManager

- (SXDragManager)initWithSharingPolicy:(unint64_t)a3 dataSource:(id)a4
{
  id v6;
  SXDragManager *v7;
  SXDragManager *v8;
  uint64_t v9;
  UIDragInteraction *dragInteraction;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXDragManager;
  v7 = -[SXDragManager init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_sharingPolicy = a3;
    objc_storeWeak((id *)&v7->_dataSource, v6);
    if (a3 != 1)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF69E8]), "initWithDelegate:", v8);
      dragInteraction = v8->_dragInteraction;
      v8->_dragInteraction = (UIDragInteraction *)v9;

      objc_msgSend(v6, "viewForDragManager:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addInteraction:", v8->_dragInteraction);

    }
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SXDragManager dragInteraction](self, "dragInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDragManager dragInteraction](self, "dragInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SXDragManager;
  -[SXDragManager dealloc](&v6, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BDF69E8], "isEnabledByDefault"))
  {
    self->_enabled = v3;
    -[SXDragManager dragInteraction](self, "dragInteraction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[SXDragManager itemsForSession:atLocation:](self, "itemsForSession:atLocation:", v6, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[SXDragManager itemsForSession:atLocation:](self, "itemsForSession:atLocation:", a4, a5.x, a5.y);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "localObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_254F04CE0);

  if (v7)
  {
    objc_msgSend(v5, "localObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BDF6E88]);
      objc_msgSend(v8, "dragPreviewView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithView:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)itemsForSession:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  y = a4.y;
  x = a4.x;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[SXDragManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dragManager:dragableAtLocation:", self, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDragManager dragItemForObject:withSession:](self, "dragItemForObject:withSession:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a4, "items", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_254F04CE0);

        if (v11)
        {
          objc_msgSend(v9, "localObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "didStartDragging");

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "localObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_254F04CE0);

        if (v13)
        {
          objc_msgSend(v11, "localObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "didStartDragging");

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a4, "items", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "localObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_254F04CE0);

        if (v12)
        {
          objc_msgSend(v10, "localObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "didEndDragging");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)dragItemForObject:(id)a3 withSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dragIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXDragManager dragSession:containsDragItemWithIdentifier:](self, "dragSession:containsDragItemWithIdentifier:", v7, v8);

  objc_msgSend(v6, "dragObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v10 && !v9)
  {
    v12 = objc_alloc(MEMORY[0x24BDD15F0]);
    objc_msgSend(v6, "dragObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObject:", v13);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v14);
    objc_msgSend(v11, "setLocalObject:", v6);

  }
  return v11;
}

- (BOOL)dragSession:(id)a3 containsDragItemWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "localObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_254F04CE0);

        if (v12)
        {
          objc_msgSend(v10, "localObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "dragIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v5);

            if ((v16 & 1) != 0)
            {

              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

- (void)updateAccessibilityDragSourceDescriptorsForDraggableElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254F04CE0))
  {
    objc_msgSend(v4, "stringForAXDragAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Drag Item"), &stru_24D68E0F8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SXDragManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForDragManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67B0]), "initWithName:view:", v5, v8);
  v11[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityDragSourceDescriptors:", v10);

}

- (SXDragManagerDataSource)dataSource
{
  return (SXDragManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
