@implementation _UISceneHostingIntelligenceSupportClientComponent

- (id)windowHostingSceneForFBSScene:(id)a3
{
  void *v3;
  void *v4;

  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = objc_opt_class();
        v16 = v14;
        if (v15)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
        }
        else
        {
          v17 = 0;
        }
        v18 = v17;

        if (v18)
        {
          -[_UISceneHostingIntelligenceSupportClientComponent windowHostingSceneForFBSScene:](self, "windowHostingSceneForFBSScene:", v6, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v18, "executeActionForWindowHostingScene:", v19);
          objc_msgSend(v8, "addObject:", v18);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v8;
}

@end
