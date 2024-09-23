@implementation UIGestureDelayedEventComponentDispatcher

- (UIGestureDelayedEventComponentDispatcher)init
{
  UIGestureDelayedEventComponentDispatcher *v2;
  uint64_t v3;
  NSMutableArray *delayedTouches;
  uint64_t v5;
  NSMutableArray *delayedTouchesToSend;
  uint64_t v7;
  NSMutableArray *delayedPresses;
  uint64_t v9;
  NSMutableArray *delayedPressesToSend;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
  v2 = -[UIGestureDelayedEventComponentDispatcher init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    delayedTouches = v2->_delayedTouches;
    v2->_delayedTouches = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    delayedTouchesToSend = v2->_delayedTouchesToSend;
    v2->_delayedTouchesToSend = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    delayedPresses = v2->_delayedPresses;
    v2->_delayedPresses = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    delayedPressesToSend = v2->_delayedPressesToSend;
    v2->_delayedPressesToSend = (NSMutableArray *)v9;

  }
  return v2;
}

- (uint64_t)enqueueDelayedTouchToSend:(uint64_t)result
{
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = (id *)result;
  if (!a2)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 >= 1)
    *(_QWORD *)(a2 + 8) = --v4;
  if (!v4)
  {
    v5 = *(void **)(a2 + 24);
LABEL_7:
    v6 = v5;
    if ((objc_msgSend(v6, "isDelayed") & 1) != 0)
    {
      if (a2)
        v7 = *(void **)(a2 + 24);
      else
        v7 = 0;
      v8 = v7;
      _UIGestureDelayedTouchForUITouch(v8, v3[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = enqueueDelayedTouchToSend____s_category;
        if (!enqueueDelayedTouchToSend____s_category)
        {
          v10 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&enqueueDelayedTouchToSend____s_category);
        }
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23.receiver = v3;
            v23.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
            v12 = v11;
            objc_msgSendSuper2(&v23, sel_description);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (a2)
              v14 = *(void **)(a2 + 24);
            else
              v14 = 0;
            v15 = v14;
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (a2)
            {
              v18 = *(id *)(a2 + 24);
              v19 = *(void **)(a2 + 32);
              v20 = v18;
            }
            else
            {
              v18 = 0;
              v20 = 0;
              v19 = 0;
            }
            v21 = v19;
            objc_msgSend(v21, "_phaseDescription", v23.receiver, v23.super_class);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v25 = v13;
            v26 = 2112;
            v27 = v17;
            v28 = 2048;
            v29 = v18;
            v30 = 2112;
            v31 = v22;
            _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Sending delayed touch <%@: %p; phase = %@>",
              buf,
              0x2Au);

          }
        }
        objc_msgSend(v3[2], "addObject:", a2);
      }
    }
    else
    {

    }
    return objc_msgSend(v3[1], "removeObject:", a2);
  }
  return result;
}

- (uint64_t)enqueueDelayedPressToSend:(uint64_t)result
{
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = (id *)result;
  if (!a2)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 >= 1)
    *(_QWORD *)(a2 + 8) = --v4;
  if (!v4)
  {
    v5 = *(void **)(a2 + 24);
LABEL_7:
    v6 = v5;
    if ((objc_msgSend(v6, "isDelayed") & 1) != 0)
    {
      if (a2)
        v7 = *(void **)(a2 + 24);
      else
        v7 = 0;
      v8 = v7;
      _UIGestureDelayedTouchForUITouch(v8, v3[4]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = enqueueDelayedPressToSend____s_category[0];
        if (!enqueueDelayedPressToSend____s_category[0])
        {
          v10 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, enqueueDelayedPressToSend____s_category);
        }
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23.receiver = v3;
            v23.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
            v12 = v11;
            objc_msgSendSuper2(&v23, sel_description);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (a2)
              v14 = *(void **)(a2 + 24);
            else
              v14 = 0;
            v15 = v14;
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (a2)
            {
              v18 = *(id *)(a2 + 24);
              v19 = *(void **)(a2 + 32);
              v20 = v18;
            }
            else
            {
              v18 = 0;
              v20 = 0;
              v19 = 0;
            }
            v21 = v19;
            objc_msgSend(v21, "_phaseDescription", v23.receiver, v23.super_class);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v25 = v13;
            v26 = 2112;
            v27 = v17;
            v28 = 2048;
            v29 = v18;
            v30 = 2112;
            v31 = v22;
            _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Sending delayed press <%@: %p; phase = %@>",
              buf,
              0x2Au);

          }
        }
        objc_msgSend(v3[4], "addObject:", a2);
      }
    }
    else
    {

    }
    return objc_msgSend(v3[3], "removeObject:", a2);
  }
  return result;
}

- (_QWORD)delayedTouchForTouch:(void *)a3 event:
{
  _QWORD *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  _UIGestureDelayedTouchForUITouch(a2, a1[1]);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)objc_msgSend(a3, "_cloneEvent");
    v8 = -[UIGestureDelayedTouch initWithEvent:touch:]((id *)[UIGestureDelayedTouch alloc], v7, a2);
    v6 = v8;
    if (v8)
      v9 = v8[4];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "_loadStateFromTouch:", a2);

    objc_msgSend(a1[1], "addObject:", v6);
  }
  v11 = delayedTouchForTouch_event____s_category;
  if (!delayedTouchForTouch_event____s_category)
  {
    v11 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&delayedTouchForTouch_event____s_category);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v13 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19.receiver = a1;
      v19.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
      v14 = v13;
      objc_msgSendSuper2(&v19, sel_description);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "_phaseDescription", v19.receiver, v19.super_class);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      v24 = 2048;
      v25 = a2;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Delaying touch <%@: %p; phase = %@>", buf, 0x2Au);

    }
  }
  if (v6)
    ++v6[1];
  objc_msgSend(a2, "setIsDelayed:", 1);
  return v6;
}

