@implementation SiriUIURLSession

+ (id)sharedURLSession
{
  if (sharedURLSession_onceToken != -1)
    dispatch_once(&sharedURLSession_onceToken, &__block_literal_global_3);
  return (id)sharedURLSession_sharedURLSession;
}

void __36__SiriUIURLSession_sharedURLSession__block_invoke()
{
  SiriUIURLSession *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUIURLSession);
  v1 = (void *)sharedURLSession_sharedURLSession;
  sharedURLSession_sharedURLSession = (uint64_t)v0;

}

- (SiriUIURLSession)init
{
  SiriUIURLSession *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURLSession *URLSession;
  uint64_t v8;
  NSMapTable *tasksForClient;
  uint64_t v10;
  NSMapTable *imageDownloadForTask;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUIURLSession;
  v2 = -[SiriUIURLSession init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPShouldSetCookies:", 0);
    objc_msgSend(v3, "setHTTPCookieAcceptPolicy:", 1);
    v4 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    URLSession = v2->_URLSession;
    v2->_URLSession = (NSURLSession *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    tasksForClient = v2->_tasksForClient;
    v2->_tasksForClient = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    imageDownloadForTask = v2->_imageDownloadForTask;
    v2->_imageDownloadForTask = (NSMapTable *)v10;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUIURLSession;
  -[SiriUIURLSession description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSMapTable dictionaryRepresentation](self->_tasksForClient, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" tasksForClient="));
    objc_msgSend(v4, "appendString:", v6);
  }

  return (NSString *)v4;
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 completionHandler:(id)a5
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:completionHandler:", a3, a4, a5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 completionHandler:(id)a6
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:completionHandler:", a3, a4, 0, a6, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 completionHandler:(id)a7
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:userAgent:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:userAgent:completionHandler:", a3, a4, a6, 0, a7, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 userAgent:(id)a7 completionHandler:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  height = a5.height;
  width = a5.width;
  v15 = a8;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __103__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_fillColor_userAgent_completionHandler___block_invoke;
  v19[3] = &unk_24D7D9410;
  v20 = v15;
  v16 = v15;
  -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:", a3, a4, 0, v19, a6, a7, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __103__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_fillColor_userAgent_completionHandler___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:", a3, a4, a6, a7, a8, 0, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8 userAgent:(id)a9
{
  _BOOL8 v12;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  SiriUIURLSessionImageDownload *v24;
  id v25;
  SiriUIURLSessionImageDownload *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  SiriUIURLSession *v33;
  id v34;
  id v35;
  id v36;

  v12 = a6;
  height = a5.height;
  width = a5.width;
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v17)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v17);
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v22, "setValue:forHTTPHeaderField:", v21, CFSTR("User-Agent"));
    -[NSURLSession dataTaskWithRequest:](self->_URLSession, "dataTaskWithRequest:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIURLSession _registerTask:forClient:](self, "_registerTask:forClient:", v23, v18);
    if (objc_msgSend(v23, "state") == 1)
      objc_msgSend(v23, "resume");
    v24 = [SiriUIURLSessionImageDownload alloc];
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __113__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_incremental_progressHandler_fillColor_userAgent___block_invoke;
    v32 = &unk_24D7D9438;
    v36 = v19;
    v33 = self;
    v25 = v23;
    v34 = v25;
    v35 = v18;
    v26 = -[SiriUIURLSessionImageDownload initWithFitToSize:progressHandler:incremental:client:fillColor:](v24, "initWithFitToSize:progressHandler:incremental:client:fillColor:", &v29, v12, v35, v20, width, height);
    -[NSMapTable setObject:forKey:](self->_imageDownloadForTask, "setObject:forKey:", v26, v25, v29, v30, v31, v32, v33);
    v27 = v25;

  }
  else
  {
    if (v19)
      (*((void (**)(id, _QWORD, uint64_t))v19 + 2))(v19, 0, 1);
    v27 = 0;
  }

  return v27;
}

void __113__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_incremental_progressHandler_fillColor_userAgent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    v5 = v7;
  }
  if ((_DWORD)a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unregisterTask:forClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = v7;
  }

}

- (void)cancelAllTasksForClient:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[NSMapTable objectForKey:](self->_tasksForClient, "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_registerTask:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    -[NSMapTable objectForKey:](self->_tasksForClient, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[NSMapTable setObject:forKey:](self->_tasksForClient, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)_unregisterTask:(id)a3 forClient:(id)a4
{
  id v6;
  NSMapTable *tasksForClient;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  if (a3 && v6)
  {
    tasksForClient = self->_tasksForClient;
    v10 = v6;
    v8 = a3;
    -[NSMapTable objectForKey:](tasksForClient, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v8);

    if (!objc_msgSend(v9, "count"))
      -[NSMapTable removeObjectForKey:](self->_tasksForClient, "removeObjectForKey:", v10);

    v6 = v10;
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSMapTable *imageDownloadForTask;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  imageDownloadForTask = self->_imageDownloadForTask;
  v7 = a5;
  v8 = a4;
  -[NSMapTable objectForKey:](imageDownloadForTask, "objectForKey:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendDownloadedData:fromURL:", v7, v10);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSMapTable *imageDownloadForTask;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  imageDownloadForTask = self->_imageDownloadForTask;
  v8 = a5;
  v9 = a4;
  -[NSMapTable objectForKey:](imageDownloadForTask, "objectForKey:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originalRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finishedFromURL:error:", v11, v8);

  -[NSMapTable removeObjectForKey:](self->_imageDownloadForTask, "removeObjectForKey:", v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadForTask, 0);
  objc_storeStrong((id *)&self->_tasksForClient, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
}

@end
