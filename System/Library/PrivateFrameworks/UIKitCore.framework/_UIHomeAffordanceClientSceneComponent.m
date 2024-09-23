@implementation _UIHomeAffordanceClientSceneComponent

- (_QWORD)_cachedHomeAffordanceSceneNotifier
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      objc_msgSend(a1, "clientScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "_homeAffordanceSceneNotifier");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v1[3];
      v1[3] = v5;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  objc_msgSend(v19, "settingsDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsProperty:", sel_homeAffordanceSceneReferenceFrame);

  v7 = v19;
  if (v6)
  {
    objc_msgSend(v19, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeAffordanceSceneReferenceFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[_UIHomeAffordanceClientSceneComponent _cachedHomeAffordanceSceneNotifier](self);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      -[_UIHomeAffordanceSceneNotifier _homeAffordanceSceneUpdateSource:frameDidChange:](v17, self, v10, v12, v14, v16);

    v7 = v19;
  }

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = objc_opt_class();
        v14 = v12;
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;

        -[_UIHomeAffordanceClientSceneComponent _cachedHomeAffordanceSceneNotifier](self);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
        {
          if (!objc_msgSend(v16, "actionType", (_QWORD)v20))
            -[_UIHomeAffordanceSceneNotifier _homeAffordanceSceneUpdateSource:doubleTapGestureDidSucceed:]((uint64_t)v18, self, objc_msgSend(v16, "didSucceed"));
          objc_msgSend(v6, "addObject:", v16);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHomeAffordanceSceneNotifier, 0);
}

@end