- (_QWORD)delayedPressForPress:(void *)a3 event:
{
  _QWORD *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  _UIGestureDelayedTouchForUITouch(a2, a1[3]);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)objc_msgSend(a3, "_cloneEvent");
    v8 = -[UIGestureDelayedPress initWithEvent:press:]((id *)[UIGestureDelayedPress alloc], v7, a2);
    v6 = v8;
    if (v8)
      v9 = v8[4];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "_loadStateFromPress:", a2);

    objc_msgSend(a1[3], "addObject:", v6);
  }
  v11 = delayedPressForPress_event____s_category;
  if (!delayedPressForPress_event____s_category)
  {
    v11 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&delayedPressForPress_event____s_category);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v13 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19.receiver = a1;
      v19.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
      v14 = v13;
      objc_msgSendSuper2(&v19, sel_description);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "_phaseDescription", v19.receiver, v19.super_class);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      v24 = 2048;
      v25 = a2;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Delaying press <%@: %p; phase = %@>", buf, 0x2Au);

    }
  }
  if (v6)
    ++v6[1];
  objc_msgSend(a2, "setIsDelayed:", 1);
  return v6;
}

- (void)removeDelayedTouch:(id *)a1
{
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!a2)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 >= 1)
    *(_QWORD *)(a2 + 8) = --v4;
  if (!v4)
  {
    v5 = *(void **)(a2 + 24);
LABEL_7:
    v6 = v5;
    v7 = removeDelayedTouch____s_category;
    if (!removeDelayedTouch____s_category)
    {
      v7 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&removeDelayedTouch____s_category);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11.receiver = a1;
        v11.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
        v9 = v8;
        objc_msgSendSuper2(&v11, sel_description);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@: Clearing delay on touch %@", buf, 0x16u);

      }
    }
    objc_msgSend(v6, "setIsDelayed:", 0, v11.receiver, v11.super_class);
    objc_msgSend(v6, "_setIsFirstTouchForView:", 0);
    objc_msgSend(a1[1], "removeObject:", a2);

  }
}

- (uint64_t)removeDelayedPress:(uint64_t)result
{
  id *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (id *)result;
    if (!a2)
      goto LABEL_6;
    v4 = *(_QWORD *)(a2 + 8);
    if (v4 >= 1)
      *(_QWORD *)(a2 + 8) = --v4;
    if (!v4)
    {
LABEL_6:
      v5 = removeDelayedPress____s_category;
      if (!removeDelayedPress____s_category)
      {
        v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&removeDelayedPress____s_category);
      }
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v8 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v13.receiver = v3;
          v13.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
          v9 = v8;
          objc_msgSendSuper2(&v13, sel_description);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (a2)
            v11 = *(void **)(a2 + 24);
          else
            v11 = 0;
          v12 = v11;
          *(_DWORD *)buf = 138412546;
          v15 = v10;
          v16 = 2112;
          v17 = v12;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@: Clearing delay on press %@", buf, 0x16u);

        }
      }
      if (a2)
        v6 = *(void **)(a2 + 24);
      else
        v6 = 0;
      v7 = v6;
      objc_msgSend(v7, "setIsDelayed:", 0);

      return objc_msgSend(v3[3], "removeObject:", a2);
    }
  }
  return result;
}

- (void)removeDelayedTouchesToSend:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
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
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (v9)
          v10 = *(void **)(v9 + 24);
        else
          v10 = 0;
        v11 = v10;
        objc_msgSend(v11, "setIsDelayed:", 0, (_QWORD)v13);
        objc_msgSend(v11, "_setIsFirstTouchForView:", 0);
        -[NSMutableArray removeObject:](self->_delayedTouchesToSend, "removeObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v12;
    }
    while (v12);
  }

}

