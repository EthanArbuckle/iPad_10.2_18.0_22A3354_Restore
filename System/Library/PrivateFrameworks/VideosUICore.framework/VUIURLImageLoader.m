@implementation VUIURLImageLoader

- (id)imageKeyForObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "absoluteString");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  VUICImageLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v10 = 138412290;
    *(_QWORD *)&v10[4] = objc_opt_class();
    v7 = *(id *)&v10[4];
    _os_log_impl(&dword_1D951F000, v6, OS_LOG_TYPE_INFO, "URLImageLoader cannot create key for object of type [%@]", v10, 0xCu);

  }
  v5 = 0;
LABEL_9:
  objc_msgSend(v5, "vui_SHA256String", *(_OWORD *)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)URLForObject:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "url");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_21);
  return (id)sharedInstance_sSharedInstance_0;
}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  id *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[5];

  v79[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VUIURLImageLoaderTaskKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);

  if (v8 != v9)
  {
    v10 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("VUIURLImageLoaderOptionsRequestRecordKey"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("VUIURLImageLoaderTaskDecryptorKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("VUIURLImageLoaderTaskReceivedDataKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_7:
    VUICImageLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v17;
      _os_log_impl(&dword_1D951F000, v16, OS_LOG_TYPE_DEFAULT, "URLImageLoader returned a non-NSHTTPURLResponse with url [%@]", buf, 0xCu);

    }
    v15 = *(void **)(a1 + 40);
    if (v15)
      v14 = 0;
    else
      v14 = 200;
    goto LABEL_12;
  }
  v14 = objc_msgSend(v13, "statusCode");
  v15 = *(void **)(a1 + 40);

LABEL_12:
  v54 = a1;
  v47 = v11;
  v48 = v7;
  if (v15 || (unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFF37)
  {
    if (v15)
    {
      v10 = v15;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2F90];
      v78[0] = CFSTR("statusCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v23 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v24;
      v78[1] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, -18, v26);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v23;
    }
    objc_msgSend(v51, "didFailWithError:", v10);
    VUICImageLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(v54 + 32), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v73 = v27;
      v74 = 2112;
      v75 = v5;
      v76 = 2112;
      v77 = v10;
      _os_log_impl(&dword_1D951F000, v18, OS_LOG_TYPE_INFO, "URLImageLoader Finished task %@ url %@ with error [%@]", buf, 0x20u);

    }
    v52 = 0;
  }
  else
  {
    v18 = v11;
    if (-[NSObject length](v18, "length"))
    {
      if (v50)
      {
        objc_msgSend(v50, "decryptImageData:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          +[VUIImage imageWithData:](VUIImage, "imageWithData:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
          v10 = 0;
          v18 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          v20 = 0;
        }
      }
      else
      {
        +[VUIImage imageWithData:](VUIImage, "imageWithData:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setRotationEnabled:", objc_msgSend(v3, "isImageRotationEnabled"));
        v10 = 0;
      }
      VUICImageLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(v54 + 32), "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v73 = v30;
        v74 = 2112;
        v75 = v5;
        _os_log_impl(&dword_1D951F000, v28, OS_LOG_TYPE_INFO, "URLImageLoader Finished loading task %@ url %@", buf, 0x16u);

      }
    }
    else
    {
      VUICImageLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v73 = v29;
        v74 = 2112;
        v75 = v5;
        _os_log_impl(&dword_1D951F000, v28, OS_LOG_TYPE_INFO, "URLImageLoader Finished loading task %@ url %@ with no data", buf, 0x16u);

      }
      v20 = 0;
      v10 = 0;
    }
    v52 = v20;

    objc_msgSend(v51, "didCompleteLoadingWithResponseBody:", v18);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v3, "loadIDsByURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v5;
  objc_msgSend(v31, "objectForKeyedSubscript:", v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v32;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v68 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v3, "loadOptionsByID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "loadOptionsByID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeObjectForKey:", v37);

        objc_msgSend(v39, "objectForKey:", CFSTR("VUIURLImageLoaderOptionsCompletionHandlerKey"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v10)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_39;
          block[3] = &unk_1E9F2C4A8;
          v66 = v41;
          v64 = *(id *)(v54 + 32);
          v65 = v10;
          dispatch_async(MEMORY[0x1E0C80D38], block);

          v43 = &v64;
          v44 = &v66;
        }
        else if (v52)
        {
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2;
          v58[3] = &unk_1E9F2CB90;
          v62 = v41;
          v59 = *(id *)(v54 + 32);
          v60 = v52;
          v61 = *(id *)(v54 + 40);
          dispatch_async(MEMORY[0x1E0C80D38], v58);

          v43 = &v59;
          v44 = &v62;
        }
        else
        {
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3;
          v55[3] = &unk_1E9F2C430;
          v57 = v41;
          v56 = *(id *)(v54 + 32);
          dispatch_async(MEMORY[0x1E0C80D38], v55);
          v43 = &v56;
          v44 = &v57;
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v34);
  }

  objc_msgSend(v3, "loadIDsByURL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v49;
  objc_msgSend(v45, "removeObjectForKey:", v49);

  objc_msgSend(v3, "taskOptionsByURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "removeObjectForKey:", v49);

  v7 = v48;
LABEL_45:

}

void __47__VUIURLImageLoader__executeOnProcessingQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __35__VUIURLImageLoader_sharedInstance__block_invoke()
{
  VUIURLImageLoader *v0;
  void *v1;

  v0 = objc_alloc_init(VUIURLImageLoader);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

void __32__VUIURLImageLoader_cancelLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "loadOptionsByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "loadOptionsByID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VUIURLImageLoaderOptionsURLKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    VUICImageLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v21 = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1D951F000, v9, OS_LOG_TYPE_INFO, "URLImageLoader Canceling request %@ URL %@", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend(v3, "loadOptionsByID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v3, "loadIDsByURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(v3, "loadIDsByURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v8);

      objc_msgSend(v3, "taskOptionsByURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VUIURLImageLoaderTaskKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "taskOptionsByURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v8);

      VUICImageLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v20;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1D951F000, v19, OS_LOG_TYPE_INFO, "URLImageLoader Canceling task %@ URL %@", (uint8_t *)&v21, 0x16u);

      }
      objc_msgSend(v17, "cancel");

    }
  }

}

