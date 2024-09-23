@implementation FLFollowUpController

void __65__FLFollowUpController_ICQUI__icq_dismissFollowUpWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v25;
    v8 = "Successfully cleared lockscreen notification for followup item ID %@";
    *(_QWORD *)&v5 = 138412546;
    v22 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          v23 = 0;
          v14 = objc_msgSend(v13, "clearNotificationForItem:error:", v10, &v23);
          v15 = v23;
          _ICQGetLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v18 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v29 = v18;
              _os_log_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = v8;
            v20 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v15, "localizedDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v29 = v20;
            v8 = v19;
            v30 = 2112;
            v31 = v21;
            _os_log_error_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_ERROR, "Unable to clear lockscreen notification for followup item ID %@, error: %@", buf, 0x16u);

          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }

}

@end