- (BOOL)touchesBeganWasDelayedForTouch:(uint64_t)a1
{
  id *v4;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 8));
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if ((v4
     || (_UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 16)),
         (v4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(a2, "isDelayed"))
  {
    v5 = v4[4];
    v6 = objc_msgSend(v5, "phase") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)pressesBeganWasDelayedForPress:(uint64_t)a1
{
  id *v4;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 24));
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if ((v4
     || (_UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32)),
         (v4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(a2, "isDelayed"))
  {
    v5 = v4[4];
    v6 = objc_msgSend(v5, "phase") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)sendDelayedTouches
{
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  unint64_t v92;
  NSObject *v93;
  void *v94;
  objc_class *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t k;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  _BOOL4 CanBeConsideredForSentTouchesEnded;
  _WORD *v123;
  uint64_t v124;
  id v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  id *v130;
  uint64_t v131;
  uint64_t v132;
  id obj;
  id obja;
  id objb;
  NSObject *objc;
  id objd;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  id v185;
  __int16 v186;
  void *v187;
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v1 = a1;
  if (!objc_msgSend(a1[2], "count"))
    return;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v2 = v1[2];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
  v130 = v1;
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    obj = 0;
    v6 = *(_QWORD *)v159;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v159 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * v7);
        if (v8)
          v9 = *(void **)(v8 + 24);
        else
          v9 = 0;
        v10 = v9;
        v11 = objc_msgSend(v10, "phase");
        if (v8)
          v12 = *(void **)(v8 + 32);
        else
          v12 = 0;
        v13 = v12;
        v14 = objc_msgSend(v13, "phase");

        if (v11 == 4 && !v14)
        {
          if (!v5)
            v5 = (void *)objc_opt_new();
          objc_msgSend(v5, "addObject:", v8);
          goto LABEL_36;
        }
        if (v11 == v14)
          goto LABEL_36;
        if (v11 == 2)
        {
          objc_msgSend(v10, "locationInView:", 0);
          v16 = v15;
          v18 = v17;
          v19 = v8 ? *(void **)(v8 + 32) : 0;
          v20 = v19;
          objc_msgSend(v20, "locationInView:", 0);
          v22 = v21;
          v24 = v23;

          if (v16 == v22 && v18 == v24)
            goto LABEL_36;
        }
        if (v8)
        {
          v8 = objc_msgSend((id)v8, "copy");
          *(_BYTE *)(v8 + 16) = 1;
        }
        -[UIGestureDelayedTouch saveCurrentTouchState](v8);
        if (v8)
          v25 = *(void **)(v8 + 40);
        else
          v25 = 0;
        v26 = v25;
        if (objc_msgSend(v26, "phase") == 2)
        {
          v27 = 1;
        }
        else
        {
          if (v14 > 2 || objc_msgSend(v26, "phase") < 5)
            goto LABEL_33;
          v27 = 3;
        }
        objc_msgSend(v26, "setPhase:", v27);
LABEL_33:
        v28 = obj;
        if (!obj)
          v28 = (void *)objc_opt_new();
        obj = v28;
        objc_msgSend(v28, "addObject:", v8);

LABEL_36:
        ++v7;
      }
      while (v4 != v7);
      v29 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
      v4 = v29;
      if (!v29)
      {

        v1 = v130;
        if (obj)
        {
          objc_msgSend(v130[2], "addObjectsFromArray:", obj);

        }
        if (v5)
        {
          objc_msgSend(v130, "removeDelayedTouchesToSend:", v5);
          goto LABEL_48;
        }
        goto LABEL_49;
      }
    }
  }
  v5 = v2;
LABEL_48:

LABEL_49:
  objc_msgSend(v1[2], "sortUsingComparator:", &__block_literal_global_28);
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  obja = v1[2];
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
  if (!v30)
  {
    v32 = 0;
    v33 = 0;
    goto LABEL_74;
  }
  v31 = v30;
  v32 = 0;
  v33 = 0;
  v34 = *(_QWORD *)v155;
  do
  {
    v35 = 0;
    do
    {
      if (*(_QWORD *)v155 != v34)
        objc_enumerationMutation(obja);
      v36 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * v35);
      if (v36)
        v37 = *(void **)(v36 + 24);
      else
        v37 = 0;
      v38 = v37;
      objc_msgSend(v38, "setIsDelayed:", 0);
      if (v36)
      {
        if (*(_BYTE *)(v36 + 16))
        {
          if (v32)
            goto LABEL_62;
          goto LABEL_64;
        }
        -[UIGestureDelayedTouch saveCurrentTouchState](v36);
        v39 = *(void **)(v36 + 32);
      }
      else
      {
        -[UIGestureDelayedTouch saveCurrentTouchState](0);
        v39 = 0;
      }
      v40 = v39;
      objc_msgSend(v38, "_loadStateFromTouch:", v40);

      if (v32)
      {
LABEL_62:
        if (!objc_msgSend(v32, "count"))
          goto LABEL_67;
        objc_msgSend(v32, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "phaseForDelivery");
        v43 = objc_msgSend((id)v36, "phaseForDelivery");

        if (v42 == v43)
          goto LABEL_67;
      }
LABEL_64:
      if (!v33)
        v33 = (void *)objc_opt_new();
      v44 = objc_opt_new();

      objc_msgSend(v33, "addObject:", v44);
      v32 = (void *)v44;
LABEL_67:
      objc_msgSend(v32, "addObject:", v36);

      ++v35;
    }
    while (v31 != v35);
    v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
    v31 = v45;
  }
  while (v45);
