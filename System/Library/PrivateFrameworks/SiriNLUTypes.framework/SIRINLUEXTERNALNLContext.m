@implementation SIRINLUEXTERNALNLContext

- (BOOL)hasSystemDialogActGroup
{
  return self->_systemDialogActGroup != 0;
}

- (void)clearActiveTasks
{
  -[NSMutableArray removeAllObjects](self->_activeTasks, "removeAllObjects");
}

- (void)addActiveTasks:(id)a3
{
  id v4;
  NSMutableArray *activeTasks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activeTasks = self->_activeTasks;
  v8 = v4;
  if (!activeTasks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activeTasks;
    self->_activeTasks = v6;

    v4 = v8;
    activeTasks = self->_activeTasks;
  }
  -[NSMutableArray addObject:](activeTasks, "addObject:", v4);

}

- (unint64_t)activeTasksCount
{
  return -[NSMutableArray count](self->_activeTasks, "count");
}

- (id)activeTasksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activeTasks, "objectAtIndex:", a3);
}

- (void)clearExecutedTasks
{
  -[NSMutableArray removeAllObjects](self->_executedTasks, "removeAllObjects");
}

- (void)addExecutedTasks:(id)a3
{
  id v4;
  NSMutableArray *executedTasks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  executedTasks = self->_executedTasks;
  v8 = v4;
  if (!executedTasks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_executedTasks;
    self->_executedTasks = v6;

    v4 = v8;
    executedTasks = self->_executedTasks;
  }
  -[NSMutableArray addObject:](executedTasks, "addObject:", v4);

}

- (unint64_t)executedTasksCount
{
  return -[NSMutableArray count](self->_executedTasks, "count");
}

- (id)executedTasksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_executedTasks, "objectAtIndex:", a3);
}

- (void)clearSalientEntities
{
  -[NSMutableArray removeAllObjects](self->_salientEntities, "removeAllObjects");
}

- (void)addSalientEntities:(id)a3
{
  id v4;
  NSMutableArray *salientEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  salientEntities = self->_salientEntities;
  v8 = v4;
  if (!salientEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_salientEntities;
    self->_salientEntities = v6;

    v4 = v8;
    salientEntities = self->_salientEntities;
  }
  -[NSMutableArray addObject:](salientEntities, "addObject:", v4);

}

- (unint64_t)salientEntitiesCount
{
  return -[NSMutableArray count](self->_salientEntities, "count");
}

- (id)salientEntitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_salientEntities, "objectAtIndex:", a3);
}

- (void)clearSystemDialogActs
{
  -[NSMutableArray removeAllObjects](self->_systemDialogActs, "removeAllObjects");
}

- (void)addSystemDialogActs:(id)a3
{
  id v4;
  NSMutableArray *systemDialogActs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  systemDialogActs = self->_systemDialogActs;
  v8 = v4;
  if (!systemDialogActs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_systemDialogActs;
    self->_systemDialogActs = v6;

    v4 = v8;
    systemDialogActs = self->_systemDialogActs;
  }
  -[NSMutableArray addObject:](systemDialogActs, "addObject:", v4);

}

- (unint64_t)systemDialogActsCount
{
  return -[NSMutableArray count](self->_systemDialogActs, "count");
}

