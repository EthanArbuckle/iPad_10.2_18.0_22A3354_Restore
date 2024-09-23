@implementation UIApplication(PhotoLibrary)

- (void)pl_firstKeyWindow
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "connectedScenes");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "activationState"))
        {
          v7 = (void *)objc_msgSend(v6, "windows");
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v15;
LABEL_10:
            v11 = 0;
            while (1)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
              if ((objc_msgSend(v12, "isKeyWindow") & 1) != 0)
                break;
              if (v9 == ++v11)
              {
                v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
                if (v9)
                  goto LABEL_10;
                goto LABEL_18;
              }
            }
            if (v12)
              return v12;
          }
        }
LABEL_18:
        ;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }
  return 0;
}

@end