LABEL_74:
  v126 = v32;

  objc_msgSend(v130[2], "removeAllObjects");
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v127 = v33;
  v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
  if (v129)
  {
    v128 = *(_QWORD *)v151;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v151 != v128)
          objc_enumerationMutation(v127);
        v47 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * v46);
        v48 = (_BYTE *)_MergedGlobals_942;
        if (!_MergedGlobals_942)
        {
          v48 = (_BYTE *)(__UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
          atomic_store((unint64_t)v48, (unint64_t *)&_MergedGlobals_942);
        }
        if ((*v48 & 1) != 0)
        {
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          v86 = v47;
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
          if (v87)
          {
            v88 = v87;
            v89 = *(_QWORD *)v147;
            do
            {
              v90 = 0;
              do
              {
                if (*(_QWORD *)v147 != v89)
                  objc_enumerationMutation(v86);
                v91 = *(id *)(*((_QWORD *)&v146 + 1) + 8 * v90);
                v92 = qword_1ECD7CB50;
                if (!qword_1ECD7CB50)
                {
                  v92 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v92, (unint64_t *)&qword_1ECD7CB50);
                }
                if ((*(_BYTE *)v92 & 1) != 0)
                {
                  v93 = *(NSObject **)(v92 + 8);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    v132 = v46;
                    objc = v93;
                    if (v91)
                      v94 = (void *)*((_QWORD *)v91 + 3);
                    else
                      v94 = 0;
                    v125 = v94;
                    v95 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v95);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v91)
                    {
                      v97 = *((id *)v91 + 3);
                      v98 = (void *)*((_QWORD *)v91 + 4);
                      v91 = v97;
                    }
                    else
                    {
                      v97 = 0;
                      v98 = 0;
                    }
                    v99 = v98;
                    objc_msgSend(v99, "_phaseDescription");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v183 = v96;
                    v184 = 2048;
                    v185 = v97;
                    v186 = 2112;
                    v187 = v100;
                    _os_log_impl(&dword_185066000, objc, OS_LOG_TYPE_ERROR, "Dispatching delayed touch <%@: %p; phase = %@>",
                      buf,
                      0x20u);

                    v46 = v132;
                  }
                }
                ++v90;
              }
              while (v88 != v90);
              v101 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
              v88 = v101;
            }
            while (v101);
          }

        }
        if (objc_msgSend(v47, "count"))
        {
          v131 = v46;
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          objb = (id)objc_claimAutoreleasedReturnValue();
          v170 = 0u;
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v50 = v47;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v170, buf, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v171;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v171 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * v54);
                if (v55)
                {
                  v56 = *(id *)(v55 + 24);
                  if (*(_BYTE *)(v55 + 16))
                  {
                    v57 = *(id *)(v55 + 40);
                    objc_msgSend(v56, "_loadStateFromTouch:", v57);

                    v58 = *(id *)(v55 + 32);
                    objc_msgSend(v58, "_responder");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "_setResponder:", v59);

                    v60 = *(id *)(v55 + 32);
                    objc_msgSend(v60, "window");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "setWindow:", v61);

                    v62 = *(id *)(v55 + 24);
                    v63 = objc_msgSend(v62, "phase");
                    v64 = *(id *)(v55 + 32);
                    objc_msgSend(v64, "setPhase:", v63);

                  }
                }
                else
                {
                  v56 = 0;
                }
                objc_msgSend(v56, "_responder");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "_eventReceivingWindow");
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                if (v66)
                {
                  objc_msgSend(v49, "objectForKey:", v65);
                  v67 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v67)
                  {
                    v67 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                    objc_msgSend(v49, "setObject:forKey:", v67, v65);
                    if (v55)
                      v68 = *(void **)(v55 + 48);
                    else
                      v68 = 0;
                    v69 = v68;
                    objc_msgSend(objb, "setObject:forKey:", v69, v65);

                  }
                  objc_msgSend(v67, "addObject:", v56);

                }
                ++v54;
              }
              while (v52 != v54);
              v70 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v170, buf, 16);
              v52 = v70;
            }
            while (v70);
          }

          v168 = 0u;
          v169 = 0u;
          v166 = 0u;
          v167 = 0u;
          v71 = v49;
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v166, v181, 16);
          if (v72)
          {
            v73 = v72;
            v74 = *(_QWORD *)v167;
            do
            {
              for (i = 0; i != v73; ++i)
              {
                if (*(_QWORD *)v167 != v74)
                  objc_enumerationMutation(v71);
                v76 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
                objc_msgSend(v71, "objectForKey:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(objb, "objectForKey:", v76);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v162 = 0u;
                v163 = 0u;
                v164 = 0u;
                v165 = 0u;
                v79 = v77;
                v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v162, v180, 16);
                if (v80)
                {
                  v81 = v80;
                  v82 = *(_QWORD *)v163;
                  do
                  {
                    for (j = 0; j != v81; ++j)
                    {
                      if (*(_QWORD *)v163 != v82)
                        objc_enumerationMutation(v79);
                      objc_msgSend(v78, "_addTouch:forDelayedDelivery:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * j), 1);
                    }
                    v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v162, v180, 16);
                  }
                  while (v81);
                }

                objc_msgSend(v79, "anyObject");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = objc_msgSend(v84, "phase");

                switch(v85)
                {
                  case 0:
                    objc_msgSend(v76, "touchesBegan:withEvent:", v79, v78);
                    break;
                  case 1:
                    objc_msgSend(v76, "touchesMoved:withEvent:", v79, v78);
                    break;
                  case 3:
                    objc_msgSend(v76, "touchesEnded:withEvent:", v79, v78);
                    break;
                  case 4:
                    objc_msgSend(v76, "touchesCancelled:withEvent:", v79, v78);
                    break;
                  default:
                    break;
                }

              }
              v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v166, v181, 16);
            }
            while (v73);
          }

          v46 = v131;
        }
        ++v46;
      }
      while (v46 != v129);
      v102 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
      v129 = v102;
    }
    while (v102);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objd = v127;
  v103 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
  if (v103)
  {
    v104 = v103;
    v105 = *(_QWORD *)v143;
    do
    {
      for (k = 0; k != v104; ++k)
      {
        if (*(_QWORD *)v143 != v105)
          objc_enumerationMutation(objd);
        v107 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * k);
        v138 = 0u;
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v108 = v107;
        v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v174, 16);
        if (v109)
        {
          v110 = v109;
          v111 = *(_QWORD *)v139;
          do
          {
            v112 = 0;
            do
            {
              if (*(_QWORD *)v139 != v111)
                objc_enumerationMutation(v108);
              v113 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * v112);
              if (v113)
              {
                v114 = *(unsigned __int8 *)(v113 + 16);
                v115 = *(id *)(v113 + 24);
                v116 = v115;
                if (v114)
                {
                  v117 = objc_msgSend(v115, "phase");

                  if (v117 == 3)
                    goto LABEL_165;
                  goto LABEL_168;
                }
                v118 = *(void **)(v113 + 40);
              }
              else
              {
                v116 = 0;
                v118 = 0;
              }
              v119 = v118;
              objc_msgSend(v116, "_loadStateFromTouch:", v119);

              if (objc_msgSend((id)v113, "phaseForDelivery") == 3)
              {
                v120 = v113 ? *(void **)(v113 + 24) : 0;
                v121 = v120;
                CanBeConsideredForSentTouchesEnded = _UIDelayedTouchCanBeConsideredForSentTouchesEnded(v121);

                if (CanBeConsideredForSentTouchesEnded)
                {
                  if (v113)
                  {
LABEL_165:
                    v123 = *(id *)(v113 + 24);
                    if (v123)
                      v123[118] |= 8u;
                  }
                  else
                  {
                    v123 = 0;
                  }

                }
              }
LABEL_168:
              ++v112;
            }
            while (v110 != v112);
            v124 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v174, 16);
            v110 = v124;
          }
          while (v124);
        }

      }
      v104 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
    }
    while (v104);
  }

}

