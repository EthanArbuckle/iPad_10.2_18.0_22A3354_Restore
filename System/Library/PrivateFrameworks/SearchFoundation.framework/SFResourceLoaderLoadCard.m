@implementation SFResourceLoaderLoadCard

void __SFResourceLoaderLoadCard_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  getWeakLoaders();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "strongloader", (_QWORD)v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE5492E0) & 1) != 0)
        {
          objc_msgSend(v7, "cardLoader");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "canLoadCard:", *(_QWORD *)(a1 + 32)))
          {
            objc_msgSend(v8, "loadCard:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
            if (PARLogHandleForCategory_onceToken_63033 != -1)
              dispatch_once(&PARLogHandleForCategory_onceToken_63033, &__block_literal_global_105);
            v14 = PARLogHandleForCategory_logHandles_1_63034;
            if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_63034, OS_LOG_TYPE_DEBUG))
            {
              v15 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v23 = v15;
              v24 = 2112;
              v25 = v8;
              _os_log_debug_impl(&dword_19E535000, v14, OS_LOG_TYPE_DEBUG, "card %@ loaded by %@", buf, 0x16u);
            }

LABEL_23:
            v12 = v2;
            goto LABEL_24;
          }

        }
        else if ((objc_opt_respondsToSelector() & 1) != 0
               && (objc_msgSend(v7, "loadCard:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          goto LABEL_23;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v4)
        continue;
      break;
    }
  }

  v9 = (void *)MEMORY[0x1E0CB35C8];
  v20[0] = *MEMORY[0x1E0CB2938];
  v20[1] = CFSTR("SFResourceLoaderFailedResourceKey");
  v10 = *(_QWORD *)(a1 + 32);
  v21[0] = CFSTR("SFResourceLoaders are not available.");
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SFResourceLoaderErrorDomain"), 1000, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (PARLogHandleForCategory_onceToken_63033 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_63033, &__block_literal_global_105);
  v13 = PARLogHandleForCategory_logHandles_1_63034;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_63034, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_log_error_impl(&dword_19E535000, v13, OS_LOG_TYPE_ERROR, "SFResourceLoaderLoadCard error: %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_24:

}

@end
