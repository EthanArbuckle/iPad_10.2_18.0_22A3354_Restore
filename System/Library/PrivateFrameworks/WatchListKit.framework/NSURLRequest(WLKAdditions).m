@implementation NSURLRequest(WLKAdditions)

+ (id)wlk_requestWithURL:()WLKAdditions httpMethod:httpBody:httpHeaders:cachePolicy:timeout:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v35 = v15;
    HIDWORD(v34) = objc_msgSend(v14, "isEqualToString:", CFSTR("POST"));
    LODWORD(v34) = objc_msgSend(v14, "isEqualToString:", CFSTR("PATCH"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:cachePolicy:timeoutInterval:", v13, a8, a1);
    objc_msgSend(v17, "setHTTPMethod:", v14);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v16, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKey:", v23, v34);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setValue:forHTTPHeaderField:", v24, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v20);
    }

    if ((HIDWORD(v34) | v34) == 1)
    {
      v15 = v35;
      if (v35)
      {
        objc_msgSend(v17, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (!v26)
        {
          WLKNetworkingLogObject();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B515A000, v27, OS_LOG_TYPE_DEFAULT, "NSURLRequest-WLKAdditions: HTTP body specified without specifying Content-Type", buf, 2u);
          }

        }
        objc_msgSend(v17, "setHTTPBody:", v35, v34);
      }
      else if (HIDWORD(v34))
      {
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v13, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "query");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "length"))
        {
          objc_msgSend(v31, "dataUsingEncoding:", 4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setHTTPBody:", v32);

          objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
        }
        objc_msgSend(v30, "setQueryItems:", 0, v34);
        objc_msgSend(v30, "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setURL:", v33);

      }
    }
    else
    {
      v15 = v35;
    }
  }
  else
  {
    WLKNetworkingLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v28, OS_LOG_TYPE_DEFAULT, "NSURLRequest-WLKAdditions: URL parameter is nil", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

+ (uint64_t)wlk_requestWithURL:()WLKAdditions httpMethod:httpHeaders:cachePolicy:timeout:
{
  return objc_msgSend(a1, "wlk_requestWithURL:httpMethod:httpBody:httpHeaders:cachePolicy:timeout:", a3, a4, 0, a5, a6);
}

@end