uint64_t __62__UIGestureDelayedEventComponentDispatcher_sendDelayedTouches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a2, "timestampForDelivery");
  v5 = v4;
  objc_msgSend(a3, "timestampForDelivery");
  if (v6 > v5)
    return -1;
  else
    return v5 > v6;
}

- (void)sendDelayedPresses
{
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;
  const __CFDictionary *Mutable;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  char isKindOfClass;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  NSObject *v102;
  void *v103;
  objc_class *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  id v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  uint64_t v128;
  __int128 v129;
  void *v130;
  id v131;
  const __CFAllocator *allocator;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  id *v141;
  const __CFDictionary *v142;
  id v143;
  id obj;
  id obja;
  id objb;
  NSObject *objc;
  id objd;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint8_t v192[128];
  uint8_t buf[4];
  void *v194;
  __int16 v195;
  id v196;
  __int16 v197;
  void *v198;
  uint64_t v199;

  v199 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[4], "count"))
    {
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v2 = v1[4];
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v169, v190, 16);
      v141 = v1;
      if (v3)
      {
        v4 = v3;
        obj = 0;
        v5 = 0;
        v6 = *(_QWORD *)v170;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v170 != v6)
              objc_enumerationMutation(v2);
            v8 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * v7);
            if (v8)
              v9 = *(void **)(v8 + 24);
            else
              v9 = 0;
            v10 = v9;
            if (objc_msgSend(v10, "phase") == 4
              && (!v8 ? (v11 = 0) : (v11 = *(void **)(v8 + 32)),
                  v12 = v11,
                  v13 = objc_msgSend(v12, "phase"),
                  v12,
                  !v13))
            {
              v29 = obj;
              if (!obj)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
              obj = v29;
              objc_msgSend(v29, "addObject:", v8);
            }
            else
            {
              v14 = objc_msgSend(v10, "phase");
              if (v8)
                v15 = *(void **)(v8 + 32);
              else
                v15 = 0;
              v16 = v15;
              v17 = objc_msgSend(v16, "phase");

              if (v14 != v17)
              {
                if (objc_msgSend(v10, "phase") != 2
                  || ((objc_msgSend(v10, "force"), v19 = v18, !v8) ? (v20 = 0) : (v20 = *(void **)(v8 + 32)),
                      v21 = v20,
                      objc_msgSend(v21, "force"),
                      v23 = v22,
                      v21,
                      v19 != v23))
                {
                  if (v8)
                  {
                    v8 = objc_msgSend((id)v8, "copy");
                    *(_BYTE *)(v8 + 16) = 1;
                  }
                  -[UIGestureDelayedPress saveCurrentPressState](v8);
                  if (v8)
                    v24 = *(void **)(v8 + 40);
                  else
                    v24 = 0;
                  v25 = v24;
                  v26 = objc_msgSend(v25, "phase");

                  if (v26 == 2)
                  {
                    if (v8)
                      v27 = *(void **)(v8 + 40);
                    else
                      v27 = 0;
                    v28 = v27;
                    objc_msgSend(v28, "setPhase:", 1);

                  }
                  if (!v5)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v5 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(v5, "addObject:", v8);

                }
              }
            }

            ++v7;
          }
          while (v4 != v7);
          v30 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v169, v190, 16);
          v4 = v30;
        }
        while (v30);

        v1 = v141;
        if (v5)
        {
          objc_msgSend(v141[4], "addObjectsFromArray:", v5);

        }
        if (!obj)
          goto LABEL_49;
        objc_msgSend(v141[4], "removeObjectsInArray:", obj);
        v2 = obj;
      }

