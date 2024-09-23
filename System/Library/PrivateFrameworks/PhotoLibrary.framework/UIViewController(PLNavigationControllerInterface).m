@implementation UIViewController(PLNavigationControllerInterface)

- (void)uiipc_imagePickerController
{
  void *i;

  for (i = (void *)objc_msgSend(a1, "parentViewController"); i; i = (void *)objc_msgSend(i, "parentViewController"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return i;
}

- (uint64_t)uiipc_imagePickerOptions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiipc_imagePickerController"), "_properties");
}

- (uint64_t)uiipc_useTelephonyUI
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CEC068]), "BOOLValue");
}

- (uint64_t)uiipc_filterForMediaTypes:()PLNavigationControllerInterface
{
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
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
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v5 = result;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    v9 = (void *)*MEMORY[0x1E0CEC520];
    v10 = (void *)*MEMORY[0x1E0CEC568];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", objc_msgSend(v9, "identifier")) & 1) != 0)
          v6 = 1;
        else
          v7 |= objc_msgSend(v12, "isEqualToString:", objc_msgSend(v10, "identifier"));
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
    if ((v7 & 1) != 0)
      v13 = 2;
    else
      v13 = 0;
    if ((v6 & 1) != 0)
      return (v6 & v7 & 1) == 0;
    else
      return v13;
  }
  return result;
}

@end
