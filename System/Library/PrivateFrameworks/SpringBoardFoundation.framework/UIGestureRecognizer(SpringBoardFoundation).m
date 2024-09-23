@implementation UIGestureRecognizer(SpringBoardFoundation)

- (void)sbf_setStylusTouchesAllowed:()SpringBoardFoundation
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "allowedTouchTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (!a3)
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "removeObject:", &unk_1E203AA08);
    goto LABEL_5;
  }
  v6 = objc_msgSend(v5, "containsObject:", &unk_1E203AA08);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v8, "addObject:", &unk_1E203AA08);
LABEL_5:
    objc_msgSend(a1, "setAllowedTouchTypes:", v8);

    v7 = v9;
  }

}

- (id)sbf_activeTouches
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "_activeEventOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchesForGestureRecognizer:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v6 = v5;

  return v6;
}

- (uint64_t)sbf_hasPointerTouch
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "sbf_activeTouches", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "_isPointerTouch") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

@end