LABEL_49:
      objc_msgSend(v1[4], "sortUsingComparator:", &__block_literal_global_7_0);
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      obja = v1[4];
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
      if (!v31)
      {
        v33 = 0;
        v34 = 0;
        goto LABEL_74;
      }
      v32 = v31;
      v33 = 0;
      v34 = 0;
      v35 = *(_QWORD *)v166;
      while (1)
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v166 != v35)
            objc_enumerationMutation(obja);
          v37 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * v36);
          if (v37)
            v38 = *(void **)(v37 + 24);
          else
            v38 = 0;
          v39 = v38;
          objc_msgSend(v39, "setIsDelayed:", 0);
          if (v37)
          {
            if (*(_BYTE *)(v37 + 16))
            {
              if (v33)
                goto LABEL_62;
              goto LABEL_64;
            }
            -[UIGestureDelayedPress saveCurrentPressState](v37);
            v40 = *(void **)(v37 + 32);
          }
          else
          {
            -[UIGestureDelayedPress saveCurrentPressState](0);
            v40 = 0;
          }
          v41 = v40;
          objc_msgSend(v39, "_loadStateFromPress:", v41);

          if (v33)
          {
LABEL_62:
            if (!objc_msgSend(v33, "count"))
              goto LABEL_67;
            objc_msgSend(v33, "lastObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "phaseForDelivery");
            v44 = objc_msgSend((id)v37, "phaseForDelivery");

            if (v43 == v44)
              goto LABEL_67;
          }
LABEL_64:
          if (!v34)
            v34 = (void *)objc_opt_new();
          v45 = objc_opt_new();

          objc_msgSend(v34, "addObject:", v45);
          v33 = (void *)v45;
LABEL_67:
          objc_msgSend(v33, "addObject:", v37);

          ++v36;
        }
        while (v32 != v36);
        v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v189, 16);
        v32 = v46;
        if (!v46)
        {
LABEL_74:
          v130 = v33;

          objc_msgSend(v141[4], "removeAllObjects");
          v163 = 0u;
          v164 = 0u;
          v161 = 0u;
          v162 = 0u;
          v131 = v34;
          v134 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
          if (!v134)
            goto LABEL_147;
          allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v133 = *(_QWORD *)v162;
          *(_QWORD *)&v47 = 138412802;
          v129 = v47;
LABEL_76:
          v48 = 0;
          while (1)
          {
            if (*(_QWORD *)v162 != v133)
              objc_enumerationMutation(v131);
            v49 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v48);
            v50 = (_BYTE *)qword_1ECD7CB58;
            if (!qword_1ECD7CB58)
            {
              v50 = (_BYTE *)(__UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
              atomic_store((unint64_t)v50, (unint64_t *)&qword_1ECD7CB58);
            }
            if ((*v50 & 1) != 0)
            {
              v159 = 0u;
              v160 = 0u;
              v157 = 0u;
              v158 = 0u;
              v95 = v49;
              v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
              if (v96)
              {
                v97 = v96;
                v98 = *(_QWORD *)v158;
                do
                {
                  v99 = 0;
                  do
                  {
                    if (*(_QWORD *)v158 != v98)
                      objc_enumerationMutation(v95);
                    v100 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * v99);
                    v101 = qword_1ECD7CB60;
                    if (!qword_1ECD7CB60)
                    {
                      v101 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                      atomic_store(v101, (unint64_t *)&qword_1ECD7CB60);
                    }
                    if ((*(_BYTE *)v101 & 1) != 0)
                    {
                      v102 = *(NSObject **)(v101 + 8);
                      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                      {
                        objc = v102;
                        if (v100)
                          v103 = *(void **)(v100 + 24);
                        else
                          v103 = 0;
                        v143 = v103;
                        v104 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v104);
                        v140 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v100)
                        {
                          v105 = *(id *)(v100 + 24);
                          v106 = *(void **)(v100 + 32);
                          v138 = v105;
                        }
                        else
                        {
                          v105 = 0;
                          v138 = 0;
                          v106 = 0;
                        }
                        v107 = v106;
                        objc_msgSend(v107, "_phaseDescription");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = v129;
                        v194 = v140;
                        v195 = 2048;
                        v196 = v105;
                        v197 = 2112;
                        v198 = v108;
                        _os_log_impl(&dword_185066000, objc, OS_LOG_TYPE_ERROR, "Dispatching delayed press <%@: %p; phase = %@>",
                          buf,
                          0x20u);

                      }
                    }
                    ++v99;
                  }
                  while (v97 != v99);
                  v109 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v157, v187, 16);
                  v97 = v109;
                }
                while (v109);
              }

            }
            if (objc_msgSend(v49, "count", v129))
              break;
LABEL_124:
            if (++v48 == v134)
            {
              v110 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v161, v188, 16);
              v134 = v110;
              if (v110)
                goto LABEL_76;
LABEL_147:

              v155 = 0u;
              v156 = 0u;
              v153 = 0u;
              v154 = 0u;
              objd = v131;
              v111 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
              if (!v111)
                goto LABEL_170;
              v112 = v111;
              v113 = *(_QWORD *)v154;
LABEL_149:
              v114 = 0;
              while (1)
              {
                if (*(_QWORD *)v154 != v113)
                  objc_enumerationMutation(objd);
                v115 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v114);
                v149 = 0u;
                v150 = 0u;
                v151 = 0u;
                v152 = 0u;
                v116 = v115;
                v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
                if (v117)
                  break;
LABEL_168:

                if (++v114 == v112)
                {
                  v112 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v153, v186, 16);
                  if (!v112)
                  {
LABEL_170:

                    return;
                  }
                  goto LABEL_149;
                }
              }
              v118 = v117;
              v119 = *(_QWORD *)v150;
              while (2)
              {
                v120 = 0;
LABEL_155:
                if (*(_QWORD *)v150 != v119)
                  objc_enumerationMutation(v116);
                v121 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * v120);
                if (v121)
                {
                  v122 = *(unsigned __int8 *)(v121 + 16);
                  v123 = *(id *)(v121 + 24);
                  v124 = v123;
                  if (v122)
                  {
                    v125 = objc_msgSend(v123, "phase");

                    if (v125 == 3)
                    {
                      v124 = *(id *)(v121 + 24);
                      objc_msgSend(v124, "setSentPressesEnded:", 1);
                      goto LABEL_163;
                    }
                    goto LABEL_164;
                  }
                  v126 = *(void **)(v121 + 40);
                }
                else
                {
                  v124 = 0;
                  v126 = 0;
                }
                v127 = v126;
                objc_msgSend(v124, "_loadStateFromPress:", v127);

