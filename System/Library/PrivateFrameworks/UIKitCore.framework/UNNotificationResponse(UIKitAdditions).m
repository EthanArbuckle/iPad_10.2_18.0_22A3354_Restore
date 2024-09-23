@implementation UNNotificationResponse(UIKitAdditions)

- (id)targetScene
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)UIApp, "connectedScenes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetSceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "session", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "persistentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v3);

          if (v11)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
