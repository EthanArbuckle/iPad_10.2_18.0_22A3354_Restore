@implementation NSArray(Foundation_Extensions)

- (void)muDeepMutableCopy
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_17;
          }
          v10 = objc_msgSend(v9, "muDeepMutableCopy", v13, (_QWORD)v14);
        }
        else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F044E978))
        {
          v10 = objc_msgSend(v9, "mutableCopy");
        }
        else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F044E8B0))
        {
          v10 = objc_msgSend(v9, "copy");
        }
        else
        {
          v10 = v9;
        }
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v2, "addObject:", v10);
          goto LABEL_19;
        }
LABEL_17:
        +[PPKImageWriter log]();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v9;
          _os_log_impl(&dword_1DDB0F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to copy object for [NSMutableArray muDeepMutableCopy]: %@", buf, 0xCu);
        }
LABEL_19:

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v2;
}

@end