LABEL_163:
LABEL_164:
                if (v118 == ++v120)
                {
                  v128 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v149, v185, 16);
                  v118 = v128;
                  if (!v128)
                    goto LABEL_168;
                  continue;
                }
                goto LABEL_155;
              }
            }
          }
          v135 = v48;
          Mutable = CFDictionaryCreateMutable(allocator, 0, 0, MEMORY[0x1E0C9B3A0]);
          v181 = 0u;
          v182 = 0u;
          v183 = 0u;
          v184 = 0u;
          v52 = v49;
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v181, buf, 16);
          if (!v53)
            goto LABEL_102;
          v54 = v53;
          v55 = *(_QWORD *)v182;
          while (2)
          {
            v56 = 0;
LABEL_86:
            if (*(_QWORD *)v182 != v55)
              objc_enumerationMutation(v52);
            v57 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * v56);
            if (v57)
            {
              v58 = *(id *)(v57 + 24);
              if (*(_BYTE *)(v57 + 16))
              {
                v59 = *(id *)(v57 + 40);
                objc_msgSend(v58, "_loadStateFromPress:", v59);

                v60 = *(id *)(v57 + 32);
                objc_msgSend(v60, "responder");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setResponder:", v61);

                v62 = *(id *)(v57 + 32);
                objc_msgSend(v62, "window");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setWindow:", v63);

                v64 = *(id *)(v57 + 24);
                v65 = objc_msgSend(v64, "phase");
                v66 = *(id *)(v57 + 32);
                objc_msgSend(v66, "setPhase:", v65);

              }
            }
            else
            {
              v58 = 0;
            }
            objc_msgSend(v58, "responder");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
              goto LABEL_95;
            objc_msgSend(v58, "responder");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "window");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
            {

              goto LABEL_95;
            }
            objc_msgSend(v58, "responder");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v72 = objc_opt_isKindOfClass();

            if ((v72 & 1) != 0)
            {
LABEL_95:
              objc_msgSend(v58, "responder");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              CFDictionaryGetValue(Mutable, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v74)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "responder");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                CFDictionarySetValue(Mutable, v75, v74);

              }
              objc_msgSend(v74, "addObject:", v58);

            }
            if (v54 == ++v56)
            {
              v76 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v181, buf, 16);
              v54 = v76;
              if (!v76)
              {
LABEL_102:

                v179 = 0u;
                v180 = 0u;
                v177 = 0u;
                v178 = 0u;
                v142 = Mutable;
                v139 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v177, v192, 16);
                if (v139)
                {
                  v137 = *(_QWORD *)v178;
                  do
                  {
                    for (i = 0; i != v139; ++i)
                    {
                      if (*(_QWORD *)v178 != v137)
                        objc_enumerationMutation(v142);
                      objb = *(id *)(*((_QWORD *)&v177 + 1) + 8 * i);
                      CFDictionaryGetValue(v142, objb);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      v79 = (void *)UIApp;
                      objc_msgSend(v78, "anyObject");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "window");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (id)objc_msgSend(v79, "_pressesEventForWindow:", v81);

                      v175 = 0u;
                      v176 = 0u;
                      v173 = 0u;
                      v174 = 0u;
                      v83 = v78;
                      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
                      if (v84)
                      {
                        v85 = v84;
                        v86 = *(_QWORD *)v174;
                        do
                        {
                          for (j = 0; j != v85; ++j)
                          {
                            if (*(_QWORD *)v174 != v86)
                              objc_enumerationMutation(v83);
                            v88 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * j);
                            v89 = (void *)UIApp;
                            objc_msgSend(v88, "window");
                            v90 = (void *)objc_claimAutoreleasedReturnValue();
                            v91 = (id)objc_msgSend(v89, "_pressesEventForWindow:", v90);

                            if (v91 != v82)
                            {
                              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              v136 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void sendEventForDelayedPresses(NSArray<UIGestureDelayedPress *> *const __strong)");
                              v92 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v136, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("UIGestureDelayedEventComponentDispatcher.m"), 512, CFSTR("events are from different window scenes"));

                            }
                            objc_msgSend(v91, "_addPress:forDelayedDelivery:", v88, 1);
                          }
                          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
                        }
                        while (v85);
                      }

                      objc_msgSend(v83, "anyObject");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v94 = objc_msgSend(v93, "phase");

                      switch(v94)
                      {
                        case 0:
                          objc_msgSend(objb, "pressesBegan:withEvent:", v83, v82);
                          break;
                        case 1:
                          objc_msgSend(objb, "pressesChanged:withEvent:", v83, v82);
                          break;
                        case 3:
                          objc_msgSend(objb, "pressesEnded:withEvent:", v83, v82);
                          break;
                        case 4:
                          objc_msgSend(objb, "pressesCancelled:withEvent:", v83, v82);
                          break;
                        default:
                          break;
                      }

                    }
                    v139 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v177, v192, 16);
                  }
                  while (v139);
                }

                CFRelease(v142);
                v48 = v135;
                goto LABEL_124;
              }
              continue;
            }
            goto LABEL_86;
          }
        }
      }
    }
  }
}

uint64_t __62__UIGestureDelayedEventComponentDispatcher_sendDelayedPresses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a2, "timestampForDelivery");
  v5 = v4;
  objc_msgSend(a3, "timestampForDelivery");
  if (v6 > v5)
    return -1;
  else
    return v5 > v6;
}

