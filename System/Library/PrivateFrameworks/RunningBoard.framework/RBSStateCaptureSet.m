@implementation RBSStateCaptureSet

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  RBSStateCaptureSetSegment *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  RBSStateCaptureSetSegment *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "captureState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  os_unfair_lock_assert_owner(&_stateCaptureLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_stateCaptureSegments;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
  {

LABEL_15:
    v10 = objc_alloc_init(RBSStateCaptureSetSegment);
    -[NSMutableSet addObject:](self->_stateCaptureSegments, "addObject:", v10);
    goto LABEL_16;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if ((unint64_t)objc_msgSend(v13, "count", (_QWORD)v16) <= 0x18)
      {
        if (!v10 || (v14 = -[RBSStateCaptureSetSegment count](v10, "count"), v14 < objc_msgSend(v13, "count")))
        {
          v15 = v13;

          v10 = v15;
        }
      }
    }
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v9);

  if (!v10)
    goto LABEL_15;
LABEL_16:
  -[RBSStateCaptureSetSegment addItem:withLength:](v10, "addItem:withLength:", v4, v6, (_QWORD)v16);

}

- (void)removeItem:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_stateCaptureSegments;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "containsItem:", v4, (_QWORD)v19) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_13;
    objc_msgSend(v11, "removeItem:", v4);
    if (!objc_msgSend(v11, "count"))
      -[NSMutableSet removeObject:](self->_stateCaptureSegments, "removeObject:", v11);
  }
  else
  {
LABEL_9:

LABEL_13:
    rbs_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RBSStateCaptureSet removeItem:].cold.1((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);

    v11 = 0;
  }

}

- (RBSStateCaptureSet)init
{
  RBSStateCaptureSet *v2;
  uint64_t v3;
  NSMutableSet *stateCaptureSegments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSStateCaptureSet;
  v2 = -[RBSStateCaptureSet init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    stateCaptureSegments = v2->_stateCaptureSegments;
    v2->_stateCaptureSegments = (NSMutableSet *)v3;

  }
  return v2;
}

- (NSSet)itemsCopy
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_stateCaptureSegments;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "items", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureSegments, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

- (void)removeItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "RBSStateCapture remove item called for untracked item %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