- (id)systemDialogActsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_systemDialogActs, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLContext;
  -[SIRINLUEXTERNALNLContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
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
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systemDialogActGroup = self->_systemDialogActGroup;
  if (systemDialogActGroup)
  {
    -[SIRINLUEXTERNALSystemDialogActGroup dictionaryRepresentation](systemDialogActGroup, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("system_dialog_act_group"));

  }
  if (-[NSMutableArray count](self->_activeTasks, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_activeTasks, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = self->_activeTasks;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("active_tasks"));
  }
  if (-[NSMutableArray count](self->_executedTasks, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_executedTasks, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = self->_executedTasks;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("executed_tasks"));
  }
  if (-[NSMutableArray count](self->_salientEntities, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_salientEntities, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = self->_salientEntities;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("salient_entities"));
  }
  if (-[NSMutableArray count](self->_systemDialogActs, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_systemDialogActs, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = self->_systemDialogActs;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v36;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v36 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("system_dialog_acts"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_systemDialogActGroup)
    PBDataWriterWriteSubmessage();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_activeTasks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_executedTasks;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_salientEntities;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_systemDialogActs;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v20 = a3;
  if (self->_systemDialogActGroup)
    objc_msgSend(v20, "setSystemDialogActGroup:");
  if (-[SIRINLUEXTERNALNLContext activeTasksCount](self, "activeTasksCount"))
  {
    objc_msgSend(v20, "clearActiveTasks");
    v4 = -[SIRINLUEXTERNALNLContext activeTasksCount](self, "activeTasksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALNLContext activeTasksAtIndex:](self, "activeTasksAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addActiveTasks:", v7);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLContext executedTasksCount](self, "executedTasksCount"))
  {
    objc_msgSend(v20, "clearExecutedTasks");
    v8 = -[SIRINLUEXTERNALNLContext executedTasksCount](self, "executedTasksCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUEXTERNALNLContext executedTasksAtIndex:](self, "executedTasksAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addExecutedTasks:", v11);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLContext salientEntitiesCount](self, "salientEntitiesCount"))
  {
    objc_msgSend(v20, "clearSalientEntities");
    v12 = -[SIRINLUEXTERNALNLContext salientEntitiesCount](self, "salientEntitiesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUEXTERNALNLContext salientEntitiesAtIndex:](self, "salientEntitiesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSalientEntities:", v15);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLContext systemDialogActsCount](self, "systemDialogActsCount"))
  {
    objc_msgSend(v20, "clearSystemDialogActs");
    v16 = -[SIRINLUEXTERNALNLContext systemDialogActsCount](self, "systemDialogActsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[SIRINLUEXTERNALNLContext systemDialogActsAtIndex:](self, "systemDialogActsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSystemDialogActs:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALSystemDialogActGroup copyWithZone:](self->_systemDialogActGroup, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_activeTasks;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addActiveTasks:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v10);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = self->_executedTasks;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend(v5, "addExecutedTasks:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v16);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = self->_salientEntities;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend(v5, "addSalientEntities:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v22);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = self->_systemDialogActs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v30), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend(v5, "addSystemDialogActs:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  NSMutableArray *activeTasks;
  NSMutableArray *executedTasks;
  NSMutableArray *salientEntities;
  NSMutableArray *systemDialogActs;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((systemDialogActGroup = self->_systemDialogActGroup, !((unint64_t)systemDialogActGroup | v4[4]))
     || -[SIRINLUEXTERNALSystemDialogActGroup isEqual:](systemDialogActGroup, "isEqual:"))
    && ((activeTasks = self->_activeTasks, !((unint64_t)activeTasks | v4[1]))
     || -[NSMutableArray isEqual:](activeTasks, "isEqual:"))
    && ((executedTasks = self->_executedTasks, !((unint64_t)executedTasks | v4[2]))
     || -[NSMutableArray isEqual:](executedTasks, "isEqual:"))
    && ((salientEntities = self->_salientEntities, !((unint64_t)salientEntities | v4[3]))
     || -[NSMutableArray isEqual:](salientEntities, "isEqual:")))
  {
    systemDialogActs = self->_systemDialogActs;
    if ((unint64_t)systemDialogActs | v4[5])
      v10 = -[NSMutableArray isEqual:](systemDialogActs, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SIRINLUEXTERNALSystemDialogActGroup hash](self->_systemDialogActGroup, "hash");
  v4 = -[NSMutableArray hash](self->_activeTasks, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_executedTasks, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_salientEntities, "hash");
  return v6 ^ -[NSMutableArray hash](self->_systemDialogActs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALSystemDialogActGroup *systemDialogActGroup;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  systemDialogActGroup = self->_systemDialogActGroup;
  v6 = *((_QWORD *)v4 + 4);
  if (systemDialogActGroup)
  {
    if (v6)
      -[SIRINLUEXTERNALSystemDialogActGroup mergeFrom:](systemDialogActGroup, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLContext setSystemDialogActGroup:](self, "setSystemDialogActGroup:");
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALNLContext addActiveTasks:](self, "addActiveTasks:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALNLContext addExecutedTasks:](self, "addExecutedTasks:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v4 + 3);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[SIRINLUEXTERNALNLContext addSalientEntities:](self, "addSalientEntities:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 5);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[SIRINLUEXTERNALNLContext addSystemDialogActs:](self, "addSystemDialogActs:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (SIRINLUEXTERNALSystemDialogActGroup)systemDialogActGroup
{
  return self->_systemDialogActGroup;
}

- (void)setSystemDialogActGroup:(id)a3
{
  objc_storeStrong((id *)&self->_systemDialogActGroup, a3);
}

- (NSMutableArray)activeTasks
{
  return self->_activeTasks;
}

- (void)setActiveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_activeTasks, a3);
}

- (NSMutableArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setExecutedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_executedTasks, a3);
}

- (NSMutableArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setSalientEntities:(id)a3
{
  objc_storeStrong((id *)&self->_salientEntities, a3);
}

- (NSMutableArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setSystemDialogActs:(id)a3
{
  objc_storeStrong((id *)&self->_systemDialogActs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_systemDialogActGroup, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

+ (Class)activeTasksType
{
  return (Class)objc_opt_class();
}

+ (Class)executedTasksType
{
  return (Class)objc_opt_class();
}

+ (Class)salientEntitiesType
{
  return (Class)objc_opt_class();
}

+ (Class)systemDialogActsType
{
  return (Class)objc_opt_class();
}

@end