- (void)removeTouch:(void *)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *log;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _UIGestureDelayedTouchForUITouch(a2, a1[2]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      do
      {
        v5 = removeTouch____s_category;
        if (!removeTouch____s_category)
        {
          v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&removeTouch____s_category);
        }
        if ((*(_BYTE *)v5 & 1) != 0)
        {
          v8 = *(NSObject **)(v5 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            log = v8;
            v9 = (objc_class *)objc_opt_class();
            NSStringFromClass(v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a2, "_phaseDescription");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v15 = v11;
            v16 = 2048;
            v17 = a2;
            v18 = 2112;
            v19 = v10;
            _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Cancelling send of touch <%@: %p; phase = %@>",
              buf,
              0x20u);

          }
        }
        v13 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "removeDelayedTouchesToSend:", v6);

        _UIGestureDelayedTouchForUITouch(a2, a1[2]);
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v7;
      }
      while (v7);
    }
  }
}

- (void)removePress:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *log;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      do
      {
        v5 = removePress____s_category;
        if (!removePress____s_category)
        {
          v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&removePress____s_category);
        }
        if ((*(_BYTE *)v5 & 1) != 0)
        {
          v7 = *(NSObject **)(v5 + 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            log = v7;
            v8 = (objc_class *)objc_opt_class();
            NSStringFromClass(v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a2, "_phaseDescription");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v13 = v10;
            v14 = 2048;
            v15 = a2;
            v16 = 2112;
            v17 = v9;
            _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Cancelling send of press <%@: %p; phase = %@>",
              buf,
              0x20u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);
        _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

- (void)cancelDelayedTouches:(void *)a3 touches:(void *)a4 fromEvent:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = objc_msgSend(a2, "count");
    if (v5 < 1)
    {
      v27 = 0;
      v7 = 0;
    }
    else
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = a2;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v43;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
          if (v11)
            v12 = *(void **)(v11 + 24);
          else
            v12 = 0;
          v13 = v12;
          v14 = objc_msgSend(v13, "phase");
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke;
          aBlock[3] = &unk_1E16B1888;
          v40 = v13;
          v41 = v14;
          v15 = v13;
          v16 = _Block_copy(aBlock);
          objc_msgSend(v7, "addObject:", v16);

          if (v11)
            v17 = *(void **)(v11 + 32);
          else
            v17 = 0;
          v18 = v17;
          objc_msgSend(v15, "_loadStateFromTouch:", v18);

          objc_msgSend(v27, "addObject:", v15);
          ++v10;
        }
        while (v8 != v10);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        v8 = v19;
      }
      while (v19);
    }

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__12;
    v37 = __Block_byref_object_dispose__12;
    v38 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_11;
    v32[3] = &unk_1E16B4CC8;
    v32[4] = &v33;
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_11((uint64_t)v32, a3);
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_11((uint64_t)v32, v27);
    if (objc_msgSend((id)v34[5], "count"))
      objc_msgSend(a4, "_cancelComponents:", v34[5]);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v20);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
      }
      while (v21);
    }

    _Block_object_dispose(&v33, 8);
  }
}

uint64_t __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", *(_QWORD *)(a1 + 40));
}

void __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "_responder", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          if (!v10)
          {
            v11 = objc_opt_new();
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v13 = *(void **)(v12 + 40);
            *(_QWORD *)(v12 + 40) = v11;

            v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          }
          objc_msgSend(v10, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)cancelDelayedPresses:(void *)a3 presses:(void *)a4 fromEvent:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = objc_msgSend(a2, "count");
    if (v5 < 1)
    {
      v27 = 0;
      v7 = 0;
    }
    else
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = a2;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v43;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v10);
          if (v11)
            v12 = *(void **)(v11 + 24);
          else
            v12 = 0;
          v13 = v12;
          v14 = objc_msgSend(v13, "phase");
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke;
          aBlock[3] = &unk_1E16B1888;
          v40 = v13;
          v41 = v14;
          v15 = v13;
          v16 = _Block_copy(aBlock);
          objc_msgSend(v7, "addObject:", v16);

          if (v11)
            v17 = *(void **)(v11 + 32);
          else
            v17 = 0;
          v18 = v17;
          objc_msgSend(v15, "_loadStateFromPress:", v18);

          objc_msgSend(v27, "addObject:", v15);
          ++v10;
        }
        while (v8 != v10);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        v8 = v19;
      }
      while (v19);
    }

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__12;
    v37 = __Block_byref_object_dispose__12;
    v38 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2;
    v32[3] = &unk_1E16B4CC8;
    v32[4] = &v33;
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2((uint64_t)v32, a3);
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2((uint64_t)v32, v27);
    if (objc_msgSend((id)v34[5], "count"))
      objc_msgSend(a4, "_cancelComponents:", v34[5]);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v20);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v46, 16);
      }
      while (v21);
    }

    _Block_object_dispose(&v33, 8);
  }
}

uint64_t __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", *(_QWORD *)(a1 + 40));
}

void __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "responder", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          if (!v10)
          {
            v11 = objc_opt_new();
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v13 = *(void **)(v12 + 40);
            *(_QWORD *)(v12 + 40) = v11;

            v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          }
          objc_msgSend(v10, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedPressesToSend, 0);
  objc_storeStrong((id *)&self->_delayedPresses, 0);
  objc_storeStrong((id *)&self->_delayedTouchesToSend, 0);
  objc_storeStrong((id *)&self->_delayedTouches, 0);
}

@end