void __109__VUIURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "loadOptionsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  VUICImageLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v23 = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1D951F000, v6, OS_LOG_TYPE_INFO, "URLImageLoader Adding request %@ URL %@", (uint8_t *)&v23, 0x16u);
  }

  objc_msgSend(v3, "loadIDsByURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadIDsByURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "session");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject dataTaskWithURL:](v12, "dataTaskWithURL:", *(_QWORD *)(a1 + 56));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        VUICImageLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1D951F000, v12, OS_LOG_TYPE_INFO, "URLImageLoader invalid NSURLSessionTask source type", (uint8_t *)&v23, 2u);
        }
        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 64), "session");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject dataTaskWithRequest:](v12, "dataTaskWithRequest:", *(_QWORD *)(a1 + 56));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

LABEL_11:
    VUICImageLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      v23 = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1D951F000, v16, OS_LOG_TYPE_INFO, "URLImageLoader Loading task %@ URL %@", (uint8_t *)&v23, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("VUIURLImageLoaderTaskKey"));
    v19 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy");
    objc_msgSend(v3, "taskOptionsByURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "resume");
    v21 = *(void **)(a1 + 80);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "originalRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "willSendRequest:", v22);

  }
}

- (NSMutableDictionary)taskOptionsByURL
{
  return self->_taskOptionsByURL;
}

- (NSURLSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSMutableDictionary)loadOptionsByID
{
  return self->_loadOptionsByID;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  VUIURLImageLoader *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  __int128 *p_buf;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v35 = self;
  v61 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v37 = a7;
  v38 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v39;
    v11 = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      VUICImageLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
        v32 = *(id *)((char *)&buf + 4);
        _os_log_impl(&dword_1D951F000, v31, OS_LOG_TYPE_INFO, "URLImageLoader cannot load image for object of type [%@]", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v38 + 2))(v38, 0, 0, 0, 0, v30);
      v11 = 0;
      v10 = 0;
      v29 = 0;
      goto LABEL_24;
    }
    v12 = v39;
    objc_msgSend(v12, "url");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB37A8]);
    objc_msgSend(v12, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v13, "initWithURL:", v14);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v12, "headers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v12, "headers", v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forHTTPHeaderField:", v21, v19);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v16);
    }

    objc_msgSend(v12, "decrypter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v12, "decrypter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKey:", v23, CFSTR("VUIURLImageLoaderTaskDecryptorKey"));

    }
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "setObject:forKey:", v25, CFSTR("VUIURLImageLoaderOptionsIDKey"));
    objc_msgSend(v41, "setObject:forKey:", v11, CFSTR("VUIURLImageLoaderOptionsURLKey"));
    if (v38)
    {
      v26 = (void *)objc_msgSend(v38, "copy");
      objc_msgSend(v41, "setObject:forKey:", v26, CFSTR("VUIURLImageLoaderOptionsCompletionHandlerKey"));

    }
    objc_msgSend(v37, "recordForResource:withInitiator:", 3, 2, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v40, "setObject:forKey:", v27, CFSTR("VUIURLImageLoaderOptionsRequestRecordKey"));
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v28, CFSTR("VUIURLImageLoaderTaskReceivedDataKey"));

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__3;
    v58 = __Block_byref_object_dispose__3;
    v59 = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __109__VUIURLImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v42[3] = &unk_1E9F2CAF0;
    v29 = v25;
    v43 = v29;
    v44 = v41;
    v11 = v11;
    v45 = v11;
    v10 = v10;
    p_buf = &buf;
    v46 = v10;
    v47 = v36;
    v48 = v40;
    v30 = v27;
    v49 = v30;
    objc_msgSend(v36, "_executeOnProcessingQueue:", v42);

    _Block_object_dispose(&buf, 8);
