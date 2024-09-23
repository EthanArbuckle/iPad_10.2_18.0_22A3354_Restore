@implementation _UIResponderIntegrityProtection

+ (id)rip
{
  if (qword_1ECD7DDC8 != -1)
    dispatch_once(&qword_1ECD7DDC8, &__block_literal_global_243);
  return (id)_MergedGlobals_1061;
}

- (_UIResponderIntegrityProtection)init
{
  _UIResponderIntegrityProtection *v2;
  uint64_t v3;
  NSMutableArray *deliveryStack;
  uint64_t v5;
  NSMapTable *pressBeganRecords;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIResponderIntegrityProtection;
  v2 = -[_UIResponderIntegrityProtection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deliveryStack = v2->_deliveryStack;
    v2->_deliveryStack = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    pressBeganRecords = v2->_pressBeganRecords;
    v2->_pressBeganRecords = (NSMapTable *)v5;

  }
  return v2;
}

- (void)startDeliveringPresses:(id)a3 inPhase:(int64_t)a4 withEvent:(id)a5
{
  id v8;
  id v9;
  _UIRIPDeliveryRecord *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_UIRIPDeliveryRecord initWithPresses:inPhase:withEvent:]([_UIRIPDeliveryRecord alloc], "initWithPresses:inPhase:withEvent:", v9, a4, v8);

  -[NSMutableArray addObject:](self->_deliveryStack, "addObject:", v10);
}

- (void)finishedDeliveringPresses
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_deliveryStack, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderIntegrityProtection.m"), 222, CFSTR("No delivery record found. This indicates imbalanced calls of startDeliveringPresses:inPhase:withEvent: and finishDeliveringPresses."));

  }
  -[NSMutableArray lastObject](self->_deliveryStack, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_deliveryStack, "removeLastObject");
  if (!objc_msgSend(v4, "phase"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "presses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v5);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_pressBeganRecords, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            __rip_break_invalid_began__(v4, v25, v24);
          -[NSMapTable setObject:forKey:](self->_pressBeganRecords, "setObject:forKey:", v4, v24);

        }
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v21);
    }
    goto LABEL_34;
  }
  if (objc_msgSend(v4, "phase") == 3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "presses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      v27 = *(_QWORD *)v31;
      v28 = v5;
      do
      {
        v9 = 0;
        v29 = v7;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
          -[NSMapTable objectForKey:](self->_pressBeganRecords, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v4, "diffToRecord:press:", v11, v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = finishedDeliveringPresses___s_category;
              if (!finishedDeliveringPresses___s_category)
              {
                v13 = __UILogCategoryGetNode("ResponderIntegrityProtection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v13, (unint64_t *)&finishedDeliveringPresses___s_category);
              }
              v14 = *(id *)(v13 + 8);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                if (v10)
                {
                  v15 = (void *)MEMORY[0x1E0CB3940];
                  v16 = v10;
                  v17 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v17);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v16);
                  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  v5 = v28;
                  v8 = v27;
                }
                else
                {
                  v19 = CFSTR("(nil)");
                }
                *(_DWORD *)buf = 138412546;
                v39 = v19;
                v40 = 2112;
                v41 = v12;
                _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Received inconsistent presses began and ended calls for press %@:\n%@", buf, 0x16u);

                v7 = v29;
              }

            }
            -[NSMapTable removeObjectForKey:](self->_pressBeganRecords, "removeObjectForKey:", v10);

          }
          else
          {
            __rip_break_invalid_ended__(v10);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v7);
    }
LABEL_34:

  }
}

- (void)responder:(id)a3 class:(Class)a4 receivedPresses:(id)a5 inPhase:(int64_t)a6 withEvent:(id)a7
{
  NSMutableArray *deliveryStack;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  deliveryStack = self->_deliveryStack;
  v14 = a7;
  v15 = a5;
  v16 = a3;
  if (!-[NSMutableArray count](deliveryStack, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderIntegrityProtection.m"), 254, CFSTR("No delivery record found but we are receiving presses methods."));

  }
  -[NSMutableArray lastObject](self->_deliveryStack, "lastObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "responder:class:receivedPresses:inPhase:withEvent:", v16, a4, v15, a6, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressBeganRecords, 0);
  objc_storeStrong((id *)&self->_deliveryStack, 0);
}

@end
