@implementation _SBKeyboardFocusCoalitionFactory

- (id)newCoalitionForSceneControllers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __objc2_class **v14;
  BOOL v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v3 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
  {
    v6 = 0;
    v5 = 0;
    v4 = 0;
    goto LABEL_25;
  }
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "sbWindowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEmbeddedScene") & 1) != 0)
      {
        v11 = v6;
        v12 = v4;
        v6 = v9;
      }
      else if ((objc_msgSend(v10, "isContinuityScene") & 1) != 0)
      {
        v11 = v5;
        v12 = v4;
        v5 = v9;
      }
      else
      {
        v11 = v4;
        v12 = v9;
        if (!objc_msgSend(v10, "isExternalDisplayScene"))
          goto LABEL_12;
      }
      v13 = v9;

      v4 = v12;
LABEL_12:

    }
    v3 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v3);
  if (v6 && v4)
  {
    v14 = off_1E8E95BA8;
    goto LABEL_24;
  }
  if (v5)
    v15 = v6 == 0;
  else
    v15 = 1;
  v14 = off_1E8E95BD8;
  if (!v15)
    v14 = off_1E8E95BB0;
  if (v6)
LABEL_24:
    v3 = objc_alloc_init(*v14);
  else
    v3 = 0;
LABEL_25:

  return v3;
}

@end