LABEL_24:

    goto LABEL_25;
  }
  v29 = 0;
LABEL_25:
  v33 = v29;

  return v33;
}

- (NSMutableDictionary)loadIDsByURL
{
  return self->_loadIDsByURL;
}

- (VUIURLImageLoader)init
{
  VUIURLImageLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *processingQueue;
  uint64_t v13;
  NSMutableDictionary *loadOptionsByID;
  uint64_t v15;
  NSMutableDictionary *loadIDsByURL;
  uint64_t v17;
  NSMutableDictionary *taskOptionsByURL;
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VUIURLImageLoader;
  v2 = -[VUIURLImageLoader init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPMaximumConnectionsPerHost:", 4);
    objc_msgSend(v3, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend(v3, "setWaitsForConnectivity:", 0);
    objc_msgSend(v3, "set_timingDataOptions:", 1);
    v4 = (void *)MEMORY[0x1E0CFDCA8];
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAgentForProcessInfo:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      v21 = CFSTR("User-Agent");
      v22[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHTTPAdditionalHeaders:", v7);

    }
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VUIURLImageLoader (%p) processing queue"), v2);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4), 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    loadOptionsByID = v2->_loadOptionsByID;
    v2->_loadOptionsByID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    loadIDsByURL = v2->_loadIDsByURL;
    v2->_loadIDsByURL = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    taskOptionsByURL = v2->_taskOptionsByURL;
    v2->_taskOptionsByURL = (NSMutableDictionary *)v17;

  }
  return v2;
}

- (void)cancelLoad:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__VUIURLImageLoader_cancelLoad___block_invoke;
    v5[3] = &unk_1E9F2CB18;
    v6 = v4;
    -[VUIURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v5);

  }
}

- (void)_executeOnProcessingQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIURLImageLoader processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VUIURLImageLoader__executeOnProcessingQueue___block_invoke;
  block[3] = &unk_1E9F2CAC8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_1E9F2CB68;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[VUIURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v11);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__VUIURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v15[3] = &unk_1E9F2CB40;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[VUIURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v15);

}

void __78__VUIURLImageLoader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "originalRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("VUIURLImageLoaderOptionsRequestRecordKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_timingData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveResponse:timingData:", v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__VUIURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke;
  v11[3] = &unk_1E9F2CB68;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[VUIURLImageLoader _executeOnProcessingQueue:](self, "_executeOnProcessingQueue:", v11);

}

void __56__VUIURLImageLoader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "originalRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "taskOptionsByURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("VUIURLImageLoaderTaskReceivedDataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "taskOptionsByURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("VUIURLImageLoaderOptionsRequestRecordKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "didReceiveData:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  objc_class *v7;
  void (**v8)(id, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0CB34F0];
  v8 = (void (**)(id, id))a6;
  v9 = a5;
  v10 = [v7 alloc];
  objc_msgSend(v9, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v11, v12, v13, 2);
  v8[2](v8, v14);

}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 40))
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 48), 0, 0, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);

    }
  }
}

uint64_t __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 56))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "state");
    if (result != 2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  }
  return result;
}

void __58__VUIURLImageLoader_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
    {
      v2 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);

    }
  }
}

- (BOOL)isImageRotationEnabled
{
  return self->_imageRotationEnabled;
}

- (void)setImageRotationEnabled:(BOOL)a3
{
  self->_imageRotationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_taskOptionsByURL, 0);
  objc_storeStrong((id *)&self->_loadIDsByURL, 0);
  objc_storeStrong((id *)&self->_loadOptionsByID, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
