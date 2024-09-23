@implementation _UIWindowOrientationUpdate

- (_QWORD)initWithOrientation:(void *)a3 transitionAnimationSettings:(void *)a4 updateBlock:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)_UIWindowOrientationUpdate;
    v10 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v10;
    if (v10)
    {
      *((_QWORD *)v10 + 2) = a2;
      objc_storeStrong((id *)v10 + 3, a3);
      v11 = _Block_copy(v9);
      v12 = (void *)a1[4];
      a1[4] = v11;

      v13 = (void *)a1[1];
      a1[1] = 0;

    }
  }

  return a1;
}

- (void)synchronizeDrawingWithFencesOnScene:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(a1 + 8);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "_synchronizeDrawingWithFence:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[_UIWindowOrientationUpdate invalidateFences](a1);
  }

}

- (uint64_t)invalidateFences
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(result + 8);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate", (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 8), "removeAllObjects");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_transitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_trackedFences, 0);
}

- (void)trackFence:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = *(void **)(a1 + 8);
    v8 = v4;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v6;

      v5 = *(void **)(a1 + 8);
    }
    objc_msgSend(v5, "addObject:", v8);
    v4 = v8;
  }

}

- (void)transferFencesToUpdate:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(a1 + 8);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[_UIWindowOrientationUpdate trackFence:]((uint64_t)v3, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects", (_QWORD)v9);
  }

}

@end
